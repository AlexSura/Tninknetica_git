module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validations
      @validations || []
    end

    def validate(attr, validation_type, param = nil)
      validation = { attr: attr, validation_type: validation_type, param: param }
      instance_variable_set(:@validations, validations.push(validation))
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each { |validation| check(validation) }
    end

    def check(validation)
      attr, validation_type, param = validation.values
      value = instance_variable_get("@#{attr}".to_sym)

      case validation_type
      when :presence
        check_presence(attr, value)
      when :format
        check_regex(attr, value, param)
      when :type
        check_type(attr, value, param)
      end
    end

    def check_presence(attr, value)
      raise ArgumentError, "#{attr} is missing, or blank." if value.nil? || value.to_s.strip.empty?
    end

    def check_regex(attr, value, param)
      raise ArgumentError, "#{attr} is invalid." unless value =~ param
      puts value =~ param
    end

    def check_type(attr, value, param)
      raise TypeError, "#{attr} has invalid type" unless value.is_a?(param)
    end

    # returns true if all validation are passed, false otherwise
    def valid?
      validate!
      true
    rescue ArgumentError, TypeError
      false
    end
  end
end
