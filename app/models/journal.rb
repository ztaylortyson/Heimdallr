class Journal < ApplicationRecord
  belongs_to :lawsuit

  scope :desc, -> { order('journals.created_at DESC')}

end
