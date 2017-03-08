module FakePhoto extend self
  def path
    File.join(Rails.root, 'spec/factories/files/breakout.jpg')
  end

  def file
    File.new(path)
  end
end
