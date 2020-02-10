class Goal < ApplicationRecord
    belongs_to :project

    has_many :resources
    has_many :images
    has_many :updates

    validates :title, presence: true
    validates :description, presence: true
    STATUS_OPTIONS = ["Not Started", "Incomplete", "Completed"]
    validates :status, presence: true, inclusion: STATUS_OPTIONS

end
