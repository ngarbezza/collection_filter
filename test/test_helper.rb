# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'collection_filter'

require 'minitest/autorun'

require 'minitest/reporters'

MiniTest::Reporters.use!
