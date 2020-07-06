#!/usr/bin/env ruby

s = [
    %w(xx__xx__   xx______   xx____xx   _xxxxxx_   ______xx),
    %w(xx_xxxxx   xx______   xx____xx   xx____xx   ______xx),
    %w(xxxx__xx   xx_xxx__   xxx__xxx   xx______   ______xx),
    %w(xxx_____   xxxxxxx_   _xxxxxxx   _xxxxx__   _xxxxxxx),
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
  p = 32.chr;
  q = p * 3;
  g = -> { puts(f[62]) };
  h = -> { puts(f[2] + p * 58 + f[2]) };

  g[];
  h[];

  puts([
    #{encoded}
  ].map{|l|
    t = f[2];
    40.times {|i|
      t += (i % 8 == 0 ? q : '') + (l[i] > 0 ? f[1] : p)
    };
    t + q + f[2]
  });

  h[];
  g[]
)*""
QUINE
