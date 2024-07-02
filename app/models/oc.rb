class Oc < ApplicationRecord
  validates_uniqueness_of :sbn
  belongs_to :lawsuit
end
