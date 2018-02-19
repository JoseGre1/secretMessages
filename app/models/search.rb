class Search
  include ActiveModel::Model
  include AttributesMethods

  SEARCH_CRITERIA = ["area", "closest", "", nil].freeze

  attr_accessor :search_by, :latitude, :longitude, :radius

  def initialize(attributes = {})
    @search_by = attributes.fetch(:search_by, nil)
    @latitude = attributes.fetch(:latitude, nil)
    @longitude = attributes.fetch(:longitude, nil)
    @radius = attributes.fetch(:radius, 100)
  end

  validates :latitude,
            numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude,
            numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :search_by, inclusion: { in: SEARCH_CRITERIA, message: "Search criterium is invalid" }
  validates :radius, numericality: { greater_than_or_equal_to: 0 }
end
