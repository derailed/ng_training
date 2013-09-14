require 'spec_helper'

feature 'Comments' do
  let!(:article) { create(:blog_post, title: 'Fred', content: 'Blee' ) }    
  
  scenario 'I want to add a comment to an article', :focus do
   visit blog_ng.blog_posts_path
   expect(page).to have_content( "FRED" )
   
   find(:css, "#summary_blog_post_#{article.id}" ).click   
   within( "#comments_blog_post_#{article.id}" ) do
     find(:css, 'textarea').set "You rock!!"
   end
            
   expect(page).to have_content( "You rock!!" )
  end  
end