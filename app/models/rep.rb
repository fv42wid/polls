class Rep < ActiveRecord::Base
  has_many :votes
  belongs_to :district

end
