class ClientsController < ApplicationController


	before_action :find_client, :only => [:show, :edit, :update, :destroy] 

	def index
		@clients = Client.all

	end


	def new
		@client = Client.new

	end

	def create
		@client = Client.new params.require(:client).permit(:name)

		if @client.save
			redirect_to client_path(@client)
		else
			render 'new'	
		end

	end


	def show
    @client = Client.find(params[:id])
	end
	
	protected


  def find_client
    @client = Client.find(params[:id])
  end



end
