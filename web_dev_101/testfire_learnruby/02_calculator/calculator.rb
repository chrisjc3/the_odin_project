def add(x,y)
	x = x.to_i * 1.0
	y = y.to_i * 1.0
	a = x+y
end
def subtract(x,y)
	x = x.to_i * 1.0
	y = y.to_i * 1.0
	a = x-y
end
def sum(arr=[])
	answer = 0
	arr.each do |x|
		answer = answer + x
	end
	return answer
end

def multiply(arr=[])
	answer = 1
	arr.each {|x| answer = answer * x}
	return answer
end