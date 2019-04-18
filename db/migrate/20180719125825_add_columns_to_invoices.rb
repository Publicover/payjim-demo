class AddColumnsToInvoices < ActiveRecord::Migration[5.0]
  def change
    add_column :invoices, :notes, :string
    add_column :invoices, :subtotal, :float
    add_column :invoices, :adjustments, :float
    add_column :invoices, :total, :float
    add_column :invoices, :paid?, :boolean, :default => false
    add_column :invoices, :project, :string
  end
end
