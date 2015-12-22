
class Cipher1
	def ceasar_cipher(string, int)
		ano = Array(0..26)

		alphU = ('A'..'Z').to_a
		alphU = alphU.zip(ano).flatten.compact
		alphU = alphU.reverse

		alphL = ('a'..'z').to_a
		alphL = alphL.zip(ano).flatten.compact
		alphL = alphL.reverse


		p = Regexp.new(/[[:punct:]]/)
		s = Regexp.new(/[[:space:]]/)
		words = string.split("")
		i = 0
		#The numbers in the alpha arrays are unnecessary
		#Original intent was to use hashes with the splat operator: Hash[*alphU] 
		#No need to overkill I guess
		until i == string.size 
			punc_t = p.match words[i]
			space_t = s.match words[i]
			if punc_t == nil && space_t == nil
 				if words[i] == words[i].upcase 
					tgt = alphU.rindex(words[i])
					tgt = tgt - (int*2)
					words[i] = alphU[tgt]
				elsif words[i] == words[i].downcase 
					tgt = alphL.rindex(words[i])
					tgt = tgt - (int*2)
					words[i] = alphL[tgt]
				end
			end
			i += 1
		end
		words = words.join
	end
end

a = Cipher1.new
ans1 = a.ceasar_cipher("What a string!", 5)
ans2 = a.ceasar_cipher("Kinda cool", 32)
ans3 = a.ceasar_cipher("I wonder, if", 3)
ans4 = a.ceasar_cipher("Maybe...possibly, yea?", 8)
puts ans1.to_s
puts ans2.to_s
puts ans3.to_s
puts ans4.to_s