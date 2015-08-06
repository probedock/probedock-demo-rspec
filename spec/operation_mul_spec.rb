require 'helper'

describe ProbedockDemoRspec::OperationMul, probedock: { contributors: 'laurent.prevost@probedock.io', tickets: 'feature-3', tags: 'mul' } do
	it 'should allow the multiplication of two integers through a call to calculate', probedock: { tags: 'calculate' } do
     expect(ProbedockDemoRspec::OperationMul.new(left: 2, right: 3).calculate).to eq(6)
	end

	it 'should should allow to do the multiplication of two integers', probedock: { tags: 'process' } do
		expect(ProbedockDemoRspec::OperationMul.new(left: 2, right: 3).process).to eq(6)
	end

	it 'should allow process and calculate to give the same result for single multiplication operation', probedock: { tags: [ 'process', 'calculate' ] } do
		expect(ProbedockDemoRspec::OperationMul.new(left: 2, right: 3).process).to eq(ProbedockDemoRspec::OperationMul.new(left: 2, right: 3).calculate)
	end

	it 'should allow to process an multiplication with left integer and right operation', probedock: { tags: [ 'process', 'composed'] } do
		expect(ProbedockDemoRspec::OperationMul.new(left: 2, right_operation: ProbedockDemoRspec::OperationMul.new(left: 1, right: 3)).process).to eq(6)
	end

	it 'should not allow to get the correct result through calculate when left is integer and right is operation', probedock: { tags: [ 'calculate', 'composed' ] } do
		expect(ProbedockDemoRspec::OperationMul.new(left: 2, right_operation: ProbedockDemoRspec::OperationMul.new(left: 1, right: 3)).calculate).not_to eq(6)
	end

	it 'should allow to process an multiplication with left operation and right integer', probedock: { tags: [ 'process', 'composed'] } do
		expect(ProbedockDemoRspec::OperationMul.new(left_operation: ProbedockDemoRspec::OperationMul.new(left: 2, right: 3), right: 2).process).to eq(12)
	end

	it 'should not allow to get the correct result through calculate when left is operation and right is integer', probedock: { tags: [ 'calculate', 'composed' ] } do
		expect(ProbedockDemoRspec::OperationMul.new(left_operation: ProbedockDemoRspec::OperationMul.new(left: 2, right: 3), right: 2).calculate).not_to eq(12)
	end

	it 'should allow to process an multiplication with left operation and right operation', probedock: { tags: [ 'process', 'composed'] } do
		expect(ProbedockDemoRspec::OperationMul.new(
			left_operation: ProbedockDemoRspec::OperationMul.new(left: 2, right: 2),
			right_operation: ProbedockDemoRspec::OperationMul.new(left: 2, right: 1)
	 	).process).to eq(8)
	end

	it 'should not allow to get the correct result through calculate when left is operation and right is operation', probedock: { tags: [ 'calculate', 'composed' ] } do
		expect(ProbedockDemoRspec::OperationMul.new(
			left_operation: ProbedockDemoRspec::OperationMul.new(left: 2, right: 2),
			right_operation: ProbedockDemoRspec::OperationMul.new(left: 2, right: 1)
		).calculate).not_to eq(8)
	end
end
