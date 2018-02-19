class MessageDecorator < Draper::Decorator
  delegate_all

  def body
    object.decrypt_body
  end
end
