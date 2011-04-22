class Opponent
  
  attr_accessor :secret
  
  def initialize(level)
    generate_secret(level)
  end
  
  def generate_secret(level)
    
    @secret = Array.new(5)
    
    @secret.map! { rand(level)+1 }
    
  end
  
  def crack_me(guess)
    return "+++++" if self.secret.eql?(guess)

    correct,incorrect = guess.zip(self.secret).partition{ |a, b| a.to_i == b}
    "+"*correct.length + "-"*incorrect.length  
  end
end