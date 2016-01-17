#generate a 4 element array of colors
#there are 6 colors to chose from
#feedback:
	#white = correct color, wrong place
	#black = correct color, correct place
		#order of feedback is not considered
#players get 8 guesses

#NO ERROR CHECKING!!!

#Probably not going to do AI...#
#minor AI...11JAN#

#craft7/8 for ai answers could be vastly improved

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
#if not in col_array then repeat yada ya
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

def nilbyside(x, arr)
	if x == 1 
		if arr[0] == nil 
			return 0
		elsif arr[1] == nil
			return 1
		else
			return nil
		end
	end
	if x == 2
		if arr[2] == nil 
			return 2
		elsif arr[3] == nil
			return 3
		else
			return nil
		end
	end
end

########################CRAFTED ANSWERS 6:8 START######################
def craft6
#populate blank guess
	ai_guess = []
#get count of first presence since it's the basis of all answers
	col1 = $fb1.count("correct").to_i
#other counts deduct col0
	col2 = (4 - $fb2.count("nil")) - col1
	col3 = (4 - $fb3.count("nil")) - col1
	col4 = (4 - $fb4.count("nil")) - col1
	col5 = (4 - $fb5.count("nil")) - col1
#get 6th color if applicaple	
	tot = col1 + col2 + col3 + col4 + col5
	if tot < 4 then
		col6 = 4 - tot 
	else 
		col6 = 0
	end
#push answers to array
	if col1 > 0 then
		i = 0
		until i == col1
			ai_guess.push $col_arr[0]
			i += 1
		end
	end

	if col2 > 0 then
		i = 0
		until i == col2
			ai_guess.push $col_arr[1]
			i += 1
		end
	end
	if col3 > 0 then
		i = 0
		until i == col3
			ai_guess.push $col_arr[2]
			i += 1
		end
	end
	if col4 > 0 then
		i = 0
		until i == col4
			ai_guess.push $col_arr[3]
			i += 1
		end
	end
	if col5 > 0 then
		i = 0
		until i == col5
			ai_guess.push $col_arr[4]
			i += 1
		end
	end
	if col6 > 0 then
		i = 0
		until i == col6
			ai_guess.push $col_arr[5]
			i += 1
		end
	end

	return ai_guess
end

def craft78
	#assumes craft6 lands 4 present (it does...)
	ai_guess = [nil, nil, nil, nil]
	if $fb6.count("present") == 4
		#flip all in halves if 4 are wrong
		ai_guess[0] = $ag6[1]
		ai_guess[1] = $ag6[0]
		ai_guess[2] = $ag6[3]
		ai_guess[3] = $ag6[2]
	elsif $fb6.count("present") == 2
		#flip first 2 if 2 are wrong
		ai_guess[0] = $ag6[0]
		ai_guess[1] = $ag6[1]
		ai_guess[2] = $ag6[3]
		ai_guess[3] = $ag6[2]
	else
		ai_guess = $ag6
		ai_guess = ai_guess.sort_by{|x| x=~$ag6[3] ? 0 : 1}
	end
	$x += 1
	return ai_guess
end


########################CRAFTED ANSWERS 6:8 END######################


################GAME START######################

$col_arr = ["green","red","blue","black","purple","yellow"]

puts "Who picks colors? 0 = ai ; 1 = you"
ply = gets.chomp
ply = ply.to_i
########################HUMAN##########################
if ply == 0 
	answer = ai_col_tgt($col_arr)
	#mindmaster godmode
	#puts "Answer: " + answer.to_s
	puts "Please choose from: " + $col_arr.to_s

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
		puts "Computer had generated:"
		puts answer.to_s
	end
	end

########################AI##########################
elsif ply == 1
	puts "Please choose from: " + $col_arr.to_s
	answer = guess_tgt
	ai_guess = []
	i = 0


	until i == 8
###############FIRST 5 GUESSES ARE PREDETERMINED###########
		#Guess 1
		if i == 0
			ag = [$col_arr[0].to_s,$col_arr[0].to_s,$col_arr[0].to_s,$col_arr[0].to_s]
			puts "---------------------------------"
			puts "Computer guessed: " + ag.to_s
			if answer == ag
				puts "Computer wins!"
				break
			end
			$fb1 = return_feedback(answer, ag)
			fno = i + 1
			puts "Feedback Number " + fno.to_s + ": " + $fb1.to_s
		end
		#Guess 2
		if i == 1
			ag = [$col_arr[0].to_s,$col_arr[0].to_s,$col_arr[i].to_s,$col_arr[i].to_s]
			puts "---------------------------------"
			puts "Computer guessed: " + ag.to_s
			if answer == ag
				puts "Computer wins!"
				break
			end
			$fb2 = return_feedback(answer, ag)
			fno = i + 1
			puts "Feedback Number " + fno.to_s + ": " + $fb2.to_s
		end
		#Guess 3
		if i == 2
			ag = [$col_arr[0].to_s,$col_arr[0].to_s,$col_arr[i].to_s,$col_arr[i].to_s]
			puts "---------------------------------"
			puts "Computer guessed: " + ag.to_s
			if answer == ag
				puts "Computer wins!"
				break
			end
			$fb3 = return_feedback(answer, ag)
			fno = i + 1
			puts "Feedback Number " + fno.to_s + ": " + $fb3.to_s
		end
		#Guess 4
		if i == 3
			ag = [$col_arr[0].to_s,$col_arr[0].to_s,$col_arr[i].to_s,$col_arr[i].to_s]
			puts "---------------------------------"
			puts "Computer guessed: " + ag.to_s
			if answer == ag
				puts "Computer wins!"
				break
			end
			$fb4 = return_feedback(answer, ag)
			fno = i + 1
			puts "Feedback Number " + fno.to_s + ": " + $fb4.to_s
		end
		#Guess 5
		if i == 4
			ag = [$col_arr[0].to_s,$col_arr[0].to_s,$col_arr[i].to_s,$col_arr[i].to_s]
			puts "---------------------------------"
			puts "Computer guessed: " + ag.to_s
			if answer == ag
				puts "Computer wins!"
				break
			end
			$fb5 = return_feedback(answer, ag)
			fno = i + 1
			puts "Feedback Number " + fno.to_s + ": " + $fb5.to_s
		end
### PRESENCE OF 6 CAN BE ASSUMED BASED ON PRIOR ###
		#Guess 6
		#START DIAGNOSING FEEDBACK FOR GUESSES
		if i == 5
			$ag6 = craft6
			puts "---------------------------------"
			puts "Computer guessed: " + $ag6.to_s
			if answer == $ag6
				puts "Computer wins!"
				break
			end
			$fb6 = return_feedback(answer, $ag6)
			fno = i + 1
			puts "Feedback Number " + fno.to_s + ": " + $fb6.to_s
		end
		#Guess 7
		$x = 0
		if i == 6
			$ag7 = craft78
			puts "---------------------------------"
			puts "Computer guessed: " + $ag7.to_s
			if answer == $ag7
				puts "Computer wins!"
				break
			end
			$fb7 = return_feedback(answer, $ag7)
			fno = i + 1
			puts "Feedback Number " + fno.to_s + ": " + $fb7.to_s
		end
		#Guess 8
		if i == 7
			ag = craft78
			puts "---------------------------------"
			puts "Computer guessed: " + ag.to_s
			if answer == ag
				puts "Computer wins!"
				break
			end
			fb8 = return_feedback(answer, ag)
			fno = i + 1
			puts "Feedback Number " + fno.to_s + ": " + fb8.to_s
		end
	i += 1
	if i == 8
		puts "Computer lost"
	end
	end
else
	puts "learn to play"
end

################END######################



