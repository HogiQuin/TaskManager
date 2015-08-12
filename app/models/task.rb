class Task < ActiveRecord::Base
  belongs_to :course
  has_and_belongs_to_many :groups

  validates :title, presence: true

  validates :description, presence: true

end
