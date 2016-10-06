require 'active_record'

class Piece < ActiveRecord::Base
  validates :name, :composer_id, presence: true
  belongs_to :composer
end
