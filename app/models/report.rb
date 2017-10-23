class Report < ActiveRecord::Base
  has_many :user_reports
  has_many :users, through: :user_reports
  has_many :comments, dependent: :destroy

  validates :time, presence: true
end
