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

puts '[' + s.map{|l|
  l.join.chars.reverse.inject 0 do |acc, ch|
    (acc << 1) + (ch == 'x' ? 1 : 0)
  end
}.join(', ') + ']'
