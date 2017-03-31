class Node
	attr_accessor :value, :parent, :l_child, :r_child

	def initialize(value, parent=nil)

	  @value = value
	  @parent = parent
	end
end

class BinaryTree

	def initialize array
		@root = Node.new(array[0])
	end
	def build_tree array
 	  array.each do |x|
 	  	current = @root

 	  	while true
 	  	if x<current.value
 	  		if  current.l_child == nil
 	  			current.l_child = Node.new(x,current)
 	  			puts "left #{current.l_child} is #{current.l_child.value} parent #{current.l_child.parent.value}"
 	  			break
 	  		else
 	  			current = current.l_child	
 	  		end


 	  	elsif x>current.value
 	  		if  current.r_child == nil
 	  			current.r_child = Node.new(x,current)
 	  			puts "right #{current.r_child} is #{current.r_child.value} parent #{current.r_child.parent.value}"
 	  			break
 	  		else
 	  			current = current.r_child
 	  		end
 	  	else
 	  		break
 	  	end
 	  end
     end
	end

	def breadth_first_search num,current = @root, q = ["empty"]

		if current.value == num
			return  "the number #{num} has been found"

		else
			q << current.l_child if current.l_child != nil
			q << current.r_child if current.r_child != nil
			q.shift
			
		end	

			q.each do |c|
				
				if  breadth_first_search(num,c,q) == "the number #{num} has been found"
					return 	"the number #{num} has been found"

			
				end


			end
			
			"nope"
		
	end

	def depth_first_search num, current = @root
		
		if current== nil
			return 
		end

		if current.value == num
			puts "#{current} is the match of #{current.value}"
		end

		depth_first_search(num,current.l_child) 
		depth_first_search(num,current.r_child)


	end


end




a = [12, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

b = BinaryTree.new a
b.build_tree a
b.breadth_first_search 4
