class CreateTrainReports < ActiveRecord::Migration[5.1]
  def change
    create_table :train_reports do |t|
      t.datetime :time
      t.integer :user_id
    end
  end
end
