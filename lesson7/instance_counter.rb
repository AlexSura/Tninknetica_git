module InstanceCounter
  def self.included(base)
    base.extend ClassMethod #подключение методов класса
    base.include InstanceMethod #подключение инстанс методов
  end

  module ClassMethod
    attr_reader :instances

    protected 

    attr_writer :instances  
  end    

  module InstanceMethod
    protected

    def register_instance
      self.class.class_eval do 
        if self.instances.nil?
          self.instances = 1
        else 
          self.instances += 1
        end
      end
    end
  end

end

