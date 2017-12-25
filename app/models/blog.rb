class Blog < ApplicationRecord
  extend FriendlyId

  belongs_to :topic

  friendly_id :title, use: :slugged

  enum status: { draft: 0, published: 1 }

  validates_presence_of :title, :body
end
