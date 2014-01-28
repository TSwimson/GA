# == Schema Information
#
# Table name: urls
#
#  id         :integer          not null, primary key
#  short      :string(255)
#  long       :string(255)
#  views      :integer
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Url < ActiveRecord::Base
    alpha = ('a'..'z').to_a + ('1'..'9').to_a
    indexes = (0..35).to_a

    @@alphaHash = Hash[indexes.zip alpha]
    @@reverseHash = Hash[alpha.zip indexes]

    def generate_short
        self.short = Url.convert_to_base35(self.id)
        self.save
    end

    def increment
        self.views ||= 0
        self.views += 1
        self.save
    end

    def self.generate_id_from_short id
        Url.convert_to_base10(id)
    end

    private

    def self.convert_to_base35 input
        digits = []
        while input > 0
            r = input % 35
            digits.push r
            input = input / 35
        end
        digits.reverse!
        digits.map { |d| @@alphaHash[d] }.join
    end

    def self.convert_to_base10 input
        o = input.split("").map { |d| @@reverseHash[d] }.reverse!
        a = 0
        o = o.each_with_index do |x, i|
            x = x * (35**i) if i > 0
            a += x
        end
        a
    end
end
