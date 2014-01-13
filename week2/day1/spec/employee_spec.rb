require 'employee'
require 'spec_helper'

describe Employee do

  before(:each) do
    @employee = Employee.new("T")
    @employee1 = Employee.new("A")
  end

  it "has a name " do
    @employee.name.should == "T"
    @employee1.name.should == "A"
  end

  it "introduces itself" do
    @employee.introduce.should == "Hi, my name is T."
    @employee1.introduce.should == "Hi, my name is A."
  end

  it "Can change name" do
    @employee.name =  "B"
    @employee.name.should == "B"
  end

  it "Can go on vacation" do
    @employee.put_on_vacation
    @employee.is_on_vacation?.should == true
  end

  it "Can come back from vacation" do
    @employee.put_on_vacation
    @employee.come_back_from_vacation
    @employee.is_on_vacation?.should == false
  end
  
  it "Updates employee_count" do
    Employee.get_count.should == 2
  end

  after(:each) do
    Employee.resign
    Employee.resign

  end

end