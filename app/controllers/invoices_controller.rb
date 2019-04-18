class InvoicesController < ApplicationController
  before_action :logged_in?
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.role == "#{ENV['BILLING_TYPE']}"
      @invoices = Invoice.all
      @paid_invoices = Invoice.where(paid: true)
      @current_invoices = Invoice.where(paid: false)
    else
      @invoices = Invoice.where(company_id: current_user.company_id)
      @paid_invoices = Invoice.
                               where(paid: true).
                               where(company_id: current_user.company_id)
      @current_invoices = Invoice.
                                  where(paid: false).
                                  where(company_id: current_user.company_id)
      @user_company = Company.find(current_user.company_id)
    end
  end

  def show
    @invoice = Invoice.find(params[:id])
    @tasks = @invoice.tasks
    @user_company = Company.find(current_user.company_id)
  end

  def new
    @invoice = Invoice.new
  end

  def edit
  end

  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      redirect_to @invoice
    else
      render 'new'
    end
  end

  def update
    @invoice = Invoice.find(params[:id])

    if @invoice.update(invoice_params)
      redirect_to @invoice
    else
      render 'edit'
    end
  end

  def destroy
    @invoice.destroy
    redirect_to invoices_path
  end

  private

    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def invoice_params
      params.require(:invoice).permit(:billing_start, :billing_end, :contact, :company_id, :project, :notes, :subtotal, :adjustments, :paid, :due)
    end
end
