class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
  validate :password_complexity

  private
  def password_complexity
    if password.present? && !password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).*/)
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
    end
  end
end
