class AddDeadlinesToJournals < ActiveRecord::Migration[7.1]
  def change
    add_column :journals, :status, :string
    add_column :journals, :due_date, :date
  end
end
