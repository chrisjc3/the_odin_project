
#Taken as notes: 
#https://github.com/ultrasaurus/test-first-teaching/blob/master/learn_ruby/book_titles/solution/book2.rb
class Book
  def title=(str)
    words = str.split
    new_title = ""
    words.each_with_index do |word, index|
      if word.length > 3 or index == 0 or word == "i"
        new_title << word.capitalize
      else
        new_title << word
      end
      new_title << " "
    end
    @title = new_title.chop
  end

  def title
    @title
  end
end