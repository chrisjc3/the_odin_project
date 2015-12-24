


require 'matrix'

class Matrix
	#turn open Matrix class into a tic-tac-toe board
	def refresh_board
		i = 0
		puts "---------"
		self.each do |number|
		  print "|" + number.to_s + "|"
		  i+= 1
		  if i == self.column_size
		    print "\n"
		    i = 0
		  end
		end
		puts "---------"	
	end
	def pick_move(i,j,p)
		if self[i-1, j-1] == 0 
			self.send(:[]=,i-1,j-1,p)
		else
			puts "Sorry, space taken.."
			self.p_input(p)
		end
	end 

	def p_input(player)
		puts "Row:"
		r = gets.chomp
		r = r.to_s
		r = r[0]
		puts "Column:"
		c = gets.chomp
		c = c.to_s
		c = c[0]
		self.pick_move(r.to_i,c.to_i,player)
	end

	def win_eval(i) 
		#Should probably be case or some fancy rubyist way
		#but could not find a lot of matrix documentation
		#by column
		if self[0,0] == i and 
		self[1,0] == i and 
		self[2,0] == i 
			ans = "Player " + i.to_s + " wins"
			puts ans
			return true
		elsif self[0,1] == i and 
		self[1,1] == i and 
		self[2,1] == i 
			ans = "Player " + i.to_s  + " wins"
			puts ans
			return true
		elsif self[0,2] == i and 
		self[1,2] == i and 
		self[2,2] == i 
			ans = "Player " + i.to_s  + " wins"
			puts ans
			return true
		#by row
		elsif self[0,0] == i and 
		self[0,1] == i and 
		self[0,2] == i 
			ans = "Player " + i.to_s  + " wins"
			puts ans
			return true
		elsif self[1,0] == i.to_s  and 
		self[1,1] == i and 
		self[1,2] == i 
			ans = "Player " + i.to_s  + " wins"
			puts ans
			return true
		elsif self[2,0] == i and 
		self[2,1] == i and 
		self[2,2] == i 
			ans = "Player " + i.to_s  + " wins"
			puts ans
			return true	
		#by diag
		elsif self[0,0] == i and 
		self[1,1] == i and 
		self[2,2] == i 
			ans = "Player " + i.to_s  + " wins"
			puts ans
			return true
		elsif self[0,2] == i and 
		self[1,1] == i and 
		self[2,1] == i 
			ans = "Player " + i.to_s  + " wins"
			puts ans
			return true
		else
			return false
		end
	end
end

class Game
#Make a board and loop the game till someone wins
class << self; attr_accessor :board end
@board = Matrix[[0,0,0],[0,0,0],[0,0,0]]

	gm = Game.new
	gm = Game.board
	gm.refresh_board
	p = 3
		loop do
			if p == 1
				p = 2 
			elsif p == 2
				p = 1
			elsif p == 3
				p = 1
			end
			gm.p_input(p)
			gm.refresh_board
			if gm.win_eval(p) == true
				break
			end
		end 
end

