require 'spec_helper'

describe Social::Comment do
  describe '-relationships' do
    it { should belong_to :commentable }
  end
  
  describe '-validations' do
    it { validate_presence_of :content }
    it { validate_presence_of :commentable }    
  end
end