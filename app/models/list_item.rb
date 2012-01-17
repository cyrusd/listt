class ListItem < ActiveRecord::Base
  acts_as_audited
  belongs_to :list
end
