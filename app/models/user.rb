class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  extend FriendlyId
  friendly_id :username, use: [:slugged, :finders]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

         has_many :wikis, dependent: :destroy
         has_many :collaborators, dependent: :destroy

         after_initialize { self.role ||= :standard}

         enum role:[:standard, :premium, :admin]

         def should_generate_new_friendly_id?
           new_record? || slug.nil? || slug.blank? # you can add more condition here
         end
end
