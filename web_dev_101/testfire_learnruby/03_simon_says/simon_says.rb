def echo(string)
	string
end

def shout(string)
	string.upcase
end

def repeat(string, no=2)
	string = string + " "
	s = string * no
	s.strip
end

def start_of_word(string, no)
	a = string.split("")
	b = []
	a.each_index do |x|
		if x < no 
			b.push a[x]
		end
	end
	b.map{|i| i.to_s}.join("")
end

def first_word(string)
	a = string.split(" ")
	a[0]
end

def titleize(string)
	a = string.split(" ")
	c = %w(and the or as is over)
	b = []
	a.each_index do |x|
		ltst = a[x].to_s
		if c.include? ltst and x != 0
			b.push a[x]
		else
			b.push a[x].capitalize
		end	
	end
	b.map{|s| s.to_s}.join(" ")
end