class SiteRelationship < ActiveRecord::Base
	belongs_to :target_site
	belongs_to :client_site



end
