class Url < ApplicationRecord
	validates :long_url, presence: true, format: {with: /(http|https)\:\/\//, message: "start with http:// or https://" }
	before_create :shorten
	# validates :longurl, format: {with: URI.regexp(['http', 'https'])} same as above

	def shorten
		self.short_url = SecureRandom.hex(3)
	end

end
