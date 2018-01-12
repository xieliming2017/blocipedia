class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

         has_many :wikis, dependent: :destroy
         has_many :collaborators, dependent: :destroy

         after_initialize { self.role ||= :standard}

         enum role:[:standard, :premium, :admin]

         def is_collaborator_of(wiki)
           collaborators.where(wiki_id: wiki.id).first
         end
end
