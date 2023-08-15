# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'collection_filter'

require 'minitest/autorun'

unless ENV['RM_INFO']
  require 'minitest/reporters'

  Minitest::Reporters.use!
end
