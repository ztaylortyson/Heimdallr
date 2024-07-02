class AddCtInfoToLawsuit < ActiveRecord::Migration[7.1]
  def change
      add_column :lawsuits, :ct_county, :string
      add_column :lawsuits, :ct_street_address, :string
      add_column :lawsuits, :ct_mail_address, :string
      add_column :lawsuits, :ct_city_zip, :string
      add_column :lawsuits, :ct_branch, :string
  end
end
