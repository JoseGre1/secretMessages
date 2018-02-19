module MessageSearch
  extend ActiveSupport::Concern

  def messages_around(latitude, longitude, radius = 100)
    return Message.near([latitude.to_f, longitude.to_f], radius || 100, units: :km) if latitude && longitude
  end

  def closest_message_to(latitude, longitude)
    return Message.near([latitude.to_f, longitude.to_f], 100_000, units: :km).first if latitude && longitude
  end
end
