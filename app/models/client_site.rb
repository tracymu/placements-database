class ClientSite < ActiveRecord::Base

	belongs_to :client
	belongs_to :user

	validates_uniqueness_of :name, :case_sensitive => false


	before_validation :fix_url_protocol


	def to_s
		client_id
	end



	protected

	def fix_url_protocol
		unless self.url[/^http:\/\//] || self.url[/^https:\/\//]
			self.url = 'http://' + self.url
		end
	end

end
