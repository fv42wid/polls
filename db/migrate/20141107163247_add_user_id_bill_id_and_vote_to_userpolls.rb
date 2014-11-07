class AddUserIdBillIdAndVoteToUserpolls < ActiveRecord::Migration
  def change
    add_column :user_polls, :user_id, :integer
    add_column :user_polls, :bill_id, :integer
    add_column :user_polls, :user_zip, :string
    add_column :user_polls, :user_vote, :string
  end

  def down
    remove_column :user_polls, :user_id
    remove_column :user_polls, :bill_id
    remove_column :user_polls, :user_zip
    remove_column :user_polls, :user_vote
  end
end
