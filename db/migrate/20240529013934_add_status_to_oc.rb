class AddStatusToOc < ActiveRecord::Migration[7.1]
  def change
    add_column :ocs, :status, :string
  end
end
