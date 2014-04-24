require "project1"

describe "caesar cipher method" do
  it "ignores punctuation " do
    caesar_cipher('what.a.string!!', 5).should == 'bmfy.f.xywnsl!!'
  end

  it 'ignores spaces' do
    caesar_cipher(' what a string ', 5).should == ' bmfy f xywnsl '
  end

  it 'ignores numbers' do
    caesar_cipher('hello123', 8).should == 'pmttw123'
  end

  it 'is case sensitive' do
    caesar_cipher('What A String!', 14).should == 'Kvoh O Ghfwbu!'
  end

  it 'shifts 3 when no parameter given' do
    caesar_cipher('hello world').should == 'khoor zruog'
  end

  it 'shifts backwards' do
    caesar_cipher('hello world', -3).should == 'ebiil tloia'
  end


end
