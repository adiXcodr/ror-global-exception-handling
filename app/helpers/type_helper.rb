module TypeHelper
  def array?(var)
    var.is_a?(Array)
  end

  def relation?(var)
    var.is_a?(ActiveRecord::Relation)
  end

  def list?(var)
    array?(var) || relation?(var)
  end

  def boolean?(var)
    [TrueClass, FalseClass].include?(var.class)
  end

  def string?(var)
    var.is_a?(String)
  end

  def integer?(var)
    var.is_a?(Integer)
  end

  def float?(var)
    var.is_a?(Float)
  end

  def number?(var)
    var.is_a?(Numeric)
  end

  def hash?(var)
    var.is_a?(Hash)
  end

  def symbol?(var)
    var.is_a?(Symbol)
  end

  def string_io?(var)
    var.instance_of?(StringIO)
  end

  def model_error?(var)
    var.is_a?(ActiveModel::Errors)
  end
end
