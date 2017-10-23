class UpdateComments2 < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :report_id, :integer
  end
end
