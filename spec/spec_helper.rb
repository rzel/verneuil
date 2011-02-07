
RSpec.configure do |config|
  config.mock_with :flexmock
end

require 'verneuil'

# Yields a generator to the block given and returns the generated program.
# 
def generate(&block)
  g = Verneuil::Generator.new
  block.call(g)
  g.program
end

# Returns a new process created from code. 
#
def process(code, context)
  compiler = Verneuil::Compiler.new
  program = compiler.compile(code)
  # p program
  Verneuil::Process.new(program, context)
end


# Returns the code of a sample program (in spec/programs).
#
def sample(*names)
  File.read(
    File.join(
      File.dirname(__FILE__), 'programs', *names))
end