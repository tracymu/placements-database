class TargetSitesController < ApplicationController
	 
	

	def new

		@target_site = TargetSite.new
	end

	def create

    @target_site = TargetSite.new(target_site_params)

    if @target_site.save
    	
      redirect_to target_site_path(@target_site), :notice => "Website Successfully Saved"  
    else
      render 'new'
    end

	end

  def list
    @target_sites = TargetSite.all
  end


	def show
        @target_site = TargetSite.find(params[:id])

	end

  def edit
    @target_site = TargetSite.find(params[:id])

  end


  def update


    # Note that if I make it so that the 'what clients is this relevant for' information is just done when you update information about that client

    # then I will have to add this to my update method
    # params[:target_site][:client_site_ids] ||=[]


     @target_site = TargetSite.find(params[:id])
  
    if @target_site.update(target_site_params)
      redirect_to target_site_path, notice: 'Website details were successfully updated.' 
    else
      render 'edit'
    end 

  end


  def connect
    @target_site = TargetSite.find(params[:id])

  end

  protected
  


  def target_site_params
    params.require(:target_site).permit(:name, :url, :contact_name, :do_not_contact, :page_rank,:pages_indexed,:backlinks,:twitter_followers,:twitter_handle, :facebook_page,:facebook_likes,:google_plus_page, :google_plus_likes )
  end
end
