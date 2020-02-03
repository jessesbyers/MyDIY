class Goal < ApplicationRecord
    belongs_to :project
    has_many :users, through: :projects
    # has_many :tasks
    # has_many :resources
    # has_many :photos
    # has_many :updates

end
