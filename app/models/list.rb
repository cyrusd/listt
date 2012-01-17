class List < ActiveRecord::Base
  acts_as_audited
  has_many :list_items
end
