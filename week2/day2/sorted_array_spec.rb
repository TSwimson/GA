require 'rspec'
require './sorted_array.rb'

shared_examples "yield to all elements in sorted array" do |method|
    specify do 
      expect do |b| 
        sorted_array.send(method, &b) 
      end.to yield_successive_args(2,3,4,7,9) 
    end
end

describe SortedArray do
  let(:source) { [2,3,4,7,9] }
  let(:sorted_array) { SortedArray.new source }

  describe "iterators" do
    describe "that don't update the original array" do 
      describe :each do
        context 'when passed a block' do
          it_should_behave_like "yield to all elements in sorted array", :each
        end

        it 'should return the array' do
          sorted_array.each {|el| el }.should eq source
        end
      end

      describe :map do
        it 'the original array should not be changed' do
          original_array = sorted_array.internal_arr
          expect { sorted_array.map {|el| el } }.to_not change { original_array }
        end

        it_should_behave_like "yield to all elements in sorted array", :map

        it 'creates a new array containing the values returned by the block' do
          sorted_array.map{|x| x + 2}.should == source.map {|x| x + 2}
        end
      end
    end

    describe "that update the original array" do
      describe :map! do
        it 'the original array should be updated' do
          original_array = sorted_array.internal_arr
          sorted_array.map! { |x| x + 2}
          sorted_array.internal_arr.should == source.map {|x| x + 2}
        end

        it_should_behave_like "yield to all elements in sorted array", :map!

        it 'should replace value of each element with the value returned by block' do
          original_array = sorted_array.internal_arr
          sorted_array.map! { |x| x + 5}
          sorted_array.internal_arr.should == [2,3,4,7,9].map {|x| x + 5}
        end
      end
    end
  end

  describe :find do
    #it_should_behave_like "yield to all elements in sorted array", :find

    it "should behave like array.find" do
      sorted_array.find { |x| x % 3 }.should == [2,3,4,7,9].find {|x| x % 3}
    end

    it "should return given default if target not found" do
      sorted_array.find("not found"){ |x| x == 30}.should == "not found"
    end
  end

  describe :inject do
    
    it "does inject" do
      sorted_array.inject { |sum, x| sum + x}.should == [2,3,4,7,9].inject{|sum,x| sum + x}
    end
  end
end