class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :user
      t.string :password_digest
      t.string :remember_token

      t.timestamps
    end
  end
end
