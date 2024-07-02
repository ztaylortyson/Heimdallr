json.extract! response, :id, :group, :responding_party, :propounding_party, :discovery_type, :discovery_set, :lawsuit_id, :created_at, :updated_at
json.url response_url(response, format: :json)
