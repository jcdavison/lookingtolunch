class CreateLunchRequests < ActiveRecord::Migration
  def change
    create_table :lunch_requests do |t|
      t.integer :from
      t.integer :to

      t.timestamps
    end
  end
end
