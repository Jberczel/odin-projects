require 'project3'

describe 'substring method' do

  it 'passes odin test case' do
    dictionary = %w(below down go going horn how howdy it i low own part partner sit)
    substring('below', dictionary).should == { 'below' => 1, 'low' => 1 }
  end

  it 'passes odin test case with multiple words' do
    dictionary = %w(below down go going horn how howdy it i low own part partner sit)
    text = "Howdy partner, sit down! How's it going?"
    substring(text, dictionary).should == { 'down' => 1, 'how' => 2, 'howdy' => 1, 'go' => 1, 'going' => 1, 'it' => 2, 'i' => 3, 'own' => 1, 'part' => 1, 'partner' => 1, 'sit' => 1 }
  end

  it 'handles empty dictionary' do
    dict = {}
    substring('hello world',dict).should == {}
  end

  it 'handles blank text' do
    dict = %w(hello world)
    substring('',dict).should == {}
  end

end
