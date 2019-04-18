require 'rails_helper'

RSpec.describe "User login" do
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
  end

  it 'tests user' do
    expect(@user_one).to be_valid
    expect(@user_two).to be_valid
  end

  it 'needs an email' do
    fill_in 'email', with: ' '
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text('Invalid email or password.')
  end

  it 'needs a password' do
    fill_in 'email', with: 'thejim@jim.com'
    fill_in 'password', with: ' '
    click_button 'Log in'
    expect(page).to have_text('Invalid email or password')
  end

  it 'allows users to log in' do
    fill_in 'email', with: 'yup@yup.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text('You have logged in.')
  end

  it 'recognizes admins' do
    fill_in 'email', with: 'thejim@jim.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text('Welcome back, loyal employee.')
  end
end
