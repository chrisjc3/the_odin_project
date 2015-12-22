
Vowels = %w[a e i o u]
Alpha = ('a'..'z').to_a
Consonants = Alpha - Vowels

def translate(arr)
a = arr.split.map do |word| 
	if Vowels.include?(word[0])
	    word + 'ay'
	  elsif word[0..1] == "qu"
	     word[2..-1]+"quay"  
	  elsif word[0..2] == "thr"
	     word[3..-1]+"thray"  
	  elsif word[0..2] == "sch"
	     word[3..-1]+"schay"  
	  elsif word[0..2] == "squ"
	     word[3..-1]+"squay"  
	  elsif Consonants.include?(word[0]) && 
	    Consonants.include?(word[1])
	    word[2..-1] + word[0..1] + 'ay'
	  elsif Consonants.include?(word[0])
	    word[1..-1] + word[0..0] + 'ay'
	end
end
a.join(" ")
end

