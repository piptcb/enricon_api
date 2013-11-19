class AddFieldDownloadToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :download, :boolean, default: false
  end
end
