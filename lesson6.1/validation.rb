module Validate
  NUMBER_TRAIN_VALIDATE = /^[a-z0-9]{3}\-*[a-z0-9]{2}$/

  def validate!
    raise 'Number has invalid format!!' if name.length < 3
  end

  def validate_train!
    raise "номер поезда указан неверно!!" if number !~ NUMBER_TRAIN_VALIDATE 
  end

  def valid?
    validate!
    true
  rescue RuntimeError
    false
  end

  protected

   def validate_station!
    raise 'Number has invalid format!!' if name.length < 3
  end

  def validate_route!
    raise "Number has invalid format.." if @first_station.nil? && @last_station.nil?
  end
end
