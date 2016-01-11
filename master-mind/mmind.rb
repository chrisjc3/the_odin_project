#https://www.youtube.com/watch?v=rmp05sCXTRg

#generate a 4 element array of colors
#there are 6 colors to chose from
#feedback:
	#white = correct color, wrong place
	#black = correct color, correct place
		#order of feedback is not considered
#player gets 8 guesses

#Probably not going to do AI...#
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

def ai_col_tgt(arr)
	i = 1
	col_tgt = []
	until i > 4
		col_tgt.push arr[rand(6)]
		i += 1
	end
	return col_tgt.to_a
end

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

def gen_freq(a)
	afreq = a
	freq = Hash.new(0)
	afreq.each { |col| freq[col] += 1} 
	return freq
end

def make_keys(a)
		nx = a.flatten
		$cl_nm1 = nx[0]
		$cl_no1 = nx[1]
		$cl_nm2 = nx[2]
		$cl_no2 = nx[3]
		$cl_nm3 = nx[4]
		$cl_no3 = nx[5]
		$cl_nm4 = nx[6]
		$cl_no4 = nx[7]
end

def find_allow(a)
	if a == $cl_nm1
		return $cl_no1
	end
	if a == $cl_nm2
		return $cl_no2
	end
	if a == $cl_nm3
		return $cl_no3
	end
	if a == $cl_nm4
		return $cl_no4
	end
end

def return_feedback(a, b)
	feedback = []
	tested = []
	correct = []
	present = []
	afreq = gen_freq(a)
	make_keys(afreq)
	i = 0

	until i == 4
		if a[i] == b[i]
			correct.push b[i]
		elsif a.include? b[i] and a[i] != b[i]
			present.push b[i]
		else
			tested.push b[i]
		end
		i += 1
	end

	i = 0
	until i == correct.size
		j = 0
		x = correct.count(correct[i])
		until j == x.to_i
			feedback.push "correct"
			j += 1
		end
		i += 1
	end

	i = 0
	until i == present.size
		x = find_allow(present[i])
		j = 0
		c = correct.count(present[i])
		x = x.to_i - c.to_i
		until j == x.to_i
			feedback.push "present"
			j += 1
		end
		i += 1
	end

	#fill feedback w/ nil if necessary
	until feedback.size == 4
		feedback.push "nil"
	end

	return feedback
end

################GAME START######################

col_arr = ["green","red","blue","black","purple","yellow"]

puts "Who picks colors? 0 = ai ; 1 = you"
ply = gets.chomp
ply = ply.to_i

if ply == 0 
	answer = ai_col_tgt(col_arr)
	puts "Answer: " + answer.to_s
	i = 1
	until i == 8
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
	puts "Please choose from: " + col_arr.to_s
	end
elsif ply == 1
	puts "Please choose from: " + col_arr.to_s
	answer = guess_tgt
	ai_guess = []
	i = 1
	until i == 8
		if i == 1 
			ag = [col_arr[0].to_s,col_arr[0].to_s,col_arr[0].to_s,col_arr[0].to_s]
		end
		puts "Computer guessed: " + ag.to_s
		fb1 = return_feedback(answer, ag)
		puts "Feedback Number " + i.to_s + ": " + fb1.to_s
		if fb1.include? "correct" or fb1.include? "present"
			ai_guess.push [col_arr[1]]
		end



	i += 1
	end



else
	puts "learn to play"
end

################END######################
