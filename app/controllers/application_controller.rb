class ApplicationController < ActionController::Base
  include ApiResponseConcern
  rescue_from Exception, with: :handle_global_exception
end
