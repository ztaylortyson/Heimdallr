class UserLawsuit < ApplicationRecord
  belongs_to :user
  belongs_to :lawsuit
end
