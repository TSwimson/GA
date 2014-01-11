class Unit
  #basic properties, feel free to add more
  attr_accessor :building, :number, :sqft, :rent, :tenant

  # initialize instance variables
  def initialize(building, number, sqft, rent, tenant=nil)
    @building = building
    @number = number
    @sqft = sqft
    @rent = rent
    @tenant = tenant
  end

  #Returns true if unit is available, otherwise false. The unit
  # is available if it is not occupied by a tenant.
  def available?
    return @tenant == nil
  end

  def add_tenant tenant
    return @tenant = tenant
  end
end
