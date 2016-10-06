require 'active_record'

class Composer < ActiveRecord::Base
  validates :name, :period, presence: true
  has_many :pieces
end
