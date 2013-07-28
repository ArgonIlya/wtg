Uploadcare::Rails::Engine.configure do
  config.uploadcare.public_key = '44c2c4863e9cf9b697dc'
  config.uploadcare.private_key = '40df58381eee8c9ce433'
  #config.uploadcare.public_key = 'demopublickey'
  #config.uploadcare.private_key = 'demoprivatekey'
  config.uploadcare.widget_version = '0.8'


  # Set the following to true if you don't want to propagate exceptions
  # that are happening while storing a file (e.g. storing a file
  # which no longer exists). They all are written to logger.error anyway.

  config.uploadcare.silence_save_errors = false

end