Uploadcare::Rails::Engine.configure do
  config.uploadcare.public_key = 'demopublickey'
  config.uploadcare.private_key = 'demoprivatekey'
  config.uploadcare.widget_version = '0.8'


  # Set the following to true if you don't want to propagate exceptions
  # that are happening while storing a file (e.g. storing a file
  # which no longer exists). They all are written to logger.error anyway.

  config.uploadcare.silence_save_errors = false

end