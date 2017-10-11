class User < ActiveRecord::Base
  has_secure_password

  has_many :comments
  has_many :user_reports
  has_many :bridge_reports, through: :user_reports
  has_many :train_reports, through: :user_reports

end
