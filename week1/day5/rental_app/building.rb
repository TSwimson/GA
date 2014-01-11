class Building
  attr_accessor :name, :address, :units

  # initialize instance variables
  def initialize(name, address, units = [])
    @name = name
    @address = address
    @units = units
  end

  # Returns an array. Each element is a tenant's contact info
  def get_contact_list
    @units.map { |u| u.tenant.contact_info }
  end

  # Returns the total sqft rented.
  def calc_total_sqft_rented
    get_rented_units.inject(0) { |sum, x| sum + x.sqft }
  end

  # Returns the annual income. Only rented units make income.
  def calc_annual_income
    get_rented_units.inject(0) { |sum, x| sum + x.rent }
  end

  # Returns an array containing all available units
  def get_available_units
    @units.select { |u| u.available? }
  end

  # Returns an array containing all occupied units
  def get_rented_units
    @units.select { |u| !u.available? }
  end

end
