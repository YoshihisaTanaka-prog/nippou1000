class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :mains, ->{ order(id: :asc) }, dependent: :destroy

  validates :first_person_id, presence: true

  def first_person
    f = FirstPerson.find_by(id: self.first_person_id)
    if f
      return f.name
    else
      return "小生"
    end
  end

end
