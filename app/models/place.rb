class Place < ActiveRecord::Base
    has_many :images
    geocoded_by :address
    after_validation :geocode, if: :address_changed?
    reverse_geocoded_by :latitude, :longitude
    after_validation :reverse_geocode, if: :latitude_changed?
    after_validation :reverse_geocode, if: :longitude_changed?
    acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude
end
