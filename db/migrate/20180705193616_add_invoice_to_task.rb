class AddInvoiceToTask < ActiveRecord::Migration[5.0]
  def change
    add_reference :tasks, :invoice, foreign_key: true
  end
end
