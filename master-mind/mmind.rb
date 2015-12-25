#https://www.youtube.com/watch?v=rmp05sCXTRg

#generate a 4 element array of colors
#there are 6 colors to chose from
#feedback:
	#white = correct color, wrong place
	#black = correct color, correct place
		#order of feedback is not considered
#player gets 8 guesses

#################Define AI last, make AI gen_col_tgt first
#################REPLICATE that guy's youtube strategy 
#################should probably be able to win every time
#AI should:
	#Guess 4 of one color, recieve feedback
	#based on feedback change two right colors
	#based on feedback continue and find the 4 correct colors
	#try to position them correctly

module Enumerable
  def does_not_include?(item)
    !include?(item)
  end
end

col_arr = ["green","red","blue","black","purple","yellow"]

def ai_col_tgt(arr)
	i = 1
	col_tgt = []
	until i > 4
		col_tgt.push arr[rand(6)]
		i += 1
	end
	return col_tgt.to_a
end

#def player_col_tgt

#end

def guess_tgt
	puts "First Color: "
		c1 = gets.chomp
		c1 = c1.to_s
	puts "Second Color: "
		c2 = gets.chomp
		c2 = c2.to_s
	puts "Third Color: "
		c3 = gets.chomp
		c3 = c3.to_s
	puts "Fourth Color: "
		c4 = gets.chomp
		c4 = c4.to_s
	guess_arr = [c1,c2,c3,c4]
	return guess_arr
end

def return_feedback(a, b)
	feedback = []
	tested = []
	correct = []
	allow = 1
	#Assigns allow to highest frequency
	afreq = a.to_s
	afreq = afreq.split(",")
	freq = Hash.new(0)
	afreq.each { |col| freq[col] += 1} 
	freq = freq.sort_by{|a,b|b}
	f = freq.reverse[0]
	allow = f[1,1].to_s
	allow = allow.gsub(/\W/,"")
	allow = allow.to_i
	#check if any correct position and push to front
	i = 0
	act = 1
	until i >= 3
		if a[i] == b[i]
			if correct.does_not_include? b[i]
				feedback.push "correct"
				correct.push b[i]
			elsif act < allow
				feedback.push "correct"
				correct.push b[i]
				act += 1
			end
		end
		i += 1
	end
	#recirculate barring corrects and check if present
	i = 0
	act = 1
	until i >= 3
		if a.include? b[i] and a[i] != b[i]
			if tested.does_not_include? b[i]
				feedback.push "present"
				tested.push b[i]
			elsif act < allow
				feedback.push "present"
				tested.push b[i]
				act += 1
			end
		end
		tested.push b[i]
		i += 1
	end
	#fill feedback w/ nil if applicable
	until feedback.size == 4
		feedback.push "nil"
	end
	return feedback
end


answer = ai_col_tgt(col_arr)
#print answer 
puts "Answer: " + answer.to_s

#Do until feedback = true or i = 7
i = 1
until i == 7
	guess = guess_tgt
	puts "Guess Number " + i.to_s + ": " + guess.to_s
	if answer == guess
		puts "Guesser wins!"
		break
	else
		x = return_feedback(answer, guess)
		puts "Feedback Number " + i.to_s + ": " + x.to_s
	end
i += 1
end