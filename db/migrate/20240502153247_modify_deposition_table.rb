class ModifyDepositionTable < ActiveRecord::Migration[7.1]
  def change
    add_column :depositions, :doc_req, :boolean
    add_column :depositions, :deponent, :string
    change_column :depositions, :title, :integer, default: 0 
  end
end
