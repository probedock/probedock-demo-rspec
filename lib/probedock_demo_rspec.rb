# encoding: UTF-8

module ProbedockDemoRspec
  VERSION = '0.1.0'

  class OperationError < StandardError
  end

end

Dir[File.join File.dirname(__FILE__), File.basename(__FILE__, '.*'), '*.rb'].each{ |lib| require lib }
