class Gossip < ApplicationRecord
  belongs_to :author, class_name: "User"
  validates :title, presence: true
  validates :content, presence: true
  has_many :comments, dependent: :destroy
end