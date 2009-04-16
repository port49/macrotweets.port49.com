class MacroTweet < ActiveRecord::Base
  attr_accessor :sig
  
  def validate
    Errors.add( 'sig', "Nope." ) unless self.sig == "wtf?!?"
  end
  
end
