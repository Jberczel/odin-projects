require 'project2'

describe 'stock picker method' do
  
  it 'passes odin test case' do
    stock_picker([17,3,6,9,15,8,6,1,10]).should == [1,4]
  end

  it 'handles declining stock prices' do
    stock_picker([100,90,80,40,36]).should == [0,0]
  end

  # ambgious what is best day to buy/sell from instructions
  it 'handles constant price' do
    stock_picker([50,50,50,50]).should == [0,0]
  end

  it 'handles edge case: lowest day is last day' do
    stock_picker([10,15,25,20,5]).should == [0,2]
  end

  it 'handles edge case: highest day is first day' do
   stock_picker([25,15,10,20,5]).should == [2,3]
 end
 
end