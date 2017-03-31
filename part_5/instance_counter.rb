module InstanceCounter
  def self.included(klass)
    klass.extend ClassMethods
    klass.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      @instances
    end

    def instances=(instance)
      @instances = instance
    end
  end

  module InstanceMethods

    protected

    def register_instance
      self.class.instances ||= 0
      self.class.instances += 1
    end
  end
end