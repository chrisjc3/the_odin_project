
class Sort
	def bubblesort(arr)
		ct = 0
		i = 0
		complete = false
		until complete == true
			if arr[i] > arr[i+1] 
				x1 = arr[i]
				x2 = arr[i+1]
 				arr[i] = x2
 				arr[i+1] = x1
 				ct += 1
 			else 
 				i += 1
			end
			if i == arr.size-1
				i = 0
				if ct == 0 
					complete = true
				end
				ct = 0
			end
		end
		return arr
	end
end


sort_this = [4,3,99,1,88,8,12]
puts sort_this.to_s
puts " -- bubblsorted -- " 
a = Sort.new
ans1 = a.bubblesort(sort_this)
puts ans1.to_s