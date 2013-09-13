class ClientSitesController < ApplicationController


  before_action :find_client, :only => [:new, :create]


	def index
		@client_sites = ClientSite.all

	end


	def new
		@client_site = @client.client_sites.new

	end

	def create
		@client_site = ClientSite.new params.require(:client_site).permit(:name, :url)

		if @client_site.save
			redirect_to client_site_path(@client_site)
		else
			render 'new'	
		end

	end


	def show

	end
	


  protected
  
  def find_client
    @client = Client.find(params[:client_id])    
  end

end
