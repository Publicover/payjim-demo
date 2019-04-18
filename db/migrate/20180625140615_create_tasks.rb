class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.float :rate
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
