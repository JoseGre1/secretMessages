class Message < ApplicationRecord
  before_save :encrypt_body

  validates :body, presence: true, allow_blank: false, length: { maximum: 100 }
  validates :latitude,
            numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 },
            presence: true,
            allow_blank: false

  validates :longitude,
            numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 },
            presence: true,
            allow_blank: false

  reverse_geocoded_by :latitude, :longitude

  def decrypt_body
    crypto.decrypt_and_verify(body)
  end

  private

  def crypto
    ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
  end

  def encrypt_body
    self.body = crypto.encrypt_and_sign(body)
  end
end
