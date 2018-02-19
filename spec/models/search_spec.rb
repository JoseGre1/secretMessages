require "rails_helper"

RSpec.describe Search, type: :model do
  describe "latitude" do
    it do
      should validate_numericality_of(:latitude)
        .is_greater_than_or_equal_to(-90)
        .is_less_than_or_equal_to(90)
    end
  end

  describe "longitude" do
    it do
      should validate_numericality_of(:longitude)
        .is_greater_than_or_equal_to(-180)
        .is_less_than_or_equal_to(180)
    end
  end

  describe "search_by" do
    SEARCH_CRITERIA = ["area", "closest", "", nil].freeze
    it do
      should validate_inclusion_of(:search_by)
        .in_array(SEARCH_CRITERIA)
    end
  end

  describe "radius" do
    it do
      should validate_numericality_of(:radius)
        .is_greater_than_or_equal_to(0)
    end
  end
end
