class RemoveCompanyIdFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :company_id, :integer
  end
end
