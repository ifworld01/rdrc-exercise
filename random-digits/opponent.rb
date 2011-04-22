class Opponent
  
  attr_reader :secret
  
  def initialize(level)
    generate_secret(level)
  end
  
  def generate_secret(level)
    
    secret = Array.new(5)
    
    secret.map! { rand(level)+1 }
    
  end
  
  def crack_me(guess)
    return "+++++" if secret.eql?(guess)

    correct,incorrect = guess.zip(secret).partition{ |a, b| a == b}
    "+"*correct.length + "-"*incorrect.length  
  end
end