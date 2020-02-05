class Collaboration < ApplicationRecord
    belongs_to :user
    belongs_to :project

    def self.project_user_is_owner(user)
        where(user_id: user.id, role: "Project Owner").map { |c| c.project }
    end

    def self.owner_address(user)
        address = project_user_is_owner(user).map {|p| p.address}
        address.join("', '")
    end
end