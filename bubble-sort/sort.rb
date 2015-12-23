

def bubblesort(arr)
	ct = 0
	i = 0
	complete = false
	until complete == true
		if arr[i] > arr[i+1] 
			arr[i], arr[i+1] = arr[i+1], arr[i]
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



def bubble_sort_by(arr)
	i, mx, ct, complete = 0, arr.size-1, 0, false
	until complete == true
		if yield(arr[i], arr[i+1]) < 0 
				arr[i], arr[i+1] = arr[i+1], arr[i]
				ct += 1
		end
		i +=1
		if i == mx
			i = 0
			if ct == 0 
				complete = true
			end
			ct = 0
		end
	end
	return arr.reverse
end


puts "|--------------------|"
puts "|--	First Test  -|"
puts "|--------------------|"
sort_this = [4,3,99,1,88,8,12]
puts sort_this.to_s
puts "|--------------------|"
puts "|--- bubble sorted --| "
puts "|--------------------|" 
ans1 = bubblesort(sort_this)
puts ans1.to_s
puts "|--------------------|"
puts "|--	Next Test  --|"
puts "|--------------------|"
ans2 = bubble_sort_by(["hi","hello","hey"]) {|left,right| left.length - right.length}
puts ans2.to_s