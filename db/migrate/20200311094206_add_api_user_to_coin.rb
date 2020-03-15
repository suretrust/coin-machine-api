class AddApiUserToCoin < ActiveRecord::Migration[6.0]
  def change
    add_reference :coins, :api_user, null: false, foreign_key: true
  end
end
