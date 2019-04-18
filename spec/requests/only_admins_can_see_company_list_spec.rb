RSpec.describe 'Admins can see company list' do
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
  end

  it 'allows admins to see companies' do
    visit '/'
    expect(page).to have_text('You must log in to access this page')
    visit 'companies'
    expect(page).to have_text('You must log in to access this page')
    fill_in 'email', with: 'thejim@jim.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text('Welcome back, loyal employee.')
    visit '/companies'
    expect(page).to have_text('Companies#index')
  end

  it 'disallows clients from seeing companies' do
    visit '/'
    fill_in 'email', with: 'yup@yup.com'
    fill_in 'password', with: 'password'
    visit '/companies'
    expect(page).to have_text('You must log in to access this page')
  end
end
