class StringIOForCarrierWave < StringIO
  def initialize(*args)
    super(*args[2..-1])
    @filename = args[0]
    @content_type = args[1]
  end

  def original_filename
    @filename
  end

  attr_reader :content_type
end
