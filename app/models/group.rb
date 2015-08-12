class Group < ActiveRecord::Base
  belongs_to :semester
  has_and_belongs_to_many :courses
  has_and_belongs_to_many :tasks
  has_and_belongs_to_many :users

  validates :name , presence: true,
                    length: {minimum: 5},
                    uniqueness: true
end
