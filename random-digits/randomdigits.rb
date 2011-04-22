class RandomDigits
  require 'opponent'
  
  SUCCESS = "+++++"
  MAX_ATTEMPTS = 10
  
  def initialize
    code_cracked = false
    attempts = 0
     p <<END_STRING
     Welcome to Random Digits. 
     Please choose a difficulty level, considering there are 5 positions.
     Level 5 - each position can contain numbers 1 - 5.
     Level 10 - each position can contain numbers 1 - 10.
     You will have 10 chances to crack the code.
     Each guess will generate a response informing you which position you guess correctly.
     The symbol '+' indicates a corect guess.
     The symbol '-' indicates an incorrect guess. 
     There can be duplicate digits in the code. 
     After 10 incorrect guesses, the secret will be revealed. 
END_STRING
   
    print "Enter you difficulty level (5, 10, or 15) >> "
    level = gets.to_i
    opponent = Opponent.new(level)
    while !code_cracked and attempts != MAX_ATTEMPTS
      print "Enter you 5 numbers separated by commas >> "
      console_guess = gets
      guess = console_guess.chomp.split(',')
      result = opponent.crack_me(guess)
      if result == SUCCESS
        print "You cracked the code!"
        code_cracked = true
      else
        p "Almost .. " + result.to_s
        attempts += 1
      end
    end
    p "Code was -----> " + opponent.secret.to_s
  end
  
  rand = RandomDigits.new
  
end