class TargetSite < ActiveRecord::Base
	
	has_many :site_relationships
	has_many :client_sites, :through => :site_relationships


	validates_uniqueness_of :name, :case_sensitive => false


	before_validation :fix_url_protocol

	
def formatted_updated_at	
		self.updated_at.strftime "%d-%m-%Y"
	end




	protected

	def fix_url_protocol
		unless self.url[/^http:\/\//] || self.url[/^https:\/\//]
			self.url = 'http://' + self.url
		end
	end


end
