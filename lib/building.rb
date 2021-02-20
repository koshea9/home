class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  # You could also just use a regular map (without the if block) and compact the resulting array to get rid of nils
  def renters
    @units.flat_map do |unit|
      if unit.rented?
        unit.renter.name
      else []
      end
    end
  end

  # I really like how you did this - summing as floats and dividing by length is perfect
  def average_rent
    sum_rent = @units.sum do |unit|
      unit.monthly_rent.to_f
    end
    sum_rent / @units.length
  end

  def rented_units
    @units.find_all do |unit|
      # You could use unit.renter here instead because if will evaluate to nil (which is falsy) if there is no renter
      unit.renter != nil
    end
  end

  def renter_with_highest_rent
    most_expensive = rented_units.max_by do |unit|
      unit.monthly_rent
    # Make sure to line up your ends with the start of the block. I write the end for every block before I fill in the logic
    # Establishing that habit early will help you later on when the code gets more complicated
    end
    most_expensive.renter
  end

    # This looks great! 
  def units_by_number_of_bedrooms
    list_units = {}
    @units.each do |unit|
      # Same as my comment on line 32. Comparing with nil is great though if it helps your understanding
      if list_units[unit.bedrooms] == nil
        list_units[unit.bedrooms] = []
      end
        list_units[unit.bedrooms] << unit.number
    end
    list_units
  end
end

# Option 1 is basically your implementation, just with an inline if block and fancy .nil? syntax

# I'm unfamiliar with reduce in ruby, so I can't speak to option 2
# There is a reduce in javascript that's quite popular, but I've never seen it in ruby so I wouldn't focus on it

# Refactor options:
# Option 1:
#   def units_by_number_of_bedrooms
#     grouped_units = {}
#     @units.each do |unit|
#       grouped_units[unit.bedrooms] = [] if grouped_units[unit.bedrooms].nil?
#       grouped_units[unit.bedrooms] << unit.number
#     end
#     grouped_units
#   end
# end
#
# Option 2:
#   @units.reduce({}) do |acc, unit|
#     acc[unit.bedrooms] = [] if acc[unit.bedrooms].nil?
#     acc[unit.bedrooms] << unit.number
#     acc
#   end
# end
