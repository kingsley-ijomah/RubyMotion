class User
  PROPERTIES = [:id, :name, :email, :phone]
  PROPERTIES.each { |prop| attr_accessor prop }

  def initialize(properties = {})
    properties.each do |key, value|
      if PROPERTIES.member? key.to_sym
        self.send("#{key}=", value)
      end
    end
  end
end
