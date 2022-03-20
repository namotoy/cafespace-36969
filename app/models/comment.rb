class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :cafetype
  validates :text, presence: true
end
