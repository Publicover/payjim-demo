class AddDueToInvoices < ActiveRecord::Migration[5.0]
  def change
    add_column :invoices, :due, :date
  end
end
