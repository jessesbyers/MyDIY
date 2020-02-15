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

    DIFFICULTY_OPTIONS = ["Not Rated", "Easy DIY", "Requires New Skills", "Hire an Expert"]
    validates :difficulty, presence: true, inclusion: DIFFICULTY_OPTIONS

    PRIORITY_OPTIONS = ["Not Rated", "High", "Medium", "Low"]
    validates :priority, presence: true, inclusion: PRIORITY_OPTIONS

    TIME_OPTIONS = ["Unrated", "Under 1 Hour", "1-2 Hours", "Half Day", "Full Day", "Weekend", "Long Term"]
    validates :time_commitment, presence: true, inclusion: TIME_OPTIONS
    
    # Scope methods called in Goals index view to sort goals by completion status.
    scope :completed, -> { where(status: 'Completed') }
    scope :incomplete, -> { where(status: 'Incomplete') }
    scope :not_started, -> { where(status: 'Not Started') }

    # Scope methods for filter/sort options on Goals index view. Called in goals#index to set @goals for view.
    def self.filter_status(params)
        where('status = ?', "#{params}")
    end

    def self.filter_priority(params)
        where('priority = ?', "#{params}")
    end

    def self.filter_difficulty(params)
        where('difficulty = ?', "#{params}")
    end

    def self.filter_time_commitment(params)
        where('time_commitment = ?', "#{params}")
    end

    # def self.filter_budget(params)
    #     where('budget = ?', "#{params}")
    # end
end
