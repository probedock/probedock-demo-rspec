require 'helper'

describe ProbedockDemoRspec::Calculator do
  before :each do
    @calculator = ProbedockDemoRspec::Calculator.new
  end

  it '1 + 3 should equals to 4' do
    expect(@calculator.add(1, 3)).to eq(4)
  end

  # it "should raise an error when created if the name option is missing" do
  #   expect{ Boxafe::Box.new box_options.merge(name: nil) }.to raise_error(Boxafe::Error, "The :name option is required")
  # end
end
