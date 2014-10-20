class CreateUserPolls < ActiveRecord::Migration
  def change
    create_table :user_polls do |t|

      t.timestamps
    end
  end
end
