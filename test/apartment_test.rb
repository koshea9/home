require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'
require './lib/renter'

class ApartmentTest < Minitest::Test
  # These tests look great! We can go over test setup methods to make the copy/pasting a little less if you'd like

  def test_it_exists
    renter1 = Renter.new("Jessie")
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})

    assert_instance_of Apartment, unit1
  end

  def test_it_has_readable_attributes
    renter1 = Renter.new("Jessie")
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})

    assert_equal "A1", unit1.number
    assert_equal 1200, unit1.monthly_rent
    assert_equal 1, unit1.bathrooms
    assert_equal 1, unit1.bedrooms
    assert_nil nil, unit1.renter
  end

  def test_it_can_add_renter
    # If you have time, going back through a deleting code comments like this will help your code look better
    # skip
    renter1 = Renter.new("Jessie")
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit1.add_renter(renter1)

    assert_equal renter1, unit1.renter
  end


end
