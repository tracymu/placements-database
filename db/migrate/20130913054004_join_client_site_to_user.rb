class JoinClientSiteToUser < ActiveRecord::Migration
  def change

  	  	add_column :client_sites, :user_id, :integer

  end
end
