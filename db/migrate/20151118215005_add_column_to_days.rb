class AddColumnToDays < ActiveRecord::Migration
  def change
    add_column :days, :weight_id, :integer
    add_column :days, :user_id, :integer
    
  end
end
