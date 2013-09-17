class TargetSitesController < ApplicationController
	  before_action :find_client_site, :only => [:new, :create, :show, :edit ]

	

	def new

		@target_site = @client_site.target_sites.new
	end

	def create

    @target_site = @client_site.target_sites.new(target_site_params)

    if @target_site.save
      redirect_to client_site_target_site_path(@client_site,@target_site), :notice => "Website Successfully Saved"  
    else
      render 'new'
    end

	end


	def show
        @target_site = TargetSite.find(params[:id])

	end


  protected
  
  def find_client_site
	    @client_site = ClientSite.find(params[:client_site_id])    
  end


  def target_site_params
    params.require(:target_site).permit(:name, :url, :contact_name, :do_not_contact, :page_rank,:pages_indexed,:backlinks,:twitter_followers,:twitter_handle, :facebook_page,:facebook_likes,:google_plus_page, :google_plus_likes )
  end
end
