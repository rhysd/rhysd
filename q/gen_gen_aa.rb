#!/usr/bin/env ruby

s = [
  "                                               ",
  "  xx xxx   xx       xx   xx                xx  ",
  "  xxxx xx  xx       xx   xx   xxxxxx       xx  ",
  "  xxx   x  xxxxxx   xx   xx  xx            xx  ",
  "  xx       xxx  xx   xxxxxx   xxxxx    xxxxxx  ",
  "  xx       xx   xx       xx       xx  xx   xx  ",
  "  xx       xx   xx   xxxxx   xxxxxx    xxxxxx  ",
  "                                               ",
]

encoded = s.map{|l|
  i = l.chars.reverse.inject 0 do |acc, ch|
    (acc << 1) + (ch == 'x' ? 1 : 0)
  end
  i.to_s(36).dump()
}.join(', ')

puts <<-QUINE
eval$s=%w(
  s = %(eval$s=%w(\#{$s})*"");
  f = -> n { s.slice!(0, n) };

  puts(f[51], [
    #{encoded}
  ].map{|l|
    f[2] + (0..46).map {|i|
      l.to_i(36)[i] > 0 ? f[1] : 32.chr
    } * "" + f[2]
  }, s)
  # 👉 https://github.com/rhysd
)*""
QUINE
