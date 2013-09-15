require 'spec_helper'

feature 'Comments' do
  let!(:article) { create(:blog_post, title: 'Fred', content: 'Blee' ) }    
  
  scenario 'I want to add a comment to an article' do
   visit blog_posts_path
   expect(page).to have_content( "FRED" )
   
   find(:css, "#summary_blog_post_#{article.id}" ).click   
   within( "#comments_blog_post_#{article.id}" ) do
     find(:css, 'textarea').set "you rock!!"
   end
   click_button( "add-comment-#{article.id}" )
            
   expect(page).to have_content( "1 comment" )
  end  
  
  scenario 'I want to add a bad comment to an article', driver: :webkit do
   visit blog_posts_path
   post = BlogPost.first
   
   find(:css, "#summary_blog_post_#{post.id}" ).click
   click_button( "add-comment-#{post.id}" )
  
   expect(page).to have_selector('div.alert-error')                        
  end  
end