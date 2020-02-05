class Project < ApplicationRecord
    has_many :collaborations
    has_many :users, through: :collaborations
    has_many :goals

    accepts_nested_attributes_for :goals, reject_if: proc { |attributes| attributes['title'].blank? || attributes['description'].blank? || attributes['budget'].blank? || attributes['status'].blank? }
    accepts_nested_attributes_for :collaborations
    # has_many :resources, through: :goals
    # has_many :photos, through: :goals
    # has_many :updates through: :goals
end
