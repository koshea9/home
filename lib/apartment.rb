class Apartment
  attr_reader :number,
              :monthly_rent,
              :bathrooms,
              :bedrooms

  # The renter class variable can only be edited through the add_renter method, so this can be a reader function
  # Always try to avoid using attr_accessor unless absolutely necessary (which is almost never) for security purposes
  attr_accessor :renter

  def initialize(value)
    @number = value[:number]
    @monthly_rent = value[:monthly_rent]
    @bathrooms = value[:bathrooms]
    @bedrooms = value[:bedrooms]
    @renter = nil
  end

  def add_renter(renter)
    @renter = renter
  end

  # Even simple extra methods like this that aren't in the interaction pattern should have tests
  def rented?
    @renter !=nil
  end
end
