# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Book.create([
        { title: "Moby Dick" },
        { title: "Huck Finn" },
        { title: "Dirty Book"}])

Video.create([
        { title: "Tommy Boy"},
        { title: "Jaws"}])

Photo.create([
          { caption: "Picture of my cat." },
          { caption: "Picture of my dog." }])


Book.find(1).comments.create(content: "Ahab is one crazy dude!!")
Book.find(1).comments.create(content: "The white whale is spooky.")
Book.find(2).comments.create(content: "I love Twain.")
Book.find(2).comments.create(content: "Huck is one smart guy.")
Book.find(3).comments.create(content: "Comment with bad words.")
Book.find(3).comments.create(content: "Comment with really bad words.")

Video.find(1).comments.create(content: "Tommy Boy Rocks!")
Video.find(2).comments.create(content: "Jaws is sooo fakey, but I can't get it out of my head.")


Photo.find(1).comments.create(content: "Isn't my cat cute.")
Photo.find(2).comments.create(content: "My dog smells.")



