class BlogPost < ActiveRecord::Base
  include Commentable
  
  # Validations...
  validates_presence_of :title, :content
  
  # Scopes...
  scope :sort_recent, -> { order( created_at: :desc ) }
end