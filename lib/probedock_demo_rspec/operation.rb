# encoding: UTF-8

module ProbedockDemoRspec
  class Operation
		##
		# Constructor
		#
		# @param left Left integer
		# @param right Right integer
		# @param left_operation Left opration
		# @param right_operation Right operation
		##
		def initialize(left: 0, right: 0, left_operation: nil, right_operation: nil)
			@left_operand = left
			@right_operand = right
			@left_operation = left_operation
			@right_operation = right_operation
		end

		##
		# Process the operation and take care about the composition of the operations
		#
		# @return The result of the operation
		##
		def process
			# Calculate the result of the left operation if any
		 	@left_operand = @left_operation.process unless @left_operation.nil?

   		# Calculate the result of the right operation if any
			@right_operand = @right_operation.process unless @right_operation.nil?

   		# Process the operation itself after the composition resolution
   		calculate
		end
  end
end
