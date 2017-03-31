class Chess

	def initialize array
		@root = Note.new(array[0])
		@result = array[1]
	end

	def board
		@board = Array.new(8) {Array.new(8)}
		
	end


	def knight_moves array=[@root,@result],q=[[@root]]
		current = array[0]

	 q.each do |subs|
	  subs.each do |move|
		if move.value == array[1]
			@result =[]
			return @result<<move
		end
	  end
	 end

		
			q.push(children(current))
			q[0].shift
			q.shift if q[0].empty?

				
				ary =[q[0][0], array[1]]
				if knight_moves(ary,q)[0].value == array[1]
					i=0
					while @result.last.value != @root.value
						 @result << @result[i].parent
						i+=1
					end
					return  @result
				end

			

	end

	def children root
		a = root.value[0]
		b = root.value[1]
		c=[]
		c.push([a-2,b-1],[a-2,b+1],[a+2,b-1],[a+2,b+1],[a-1,b-2],[a-1,b+2],[a+1,b-2],[a+1,b+2])
 		
 		c.each do |x|
 		if x[0].between?(1,8) && x[1].between?(1,8)

 		root.children << Note.new(x,root)
 		end

 		end



		root.children

	end
	def to_value array
		array.map!{|n| n.value}
	end

	


end


class Note
	attr_accessor :value, :parent, :children

	def initialize value, parent=nil, children=[]
		@value = value
		@parent = parent
		@children = children
	end

end




b=Note.new(0,0)
a = Chess.new([[3,3],[4,3]])
b = a.knight_moves
p a.to_value b.reverse

	





