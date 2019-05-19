# Print the contents of an array of sixteen numbers, four numbers
# at a time, using just 'each'.
numbers = (0..15).to_a
numbers.each { |n| p numbers.slice(n, 4) if (n % 4).zero? }
puts

# Now, do the same with 'each_slice' in 'Enumerable'.
numbers.each_slice(4) { |ns| p ns }
puts

# The Tree class was interesting, but it did not allow you to specify
# a new tree with a clean user interface. Let the initializer accept a
# nested structure with hashes and arrays. You should be able to
# specify a tree like this: {'grandpa' => { 'dad' => {'child 1' => {}, 'child
# 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } }.
class Tree
  attr_accessor :node_name, :children

  def initialize(tree)
    @node_name = tree.keys.first
    @children = tree[@node_name].map do |(node_name, subtree)|
      Tree.new(node_name => subtree)
    end
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end

  def visit
    yield self
  end
end

tree = Tree.new('grandpa' => {
                  'dad' => { 'child 1' => {}, 'child 2' => {} },
                  'uncle' => { 'child 3' => {}, 'child 4' => {} }
                })

puts 'Visiting root'
tree.visit { |node| puts node.node_name }
puts

puts 'Visiting entire tree'
tree.visit_all { |node| puts node.node_name }
puts

# Write a simple grep that will print the lines of a file having any
# occurrences of a phrase anywhere in that line. You will need to do
# a simple regular expression match and read lines from a file. (This
# is surprisingly simple in Ruby.) If you want, include line numbers.
def grep(filename, pattern)
  regex = Regexp.new(pattern)
  File.readlines(filename).each { |line| p line if line =~ regex }
end

grep 'grep.txt', 'rod'
