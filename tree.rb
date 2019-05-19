class Tree
  attr_accessor :children, :node_name

  def initialize(node_name, children = [])
    @children = children
    @node_name = node_name
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end

  # def visit(&block)
  def visit
    # block.call self
    yield self
  end
end

ruby_tree = Tree.new('Ruby', [Tree.new('Reia'), Tree.new('MacRuby')])

puts 'Visiting a node'
ruby_tree.visit { |node| puts node.node_name }
puts

puts 'Visiting entire tree'
ruby_tree.visit_all { |node| puts node.node_name }
