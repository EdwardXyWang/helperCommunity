class Event < ApplicationRecord

  belongs_to :user

  validates :title, presence: true

  validates :description, presence: true
  # validates :user_id, presence: true
  # validates :scheduled_at, presence: true
  # validates :location, presence: true

  geocoded_by :full_address, :latitude  => :lat, :longitude => :lng
  geocoded_by :end_address, latitude: :end_lat, longitude: :end_lng

  after_validation :geocode

  before_save :geocode_endpoints

  after_validation :geocode
  has_and_belongs_to_many :users

  has_attached_file :photo, :styles => { :medium =>     "300x300#", :thumb => "200x200#" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  def full_address
    address + ", " + city
  end

  after_create_commit { ActionCable.server.broadcast 'events', {message: self.to_json}}

private
  #To enable Geocoder to works with multiple locations
  def geocode_endpoints
    if self.address_changed?
      # if implement event-editing, next line must only run when from-address changes
      geocoded = Geocoder.search(self.full_address).first
      if geocoded
        self.lat = geocoded.latitude
        self.lng = geocoded.longitude
      end
    end
    # Repeat for destination
    if self.end_address_changed?
      # if implement event-editing, next line must only run when to-address changes
      geocoded = Geocoder.search(self.end_address).first
      if geocoded
        self.end_lat = geocoded.latitude
        self.end_lng = geocoded.longitude
      end
    end
  end

end
