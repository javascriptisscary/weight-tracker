class ChangeDayColumntoDate < ActiveRecord::Migration
  def change
    change_column :days, :date, :date
  end
end
