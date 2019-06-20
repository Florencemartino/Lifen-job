require "json"
require_relative 'model'
require_relative 'communication_repository'

in_path = File.join(__dir__, 'data.json')
out_path = File.join(__dir__, 'flo_output.json')
