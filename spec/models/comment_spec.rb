require 'spec_helper'

describe Comment do
  describe '-relationships' do
    it { should belong_to :blog_post }
  end
  
  describe '-validations' do
    it { validate_presence_of :content }
  end
end