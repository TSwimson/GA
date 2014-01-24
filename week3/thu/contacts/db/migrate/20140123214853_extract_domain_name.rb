class ExtractDomainName < ActiveRecord::Migration
    
  def change
    Person.all.each do |p| 
        p.domain_name = p.email.split("@").last
        p.save
    end

  end
end
