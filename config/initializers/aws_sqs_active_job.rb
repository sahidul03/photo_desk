# Wait until ready for running ECS service for ActiveJob
# return if Rails.env.production?

Aws::Rails::SqsActiveJob.configure do |config|

  # config.max_messages = 5
  # config.client = Aws::SQS::Client.new(region: ENV["AWS_REGION"],endpoint: ENV["AWS_SQS_HOST"])

  if Rails.env.production?
    config.queues = {
      default: "#{ENV["AWS_SQS_HOST"]}"
    }
    config.logger = ActiveSupport::Logger.new(STDOUT)
    config.client = Aws::SQS::Client.new(region: ENV["AWS_REGION"],endpoint: ENV["AWS_SQS_HOST"])
  else
    config.queues = {
      default: "#{ENV["AWS_SQS_HOST"]}/queue/default"
    }
    config.logger = ActiveSupport::Logger.new(STDOUT)
    config.client = Aws::SQS::Client.new(region: ENV["AWS_REGION"],
                                         credentials: Aws::Credentials.new("kurashiru", "mart"),
                                         endpoint: ENV["AWS_SQS_HOST"])
  end
end
