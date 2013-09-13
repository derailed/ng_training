require 'spec_helper'

describe BlogPostsHelper do
  describe '#majuculize' do
    it "upcases text correctly" do
      majusculize( "Hello World!" ).should == "HELLO WORLD!"
    end
    
    it 'truncates text correctly' do
      majusculize( 'a'*40 ).should == 'A'*32 + "..."
    end
  end
end