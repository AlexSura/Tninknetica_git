module Validate
  NUMBER_TRAIN_VALIDATE = /^[a-z0-9]{3}\-*[a-z0-9]{2}$/

  def validate!(atr)
    raise 'Number has invalid format!!' if atr.nil?
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
end
