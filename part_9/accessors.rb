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

  end
end
