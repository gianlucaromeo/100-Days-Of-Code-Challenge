require "active_support/core_ext/integer/time"

Rails.application.configure do
  config.enable_reloading = true
  config.eager_load = false
  config.consider_all_requests_local = true
  config.server_timing = true

  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      "Cache-Control" => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  config.active_storage.service = :local
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  
  # Add these
  config.action_mailer.delivery_method = :smtp  # Use SMTP to send emails
  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",  # Use the Gmail SMTP server
    port: 587,
    domain: "gmail.com",
    user_name: ENV["GMAIL_USERNAME"],  # Use the GMAIL_USERNAME environment variable from the .env file thanks to the dotenv gem
    password: ENV["GMAIL_PASSWORD"],  #  Use the GMAIL_PASSWORD environment variable from the .env file thanks to the dotenv gem
    authentication: "plain",  # Use the plain authentication method, which is the default for Gmail SMTP servers
    enable_starttls_auto: true  # Enable TLS for security
  }
  config.action_mailer.default_url_options = { 
    host: "localhost",
    port: 3000,
  }  # Set the default URL options for the mailer
  
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.active_job.verbose_enqueue_logs = true
  config.action_controller.raise_on_missing_callback_actions = true
end
