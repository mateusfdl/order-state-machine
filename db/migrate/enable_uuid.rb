# frozen_string_literal: true

class EnableUUID < ActiveRecord::Migration
  def change
    enable_extension 'pgcrypto'
  end
end
