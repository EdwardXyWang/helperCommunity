class Event < ApplicationRecord

  belongs_to :user

  validates :title, presence: true

  validates :description, presence: true
  # validates :user_id, presence: true
  # validates :scheduled_at, presence: true
  # validates :location, presence: true

  geocoded_by :full_address, :latitude  => :lat, :longitude => :lng

  after_validation :geocode
  has_and_belongs_to_many :users

  has_attached_file :photo, :styles => { :medium =>     "300x300#", :thumb => "200x200#" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  def full_address
    address + ", " + city
  end

  after_create_commit { ActionCable.server.broadcast 'events', {message: self.to_json}}

end
