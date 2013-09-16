class RenameTargetWebsitesTable < ActiveRecord::Migration
  def change
  	rename_table :target_websites, :target_sites
  end
end
