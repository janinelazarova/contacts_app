class Contact < ApplicationRecord

  belongs_to :user

  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true

  def friendly_updated_at
    updated_at.strftime("%A, %b %d")
  end

  def full_name 
    full_name = "#{first_name} #{last_name}"
  end  

  def japan
    japan_phone_num = "+81 #{phone_number}"

  end
end
