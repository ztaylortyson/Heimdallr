class AddSourceToJournal < ActiveRecord::Migration[7.1]
  def change
    add_column :journals, :source, :string
  end
end
