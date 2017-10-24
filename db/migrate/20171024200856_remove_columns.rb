class RemoveColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :bridge_report_id
    remove_column :comments, :train_report_id
    remove_column :user_reports, :bridge_report_id
    remove_column :user_reports, :train_report_id
  end
end
