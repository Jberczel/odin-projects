require 'project1'

describe 'bubble_sort method' do
  it 'sorts integers' do
    my_array = [5, 1, 4, 2, 8]
    bubble_sort(my_array).should == [1, 2, 4, 5, 8]
  end

  it 'sorts words' do
    s_array = %w(bravo echo rhino charlie zebra echo lambda)
    bubble_sort(s_array).should == %w(bravo charlie echo echo lambda rhino zebra)
  end

  it 'sorts decimals' do
    a = [0.5, 0.2, 0.25, 0.9, 0.87]
    bubble_sort(a).should == [0.2, 0.25, 0.5, 0.87, 0.9]
  end

  it 'sorts negative numbers' do
    a = [5, 0, -5, -2]
    bubble_sort(a).should == [-5, -2, 0, 5]
  end
end

describe 'bubble_sort_by method' do
  it 'sorts integers descening order' do
    my_array = [5, 1, 4, 2, 8]
    bubble_sort_by(my_array) { |left, right| right <=> left }.should == [8, 5, 4, 2, 1]
  end

  it 'sorts words descening order' do
    my_array = %w(bravo delta alligator ranger)
    bubble_sort_by(my_array) { |left, right| right <=> left }.should == %w(ranger delta bravo alligator)
  end

  it 'sorts by word length' do
    my_array = %w(hello hi hey worlds)
    bubble_sort_by(my_array) { |l, r| l.length - r.length }.should == %w(hi hey hello worlds)
  end
end
