#!/usr/bin/env ruby

s = [
    %w(_______   _______   _______   _______   _______),
    %w(xx_xxx_   xx_____   xx___xx   _______   _____xx),
    %w(xxxx_xx   xx_____   xx___xx   _xxxxxx   _____xx),
    %w(xxx___x   xxxxxx_   xx___xx   xx_____   _____xx),
    %w(xx_____   xxx__xx   _xxxxxx   _xxxxx_   _xxxxxx),
    %w(xx_____   xx___xx   _____xx   _____xx   xx___xx),
    %w(xx_____   xx___xx   _xxxxx_   xxxxxx_   _xxxxxx),
    %w(_______   _______   _______   _______   _______),
]

encoded = s.map{|l|
  i = l.join.chars.reverse.inject 0 do |acc, ch|
    (acc << 1) + (ch == 'x' ? 1 : 0)
  end
  i.to_s(36).dump()
}.join(', ')

puts <<-QUINE
eval$s=%w(
  s = %(eval$s=%w(\#{$s})*"");
  f = -> n { s.slice!(0, n) };
  w = 32.chr;

  puts(f[51], [
    #{encoded}
  ].map{|l|
    f[2] + (0..34).map {|i|
      (i % 7 > 0 ? "" : w * 2) + (l.to_i(36)[i] > 0 ? f[1] : w)
    } * "" + w * 2 + f[2]
  }, s)
  # Hello, world!
)*""
QUINE
