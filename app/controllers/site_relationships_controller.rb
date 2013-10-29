class SiteRelationshipsController < ApplicationController
  before_action :find_target_site, :only => [:new, :create]



  def new
		@site_relationship = @target_site.site_relationships.new   
	end

  def index


  end


  def create
    @site_relationship = @target_site.site_relationships.new 

    @site_relationship.client_site = ClientSite.find(params[:site_relationship][:client_site_id])
      notice = "You've made this relationship or something."
  

    if @site_relationship.save
      redirect_to target_site_path(@target_site), :notice => "You connected those sites"
    else
      render 'target_site/show'
    end

  end



  protected
  
  def find_target_site
    @target_site = TargetSite.find(params[:target_site_id])    
  end


end
