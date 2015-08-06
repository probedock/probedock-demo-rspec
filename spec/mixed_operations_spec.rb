require 'helper'

describe 'Mixed operations', probedock: { contributors: 'laurent.prevost@probedock.io', tickets: [ 'feature-1', 'feature-2', 'feature-3', 'feature-4' ], tags: 'mixed' } do
	it 'should allow to mix different operations' do
		# 5 / ((20 + (0 - 10)) / (1 * 2)) = 1
		expect(
			ProbedockDemoRspec::OperationDiv.new(
				left: 5,
				right_operation: ProbedockDemoRspec::OperationDiv.new(
					left_operation: ProbedockDemoRspec::OperationAdd.new(
						left: 20,
						right_operation: ProbedockDemoRspec::OperationSub.new(left: 0, right: 10)
					),
					right_operation: ProbedockDemoRspec::OperationMul.new(left: 1, right: 2)
				)
			).process
		).to eq(1)
	end

	it 'should be able to calculate: (6 + 30) - (2 * (15 / 5)) = 30' do
		expect(
			ProbedockDemoRspec::OperationSub.new(
				left_operation: ProbedockDemoRspec::OperationAdd.new(left: 6, right: 30),
				right_operation: ProbedockDemoRspec::OperationMul.new(
					left: 2,
					right_operation: ProbedockDemoRspec::OperationDiv.new(left: 15, right: 5)
				)
			).process
		).to eq(30)
	end

	it 'should not be possible to process operation if deep division operation has right operand equal to zero' do
		# 5 + (5 - (5 / (5 * (5 + (10 - 15))))) = division by zero
		expect{
			ProbedockDemoRspec::OperationAdd.new(
				left: 5,
				right_operation: ProbedockDemoRspec::OperationSub.new(
					left: 5,
					right_operation: ProbedockDemoRspec::OperationDiv.new(
						left: 5,
						right_operation: ProbedockDemoRspec::OperationMul.new(
							left: 5,
							right_operation: ProbedockDemoRspec::OperationAdd.new(
								left: 5,
								right_operation: ProbedockDemoRspec::OperationSub.new(left: 10, right: 15)
							)
						)
					)
				)
			).process
		}.to raise_error(ProbedockDemoRspec::OperationError)
	end
end