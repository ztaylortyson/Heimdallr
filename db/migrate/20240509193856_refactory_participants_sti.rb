class RefactoryParticipantsSti < ActiveRecord::Migration[7.1]
  def change
    add_column :participants, :type, :string 
    add_column :participants, :address, :string
    add_column :participants, :phone, :string
    add_column :participants, :email, :string
  end
end
