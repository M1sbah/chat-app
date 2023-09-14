class Room < ApplicationRecord
  belongs_to :user
  belongs_to :friend
  has_many :messages
end
