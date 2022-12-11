lines = File.readlines("inputs/input10.txt")

cycles = []
lines.each do |line|
  line = line.gsub(/\n/, "").split(" ")
  if line[0] == 'noop'
    cycles << 0
    next
  end
  if line[0] == 'addx'
    cycles << 0
    cycles << line[1].to_i
  end
end
cycles[0] = 1
ans1 = (cycles[0...19].sum * 20) + (cycles[0...59].sum * 60) + (cycles[0...99].sum * 100) + (cycles[0...139].sum * 140) + (cycles[0...179].sum * 180) + (cycles[0...219].sum * 220)

# Part2
crt = Array.new(240)
draw = Array.new(40)
draw[0] = '#'
draw[1] = '#'
draw[2] = '#'

cycles[0] = 0
center = 1
p cycles
(0...240).each do |i|
  if draw[i % 40] == '#'
    crt[i] = '#'
  else
    crt[i] = '.'
  end
  if cycles[i] == 0
    next
  end
  draw[center - 1] = nil
  draw[center] = nil
  draw[center + 1] = nil
  center = center = cycles[0..i].sum + 1
  draw[center - 1] = '#'
  draw[center] = '#'
  draw[center + 1] = '#'
end

p ans1
crt.each_slice(40) do |s|
  p s
end
