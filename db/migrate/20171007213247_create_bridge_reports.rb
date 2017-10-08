class CreateBridgeReports < ActiveRecord::Migration[5.1]
  def change
    create_table :bridge_reports do |t|
      t.timestamps :time
    end
  end
end
