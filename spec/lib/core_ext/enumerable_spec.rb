require 'spec_helper'

describe 'Enumerable extensions' do

  describe '#sum' do
    it 'sums integers' do
      [5, 15, 10].sum.should == 30
    end

    it 'sums strings' do
      ['foo', 'bar'].sum.should == 'foobar'
    end

    it 'sums arrays' do
      [[1, 2], [3, 1, 5]].sum.should == [1, 2, 3, 1, 5]
    end

    it 'defaults to identity' do
      [].sum.should == 0
    end

    it 'accepts different identity' do
      [].sum(99).should == 99
    end

    it 'accepts optional block' do
      [1, 2, 3].sum{ |x| x * 3 }.should == 18
    end
  end

end
