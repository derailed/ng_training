module BlogPostsHelper
  def majusculize( text )
    truncate( text.upcase, length: 35 )
  end
end
