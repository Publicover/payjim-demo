class ChangeAudjustmentsDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default(
      :invoices,
      :adjustments,
      0)
  end
end
