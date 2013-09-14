require 'spec_helper'

describe BlogPostsHelper do
  describe '#majuculize' do
    it "upcases text correctly" do
      expect(majusculize( "Hello World!" )).to eq "HELLO WORLD!"
    end
    
    it 'truncates text correctly' do
      expect(majusculize( 'a'*40 )).to eq 'A'*27 + "..."
    end
  end
end