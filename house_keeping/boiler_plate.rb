class BoilerPlate
  def initialize(template: nil, locals: {})
    @text_lines = File.open(template, 'r').readlines.map(&:chomp)
    @locals = locals
    parse
  end

  def parse
    @rendered = @text_lines.map do |line|
      line.gsub(/\{\{.*\}\}/) do |m|
        variable =  m.match(/\{\{(?<variable>.*)\}\}/)[:variable].strip.to_sym
        @locals[variable]
      end
    end
  end

  def to_s
    @rendered.join("\n")
  end
end
