class SiteRelationshipController < ApplicationController
  
  def add
    @client_site = ClientSite.find(params[:client_site_id])   
    @target_site = TargetSite.find(params[:target_site_id])
    @client_site.target_sites << @target_site
	  redirect_to client_site_path(@client_site)
	end



end
