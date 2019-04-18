class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.date :billing_start
      t.date :billing_end
      t.string :contact
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
