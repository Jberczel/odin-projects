require 'project2'

describe 'project2' do
  before do
    @a = [1,3,2,4,5,7,10]
  end

  describe 'my_each method' do
    it 'squares each element of array' do
      b = Array.new
      @a.my_each { |i| b << i**2 }
      b.should == [1,9,4,16,25,49,100]
    end

    it 'returns self if no block given' do
      @a.my_each.should == [1,3,2,4,5,7,10]
    end
  end

  describe 'my_each_with_index method' do
    it 'passes element and its index' do
      b = Array.new
      @a.my_each_with_index { |val, i| b << [val,i] }
      b.should == [[1,0], [3,1], [2,2] ,[4,3], [5,4] ,[7,5] ,[10,6]]
    end

    it 'returns self if no block given' do
      @a.my_each_with_index.should == [1,3,2,4,5,7,10]
    end
  end

  describe 'my_select method' do
    it 'selects even numbers' do
      @a.my_select { |num| num % 2 == 0 }.should == [2, 4, 10]
    end

    it 'selects letters beginning with vowels' do
      %w(dog alligator elephant rhino).my_select { |w| w[0] =~ /[aeiou]/ }.should == %w(alligator elephant)
    end

    it 'returns self if no block given' do
      @a.my_select.should == @a
    end
  end

 describe 'my_all? method' do
    it 'checks if all elements are integers' do
      @a.my_all? { |num| num.is_a? Integer }.should == true
    end

     it 'checks if all elements are even' do
      @a.my_all? { |num| num % 2 == 0 }.should == false
    end

     it 'checks if all elements are > 0' do
      @a.my_all? { |num| num > 0 }.should == true
    end 
  end

  describe 'my_none? method' do
    it 'checks if any element is true' do
      [false,nil,false].my_any?.should == false
    end

     it 'checks if any element is even' do
      @a.my_any? { |num| num % 2 == 0 }.should == true
    end  
  end

  describe 'my_count method' do
    it 'counts number of integers in array' do
      ['dog', 'cat', 4, 5, 6, 7, 8].my_count { |num| num.is_a? Integer }.should == 5
    end

     it 'counts even numbers' do
      @a.my_count { |num| num % 2 == 0 }.should == 3
    end

    it 'handles parameter' do
    [false, true, false].my_count(false).should == 2
    end  

    it 'handles no parameter' do
       @a.my_count.should == 7
    end

  end




 
end
