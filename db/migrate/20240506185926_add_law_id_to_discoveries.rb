class AddLawIdToDiscoveries < ActiveRecord::Migration[7.1]
  def change
    add_column :discoveries, :lawsuit_id, :integer
  end
end
