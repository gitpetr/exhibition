class Questionnaire < ApplicationRecord
  belongs_to :user

  validates :title, :exhibition, :username, :address, :phone, :email, :web, :budget, :area, :region, :main_purpose_participation, :company_info, :user_id, presence: true

  def user_create(email)
    pwd = (('a'..'z').to_a.shuffle.first(3) + ['_', '-'] + (1..9).to_a.shuffle.first(2) + ('A'..'Z').to_a.shuffle.first(3)).shuffle.join
    User.create(email: email, password: pwd, password_confirmation: pwd, tmp_password: pwd)
  end
end
