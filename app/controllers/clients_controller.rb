class ClientsController < ApplicationController

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

	end
	


end
