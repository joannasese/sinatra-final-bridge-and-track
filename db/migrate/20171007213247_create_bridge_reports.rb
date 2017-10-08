class CreateBridgeReports < ActiveRecord::Migration[5.1]
  def change
    create_table :bridge_reports do |t|
      t.datetime :time
      t.integer :user_id
    end
  end
end
