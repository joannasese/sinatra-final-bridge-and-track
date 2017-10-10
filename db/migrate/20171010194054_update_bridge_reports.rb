class UpdateBridgeReports < ActiveRecord::Migration[5.1]
  def change
    change_column :bridge_reports, :time, :text
  end
end
