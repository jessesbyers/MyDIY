class Collaboration < ApplicationRecord
    belongs_to :user
    belongs_to :project

    validates :user_id, uniqueness: { scope: :project_id, message: ": A collaboration already exists with this user on this project." }
    validates :project_id, uniqueness: { scope: :user_id, message: ": A collaboration already exists with this user on this project." }
    # validates :role, presence: true, inclusion: { in: %w("Project Owner" "Update and View" "View Only"), message: "%{value} is not a valid role" }

    def self.project_user_is_owner(user)
        where(user_id: user.id, role: "Project Owner").map { |c| c.project }
    end
end