class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.date :date
      t.timestamps
    end
  end
end
