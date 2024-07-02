class AddColumnsToDeposition < ActiveRecord::Migration[7.1]
  def change
    add_column :depositions, :depo_date, :date
    add_column :depositions, :depo_time, :time
    add_column :depositions, :propounding_party, :string
    add_column :depositions, :title, :string
    add_column :depositions, :lawsuit_id, :integer
  end
end
