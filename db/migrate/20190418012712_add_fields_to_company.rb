class AddFieldsToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :add_ln1, :string
    add_column :companies, :add_ln2, :string
    add_column :companies, :suite, :string
    add_column :companies, :city_state_zip, :string
  end
end
