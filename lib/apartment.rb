class Apartment
  attr_reader :number,
              :monthly_rent,
              :bathrooms,
              :bedrooms

  attr_accessor :renter

  def initialize(value)
    @number = value[:number]
    @monthly_rent = value[:monthly_rent]
    @bathrooms = value[:bathrooms]
    @bedrooms = value[:bedrooms]
    @renter = value[:name]
  end

  def add_renter(renter)
    @renter = renter
  end
end
