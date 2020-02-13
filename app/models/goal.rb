class Goal < ApplicationRecord
    belongs_to :project

    has_many :resources
    has_many :images
    has_many :updates

    validates :title, presence: true
    validates :description, presence: true
    validates :budget, presence: true, numericality: true
    STATUS_OPTIONS = ["Not Started", "Incomplete", "Completed"]
    validates :status, presence: true, inclusion: STATUS_OPTIONS

    # Scope methods called in Goals index view to sort goals by completion status.
    scope :completed, -> { where(status: 'Completed') }
    scope :incomplete, -> { where(status: 'Incomplete') }
    scope :not_started, -> { where(status: 'Not Started') }

    # scope :search_name, -> { where(title: 'params[]')}

    def self.search_name(params)
        where('title = ?', "#{params}")
    end

end
