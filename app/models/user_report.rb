class UserReport < ActiveRecord::Base
  belongs_to :user
  belongs_to :train_report
  belongs_to :bridge_report
end
