RX = /((?<integer>\d+)|(?<identifier>[a-zA-Z]\w*)|(?<symbol>[\.,\(\)])|(?<ws>\s))+?/

def tokenize(str)

  tokens = []

  until str.empty? do
    str = str.sub(RX, '')
    raise "not match" unless m = $~
    next if m[:ws]
    tokens << [:interger, :identifier, :symbol].find { m[it]}.then {[it, m[it]]}
  end

  tokens
end

def parse_program(tokens)
  parse_expression(tokens)
end
