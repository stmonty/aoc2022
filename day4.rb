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

ans1 = lines.map {|df| solve(df)}
ans1 = ans1.filter {|sd| sd}.length
puts ans1

ans2 = lines.map {|df| solve2(df)}
ans2 = ans2.filter {|sd| sd}.length
puts ans2


