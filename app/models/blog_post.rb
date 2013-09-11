class BlogPost < ActiveRecord::Base
  include Commentable
  
  validates_presence_of :title, :content
  
  scope :sort_recent, -> { order( created_at: :desc ) }
end