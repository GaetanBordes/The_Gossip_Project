class User < ApplicationRecord
  
  belongs_to :city

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :gossips, foreign_key: 'author_id' # Un utilisateur peut avoir plusieurs potins

  validates :first_name, :last_name, :email, :city, :description, :birthdate, presence: true

  def age
    return unless birthdate.present?
    today = Date.today
    age = today.year - birthdate.year
    age -= 1 if today.yday < birthdate.yday 
    age
  end
end
