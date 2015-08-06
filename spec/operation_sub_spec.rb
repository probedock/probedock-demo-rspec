require 'helper'

describe ProbedockDemoRspec::OperationSub, probedock: { contributors: 'laurent.prevost@probedock.io', tickets: 'feature-2', tags: 'sub' } do
	it 'should allow the subtraction of two integers through a call to calculate', probedock: { tags: 'calculate' } do
     expect(ProbedockDemoRspec::OperationSub.new(left: 1, right: 3).calculate).to eq(-2)
	end

	it 'should should allow to do the subtraction of two integers', probedock: { tags: 'process' } do
		expect(ProbedockDemoRspec::OperationSub.new(left: 1, right: 3).process).to eq(-2)
	end

	it 'should allow process and calculate to give the same result for single subtraction operation', probedock: { tags: [ 'process', 'calculate' ] } do
		expect(ProbedockDemoRspec::OperationSub.new(left: 1, right: 3).process).to eq(ProbedockDemoRspec::OperationSub.new(left: 1, right: 3).calculate)
	end

	it 'should allow to process an subtraction with left integer and right operation', probedock: { tags: [ 'process', 'composed'] } do
		expect(ProbedockDemoRspec::OperationSub.new(left: 1, right_operation: ProbedockDemoRspec::OperationSub.new(left: 1, right: 2)).process).to eq(2)
	end

	it 'should not allow to get the correct result through calculate when left is integer and right is operation', probedock: { tags: [ 'calculate', 'composed' ] } do
		expect(ProbedockDemoRspec::OperationSub.new(left: 1, right_operation: ProbedockDemoRspec::OperationSub.new(left: 1, right: 2)).calculate).not_to eq(-2)
	end

	it 'should allow to process an subtraction with left operation and right integer', probedock: { tags: [ 'process', 'composed'] } do
		expect(ProbedockDemoRspec::OperationSub.new(left_operation: ProbedockDemoRspec::OperationSub.new(left: 1, right: 2), right: 1).process).to eq(-2)
	end

	it 'should not allow to get the correct result through calculate when left is operation and right is integer', probedock: { tags: [ 'calculate', 'composed' ] } do
		expect(ProbedockDemoRspec::OperationSub.new(left_operation: ProbedockDemoRspec::OperationSub.new(left: 1, right: 2), right: 1).calculate).not_to eq(-2)
	end

	it 'should allow to process an subtraction with left operation and right operation', probedock: { tags: [ 'process', 'composed'] } do
		expect(ProbedockDemoRspec::OperationSub.new(
			left_operation: ProbedockDemoRspec::OperationSub.new(left: 1, right: 2),
			right_operation: ProbedockDemoRspec::OperationSub.new(left: 1, right: 0)
	 	).process).to eq(-2)
	end

	it 'should not allow to get the correct result through calculate when left is operation and right is operation', probedock: { tags: [ 'calculate', 'composed' ] } do
		expect(ProbedockDemoRspec::OperationSub.new(
			left_operation: ProbedockDemoRspec::OperationSub.new(left: 1, right: 2),
			right_operation: ProbedockDemoRspec::OperationSub.new(left: 1, right: 0)
		).calculate).not_to eq(-2)
	end
end
