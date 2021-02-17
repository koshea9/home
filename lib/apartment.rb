class Apartment
  attr_reader :number,
              :monthly_rent,
              :bathrooms,
              :bedrooms,
              :renter

  def initialize(value)
    @number = value[:number]
    @monthly_rent = value[:monthly_rent]
    @bathrooms = value[:bathrooms]
    @bedrooms = value[:bedrooms]
    @renter = nil
  end

  def add_renter(renter)
    @renter = []
    @renter << renter
  end

end
