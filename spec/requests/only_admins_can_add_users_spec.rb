require 'rails_helper'

RSpec.describe 'Admins can add users' do
  before do
    @company = Company.create(name: 'fake company')
    @user_one = User.create(f_name: 'the',
                            l_name: 'jim',
                            email: 'thejim@jim.com',
                            password: 'password',
                            company_id: '1',
                            role: "#{ENV['BILLING_TYPE']}")
    @user_two = User.create(f_name: 'blap',
                            l_name: 'whoever',
                            email: 'yup@yup.com',
                            password: 'password',
                            company_id: '1',
                            role: 'whatever')

    visit '/'
    expect(page).to have_text('You must log in to access this page')
    visit 'users'
    expect(page).to have_text('You must log in to access this page')
    fill_in 'email', with: 'thejim@jim.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text('Welcome back, loyal employee.')
  end

  it 'allows admins to add users' do
    visit 'users'
    expect(page).to have_text 'Users#index'
    visit 'users/new'
    expect(page).to have_text('Add a new client')
    expect(page).to have_text('First name')
    fill_in 'user[f_name]', with: 'someone'
    fill_in 'user[l_name]', with: 'someone else'
    fill_in 'user[email]', with: 'somebody@somewhere.com'
    fill_in 'user[password]', with: '123456'
    select('fake company', from: 'user[company_id]')
    click_button 'Create User'
    expect(page).to have_text('Users#show')
  end
end
