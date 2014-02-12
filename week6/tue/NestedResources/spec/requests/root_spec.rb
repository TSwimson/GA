require 'spec_helper'

describe "Root" do
  describe "GET /" do
    it "should be successful" do
      get root_path
      response.status.should == 200
    end
  end
end
