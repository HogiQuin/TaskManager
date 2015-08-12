class Course < ActiveRecord::Base
  belongs_to :semester
  has_many :tasks
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :users

  validates :name , presence: true,
                    length: {minimum: 5},
                    uniqueness: true
end
