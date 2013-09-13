require 'spec_helper'

describe CommentsHelper do
  describe '#minusculize' do
    it 'downcase text correctly' do
      minusculize( 'A'*30 ).should == 'A' + 'a'*29
    end
  end
end