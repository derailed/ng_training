require 'spec_helper'

describe BlogPost do
  
  describe '-relationships' do
    it { should have_many :comments }
  end
  
  
  describe '-validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of :content }
  end
end