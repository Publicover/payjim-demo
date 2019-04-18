class AddColumnsToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :hours, :float
    add_column :tasks, :total, :float
  end
end
