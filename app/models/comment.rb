class Comment < ActiveRecord::Base
  # Relationships...
  belongs_to :commentable, polymorphic: true
  
  # Validations...
  validates_presence_of :content, :commentable
  
  # Scope...
  scope :sort_recent, -> { sort( created_at: :desc ) }
end