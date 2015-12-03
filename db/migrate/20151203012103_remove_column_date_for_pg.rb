class RemoveColumnDateForPg < ActiveRecord::Migration
  def change
    remove_column :days, :date, :date
  end
end
