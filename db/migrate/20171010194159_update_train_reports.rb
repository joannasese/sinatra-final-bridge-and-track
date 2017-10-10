class UpdateTrainReports < ActiveRecord::Migration[5.1]
  def change
    change_column :train_reports, :time, :text
  end
end
