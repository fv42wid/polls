class AddBodyAndSummaryToBills < ActiveRecord::Migration
  def change
    add_column :bills, :body, :text
    add_column :bills, :summary, :text
  end

  def down
    remove_column :bills, :body
    remove_column :bills, :summary
  end
end
