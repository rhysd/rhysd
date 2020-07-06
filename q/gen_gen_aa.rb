#!/usr/bin/env ruby

s = [
    %w(xx__xxx_   xx______   xx____xx   ________   ______xx),
    %w(xx_xxxxx   xx______   xx____xx   _xxxxxxx   ______xx),
    %w(xxxx__xx   xx_xxx__   xxx__xxx   xx______   ______xx),
    %w(xxx_____   xxxxxxx_   _xxxxxxx   _xxxxxx_   _xxxxxxx),
    %w(xx______   xxx___xx   ______xx   ______xx   xx____xx),
    %w(xx______   xx____xx   xx___xxx   xx____xx   xx____xx),
    %w(xx______   xx____xx   _xxxxxx_   _xxxxxx_   _xxxxxxx),
]

encoded = s.map{|l|
  l.join.chars.reverse.inject 0 do |acc, ch|
    (acc << 1) + (ch == 'x' ? 1 : 0)
  end
}.join(', ')

puts <<-QUINE
eval$s=%w(
  s = %(eval$s=%w(\#{$s})*"");
  f = -> n { s.slice!(0, n) };
  w = 32.chr;
  m = w * 3;
  g = -> { puts(f[62]) };
  h = -> { puts(f[2] + w * 58 + f[2]) };

  g[];
  h[];

  puts([
    #{encoded}
  ].map{|l|
    f[2] + (0...40).map {|i|
      (i % 8 > 0 ? "" : m) + (l[i] > 0 ? f[1] : w)
    } * "" + m + f[2]
  });

  h[];
  g[]
)*""
QUINE
