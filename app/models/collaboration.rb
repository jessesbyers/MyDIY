class Collaboration < ApplicationRecord
    belongs_to :user
    belongs_to :project

    validates :user_id, uniqueness: { scope: :project_id, message: ": A collaboration already exists with this user on this project." }
    validates :project_id, uniqueness: { scope: :user_id, message: ": A collaboration already exists with this user on this project." }
    ROLE_OPTIONS = ["Primary Project Owner", "Project Owner", "Update and View", "View Only"]
    validates :role, presence: true, inclusion: ROLE_OPTIONS


# CHANGE ALL OF THESE METHODS TO PROJECT MODEL AND CALL WITH current_user.projects.___

# DONE returns array of projects in which the (current) user is Primary Project Owner
    def self.project_user_is_primary_owner(user)
        where(user_id: user.id, role: "Primary Project Owner").map { |c| c.project }.compact
    end

# DONE returns array of projects in which the (current) user is Project Owner
    def self.project_user_is_owner(user)
        where(user_id: user.id, role: "Project Owner").map { |c| c.project }.compact
    end

# DONE returns array of projects in which the (current) user is Update and View
    def self.project_user_is_update(user)
        where(user_id: user.id, role: "Update and View").map { |c| c.project }.compact
    end

# DONE returns array of projects in which the (current) user is View Only
    def self.project_user_is_viewonly(user)
        where(user_id: user.id, role: "View Only").map { |c| c.project }.compact
    end

# DONE: returns array of projects in which the (current) user is Primary OR Project Owner
    def self.project_user_is_primary_or_owner(user)
        project_user_is_primary_owner(user) + project_user_is_owner(user).compact
    end

# DONE: returns array of projects in which the (current) user is Primary OR Project Owner OR Update
    def self.project_user_is_primary_or_owner_or_update(user)
        project_user_is_primary_owner(user) + project_user_is_owner(user) + project_user_is_update(user).compact
    end

# DONE: returns array of projects in which the (current) user is a Collaborator in any role
    def self.project_user_is_collaborator(user)
        project_user_is_primary_or_owner_or_update(user) + project_user_is_viewonly(user)
    end
end