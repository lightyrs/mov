# -*- encoding : utf-8 -*-
class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string       "name"
      t.datetime     "logged_in_at"
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
