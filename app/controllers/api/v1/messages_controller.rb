class Api::V1::MessagesController < Api::V1::BaseApiController
  include MessageSearch
  include SwaggerDocs::Messages

  before_action :validate_query_params

  def show
    @message = Message.find(params[:id])&.decorate
    json_response(@message)
  end

  def index
    @messages = fetch_messages
    json_response(@messages)
  end

  def create
    @message = Message.new(message_params[:message])
    if @message.save!
      json_response(@message&.decorate)
    else
      json_response(@message&.errors&.messages, :unprocessable_entity)
    end
  end

  private

  def message_params
    params.permit(:radius, :latitude, :longitude, :search_by, message: %i[body latitude longitude])
  end

  def validate_query_params
    if message_params[:search_by]
      @search = Search.new(message_params.to_h.symbolize_keys.slice(*Search.attributes))
      unless @search.valid?
        json_response({ errors: @search.errors }, :bad_request) && return
      end
    end
  end

  def fetch_messages
    case message_params[:search_by]
    when "area"
      search_by_area
    when "closest"
      search_closest
    else
      Message.all
    end
  end

  def search_by_area
    messages = messages_around(message_params[:latitude], message_params[:longitude], message_params[:radius])
    MessageDecorator.decorate_collection(messages)
  end

  def search_closest
    closest_message_to(message_params[:latitude], message_params[:longitude])&.decorate
  end
end
