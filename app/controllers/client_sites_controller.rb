class ClientSitesController < ApplicationController

  before_action :find_client, :only => [:new, :create, :show, :edit ]

	def new
		@client_site = @client.client_sites.new
	end


	def create
    @client_site = @client.client_sites.new(client_site_params)
    @client_site.user = current_user

    if @client_site.save
      redirect_to client_path(@client), :notice => "Website Successfully Saved"  
    else
      render 'new'
    end

	end


  def update
    @client_site = ClientSite.find(params[:id])
  
    if @client_site.update(client_site_params)
      redirect_to client_client_site_path, notice: 'Website details were successfully updated.' 
    else
      render 'edit'
    end 

  end


  def edit
    @client_site = ClientSite.find(params[:id])
  end

    
  def show
    @client_site = ClientSite.find(params[:id])
    site_relationships = SiteRelationship.where(:id => @client_site.id)
  end


  protected
  
  def find_client
    @client = Client.find(params[:client_id])    
  end


  def client_site_params
    params.require(:client_site).permit(:name, :url, :page_rank,:pages_indexed,:backlinks,:twitter_followers,:twitter_handle, :facebook_page,:facebook_likes,:google_plus_page, :google_plus_likes )
  end

end
