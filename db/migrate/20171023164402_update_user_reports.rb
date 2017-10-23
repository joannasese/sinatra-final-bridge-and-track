class UpdateUserReports < ActiveRecord::Migration[5.1]
  def change
    add_column :user_reports, :report_id, :integer
  end
end
