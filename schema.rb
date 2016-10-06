require_relative 'environment'
require 'active_record'

class CreateTables < ActiveRecord::Migration[5.0]
  def up
    create_table :composers do |t|
      t.string :name
      t.string :period
    end

    create_table :pieces do |t|
      t.belongs_to :composer
      t.string :name
    end

    add_foreign_key :pieces, :composers
  end

  def down
    drop_table :pieces

    drop_table :composers
  end
end

def main
  action = (ARGV[0] || :up).to_sym

  CreateTables.migrate(action)
end

main if __FILE__ == $PROGRAM_NAME
