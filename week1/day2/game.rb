# we'll want to store all lines of text as key-value pairs
# the keys shall be the delimiters (or, the identifiers)
pages_with_questions = Hash.new("")
#open and loop through the story line by line until the end of file
File.open("story.txt") do |infile|
    while (line = infile.gets)
        #if the current line contains ~p identifier set it as the key
        if line.include?("~p")
            key = line.chomp
        #all lines following the ~p are added as the value for the key until the next ~p is found
        else
            pages_with_questions[key] += line
        end
    end
end
continue = true
key = "~p1"
while continue
    #create a new hash with all the keys containing ~p1
        p1 = pages_with_questions.select do |key, value|
            key.include?(key)
        end
        #print the question and choices from the hash made above appending #'s to the choices
        p1.values.each_with_index do |v,i|
            puts "#{i}. #{v}" if i > 0
            puts v if i == 0
        end

        input = gets.to_i

        #get the key that matches the persons choice
        p1.keys.each_with_index do |k,i|
            if i == input
                key = k[-2..-1]
                key = "~" + key
            end
        end

        puts pages_with_questions[key]

        #ask if the user would like to play again
        puts "Play again? y/n"
        continue = gets.chomp.downcase == "y"
end
