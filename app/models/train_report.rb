class TrainReport < ActiveRecord::Base
  has_many :user_reports
  has_many :users, through: :user_train_reports
  
end
