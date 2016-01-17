

#pseudo code

#all case insensitive
#drawing not required by assignment
# turns => 6 


	#generate random word from /words.txt between 5 and 12 characters in length
require 'csv'
def dict_csv_to_arr
	contents = CSV.open "words.csv", headers: false
	words = []
	contents.each do |row|
		wrd = row[0].to_s
		if wrd.length > 5 and wrd.length < 12 
			words.push wrd
		end
	end
	return words
end
	#computer generates a word from array
def ai_pick_word(arr)
	w_avail = arr.count
	randwrd = arr[rand(w_avail)].downcase
	randwrd = randwrd.chars.to_a
	return randwrd
end
def blank_feedback(word)
	len = word.count
	feedback = []
	until feedback.count == len
		feedback.push " _ "
	end
	return feedback
end
	#player choses letter
def player_guess
	char = nil
	unless char.nil? == false
		puts "Guess a character:"
		char = gets.chomp
		if char.length > 1 
			puts "Learn to play!"
			char = nil
		else
			char = char.to_s
			char.downcase	
		end
	end
	return char
end

def check_guess(answer, guess)
	answer.map.each_with_index do |char, index|
		if char == guess
			$feedback[index] = char
		end
	end
	return $feedback
end


#once game made implement save/load states
	


#########################GAME START##########################################

words = dict_csv_to_arr
tgt_word = ai_pick_word(words)

turn = 1
turn_max = 6
$feedback = blank_feedback(tgt_word)

puts "ANSWER: " + tgt_word.to_s
# tgt_word.map.each_with_index do |char,index|
# 	puts char.to_s + " : " + index.to_s
# end
puts $feedback.to_s

until turn > turn_max
	curr_guess = player_guess
	$feedback = check_guess(tgt_word, curr_guess)
	#display letters in answer and underscore where not yet guessed
	puts "FEEDBACK: " + $feedback.to_s
	turn += 1
end


#########################GAME END############################################