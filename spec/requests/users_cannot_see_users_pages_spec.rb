require 'rails_helper'

RSpec.describe "User index" do
  before do
    @company = Company.create(name: 'fake company')
    @user_two = User.create(f_name: 'blap',
                            l_name: 'whoever',
                            email: 'yup@yup.com',
                            password: 'password',
                            company_id: '1',
                            role: 'whatever')

    visit '/'
    expect(page).to have_text('You must log in to access this page')
    fill_in 'email', with: 'yup@yup.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text('You have logged in.')
  end

  it 'rejects users without admin privileges' do
    visit '/users'
    expect(page).to have_text('You do not have permission to view this page.')
  end
end
