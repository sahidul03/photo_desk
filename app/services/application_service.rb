class ApplicationService
  def self.call(*args)
    new(*args).call
  end

  def call
    raise NotImplementedError, "call should be implemented in ApplicationService sub class"
  end

  def hundle_error(error: nil, klass: nil, message: nil)
    Rails.logger.error message.to_s + " This error is handled by #{klass}."
    raise error, message
  end
end
  