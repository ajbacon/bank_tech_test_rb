module Cream
  def self.cream?
    true
  end
end

class Cookie
  include Cream

  def a_method
    cream?
  end
end
