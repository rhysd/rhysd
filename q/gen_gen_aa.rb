#!/usr/bin/env ruby

s = [
  "               xxxx                                                   xxxx",
  "               xxxx                                                   xxxx",
  "               xxxx                                                   xxxx",
  " xxxx  xxxxx   xxxx xxxxxx   xxxx      xxxxx    xxxxxxxxx       xxxxx xxxx",
  " xxxxxxxxxxx   xxxxxxxxxxxx   xxxx     xxxx    xxxxx  xxxx     xxxxxxxxxxx",
  " xxxxxx        xxxxx   xxxx    xxxx   xxxx     xxxx           xxxx   xxxxx",
  " xxxxx         xxxx    xxxx     xxxx xxxx       xxxxxxxxx     xxx     xxxx",
  " xxxx          xxxx    xxxx      xxxxxxx           xxxxxxx    xxx     xxxx",
  " xxxx          xxxx    xxxx       xxxxx        xxx    xxxx    xxxx   xxxxx",
  " xxxx          xxxx    xxxx        xxx         xxxxxxxxxxx     xxxxxxxxxxx",
  " xxxx          xxxx    xxxx       xxxx            xxxxxx        xxxxx xxxx",
  "                              xxxxxxx                                     ",
  "                              xxxxx                                       ",
]

encoded = s.map{|l|
  i = l.chars.reverse.inject 0 do |acc, ch|
    (acc << 1) + (ch == 'x' ? 1 : 0)
  end
  i.to_s(36).dump()
}.join(', ')

puts <<-QUINE
eval($s=%w(
  s = %(eval($s=%w(\#{$s})*""));

  puts([
    #{encoded}
  ].map{|l|
    ((0..#{s[0].length-1}).map {|i|
      l.to_i(36)[i] > 0 ? s.slice!(0) : 32.chr
    } * "").rstrip
  })
)*"")
QUINE
