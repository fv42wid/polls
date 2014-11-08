class RepVote < ActiveRecord::Base
  belongs_to :rep
  belongs_to :bill

end
