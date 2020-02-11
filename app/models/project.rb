class Project < ApplicationRecord
    has_many :collaborations
    has_many :users, through: :collaborations
    has_many :goals
    has_many :resources, through: :goals
    has_many :images, through: :goals
    has_many :updates, through: :goals

    accepts_nested_attributes_for :goals, reject_if: proc { |attributes| attributes['title'].blank? || attributes['description'].blank? || attributes['budget'].blank? || attributes['status'].blank? }
    accepts_nested_attributes_for :collaborations

    validates :address, presence: true, uniqueness: true
    validates :overview, presence: true

    # call on a user.projects, return the group of projects
    def self.primary_or_owner_or_update
        joins(:collaborations).where.not('collaborations.role = ?', "View Only").uniq
    end



        # def self.project_user_is_primary_or_owner_or_update(user)
        #     project_user_is_primary_owner(user) + project_user_is_owner(user) + project_user_is_update(user).compact
        # end

end
