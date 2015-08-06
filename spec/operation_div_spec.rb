require 'helper'

describe ProbedockDemoRspec::OperationDiv, probedock: { contributors: 'laurent.prevost@probedock.io', tickets: 'feature-4', tags: 'div' } do
	it 'should allow the division of two integers through a call to calculate', probedock: { tags: 'calculate' } do
     expect(ProbedockDemoRspec::OperationDiv.new(left: 6, right: 2).calculate).to eq(3)
	end

	it 'should should allow to do the division of two integers', probedock: { tags: 'process' } do
		expect(ProbedockDemoRspec::OperationDiv.new(left: 6, right: 2).process).to eq(3)
	end

	it 'should allow process and calculate to give the same result for single division operation', probedock: { tags: [ 'process', 'calculate' ] } do
		expect(ProbedockDemoRspec::OperationDiv.new(left: 6, right: 2).process).to eq(ProbedockDemoRspec::OperationDiv.new(left: 6, right: 2).calculate)
	end

	it 'should not allow to divide by zero through calculate', probedock: { tags: ['calculate', 'error' ] } do
		expect{ ProbedockDemoRspec::OperationDiv.new(left: 2, right: 0).calculate }.to raise_error(ProbedockDemoRspec::OperationError)
	end

	it 'should not allow to divide by zero through process', probedock: { tags: ['process', 'error' ] } do
		expect{ ProbedockDemoRspec::OperationDiv.new(left: 2, right: 0).process }.to raise_error(ProbedockDemoRspec::OperationError)
	end

	it 'should allow to process an division with left integer and right operation', probedock: { tags: [ 'process', 'composed'] } do
		expect(ProbedockDemoRspec::OperationDiv.new(left: 10, right_operation: ProbedockDemoRspec::OperationDiv.new(left: 2, right: 1)).process).to eq(5)
	end

	it 'should not allow to get the correct result through calculate when left is integer and right is operation', probedock: { tags: [ 'calculate', 'composed', 'error' ] } do
		expect{ ProbedockDemoRspec::OperationDiv.new(left: 10, right_operation: ProbedockDemoRspec::OperationDiv.new(left: 2, right: 1)).calculate }.to raise_error(ProbedockDemoRspec::OperationError)
	end

	it 'should not allow to get the correct result through calculate when left is integer and right is operation where the result is zero', probedock: { tags: [ 'process', 'composed', 'error' ] } do
		expect{ ProbedockDemoRspec::OperationDiv.new(left: 10, right_operation: ProbedockDemoRspec::OperationSub.new(left: 10, right: 10)).process }.to raise_error(ProbedockDemoRspec::OperationError)
	end

	it 'should allow to process an division with left operation and right integer', probedock: { tags: [ 'process', 'composed'] } do
		expect(ProbedockDemoRspec::OperationDiv.new(left_operation: ProbedockDemoRspec::OperationDiv.new(left: 20, right: 2), right: 2).process).to eq(5)
	end

	it 'should not allow to get the correct result through calculate when left is operation and right is integer', probedock: { tags: [ 'calculate', 'composed' ] } do
		expect(ProbedockDemoRspec::OperationDiv.new(left_operation: ProbedockDemoRspec::OperationDiv.new(left: 20, right: 2), right: 2).calculate).not_to eq(2)
	end

	it 'should not allow to get the correct result through calculate when left is operation and right integer value is zero', probedock: { tags: [ 'calculate', 'composed', 'error' ] } do
		expect{ProbedockDemoRspec::OperationDiv.new(left_operation: ProbedockDemoRspec::OperationSub.new(left: 10, right: 10), right: 0).calculate}.to raise_error(ProbedockDemoRspec::OperationError)
	end

	it 'should allow to process an division with left operation and right operation', probedock: { tags: [ 'process', 'composed'] } do
		expect(ProbedockDemoRspec::OperationDiv.new(
			left_operation: ProbedockDemoRspec::OperationDiv.new(left: 10, right: 2),
			right_operation: ProbedockDemoRspec::OperationDiv.new(left: 5, right: 1)
	 	).process).to eq(1)
	end

	it 'should not allow to get the correct result through calculate when left is operation and right is operation', probedock: { tags: [ 'calculate', 'composed', 'error' ] } do
		expect{ProbedockDemoRspec::OperationDiv.new(
			left_operation: ProbedockDemoRspec::OperationDiv.new(left: 10, right: 2),
			right_operation: ProbedockDemoRspec::OperationDiv.new(left: 5, right: 1)
		).calculate}.to raise_error(ProbedockDemoRspec::OperationError)
	end

	it 'should not allow to get the correct result through process when left is operation and right is operation where the result is zero', probedock: { tags: [ 'process', 'composed', 'error' ] } do
		expect{ProbedockDemoRspec::OperationDiv.new(
			left_operation: ProbedockDemoRspec::OperationDiv.new(left: 10, right: 2),
			right_operation: ProbedockDemoRspec::OperationSub.new(left: 5, right: 5)
		).process}.to raise_error(ProbedockDemoRspec::OperationError)
	end
end
