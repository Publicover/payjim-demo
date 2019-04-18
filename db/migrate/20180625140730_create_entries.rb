class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :description
      t.float :time_worked
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
