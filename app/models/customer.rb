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
