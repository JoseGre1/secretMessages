module AttributesMethods
  extend ActiveSupport::Concern

  module ClassMethods
    def attributes
      new.as_json.keys.map(&:to_sym)
    end
  end
end
