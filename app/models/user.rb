# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string
#  uid                    :string
#  username               :string
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :github]

  validates :username, presence: true, uniqueness: true 
  
  

  # relationships
  has_many :board_users, dependent: :destroy
  has_many :boards, through: :board_users, dependent: :destroy
  has_many :comments

  has_many :notifications, as: :recipient, dependent: :destroy

  def self.online
    ids = ActionCable.server.pubsub.redis_connection_for_subscriptions.smembers "online"
    where(id: ids)
  end

  class << self
    def from_omniauth(auth)
      find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        # user.name = auth.info.name   # assuming the user model has a name
        # user.image = auth.info.image # assuming the user model has an image
        # If you are using confirmable and the provider(s) you use validate emails, 
        # uncomment the line below to skip the confirmation emails.
        # user.skip_confirmation!
      end
    end


    def ransackable_attributes(auth_object = nil)
      ["email", "username"]
    end

    def ransackable_associations(auth_object = nil)
      ["board_users", "boards"]
    end

    def find_users_not_in_board(board_id)
      where.not(id: User.joins(:boards).where('boards.id = ?', board_id))
    end
  end
end
