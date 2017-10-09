class UpdateComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :bridge_report_id, :integer
    add_column :comments, :train_report_id, :integer
  end
end
