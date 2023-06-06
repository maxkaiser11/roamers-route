OpenAI.configure do |config|
  config.access_token = Rails.application.credentials[:openai][:access_key]  # Replace with your OpenAI API key
end
