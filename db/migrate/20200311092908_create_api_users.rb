# frozen_string_literal: true

class CreateApiUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :api_users do |t|
      t.string :access_token, null: false, default: ''
      t.string :email, null: false, default: ''

      t.timestamps
    end
    add_index :api_users, :access_token, unique: true
    add_index :api_users, :email, unique: true
  end
end
