class ListItem < ActiveRecord::Base
  acts_as_audited
  belongs_to :list
  belongs_to :user

  def self.inherited(child)
    child.instance_eval do
      def model_name
        ListItem.model_name
      end
    end
    super
  end

  def self.select_options
    descendants.map{ |c| c.to_s }.sort
  end
end
