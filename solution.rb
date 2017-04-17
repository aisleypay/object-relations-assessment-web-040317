class Customer
  attr_accessor :first_name, :last_name

  ALL = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    ALL << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    ALL
  end

  def self.find_by_name(name)
    given_first_name = name.split(" ")[0]
    given_last_name = name.split(" ")[1]

    self.all.select { |customer|
      (customer.first_name == given_first_name) && (customer.last_name == given_last_name)
    }
  end

  def self.find_all_by_first_name(name)
    self.all.select { |customer| customer.first_name == name }
  end

  def self.all_name
    self.all.collect { |customer| customer.full_name }
  end

  def add_review(restaurant, content)
    Review.new(restaurant, self, content)
  end
end

#--------------------------------------------------------------------------------#

class Restaurant
  attr_accessor :name

  ALL = []

  def initialize(name)
    @name = name
    ALL << self
  end

  def self.all
    ALL
  end

  def self.find_by_name(name)
    self.all.find {|restaurant| restaurant.name == name}
  end

  def reviews
    Review.all.select {|review| review.restaurant == self}
  end

  def customers
    Review.all.collect {|review| review.customer if review.restaurant == self }
  end

end

#--------------------------------------------------------------------------------#

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
