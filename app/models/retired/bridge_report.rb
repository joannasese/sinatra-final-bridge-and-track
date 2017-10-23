class BridgeReport < ActiveRecord::Base
  has_many :user_reports
  has_many :users, through: :user_bridge_reports
  has_many :comments, dependent: :destroy

  validates :time, presence: true
end
