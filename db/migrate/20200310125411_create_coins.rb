# frozen_string_literal: true

class CreateCoins < ActiveRecord::Migration[6.0]
  def change
    create_table :coins do |t|
      t.integer :value, default: 0
      t.string :name, null: false, default: ''

      t.timestamps
    end
    add_index :coins, :name, unique: true
  end
end
