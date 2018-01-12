class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators, dependent: :destroy

  def public?
    if self.private == true
       return false
    else
      return true
    end
  end

  def is_owned_by(user)
    if self.user_id == user.id
      true
    else
      false
    end
  end

  def is_collaborated_by(user)
    if self.collaborators.where(user_id: user.id).first
      true
    else
      false
    end
  end
end
