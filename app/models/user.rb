class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, length: { :minimum => 6}

    has_many :collaborations
    has_many :projects, through: :collaborations
    has_many :goals, through: :projects, source: :goals

    has_many :resources
    has_many :images
    has_many :updates


    def self.all_except(user)
        where.not(id: user)
    end
end
