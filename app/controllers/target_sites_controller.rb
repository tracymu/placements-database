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

  def index
    @target_sites = TargetSite.all
  end

	def show
    @target_site = TargetSite.find(params[:id])
	end

  def edit
    @target_site = TargetSite.find(params[:id])
  end

  def update
    @target_site = TargetSite.find(params[:id])
    @target_site.attributes = target_site_params
    if @target_site.valid?
      @target_site.client_sites = client_sites_for_ids(target_site_params[:client_site_ids])
      @target_site.save!
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
    params.require(:target_site).permit(
      :name,
      :url,
      :contact_name,
      :do_not_contact,
      :page_rank,
      :pages_indexed,
      :backlinks,
      :twitter_followers,
      :twitter_handle, 
      :facebook_page,
      :facebook_likes,
      :google_plus_page, 
      :google_plus_likes,
      {:client_site_ids => []}
    )
  end

  def client_sites_for_ids(ids)
    ClientSite.where('id IN (?)',ids)
  end

  
end
