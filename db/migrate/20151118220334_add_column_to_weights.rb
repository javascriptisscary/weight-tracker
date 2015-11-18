class AddColumnToWeights < ActiveRecord::Migration
  def change
    add_column :weights, :pounds, :float
  end
end
