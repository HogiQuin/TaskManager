class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :groups
  has_and_belongs_to_many :courses

  validates :first_name , presence: true,
                          length: {minimum: 4}

  validates :last_name ,presence: true,
                        length: {minimum: 4}

  validates :user_number ,presence: true,
                          length: {maximum: 5, minimum: 5},
                          allow_blank: true,
                          uniqueness: true

  validates :role , presence: true

  validates :age , presence: true


  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    self.role == 'admin'
  end

  def instructor?
    self.role == 'instructor'
  end

  def student?
    self.role == 'student'
  end
end
