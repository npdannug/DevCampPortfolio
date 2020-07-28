class Topic < ApplicationRecord
	validates_presence_of :title
	has_many :blog

	def self.with_blogs
		includes(:blog).where.not(blogs: {id: nil})
	end
end
