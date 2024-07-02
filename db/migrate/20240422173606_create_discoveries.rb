class CreateDiscoveries < ActiveRecord::Migration[7.1]
  def change
    create_table :discoveries do |t|

      t.timestamps
    end
  end
end
