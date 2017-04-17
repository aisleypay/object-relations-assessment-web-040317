class Review
  attr_accessor :the_customer, :the_restaurant, :content

  ALL = []

  def initialize (the_restaurant, the_customer, content)
    @the_restaurant = the_restaurant
    @the_customer = the_customer
    @content = content
    ALL << self
  end

  def self.all
    ALL
  end

  def customer
    self.the_customer
  end

  def restaurant
    self.the_restaurant
  end

end
