# -*- encoding : utf-8 -*-
class CreateIdentities < ActiveRecord::Migration
  def up
    create_table :identities do |t|
      t.string    "uid"
      t.string    "provider"
      t.string    "email"
      t.string    "handle"
      t.string    "avatar"
      t.string    "profile_url"
      t.string    "presence_url"
      t.text      "bio"
      t.string    "hometown"
      t.integer   "user_id"
      t.timestamps
    end
    add_index :identities, [:uid, :provider], :unique => true
    add_index :identities, :user_id
  end

  def down
    drop_table :identities
  end
end
