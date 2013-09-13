class ClientSitesController < ApplicationController


  before_action :find_client, :only => [:new, :create, :show ]



	def new
		@client_site = @client.client_sites.new

	end

	def create
    @client_site = @client.client_sites.new params.require(:client_site).permit(:name, :url, :page_rank,
                                                            :pages_indexed,:backlinks,:twitter_followers,:twitter_handle,
                                                            :facebook_page,:facebook_likes,:google_plus_page, 
                                                            :google_plus_likes )
    @client_site.user = current_user

    if @client_site.save
      redirect_to client_path(@client), :notice => "Website Successfully Saved"  
    else
      render 'new'
    end
    

    def edit
    @client_site = ClientSite.find(params[:id])


    end


	end

  def show
    
    @client_site = ClientSite.find(params[:id])

  end




  protected
  
  def find_client
    @client = Client.find(params[:client_id])    
  end

end
