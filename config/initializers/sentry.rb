require 'sentry-ruby'
require 'sentry-rails'

Sentry.init do |config|
  config.dsn = ENV['SENTRY_DSN']
  config.breadcrumbs_logger = %i[active_support_logger http_logger]
  config.environment = ENV['SENTRY_ENVIRONMENT']
  config.traces_sample_rate = 0
  config.rails.skippable_job_adapters = []
  config.background_worker_threads = 0
end
