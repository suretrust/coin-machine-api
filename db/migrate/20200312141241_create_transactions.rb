class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :type
      t.references :coin, null: false, foreign_key: true
      t.references :api_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
