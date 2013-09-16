class ClientSite < ActiveRecord::Base

	belongs_to :client
	belongs_to :user
	has_many :site_relationships
	has_many :target_sites, :through => :site_relationships

	validates_uniqueness_of :name, :case_sensitive => false


	before_validation :fix_url_protocol


	def to_s
		client_id
	end

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
