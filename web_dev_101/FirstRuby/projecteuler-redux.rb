
#****************************PROJECT EULER PROBLEM 1*******************************#
class PE1

	def Funder (p1)
	mList = Array.new
	x = 1
	lentot = 1..9999999999999999
	c = p1 * x
		for x in lentot
			mList.push(c.to_i)
			x=x+1
			c = p1 * x
			if c >= 1000 then 
				break 
			end
		end  
		mList
	end
	
	def arpush (arr1, arr2)
		lentot = 0..arr2.length
		for i in lentot
			arr1.push(arr2[i])
		end
		arr1
	end
	
	def SumArray (arr1)
		x1 = 0
		lentot = 0..arr1.length
		for i in lentot
		  x1 = x1 + arr1[i].to_i
		end
		x1
	end
	
end

a = PE1.new
c1 = a.Funder(3)
c2 = a.Funder(5)
a1 = a.arpush(c1,c2)
a1 = a1.uniq
a1 = a.SumArray(a1)
puts "Multiple of 3 and 5 under 1000: " + a1.to_s


#****************************PROJECT EULER PROBLEM 2*******************************#

class PE2

	def Fibro (p1)
	mList = Array.new
	x = 2
	lentot = 1..9999999999999999
	mList.push(1,2)
	#define c as push
		for x in lentot
			c = mList[x] + mList[x-1]
			mList.push(c.to_i)
			if (mList[x] + mList[x+1]) > p1 then 
				break 
			end
		end  
		mList
	end
	
	def EvenNos (p1)
	x = 1
	lentot = 1..p1.length
	mList = Array.new
	#define c as push
		for x in lentot
			if p1[x].to_i % 2 == 0 then
				c = p1[x]
				mList.push(c.to_i)
			end
		end    
		mList
	end
	
	def SumArray (arr1)
		x1 = 0
		lentot = 0..arr1.length
		for i in lentot
		  x1 = x1 + arr1[i].to_i
		end
		x1
	end
	
end

b = PE2.new
c1 = b.Fibro(4000000)
c2 = b.EvenNos(c1)
a2 = b.SumArray(c2)
puts "Sum of Even Fibro seq under 4m: " + a2.to_s

#****************************PROJECT EULER PROBLEM 3*******************************#

class PE3

	def FindLPrime(x)
		prms = Array.new
		y = x
		lentot = x
		i = 2
		while i <= lentot
			if y%i==0 then 
				prms.push(i)
				y=y/i
			else 
				i=i+1
			end 
		end
		prms
	end
	
	
end

c = PE3.new
c1 = c.FindLPrime(100000)
a3 = Array.new
a3.push(c1)
puts "Prime Factors of 100000: " + a3.to_s















