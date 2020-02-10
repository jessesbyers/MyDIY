class Collaboration < ApplicationRecord
    belongs_to :user
    belongs_to :project

    validates :user_id, uniqueness: { scope: :project_id, message: ": A collaboration already exists with this user on this project." }
    validates :project_id, uniqueness: { scope: :user_id, message: ": A collaboration already exists with this user on this project." }
    ROLE_OPTIONS = ["Primary Project Owner", "Project Owner", "Update and View", "View Only"]
    validates :role, presence: true, inclusion: ROLE_OPTIONS


    def self.project_user_is_primary_owner(user)
        where(user_id: user.id, role: "Primary Project Owner").map { |c| c.project }.compact
    end

    def self.project_user_is_owner(user)
        where(user_id: user.id, role: "Project Owner").map { |c| c.project }.compact
    end

    def self.project_user_is_update(user)
        where(user_id: user.id, role: "Update and View").map { |c| c.project }.compact
    end

    def self.project_user_is_viewonly(user)
        where(user_id: user.id, role: "View Only").map { |c| c.project }.compact
    end

    def self.project_user_is_primary_or_owner(user)
        project_user_is_primary_owner(user) + project_user_is_owner(user).compact
    end

    def self.project_user_is_primary_or_owner_or_update(user)
        project_user_is_primary_owner(user) + project_user_is_owner(user) + project_user_is_update(user).compact
    end
end