require 'rails_helper'

RSpec.describe 'Users can only see their own invoices' do
  before do
    @company_one = Company.create(name: 'fake company')
    @company_two = Company.create(name: 'jim only')
    @invoice = Invoice.create(billing_start: '01/01/2018',
                              billing_end: '01/02/2018',
                              contact: 'blap whoever',
                              company_id: 1)
    @user_one = User.create(f_name: 'the',
                            l_name: 'jim',
                            email: 'thejim@jim.com',
                            password: 'password',
                            company_id: '999',
                            role: "#{ENV['BILLING_TYPE']}")
    @user_two = User.create(f_name: 'blap',
                            l_name: 'whoever',
                            email: 'yup@yup.com',
                            password: 'password',
                            company_id: '1',
                            role: 'whatever')
  end

  before do
    visit '/'
    expect(page).to have_text('You must log in to access this page')
    fill_in 'email', with: 'yup@yup.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text('You have logged in.')
  end

  it 'shows user their invoice' do
    visit 'invoices'
    expect(page).to have_text('Invoices for')
    expect(@invoice.company_id).to eq(@user_two.company_id)
    expect(@invoice.company_id).not_to eq(@user_one.company_id)
  end
end
