require './building'
require './unit'
require './tenant'

building = Building.new("Waterfront Tower", "345 Embarcadero")

def menu message
  puts `clear`
  puts "*** Land Lord v1.0 ***\n\n"

  puts "#{message}\n\n" unless message.empty?

  puts '1 : Add unit'
  puts '2 : Add tenant'
  puts '3 : Show all unrented units'
  puts '4 : Show tenant contacts'
  puts '5 : Show total rented sqft'
  puts '6 : Cha-ching! Show my annual income'
  puts "q : Quit\n\n"
  print '--> '
  gets.chomp
end

message = ""
choice = menu message
while choice != 'q'
  message = ""
  case choice
  when "1"
    message += 'option 1'
    puts "Please enter the unit's number, sqft and rent. Sperated by spaces"
    info = gets.chomp.split
    building.units << Unit.new(building, info[0].to_i, info[1].to_i, info[2].to_i)
    puts "Unit #{info[0]} created with #{info[1]} sqft and $#{info[2]} rent"
    print "ok"
    gets.chomp
  when "2"
    message += 'option 2'
    puts "Please enter the tenant's name and phone number"
    info = gets.chomp.split
    puts "Enter a unit number"
    building.get_available_units.each { |u| puts u.number }
    info << gets.to_i
    info[-1] = building.units.select { |u| u.number == info[-1] }[0]
    info[-1].add_tenant Tenant.new(info[0], info[1], info[2]) 
    puts "Tenant #{info[0]} added to unit #{info[2].number}" 
    print "ok"
    gets
  when "3"
    message += 'option 3'
    building.get_available_units.each { |u| puts u.number }
    print "ok"
    gets
  when "4"
    message += 'option 4'
    building.get_contact_list.each { |t| puts "#{t}" }
    print "ok"
    gets
  when "5"
    message += 'option 5'
    puts building.calc_total_sqft_rented
    print "ok"
    gets
  when "6"
    message += 'option 6'
    # Show annual income of building
    puts building.calc_annual_income
    print "ok"
    gets
  else
      message += "I don't understand ..."
      print "ok"
    gets
  end
  choice = menu message
end
