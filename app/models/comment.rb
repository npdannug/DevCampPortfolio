class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  validates_presence_of :context, length: { minimum: 5, maximum: 1000  }
end
