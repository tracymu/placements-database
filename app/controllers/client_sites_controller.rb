class ClientSitesController < ApplicationController


  before_action :find_client, :only => [:new, :create]



	def new
		@client_site = @client.client_sites.new

	end

	def create
    @client_site = @client.client_sites.new params.require(:client_site).permit(:name, :url)
    @client_site.user = current_user

    if @client_site.save
      redirect_to client_path(@client), :notice => "Website Successfully Saved"  
    else
      render 'new'
    end
    

	end



  protected
  
  def find_client
    @client = Client.find(params[:client_id])    
  end

end
