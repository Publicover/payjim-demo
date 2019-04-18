class FixPaidName < ActiveRecord::Migration[5.0]
  def change
    rename_column :invoices, :paid?, :paid
  end
end
