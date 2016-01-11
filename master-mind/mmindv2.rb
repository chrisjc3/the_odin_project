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
#should probably put in error handling
#if not in col_array then repeat
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
	correct = []
	present = []
	afreq = gen_freq(a)
	make_keys(afreq)

	i = 0
	until i == 4
		if a[i] == b[i]
			correct.push b[i]
		end
		i += 1
	end

	i = 0
	until i == 4
	xmax = find_allow(b[i])
		if a.include? b[i] and a[i] != b[i] and (correct.count(b[i]) + present.count(b[i])) < xmax
			present.push b[i]
		end
		i += 1
	end

	#collect feedback
	correct.select {|e| feedback.push "correct"}
	present.select {|e| feedback.push "present"}	

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
########################HUMAN##########################
if ply == 0 
	answer = ai_col_tgt(col_arr)
	puts "Answer: " + answer.to_s
	puts "Please choose from: " + col_arr.to_s

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
	if i == 8 
		puts "You lose"
	end
	end

########################AI##########################
elsif ply == 1
	puts "Please choose from: " + col_arr.to_s
	answer = guess_tgt
	ai_guess = []
	i = 0


	until i == 7
###############FIRST 5 GUESSES ARE PREDETERMINED###########
		#Guess 1
		if i == 0
			ag = [col_arr[0].to_s,col_arr[0].to_s,col_arr[0].to_s,col_arr[0].to_s]
			puts "---------------------------------"
			puts "Computer guessed: " + ag.to_s
			if answer == ag
				puts "Computer wins!"
				break
			end
			fb1 = return_feedback(answer, ag)
			fno = i + 1
			puts "Feedback Number " + fno.to_s + ": " + fb1.to_s
		end
		#Guess 2
		if i == 1
			ag = [col_arr[0].to_s,col_arr[0].to_s,col_arr[i].to_s,col_arr[i].to_s]
			puts "---------------------------------"
			puts "Computer guessed: " + ag.to_s
			if answer == ag
				puts "Computer wins!"
				break
			end
			fb2 = return_feedback(answer, ag)
			fno = i + 1
			puts "Feedback Number " + fno.to_s + ": " + fb2.to_s
		end
		#Guess 3
		if i == 2
			ag = [col_arr[0].to_s,col_arr[0].to_s,col_arr[i].to_s,col_arr[i].to_s]
			puts "---------------------------------"
			puts "Computer guessed: " + ag.to_s
			if answer == ag
				puts "Computer wins!"
				break
			end
			fb3 = return_feedback(answer, ag)
			fno = i + 1
			puts "Feedback Number " + fno.to_s + ": " + fb3.to_s
		end
		#Guess 4
		if i == 3
			ag = [col_arr[0].to_s,col_arr[0].to_s,col_arr[i].to_s,col_arr[i].to_s]
			puts "---------------------------------"
			puts "Computer guessed: " + ag.to_s
			if answer == ag
				puts "Computer wins!"
				break
			end
			fb4 = return_feedback(answer, ag)
			fno = i + 1
			puts "Feedback Number " + fno.to_s + ": " + fb4.to_s
		end
		#Guess 5
		if i == 4
			ag = [col_arr[0].to_s,col_arr[0].to_s,col_arr[i].to_s,col_arr[i].to_s]
			puts "---------------------------------"
			puts "Computer guessed: " + ag.to_s
			if answer == ag
				puts "Computer wins!"
				break
			end
			fb5 = return_feedback(answer, ag)
			fno = i + 1
			puts "Feedback Number " + fno.to_s + ": " + fb5.to_s
		end
### PRESENCE OF 6 CAN BE ASSUMED BASED ON PRIOR ###
		#Guess 6
		#START DIAGNOSING FEEDBACK FOR GUESSES
		if i == 5
			tot = 0
			corrects = fb1.count("correct").to_i
			presents = fb1.count("present").to_i
			tot1 = corrects.to_i + presents.to_i
			if tot1 > 0 
				j = 0
				tot = tot1
				until j == tot1
					ai_guess.push col_arr[0].to_s
				j += 1
				end
			end
			corrects = fb2.count("correct").to_i
			presents = fb2.count("present").to_i
			tot2 = corrects.to_i + presents.to_i
			if tot2 > 0 
				j = 0
				tot2 = tot2 - tot
				until j == tot2
					ai_guess.push col_arr[1].to_s
				j += 1
				end
			end
			corrects = fb3.count("correct").to_i
			presents = fb3.count("present").to_i
			tot3 = corrects.to_i + presents.to_i
			if tot3 > 0 
				j = 0
				tot3 = tot3 - tot
				until j == tot3
					ai_guess.push col_arr[2].to_s
				j += 1
				end
			end
			corrects = fb4.count("correct").to_i
			presents = fb4.count("present").to_i
			tot4 = corrects.to_i + presents.to_i
			if tot4 > 0 
				j = 0
				tot4 = tot4 - tot
				until j == tot4
					ai_guess.push col_arr[3].to_s
				j += 1
				end
			end
			corrects = fb5.count("correct").to_i
			presents = fb5.count("present").to_i
			tot5 = corrects.to_i + presents.to_i
			if tot > 0 
				j = 0
				tot5 = tot5 - tot
				until j == tot5
					ai_guess.push col_arr[4].to_s
				j += 1
				end
			end

			if ai_guess.size < 4 
				until ai_guess.size == 4
					ai_guess.push col_arr[5].to_s
				end
			end
			ag = ai_guess
			puts "---------------------------------"
			puts "Computer guessed: " + ag.to_s
			if answer == ag
				puts "Computer wins!"
				break
			end
			fb6 = return_feedback(answer, ag)
			fno = i + 1
			puts "Feedback Number " + fno.to_s + ": " + fb6.to_s
		end
		#Guess 7


		
		# if i > 5
		# afreq = gen_freq(ai_guess)
		# make_keys(afreq)
		# 	j = 1
		# 	rand_guess = []
		# 	until j == 4
		# 		x = ai_guess[rand(4)]
		# 		xmax = find_allow(x)
		# 		if rand_guess.count(x) < xmax 
		# 			rand_guess.push ai_guess[rand(4)]
		# 		end
		# 		j += 1
		# 	end
		# 	ag = rand_guess
		# 	puts "---------------------------------"
		# 	puts "Computer guessed: " + ag.to_s
		# 	if answer == ag
		# 		puts "Computer wins!"
		# 		break
		# 	end
		# 	fb7 = return_feedback(answer, ag)
		# 	fno = i + 1
		# 	puts "Feedback Number " + fno.to_s + ": " + fb7.to_s
		# end
		#Guess 8
	i += 1
	if i == 7
		puts "Computer lost"
	end
	end
else
	puts "learn to play"
end

################END######################
