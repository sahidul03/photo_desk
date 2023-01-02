class TestSqsJob < ApplicationJob
  queue_as :default

  def perform
    puts "Please print this log into SQS"
  end
end
