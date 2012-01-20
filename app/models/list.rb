class List < ActiveRecord::Base
  class Visibility
    PUBLIC    = "public"    # all users can read/write
    PROTECTED = "protected" # all users can read, permitted users can read/write
    PRIVATE   = "private"   # permitted users can read/write
  end

  acts_as_audited
  belongs_to :user
  has_many :list_items, :before_add => :check_list_item_type
  has_many :permissions
  has_many :permitted_users, :through => :permissions, :source => :user
  validates_presence_of :title

  def self.inherited(child)
    child.instance_eval do
      def model_name
        List.model_name
      end
    end
    super
  end

  def self.select_options
    descendants.map{ |c| c.to_s }.sort
  end

  def as_json(options = {})
    { type: type }.merge super(options)
  end

  def viewable_by? (user)
    if user.nil?
      visibility == List::Visibility::PUBLIC || visibility == List::Visibility::PROTECTED
    else
      self.user == user || visibility == List::Visibility::PUBLIC || visibility == List::Visibility::PROTECTED || permitted_users.include?(user) 
    end
  end

  def editable_by? (user)
    if user.nil?
      visibility == List::Visibility::PUBLIC
    else
      self.user == user || visibility == List::Visibility::PUBLIC || permitted_users.include?(user)
    end
  end

private

  def check_list_item_type (list_item)
    if ((self.type + "Item") != list_item.type)
      throw "cannot associate list item type #{list_item.type} with list type #{self.type}"
    end
  end
end
