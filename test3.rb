class A  
  #private def prive; end
  #protected def prote; end
  protected
  def prote
    puts "prote"
  end
  
  private
  def prive
    puts "private"
  end
end  

class B < A  
  def initialize  
    a = A.new  
      
    # You can call a protected method on an instance of the parent class from a subclass.  
    a.prote  
      
    # But not a private method. This will fail.  
    #a.prive 
  end 
  def m1
        prive
  end 
end  
		
B.new.m1