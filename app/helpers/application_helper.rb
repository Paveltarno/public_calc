module ApplicationHelper

  def broadcast(channel, &block)
    message = {:channel => channel, :data => capture(&block)}
    uri = URI.parse(Rails.application.secrets.faye_url)
    Net::HTTP.post_form(uri, :message => message.to_json)
  end

end
