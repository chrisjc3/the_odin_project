#Taken as notes:
#https://github.com/ultrasaurus/test-first-teaching/blob/master/learn_ruby/timer/solution/timer.rb

class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def time_string
    hours = @seconds/3600
    remainder = @seconds%3600
    sprintf("%02d:%02d:%02d", hours, remainder/60, remainder%60)
  end
  
end