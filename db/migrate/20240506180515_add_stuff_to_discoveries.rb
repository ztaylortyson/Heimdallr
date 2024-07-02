class AddStuffToDiscoveries < ActiveRecord::Migration[7.1]
  def change
    add_column :discoveries, :group, :integer
    add_column :discoveries, :date_served, :date
    add_column :discoveries, :propounding_party, :string
    add_column :discoveries, :responding_party, :string
    add_column :discoveries, :req_or_resp, :integer 
    add_column :discoveries, :discovery, :integer 
    add_column :discoveries, :set, :integer
    add_column :discoveries, :service, :integer
    add_column :discoveries, :resp_due, :date 
    add_column :discoveries, :atty_notes, :text

    add_column :discoveries, :extension_id, :integer


  end
end
