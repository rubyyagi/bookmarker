class Bookmark < ApplicationRecord
  validates :title, presence: true, allow_blank: false
  validates :url, presence: true, allow_blank: false
end
