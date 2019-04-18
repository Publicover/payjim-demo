require "rails_helper"

RSpec.describe ResetMailer, type: :mailer do
  describe "password_reset" do
    # let(:company) { Company.create(name: 'The Company')}
    # let(:user) { User.create(f_name: 'the', l_name: 'jim', email: 'the@jim.com',
    #               password: 'password', company_id: 1, role: 'admin',
    #               password_reset_token: nil) }
    # let(:user.password_reset_token) { "#{ User.generate_token(password_reset_token)}" }
    # let(:mail) { ResetMailer.password_reset(user) }
    
    # @company_one = Company.create(name: 'fake company')
    # @company_two = Company.create(name: 'jim only')
    # @invoice = Invoice.create(billing_start: '01/01/2018', billing_end: '01/02/2018',
    #                           contact: 'blap whoever', company_id: 1)
    #                           #TODO figure out company ID for admins
    # @task_one = Task.create(description: 'stuff', rate: 50, invoice_id: 1)
    # @task_two = Task.create(description: 'more stuff, so much stuff', rate: 50, invoice_id: 1)
    # @user_one = User.create(f_name: 'the', l_name: 'jim', email: 'thejim@jim.com',
    #                     password: 'password', company_id: '999', role: 'jim')
    # @user_two = User.create(f_name: 'blap', l_name: 'whoever', email: 'yup@yup.com',
    #                     password: 'password', company_id: '1', role: 'whatever')
    # @user_one.password_reset_token = User.generate_token(password_reset_token)
    # @mail = ResetMailer.password_reset(@user)
    #
    # it "renders the headers" do
    #   expect(@mail.subject).to eq("dash creative billing password reset")
    #   expect(@mail.to).to eq(["#{@user.email}"])
    #   expect(@mail.from).to eq(["chitowneben@gmail.com"])
    # end
    #
    # it "renders the body" do
    #   expect(@mail.body.encoded).to match("Hi there.")
    # end
  end

end
