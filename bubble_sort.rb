def bubble_sort(array)
	(array.length-1).times do		
		array.each_index do |i|
			if (i < array.length-1) && (array[i] > array[i+1]) 
				array[i], array[i+1] = array[i+1], array[i]
			end
		end
	end
	array
end

def bubble_sort_by(array)
	(array.length-1).times do		
		array.each_index do |i|
			if (i < array.length-1) && (yield(array[i], array[i+1]) < 0) 
				array[i], array[i+1] = array[i+1], array[i]
			end
		end
	end
	array
end





puts bubble_sort([4,3,78,2,0,2]).to_s
puts bubble_sort([9,8,5,4,3,1]).to_s


g = bubble_sort_by(["hi", "hello", "hey"]) { 
							|left, right|	right.length - left.length }
puts g.to_s

g = bubble_sort_by(["cheese", "sauce", "feta", "dog", "fourthousand"]) {
							 |left, right|	right.length - left.length }
puts g.to_s


