file_path = "inputs/input4.txt"

lines = File.readlines(file_path)

lines = lines.map {|s| s.gsub(/\n/, "").split(',').map {|x| x.split('-')}.map {|y| y.map(&:to_i)}}

def solve (arr)
  r1 = (arr[0][0]..arr[0][1])
  r2 = (arr[1][0]..arr[1][1])
  return r1.cover?(r2) || r2.cover?(r1)
end

def solve2 (arr)
  r1 = (arr[0][0]..arr[0][1])
  r2 = (arr[1][0]..arr[1][1])
  (r1.first <= r2.last) and (r2.first <= r1.last)
end

a = []
lines.each do |x|
  a.push(solve(x))
end
ans1 = 0
a.each do |b|
  if b
    ans1 += 1
  end
end

w = []
lines.each do |x|
  w.push(solve2(x))
end
ans2 = 0
w.each do |z|
  if z
    ans2 += 1
  end
end
puts ans1
puts ans2
