json.extract! journal, :id, :lawsuit_id, :entry, :binder, :issue, :costs, :created_at, :updated_at
json.url journal_url(journal, format: :json)
