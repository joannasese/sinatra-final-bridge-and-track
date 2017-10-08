class CreateTrainReports < ActiveRecord::Migration[5.1]
  def change
    create_table :train_reports do |t|
      t.timestamps :time
    end
  end
end
