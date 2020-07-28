class Blog < ApplicationRecord
  enum status: { draft: 0, published: 1 }
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body
  belongs_to :topic

  has_many :comments, dependent: :destroy
  
  def self.recent
  	order("created_at DESC")
  end

  def self.first_featured
  	order("created_at").last
  end

  def self.second_featured
  	order("created_at").last(2).first
  end

  def self.third_featured
  	order("created_at").last(3).first
  end
  
end
