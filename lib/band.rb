class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues
  validates :name, :presence => true
  before_save :titleize_name

define_method(:titleize_name) do
  self.name = name.titleize
end

end
