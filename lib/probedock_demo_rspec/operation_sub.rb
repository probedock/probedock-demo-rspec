# encoding: UTF-8

module ProbedockDemoRspec
	class OperationSub < Operation

		def calculate
			@left_operand - @right_operand;
		end
	end
end
