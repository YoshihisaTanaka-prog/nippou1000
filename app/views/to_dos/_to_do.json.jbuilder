json.extract! to_do, :id, :name, :time_limit, :is_finished, :created_at, :updated_at
json.url to_do_url(to_do, format: :json)
