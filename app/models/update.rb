class Update < ApplicationRecord
    belongs_to :goal
    belongs_to :user

    def human_readable_date
        d = self.date
        d.strftime("%B %d, %Y")
    end
end
