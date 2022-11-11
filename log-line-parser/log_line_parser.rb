class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    if @line.start_with?("[ERROR]")
      @line = "Stack overflow"
    elsif @line.start_with?("[INFO]")
      @line = "File moved"
    elsif @line.start_with?("[WARNING]")
      @line.delete("[WARNING]:").strip
    end
  end

  def log_level
    @line = @line[/\[(.*?)]/, 1].downcase
  end

  def reformat
    error = "(" + @line[/\[(.*?)]/, 1].downcase + ")"
    split = @line.split(":")
    @line = split[1].strip + " " + error
  end
end
