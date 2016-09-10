
class TextAnalyzer
  def initialize(text)
    @text = text
  end

  def process
    file = File.open(@text, 'r')
    yield(file.read)
    file.close
  end

  def paragraph_count
    process { |file| puts "#{file.split("\n\n").count} paragraphs." }
  end

  def line_count
    process { |file| puts "#{file.lines.count} lines." }
  end

  def word_count
    process { |file| puts "#{file.split.count} words." }
  end

end

analyzer = TextAnalyzer.new('sample_text.txt')
analyzer.paragraph_count
analyzer.line_count
analyzer.word_count
