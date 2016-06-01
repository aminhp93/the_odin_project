class Node
	attr_accessor :leftchild, :rightchild, :value

	def initialize(value)
		@value = value
	end
end

class TreeBuilder
	attr_accessor :root

	def initialize(root=nil)
		@root = Node.new(root)
	end

	def build_tree(array)
		arr = Array.new
		array.each {|i| arr << insert_node(i)}
		arr
	end

	def insert_node(value)
		node = @root

		if node.nil?
			node = Node.new(value)
		else
			insert_node_helper(node,value)
		end
	end

	def insert_node_helper(node, value)
		if (value < node.value)
			if node.leftchild.nil?
				node.leftchild = Node.new(value)
			else
				insert_node_helper(node.leftchild, value)
			end
		elsif (node.value < value)
			if node.rightchild.nil?
				node.rightchild = Node.new(value)
			else
				insert_node_helper(node.rightchild, value)
			end
		else
			return node
		end
	end

	def build_tree_unsorted(array)

	end
	# implemented with a queue
	def breadth_first_search(target)
		queue = Array.new
		queue.unshift(@root)
		while !queue.empty?
			element = queue.shift
			return element if element.value == target
			queue << element.leftchild if !element.leftchild.nil?
			queue << element.rightchild if !element.rightchild.nil?
		end
		return nil
	end



	def depth_first_search(target)

	end

	def dfs_rec(target)

	end
end

array_sorted = [28,22,32,38,21,11,26,36]
root = array_sorted[0]
btree = TreeBuilder.new(root)
btree_array = btree.build_tree(array_sorted)
p btree.breadth_first_search(3)