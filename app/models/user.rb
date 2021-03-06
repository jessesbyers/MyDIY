class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :password, length: { :minimum => 6}
    validates_confirmation_of :password


    has_many :collaborations
    has_many :projects, through: :collaborations
    has_many :goals, through: :projects

    has_many :resources
    has_many :images
    has_many :updates

    # Method used to filter current user from list of all users in dropdown menu for creating/editing collaborations.
    def self.all_except(user)
        where.not(id: user)
    end

end
