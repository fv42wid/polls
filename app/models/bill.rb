class Bill < ActiveRecord::Base
  has_many :votes, :dependent => :destroy

end
