RSpec.describe 'Admins can create invoices' do
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
    visit 'companies'
    expect(page).to have_text('You must log in to access this page')
    fill_in 'email', with: 'thejim@jim.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text('Welcome back, loyal employee.')
  end

  it 'allows admins to add invoices' do
    visit 'invoices'
    expect(page).to have_text('Invoices for')
    visit 'invoices/new'
    expect(page).to have_text('Start an Invoice')
    fill_in 'invoice[project]', with: 'more writing'
    fill_in 'invoice[billing_start]', with: '01/01/2018'
    fill_in 'invoice[billing_end]', with: '01/02/2018'
    fill_in 'invoice[contact]', with: 'some guy'
    select('fake company', from: 'invoice[company_id]')
    click_button 'Create Invoice'
    expect(page).to have_text('ATTN')
  end
end
