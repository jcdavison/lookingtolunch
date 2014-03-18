class AddHandleInformationToLunchRequest < ActiveRecord::Migration
  def change
    add_column :lunch_requests, :from_handle, :string
    add_column :lunch_requests, :to_handle, :string
  end
end
