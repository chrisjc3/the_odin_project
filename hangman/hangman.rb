#all case insensitive
#drawing not required by assignment
# turns = 6 

#no error handling, so easy to mess up your turns/short the game
	#^wasn't requested by assignment

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
#computer generates a random word from array
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
def player_char_guess
	fin = false
	begin 
		puts "Guess a character:"
		char = gets.chomp
		if char.length > 1 and char != "save" and char != "load"
			puts "Learn to play!"
			char = nil
			redo
		elsif $feedback.include? char 
			puts "Pick again! (Already selected)"
			char = nil
			redo
		else
			char = char.to_s
			char.downcase	
			fin = true
		end
	end until fin == true

	return char
end
def player_word_guess
	wguess = nil
	unless wguess.nil? == false
		puts "Guess word:"
		wguess = gets.chomp
		wguess = wguess.to_s
		wguess.downcase	
	end
	return wguess
end
def check_char_guess(answer, guess)
	answer.map.each_with_index do |char, index|
		if char == guess
			$feedback[index] = char
		end
	end
	return $feedback
end

def ismenucommand(player_input)
	if player_input == "save"
		$menuc = "save"
		return true
	elsif player_input == "load"
		$menuc = "load"
		return true
	elsif player_input == "end"
		$menuc = "end"
		return true
	end
end

#########################GAME START##########################################

words = dict_csv_to_arr
$tgt_word = ai_pick_word(words)

turn = 1
turn_max = 6
$feedback = blank_feedback($tgt_word)

until turn > turn_max
#puts "ANSWER: " + $tgt_word.join.to_s
puts "Turn Number: " + turn.to_s
	gtype = nil
	unless gtype.nil? == false
		puts "FEEDBACK: " + $feedback.join.to_s
		puts "Select action:"
		puts "(0 = Char Guess, 1 = Word Guess, save, load, end)"
		gtype = gets.chomp
		if ismenucommand(gtype) == true
			if $menuc == "save"
				save_state = [$tgt_word.join.to_s, $feedback.join.to_s, turn].to_a
				CSV.open("save.csv", "wb") do |csv|
					csv << save_state
				end
				puts "game saved"
				break
			elsif $menuc == "load"
				contents = CSV.read("save.csv")
				$tgt_word = contents[0][0].chars.to_a
				$feedback = contents[0][1].chars.to_a
				$feedback = $feedback.keep_if {|c| c != " "}
				$feedback = $feedback.collect {|c| " " + c + " "}
				turn = contents[0][2].to_i
				puts "loaded"
				redo
			elsif $menuc == "end"
				break
			end
		else 		
			gtype = gtype.to_i
		end
		if gtype == 0 
			curr_guess = player_char_guess
			$feedback = check_char_guess($tgt_word, curr_guess)
		elsif gtype == 1
			curr_guess = player_word_guess
			if $tgt_word == curr_guess.chars.to_a
				puts "PLAYER WINS!!"
				turn = 6
			else
				puts "Nope"
			end
		else
			puts "Learn to play!"
		end
	end
	turn += 1
end




#########################GAME END############################################