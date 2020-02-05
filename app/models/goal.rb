class Goal < ApplicationRecord
    belongs_to :project

    has_many :resources
    has_many :images
    has_many :updates
end
