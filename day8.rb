def check(range, v)
  range.each do |x|
    if x >= v
      return false
    end
  end
  return true
end

def check2(range, v)
  score = 0
  range.each do |x|
    if x >= v
      score += 1
      return score
    else
      score += 1
    end
  end
  return score
end

lines = File.readlines("inputs/input8.txt")
lines = lines.map {|line| line.gsub(/\n/, "").chars.map(&:to_i) } 
WIDTH = lines.length
HEIGHT = lines[0].length
W = WIDTH - 1
H = HEIGHT - 1
$ans1 = (W * 2) + (H * 2)

columns = lines.transpose

lines.each_with_index do |row, i|
  row.each_with_index do |e, j|
    if i == 0 or i == H or j == 0 or j == W
      next
    end
    if check(row[0..j-1], e) or check(row[j+1..W], e) or check(columns[j][0..i-1], e) or check(columns[j][i+1..H], e)
      $ans1 += 1
    end
  end
end

$ans2 = []
lines.each_with_index do |row, i|
  row.each_with_index do |e, j|
    if i == 0 or i == H or j == 0 or j == W
      next
    end
    $ans2 << check2(row[0..j-1].reverse, e) * check2(row[j+1..W], e) * check2(columns[j][0..i-1].reverse, e) * check2(columns[j][i+1..H], e)
  end
end

p $ans1
p $ans2.max
