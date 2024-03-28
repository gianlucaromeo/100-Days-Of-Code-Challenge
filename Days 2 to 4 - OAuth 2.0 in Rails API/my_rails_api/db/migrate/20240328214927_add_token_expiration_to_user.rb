class AddTokenExpirationToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :user, :string
    add_column :users, :token_expiration, :timestamp
  end
end
