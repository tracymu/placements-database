class CreateClientSites < ActiveRecord::Migration
  def change
    create_table :client_sites do |t|
      t.string :name
      t.string :url
      t.integer :page_rank
      t.integer :backlinks
      t.integer :twitter_followers
      t.integer :facebook_likes
      t.integer :google_plus_likes
      t.string :twitter_handle
      t.string :facebook_page
      t.string :google_plus_page
      t.integer :pages_indexed

      t.timestamps
    end
  end
end
