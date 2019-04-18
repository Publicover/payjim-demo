require 'rails_helper'

RSpec.describe 'User Login', type: :feature do
  scenario 'User visits login page' do
    visit '/'
    expect(page).to have_text('You must log in to access this page')
  end

  scenario 'User logs in' do

  end 
end
