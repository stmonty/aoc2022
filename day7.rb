lines = File.readlines("inputs/input7.txt")

class Directory
  attr_reader :name, :children, :size, :head
  attr_writer :name, :children, :size, :head

  def initialize(name, head)
    @name = name
    @head = head
    @children = []
    @size = 0
  end

  def to_s
    "Directory #{@name}: Size: #{@size}"
  end

end

current_dir = Directory.new('/', nil)
home = current_dir
lines = lines[1..]
lines.each do |line|
  line = line.split(" ")
  if line[0] == 'ls'
    next
  end
  if line[0] == '$'
    if line[1] == 'cd'
      if line[2] == '..'
        current_dir = current_dir.head
      else
        current_dir = current_dir.children.find { |p| p.name == line[2]}
      end
    end
  elsif line[0] == 'dir'
    new_dir = Directory.new(line[1], current_dir)
    current_dir.children << new_dir
  else
    current_dir.size = current_dir.size + line[0].to_i
  end
end
$ans1 = 0
$needed_space = 30000000 - (70000000 - 46975962)
def total_size(node)
  # Calculate the total size of the current node
  node.size + node.children.map { |child| total_size(child) }.inject(0, :+)
end

def find_children(node, size_limit)
  t_size = total_size(node)
  if t_size <= size_limit
    $ans1 += t_size
  end
  # Recursively call the method for each child node
  node.children.each do |child|
    find_children(child, size_limit)
  end
end
ans2 = []
def answer2(node, size_limit, candidates)
  if total_size(node) >= size_limit
    candidates << total_size(node)
  end
  node.children.each do |child|
    answer2(child, size_limit, candidates)
  end
end

find_children(home, 100000)
answer2(home, $needed_space, ans2)
p ans2.min
p $ans1

