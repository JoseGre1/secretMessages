require "rails_helper"

RSpec.describe Message, type: :model do
  describe "body" do
    it { should validate_presence_of(:body) }
    it { should_not allow_value("").for(:body) }
    it { should validate_length_of(:body).is_at_most(100) }
    it "is encrypted before save" do
      message2 = create(:message, body: "Foo Bar")
      expect(message2.body).to_not eq("Foo Bar")
    end
  end

  describe "latitude" do
    it { should validate_presence_of(:latitude) }
    it { should_not allow_value("").for(:latitude) }
    it do
      should validate_numericality_of(:latitude)
        .is_greater_than_or_equal_to(-90)
        .is_less_than_or_equal_to(90)
    end
  end

  describe "longitude" do
    it { should validate_presence_of(:longitude) }
    it { should_not allow_value("").for(:longitude) }
    it do
      should validate_numericality_of(:longitude)
        .is_greater_than_or_equal_to(-180)
        .is_less_than_or_equal_to(180)
    end
  end

  describe "#decrypt_body" do
    let(:message1) { create(:message, body: "Foo Bar") }
    it "should decrypt the message's body" do
      expect(message1.decrypt_body).to eq("Foo Bar")
    end
  end
end
