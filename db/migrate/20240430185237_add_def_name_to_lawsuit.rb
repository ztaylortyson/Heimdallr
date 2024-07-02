class AddDefNameToLawsuit < ActiveRecord::Migration[7.1]
  def change
    add_column :lawsuits, :dname, :string
  end
end
