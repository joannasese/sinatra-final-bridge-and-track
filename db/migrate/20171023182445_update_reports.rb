class UpdateReports < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :mode, :string
  end
end
