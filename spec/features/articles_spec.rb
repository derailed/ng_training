require 'spec_helper'

feature 'Articles' do  
  
  scenario 'I want to see all available articles' do
   visit root_path

   click_link 'Articles'

   expect(page).to have_content( "Bro's happenings..." )
  end
  
  describe 'Article manipulations' do
    let!(:article) { create(:blog_post, title: 'Fred', content: 'Blee' ) }    
    
    scenario 'I want to create a new article' do
      visit blog_posts_path
    
      click_link 'New post'
      fill_in 'Title'  , with: "Cool dude!"
      fill_in 'Content', with: "Bumble Bee Tuna"
      click_button 'Update'
    
      expect(page).to have_content( "COOL DUDE!" )
    end

    scenario 'I fail to create a new article' do
      visit blog_posts_path
    
      click_link 'New post'
      click_button 'Update'
    
      expect(page).to have_selector('div.alert-error')                        
    end
    
    scenario 'I want to edit an article' do
      visit blog_posts_path          
      expect(page).to have_content( "FRED" )        
      
      click_link( "ed_blog_post_#{article.id}" )
      fill_in 'Title'  , with: "#{article.title}!!"
      click_button 'Update'
    
      expect(page).to have_content( "FRED!!" )
    end

    scenario 'I fail to edit an article' do
      visit blog_posts_path          
      expect(page).to have_content( "FRED" )        
      
      click_link( "ed_blog_post_#{article.id}" )
      fill_in 'Title'  , with: ""
      click_button 'Update'
    
      expect(page).to have_selector('div.alert-error')                        
    end
    
    scenario 'I want to delete an article' do
      visit blog_posts_path          
      expect(page).to have_content( "FRED" )
      
      click_link( "del_blog_post_#{article.id}" )
    
      expect(page).not_to have_content( "FRED!!" )
    end    
  end
end