class TargetSitesController < ApplicationController
	  before_action :find_client_site, :only => [:new, :create, :show, :edit ]


	def new
				@target_site = @client_site.target_sites.new
	end



  protected
  
  def find_client_site
    @client_site = ClientSite.find(params[:client_site_id])    
  end

end
