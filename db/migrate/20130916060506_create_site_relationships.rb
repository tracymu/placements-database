class CreateSiteRelationships < ActiveRecord::Migration
  def change
    create_table :site_relationships do |t|
    	t.integer :client_website_id
    	t.integer :target_website_id
      t.timestamps
    end
  end
end
