module Accessors
  def attr_accessor_with_history(*args)
    args.each do |method_name|
      method_var = "@#{method_name}".to_sym
      storage_var = []
      define_method("#{method_name}_history") { storage_var }
      define_method(method_name) { instance_variable_get(method_var) }
      define_method("#{method_name}=".to_sym) do |value|
        instance_variable_set(method_var, value)
        storage_var << value
      end
    end
  end

  def strong_attr_accessor(attr_name, attr_class)
    var_name = "@#{attr_name}".to_sym
    define_method(attr_name) { instance_variable_get(var_name) }
    define_method("#{attr_name}=".to_sym) do |value|
      raise if value.class.to_s != attr_class.to_s
      instance_variable_set(var_name, value)
    end
  end
end
