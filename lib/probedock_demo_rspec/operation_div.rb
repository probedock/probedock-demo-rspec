# encoding: UTF-8

module ProbedockDemoRspec
	class OperationDiv < Operation

		def calculate
			raise OperationError.new('Cannot divide by zero') if @right_operand == 0
			@left_operand / @right_operand;
		end
	end
end
