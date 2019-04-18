class TasksController < ApplicationController
  before_action :logged_in_as_admin?
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @invoice = Invoice.where(params[:invoice_id])
    @tasks = @invoice.tasks
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @invoice = Invoice.where(id: @task.invoice_id)

    # @invoice.subtotal = @invoice.set_subtotal

    if @task.save
      redirect_to invoice_path(id: @task.invoice_id)
    else
      render 'new'
    end
  end

  def update
  end

  def destroy
    @invoice = Invoice.where(params[:invoice_id])
    @task = Task.find(params[:id])

    @task.destroy
    redirect_to invoice_path(id: @task.invoice_id), notice: 'Task deleted'
  end

  private

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :rate, :invoice_id, :hours, :total)
    end
end
