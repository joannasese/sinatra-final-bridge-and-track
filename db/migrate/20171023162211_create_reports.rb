class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.datetime :time
      t.integer :user_id
      t.text :time
    end
  end
end
