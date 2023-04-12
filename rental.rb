class Rental
  attr_accessor :date
  attr_accessor :book
  attr_accessor :person

  def initialize(date)
    @date = date
  end
end