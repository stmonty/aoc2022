
boxes = {
  1 => ['H', 'R', 'B', 'D', 'Z', 'F', 'L', 'S'],
  2 => ['T', 'B', 'M', 'Z', 'R'],
  3 => ['Z', 'L', 'C', 'H', 'N', 'S'],
  4 => ['S', 'C', 'F', 'J',],
  5 => ['P', 'G', 'H', 'W', 'R', 'Z', 'B'],
  6 => ['V', 'J', 'Z', 'G', 'D', 'N', 'M', 'T'],
  7 => ['G', 'L', 'N', 'W', 'F', 'S', 'P', 'Q'],
  8 => ['M', 'Z', 'R'],
  9 => ['M', 'C', 'L', 'G', 'V', 'R', 'T']
}

#### My failed attempt at parsing the crates ####
# file = File.open("inputs/input5-2.txt")
# lines = file.readlines
# lines = lines.map {|line| line.gsub!(" ", "0").gsub(/\n/, "").gsub("[", "").gsub("[", "").gsub("]", "")}

file = File.open("inputs/input5.txt")
lines = file.readlines
lines.each do |line|
  line = line.gsub(/\n/, "").gsub("from", " ").gsub("to", " ").gsub("move", "").gsub("\\", "")
  line = line.split(/\s+/).drop(1).map {|l| l.to_i}
  boxes[line[2]].push(*boxes[line[1]].pop(line[0]).reverse) # Part 1
#  boxes[line[2]].push(*boxes[line[1]].pop(line[0])) # Part 2
end

boxes.each do |key, value|
  p value.last
end

