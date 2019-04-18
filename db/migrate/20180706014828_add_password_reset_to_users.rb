class AddPasswordResetToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :password_reset_token, :string
    add_column :users, :password_reset_send_at, :string
  end
end
