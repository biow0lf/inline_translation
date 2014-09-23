ENV['RAILS_ENV'] = 'test'

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'bundler/setup'
require 'active_record'
require 'temping'
ActiveRecord::Base.establish_connection adapter: :sqlite3, database: ':memory:'

require 'minitest/autorun'
require 'rails/generators/test_case'

def setup_destination
  destination File.expand_path '../../tmp', __FILE__
  setup :prepare_destination
end

def setup_model
  Temping.create :test_model do 
    with_columns do |t| 
      t.integer :id_alt
      t.string :column, :language, :language_alt 
    end 
  end
  TestModel.class_eval "include Babbel::IsTranslatable"
end
