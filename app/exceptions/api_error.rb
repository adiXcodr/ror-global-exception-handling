class ApiError < StandardError
  include TypeHelper
  attr_reader :message, :errors, :code

  def initialize(errors: [], code: '40000')
    @message = message_from_errors(errors)
    super(@message)
    @errors = errors
    @code = code
  end

  def attributes
    {
      code: @code,
      message:,
      errors: @errors
    }
  end

  private

  def message_from_errors(errors)
    if array?(errors)
      errors.last
    elsif model_error?(errors)
      errors.full_messages.last
    elsif string?(errors)
      errors
    else
      'Something went wrong'
    end
  end
end
