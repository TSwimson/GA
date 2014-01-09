#  Adventure Class
#
# -start by taking a hash
# -using hash, prompt user for input
# -and change the story accordingly

story_hash = { "question" => "Welcome to the haunted hotel. What room would you like to go to?","room 1" => "you're dead",{question: "You picked a good room. What would you like to do?",sleep: "You're rested for the morning",stay_up_all_night: "You might have anxiety issues."}}

class Adventure

    def initialize(story_hash)
        @story_hash = story_hash
    end

    def prompt(question, options)
        puts question
        options.each { |x| puts x }
        res = gets.chomp
        res = res.gsub(/\s+/, "_").downcase.to_sym
    end

    def prompt_and_chomp(question, options)
        res = prompt(question, options)
        until options.include?(res)
            puts "Your input was invalid"
            res = prompt(question, options)
        end
        res
    end
    def get_options(current_story_hash)
        current_story_hash.keys.select! { |k| k != "question"}

    end
    def start
        current_story_hash = @story_hash
        question = current_story_hash["question"]
        options = get_options(current_story_hash)

        until options.nil?
            res = prompt_and_chomp(question, options)

            if current_story_hash[res.to_sym].is_a?(Hash)
                current_story_hash = current_story_hash[res]
                question = current_story_hash["question"]
                options = get_options(current_story_hash)
            else
                puts current_story_hash[res]
                options = nil
            end
        end
        "End of Story!"
    end
end

a = Adventure.new(story_hash)
puts a.start


