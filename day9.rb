require 'set'

lines = File.readlines("inputs/input9.txt")

h = [0, 0]
t = [0, 0]
seen = Set.new()
seen.add(t)

lines.each do |line|
  line = line.gsub(/\n/, "").split(" ")
  (0...line[1].to_i).each do |_|
    case line[0]
    when 'U'
      h = [h[0] - 1, h[1]]
    when 'D'
      h = [h[0] + 1, h[1]]
    when 'L'
      h = [h[0], h[1] - 1]
    when 'R'
      h = [h[0], h[1] + 1]
    end
    if (t[0] - h[0]).abs > 1 or (t[1] - h[1]).abs > 1
      if h[0] < t[0]
        x = t[0] - 1
      elsif h[0] > t[0]
        x = t[0] + 1
      else
        x = t[0]
      end
      if h[1] < t[1]
        y = t[1] - 1
      elsif h[1] > t[1]
        y = t[1] + 1
      else
        y = t[1]
      end
      t = [x, y]
      seen.add(t)
    end
  end
end

def part2(moves)
  n = []
  s = Set.new()
  h = [0, 0]
  t = [0, 0]
  s.add(t)
  moves.each do |m|
    h = [h[0] + m[0], h[1] + m[1]]
    if (t[1] - h[1]).abs > 1 or (t[0] - h[0]).abs > 1
      if t[0] > h[0]
        x = -1
      elsif t[0] < h[0]
        x = 1
      else
        x = 0
      end
      if t[1] > h[1]
        y = -1
      elsif t[1] < h[1]
        y = 1
      else
        y = 0
      end
      n << [x, y]
      t = [t[0] + x, t[1] + y]
      s.add(t)
    end
  end
  [s.length, n]
end

moves = []
h = [0,0]
lines.each do |line|
  line = line.gsub(/\n/, "").split(" ")
  (0...line[1].to_i).each do |_|
    case line[0]
    when 'U'
      moves << [-1, 0]
      h = [h[0] - 1, h[1]]
    when 'D'
      moves << [1, 0]
      h = [h[0] + 1, h[1]]
    when 'L'
      moves << [0, -1]
      h = [h[0], h[1] - 1]
    when 'R'
      moves << [0, 1]
      h = [h[0], h[1] + 1]
    end
  end
end

ans2 = 0
(0..8).each do |_|
  ans2, moves = part2(moves)
end
p seen.length
p ans2
