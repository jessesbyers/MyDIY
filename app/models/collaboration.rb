class Collaboration < ApplicationRecord
    belongs_to :user
    belongs_to :project

    validates :user_id, uniqueness: { scope: :project_id, message: ": A collaboration already exists with this user on this project." }
    validates :project_id, uniqueness: { scope: :user_id, message: ": A collaboration already exists with this user on this project." }
    ROLE_OPTIONS = ["Primary Project Owner", "Project Owner", "Update and View", "View Only"]
    validates :role, presence: true, inclusion: ROLE_OPTIONS

    # returns array of collaborations in which the (current) user is Primary Project Owner
    def self.primary_owner
        where('role = ?', "Primary Project Owner")
    end

    # returns array of collaborations in which the (current) user is Primary Project Owner
    def self.not_primary_owner
        where.not('role = ?', "Primary Project Owner")
    end
end