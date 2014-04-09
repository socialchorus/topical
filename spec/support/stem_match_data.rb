class StemMatchData
  def zipped
    return @zipped if @zipped
    @zipped = {}
    inputs.each_with_index do |input, index|
      @zipped[input] = outputs[index]
    end
    @zipped
  end

  def pairs(n)
    keys = zipped.keys[0..n-1]
    zipped.slice(*keys)
  end

  def inputs
    @inputs ||= File.read(File.dirname(__FILE__) + "/stem_inputs.txt").split(/\s/)
  end

  def outputs
    @outputs ||= File.read(File.dirname(__FILE__) + "/stem_outputs.txt").split(/\s/)
  end
end