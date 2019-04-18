class AddTaskIdToInvoice < ActiveRecord::Migration[5.0]
  def change
    add_column :invoices, :task_id, :integer
  end
end
