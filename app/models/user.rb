class User < ApplicationRecord

  has_secure_password

  has_many :locations
  has_many :helper_lists
  has_many :events
  has_many :messages
  has_many :reviews

  has_attached_file :photo, :styles => { :medium =>  "300x300#", :thumb => "200x200#" }

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  has_many :reviews
  has_and_belongs_to_many :accepted_events, class_name: "Event"

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, presence: true
  # validates :password, presence: true, length: { minimum: 5 }
  # validates :password_confirmation, presence: true

  def accepted_event?(event_id)
    accepted_events.where(id: event_id).any?
  end
end
