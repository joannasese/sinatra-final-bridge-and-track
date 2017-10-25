class RemoveUserIdFromReports < ActiveRecord::Migration[5.1]
  def change
    remove_column :reports, :user_id
  end
end
