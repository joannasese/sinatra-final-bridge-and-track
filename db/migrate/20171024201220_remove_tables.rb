class RemoveTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :bridge_reports
    drop_table :train_reports
  end
end
