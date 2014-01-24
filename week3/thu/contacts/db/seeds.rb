require 'csv'

Person.delete_all

CSV.foreach('db/us-500.csv', headers: true) do |row|
  Person.create(
    { 
      first_name: row['first_name'], 
      last_name: row['last_name'], 
      email: row['email'],
      phone: row['phone1']
    }
  )
end
