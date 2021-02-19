class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    @units.flat_map do |unit|
      if unit.rented?
        unit.renter.name
      else []
      end
    end
  end

  def average_rent
    sum_rent = @units.sum do |unit|
      unit.monthly_rent.to_f
    end
    sum_rent / @units.length
  end

  def rented_units
    @units.find_all do |unit|
      unit.renter != nil
    end
  end

  def renter_with_highest_rent
    most_expensive = rented_units.max_by do |unit|
      unit.monthly_rent
        end
      most_expensive.renter
    end

    def units_by_number_of_bedrooms
      list_units = {}
      @units.each do |unit|
        if list_units[unit.bedrooms] == nil
          list_units[unit.bedrooms] = []
        end
          list_units[unit.bedrooms] << unit.number
      end
    list_units
  end
end

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
