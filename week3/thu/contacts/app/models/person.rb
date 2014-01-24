class Person < ActiveRecord::Base
    def self.all_email_domains
        select(:domain_name).distinct.map do |p|
         p.domain_name
     end
    end

    def self.find_all_with_email_domain domain=nil
        return [] if domain == nil
        return all if domain == "All"
        where(domain_name: domain)
    end


end
