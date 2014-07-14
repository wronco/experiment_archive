json.array!(@experiments) do |experiment|
  json.extract! experiment, :id, :user_id, :screenshot_original, :screenshot_variation, :winner, :confidence, :brief, :hypothesis, :experiment_url, :result_url
  json.url experiment_url(experiment, format: :json)
end
