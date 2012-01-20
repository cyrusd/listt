class Permission < ActiveRecord::Base
  READ_ONLY  = "read only"
  READ_WRITE = "read write"

  belongs_to :user
  belongs_to :list
end
