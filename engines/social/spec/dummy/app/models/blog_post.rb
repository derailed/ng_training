class BlogPost < ActiveRecord::Base
  include Social::Concerns::Commentable
end