module Social::Concerns::Commentable
  extend ActiveSupport::Concern
  
  included do    
    # Relationships...
    has_many :comments, as: :commentable, dependent: :destroy, class_name: Common::Comment
  end
end