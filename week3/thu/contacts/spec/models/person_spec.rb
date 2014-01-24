require 'spec_helper'

describe Person do
  describe :find_all_with_email_domain do
    before do
      # create 3 people, only one of which has the yahoo.com domain name
      @john = Person.create({ first_name: 'John', last_name: 'Doe', email: 'john.doe@gmail.com', domain_name: 'gmail.com' })
      @jane = Person.create({ first_name: 'Jane', last_name: 'Doe', email: 'jane.doe@yahoo.com', domain_name: 'yahoo.com' })
      @mary = Person.create({ first_name: 'Mary', last_name: 'Jane', email: 'mary.jane@gmail.com', domain_name: 'gmail.com' })
    end

    context 'given a domain name' do
      it 'should return an active record relation' do
        Person.find_all_with_email_domain('yahoo.com').should be_an ActiveRecord::Relation
      end
      
      it 'should return only the people with emails in that domain' do
        Person.find_all_with_email_domain('yahoo.com').should == [ @jane ]
      end
    end

    context 'given \'All\'' do
      it 'should return all people' do
        Person.find_all_with_email_domain('All').should == [@john, @jane, @mary]
      end
    end

    context 'given nil' do
      it 'should return no people' do
        Person.find_all_with_email_domain.should == []
      end
    end
  end

  describe :all_email_domains do
    context 'when there are people in the database' do
      before do
        @john = Person.create({ first_name: 'John', last_name: 'Doe', email: 'john.doe@gmail.com', domain_name: 'gmail.com' })
        @jane = Person.create({ first_name: 'Jane', last_name: 'Doe', email: 'jane.doe@yahoo.com', domain_name: 'yahoo.com' })
      end

      it 'should return the domains for those people' do
        Person.all_email_domains.should =~ ['yahoo.com', 'gmail.com']
      end
    end 

    context 'when there are no people in the database' do
      it 'should return no domain names' do
        Person.all_email_domains.should == []
      end
    end
  end
end
