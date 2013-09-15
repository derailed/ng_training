class Common::Comment < ActiveRecord::Base
  self.table_name = :comments
  
  # Relationships...
  belongs_to :commentable, polymorphic: true
  
  # Validations...
  validates_presence_of :content, :commentable
  
  # Scope...
  scope :sort_recent, -> { sort( created_at: :desc ) }
end