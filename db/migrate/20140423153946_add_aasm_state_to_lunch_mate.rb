class AddAasmStateToLunchMate < ActiveRecord::Migration
  def change
    add_column :lunch_mates, :aasm_state, :string
  end
end
