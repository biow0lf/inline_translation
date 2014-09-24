ENV['RAILS_ENV'] = 'test'

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'bundler/setup'
require 'active_record'
require 'temping'
ActiveRecord::Base.establish_connection adapter: :sqlite3, database: ':memory:'

require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/mini_test'
require 'rails/generators/test_case'
require 'byebug'

def setup_destination
  destination File.expand_path '../../../tmp', __FILE__
  setup :prepare_destination
end

def setup_model(model = :test_model)
  constantized = model.to_s.split("_").collect(&:capitalize).join
  unless Object.const_defined?(constantized)
    Temping.create model do 
      with_columns do |t| 
        t.integer :id_alt
        t.string :column1, :column2, :language, :language_alt 
      end
    end
    include_is_translatable Object.const_get(constantized)
  end
end

def setup_translation
  unless Object.const_defined?("Translation")
    Temping.create :translation do
      with_columns do |t|
        t.integer :translatable_id
        t.string  :translatable_type
        t.string  :field
        t.string  :language
        t.text    :translation
        t.timestamps
      end
    end
  end
end

def setup_bing_translator_env
  ENV['BING_TRANSLATOR_APP_ID'] = 'set'
  ENV['BING_TRANSLATOR_SECRET'] = 'set'
end

def include_is_translatable(model)
  model.class_eval "include Babbel::Concerns::IsTranslatable"
end

def include_translatable(model)
  model.class_eval "include Babbel::Concerns::Translatable"
end