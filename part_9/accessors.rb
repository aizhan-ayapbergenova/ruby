module Accessors
  def attr_accessor_with_history(*args)
    args.each do |method_name|
      method_var = "@#{method_name}".to_sym
      method_history = []
      define_method(method_name) { instance_variable_get(method_var) }
      define_method("#{method_name}=".to_sym) do |value|
        method_history << instance_variable_get(method_var)
        instance_variable_set(method_var, value)
      end
      define_method("#{method_name}_history".to_sym) do 
        method_history.select { |name| name != nil }
      end
    end
  end

  def strong_attr_accessor(attr_name, attr_class)
    var_name = "@#{attr_name}".to_sym
    define_method(attr_name) { instance_variable_get(var_name) }
    define_method("#{attr_name}=".to_sym) do |value|
      raise unless value.class.is_a?(attr_class)
      instance_variable_set(var_name, value)
    end
  end
end
