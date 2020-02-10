class Image < ApplicationRecord
    belongs_to :goal
    belongs_to :user

    validates :url, format: { with: %r{.(gif|jpg|png)\Z}i, message: "must be a URL for GIF, JPG or PNG image." }
    GENRE_OPTIONS = ["Inspiration", "Design Plans", "Before Photo", "After Photo", "Work in Progress"]
    validates :genre, presence: true, inclusion: GENRE_OPTIONS
    validates :caption, presence: true

end
