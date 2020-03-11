class AddCoinToApiUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :api_users, :coin, null: false, foreign_key: true
  end
end
