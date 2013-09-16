class RenameSiteRelationshipsColumns < ActiveRecord::Migration
  def change
  	rename_column :site_relationships, :client_website_id, :client_site_id
  	rename_column :site_relationships, :target_website_id, :target_site_id
  end
end
