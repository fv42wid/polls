class UserPoll < ActiveRecord::Base
  belongs_to :user, :bill

end
