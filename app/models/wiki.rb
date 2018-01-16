class Wiki < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  belongs_to :user
  has_many :collaborators, dependent: :destroy

  def public?
    self.private != true
  end

  def is_owned_by(user)
   self.user_id == user.id
  end

  def is_collaborated_by(user)
    user_list = []
    self.collaborators.each do |collaborator|
      user_list << collaborator.user
    end

    user_list.include?(user)
  end

end
