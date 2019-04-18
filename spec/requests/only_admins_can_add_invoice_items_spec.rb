require 'rails_helper'

RSpec.describe 'Only admins can add invoice tasks' do
  before do
    @company_one = Company.create(name: 'fake company')
    @company_two = Company.create(name: 'jim only')
    @invoice = Invoice.create(project: 'more writing',
                              billing_start: '01/01/2018',
                              billing_end: '01/02/2018',
                              contact: 'blap whoever',
                              company_id: 1)
    @task_one = Task.create(description: 'stuff', rate: 50, invoice_id: 1)
    @task_two = Task.create(description: 'more stuff, so much stuff',
                            rate: 50,
                            invoice_id: 1)
    @user_one = User.create(f_name: 'the',
                            l_name: 'jim',
                            email: 'thejim@jim.com',
                            password: 'password',
                            company_id: 2,
                            role: "#{ENV['BILLING_TYPE']}")
    @user_two = User.create(f_name: 'blap',
                            l_name: 'whoever',
                            email: 'yup@yup.com',
                            password: 'password',
                            company_id: 1,
                            role: 'client')
  end

  it 'should disallow clients to see invoice tasks' do
    visit '/'
    expect(page).to have_text('You must log in to access this page')
    fill_in 'email', with: 'yup@yup.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text('You have logged in.')
    visit '/invoices'
    expect(page).to have_text('Invoices for')
    click_link('INVOICE NO: 1')
    expect(page).to have_text('ATTN')
    expect(page).to_not have_xpath('/html/body/center/a')
    click_link 'Log out'
  end

  it 'should allow admins to create tasks' do
    visit '/'
    expect(page).to have_text('You must log in to access this page')
    fill_in 'email', with: 'thejim@jim.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text('Welcome back, loyal employee.')
    click_link('All Invoices')
    click_link('INVOICE NO: 1')
    expect(page).to have_text('ATTN')
    click_link('Create a new task for this invoice')
  end
end
