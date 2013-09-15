module Commentable
  extend ActiveSupport::Concern
  
  included do    
    # Relationships...
    has_many :comments, as: :commentable, dependent: :destroy    
  end
end