require "json"
require_relative 'model'
require_relative 'communication_repository'

in_path = File.join(__dir__, 'data.json')
out_path = File.join(__dir__, 'flo_output.json')
repo_comm = CommunicationRepository.new(in_path, out_path)
repo_comm.run
