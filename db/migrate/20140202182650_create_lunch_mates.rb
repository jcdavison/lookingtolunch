class CreateLunchMates < ActiveRecord::Migration
  def change
    create_table :lunch_mates do |t|
      t.string :handle
      t.string :name
      t.string :pic
      t.text :info
      t.string :last_tweet

      t.timestamps
    end
  end
end
