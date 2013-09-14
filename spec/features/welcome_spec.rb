require 'spec_helper'

feature 'Teh Brog' do
   scenario 'First glance' do
     visit root_path
 
     expect(page).to have_content( "You rock Bro!" )
   end
end