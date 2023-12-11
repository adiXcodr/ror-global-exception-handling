module ApiResponseConcern
  extend ActiveSupport::Concern

  include TypeHelper

  private

  def handle_global_exception(err)
    if err.is_a?(::ApiError)
      Rails.logger.info("Global Exception: #{err.attributes}")
      render_error_payload(err.code, errors: err.errors)
    else
      render_uncaught_error(err)
    end
  end

  def render_error_payload(code, errors: [])
    response_code = RESPONSE_CODE_MAP[code]
    render json: {
      message: response_code[:message],
      details: refactored_error_list(errors),
      code:
    }, status: response_code[:http_status]
  end

  def render_uncaught_error(err)
    Sentry.capture_exception(err)
    raise err if Rails.env.development?

    render json: {
      message: 'Internal Server Error',
      details: [],
      code: '50001'
    }, status: :internal_server_error
  end

  def refactored_error_list(errors)
    if model_error?(errors)
      handle_model_errors(errors)
    elsif string?(errors)
      [errors]
    elsif array?(errors)
      errors
    else
      []
    end
  end

  def handle_model_errors(errors)
    errors.map do |error|
      {
        field: error.attribute,
        issue: error.type
      }
    end
  end
end
