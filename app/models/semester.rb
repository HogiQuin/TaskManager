class Semester < ActiveRecord::Base
  has_many :groups
  has_many :courses

  validates :name , presence: true,
                    length: {minimum: 5},
                    uniqueness: true

  validates :start_date , presence: true

  validates :end_date , presence: true

  validates :status , presence: true,
                      length: {maximum: 1}

end
