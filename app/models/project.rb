class Project < ApplicationRecord
    has_many :users
    has_many :goals

    accepts_nested_attributes_for :goals, reject_if: proc { |attributes| attributes['title'].blank? || attributes['description'].blank? || attributes['budget'].blank? || attributes['status'].blank? }
end
