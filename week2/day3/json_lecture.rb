require 'json'
require 'typhoeus'

result = JSON.parse( '{"Animals":
            [ 
              { "name": "Fluffy", "age": 5, "species": "dog"},
              { "name": "Buster", "age": 10, "species": "cat"},
              { "name": "Mochi", "age": 4, "species": "dog"},
              { "name": "Russel", "age": 5, "species": "dog"}
            ],
  "Clients":[ 
              { "name": "Tim", "num_children": 0},
              { "name": "Angelina", "num_children": 6}
            ]
}')

#result["Animals"].each {|e| puts "#{e["name"]} - #{e["age"]} years old"}

response = Typhoeus.get("http://www.omdbapi.com/", :params => {:t => "cars", :y =>"2006" })

result = JSON.parse(response.body)
result.each {|k,v| puts "#{k}: #{v}"}