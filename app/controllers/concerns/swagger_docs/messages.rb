module SwaggerDocs::Messages
  extend ActiveSupport::Concern

  included do
    swagger_controller :messages, "Messages"

    swagger_api :index do
      summary "Fetches all Messages items"
      param :query, :search_by, :string, :optional, "Search Criterium", enum: %w[area closest]
      param :query, :latitude, :float, :optional, "Latitude"
      param :query, :longitude, :float, :optional, "Longitude"
      param :query, :radius, :float, :optional, "Radius"
      response :ok, "Success", :Message
      response :bad_request
      response 500, "Internal Error"
    end

    swagger_api :create do
      summary "Creates a new Message"
      param :form, "message[body]", :string, :required, "Message Body"
      param :form, "message[latitude]", :string, :required, "Message Latitude"
      param :form, "message[longitude]", :string, :required, "Message Longitude"
      response :ok, "Success", :Message
      response :unprocessable_entity
      response 500, "Internal Error"
    end

    swagger_api :show do
      summary "Fetches a single Message item"
      param :path, :id, :integer, :required, "Message Id"
      response :ok, "Success", :Message
      response :not_found
      response 500, "Internal Error"
    end

    swagger_model :Message do
      description "Message Object"
      property :id, :integer, :required, "Message Id"
      property :body, :string, :required, "Decrypted message body"
      property :latitude, :float, :required, "Latitude of message's position"
      property :longitude, :float, :required, "Longitude of message's position"
      property :createdAt, :date, :required, "Creation's date"
      property :updatedAt, :date, :required, "Last Update's date"
      property :distance, :float, :optional, "Distance to position specified by request parameters"
      property :bearing, :float, :optional, "Bearing angle calculated from position specified by request parameters"
    end
  end
end
