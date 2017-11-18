class HomeController < ApplicationController
  include HomeHelper	
  before_action :set_client
  before_action :set_calendar_search, only: :calendars

  def redirect
    redirect_to @client.authorization_uri.to_s
  end

  def callback
    @client.code = params[:code]
    response = @client.fetch_access_token!
    session[:authorization] = response
    redirect_to calendars_url
  end

  def calendars
    @client.update!(session[:authorization])
    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = @client
    @calendar_list = service.list_events('primary', calendar_search_iso8601(@calendar_search))
  rescue Google::Apis::AuthorizationError
    response = @client.refresh!
    session[:authorization] = session[:authorization].merge(response)
    retry
  end

  private

  def set_client
  	@client = Signet::OAuth2::Client.new(client_options)
  end	

  def client_options
    {
      client_id: Rails.application.secrets.google_client_id,
      client_secret: Rails.application.secrets.google_client_secret,
      authorization_uri: ENV['AUTHORIZATION_URI'],
      token_credential_uri: ENV['TOKEN_CREDENTIAL_URI'],
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
      redirect_uri: callback_url
    }
  end

  def set_calendar_search
    @calendar_search = {
      time_min: parse_time_parameter(:time_min) || Time.zone.now.beginning_of_day,
      time_max: parse_time_parameter(:time_max) || Time.zone.now.beginning_of_day + 1.day
    }
  end
end