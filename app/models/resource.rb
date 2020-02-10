class Resource < ApplicationRecord
    belongs_to :goal
    belongs_to :user

    validates :url, presence: true, format: { with: URI.regexp }
    validates :description, presence: true
end
