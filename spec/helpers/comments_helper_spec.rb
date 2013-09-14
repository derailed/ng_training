require 'spec_helper'

describe CommentsHelper do
  describe '#minusculize' do
    it 'downcase text correctly' do
      expect(minusculize( 'A'*30 )).to eq 'A' + 'a'*29
    end
  end
end