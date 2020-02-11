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

    # call on a user.projects, 
    # returns the array of projects in which user is any role except view_only
    def self.primary_or_owner_or_update
        joins(:collaborations).where.not('collaborations.role = ?', "View Only").uniq
    end

    # returns array of projects in which the (current) user is a Collaborator in any role
    def self.collaborator_of_any_kind
        joins(:collaborations).uniq
        # project_user_is_primary_or_owner_or_update(user) + project_user_is_viewonly(user)
    end

    # returns array of projects in which the (current) user is a Primary Project Owner
    def self.primary_owner 
        joins(:collaborations).where('collaborations.role = ?', "Primary Project Owner").uniq
    end

    # returns array of projects in which the (current) user is Project Owner
    def self.owner 
        joins(:collaborations).where('collaborations.role = ?', "Project Owner").uniq
    end

    # returns array of projects in which the (current) user is Update and View
    def self.update_and_view 
        joins(:collaborations).where('collaborations.role = ?', "Update and View").uniq
    end

    # returns array of projects in which the (current) user is View Only
    def self.view_only 
        joins(:collaborations).where('collaborations.role = ?', "View Only").uniq
    end

    # returns array of projects in which the (current) user is Primary OR Project Owner
    # would be better with an or query - need to figure out synta
    def self.primary_or_owner 
        primary_owner + owner
    end




end
