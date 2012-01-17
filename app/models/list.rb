class List < ActiveRecord::Base
  acts_as_audited
  has_many :list_items, :before_add => :check_list_item_type

private

  def check_list_item_type (list_item)
    if ((self.type + "Item") != list_item.type)
      throw "cannot associate list item type #{list_item.type} with list type #{self.type}"
    end
  end
end
