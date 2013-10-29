class Client < ActiveRecord::Base
	validates :name,  :presence => true
	validates_uniqueness_of :name, :case_sensitive => false

	has_many :client_sites

end
