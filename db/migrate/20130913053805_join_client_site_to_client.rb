class JoinClientSiteToClient < ActiveRecord::Migration
  def change

  	add_column :client_sites, :client_id, :integer

  end
end
