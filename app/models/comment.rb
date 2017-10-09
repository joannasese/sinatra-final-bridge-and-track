  class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :bridge_report
  end
