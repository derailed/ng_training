module BlogPostsHelper
  def majusculize( text )
    truncate( text.upcase, length: 30 )
  end
end