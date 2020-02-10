class Image < ApplicationRecord
    belongs_to :goal
    belongs_to :user

    GENRE_OPTIONS = ["Inspiration", "Design Plans", "Before Photo", "After Photo", "Work in Progress"]
    validates :genre, presence: true, inclusion: GENRE_OPTIONS
    # FORMAT_OPTIONS = ["Inspiration", "Design Plans", "Before Photo", "After Photo", "Work in Progress"]
    # validates :genre, presence: true, inclusion: GENRE_OPTIONS
end
