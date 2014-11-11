module ClientHelpers

  def create_kosapi_client
    credentials = { 
      client_id: ENV['KOSAPI_OAUTH_CLIENT_ID'], 
      client_secret: ENV['KOSAPI_OAUTH_CLIENT_SECRET'] 
    }
    KOSapiClient.new(credentials)
  end
  
end