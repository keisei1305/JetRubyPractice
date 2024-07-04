class FileManager
  def initialize(path, buffer)
    @path = path
    @buffer = buffer
  end
  def index
    File.foreach(@path){|i| puts i}
  end

  def where(name)
    result = []
    File.foreach(@path){|line| result<<line.strip if line.include?(name)}
    result
  end

  def find(id)
    result = -1
    File.foreach(@path).with_index{|line, index| result = line.strip if index==id}
    result
  end

  def update(id, text)
    buff = File.open(@buffer, "w")
    File.foreach(@path).with_index do |actor, index|
      buff.puts(id==index ? text : actor)
    end
    buff.close
    File.write(@path, File.read(buff))
    File.delete(@buffer) if File.exists?(@buffer)
  end

  def delete(id)
    buff = File.open(@buffer, "w")
    File.foreach(@path).with_index do |actor, index|
      buff.puts(actor) if id!=index
    end

    buff.close
    File.write(@path, File.read(buff))
    File.delete(@buffer) if File.exists?(@buffer)
  end

  def create(text)
    file = File.open(@path, "a")
    file.puts(text)
    file.close()
  end
end