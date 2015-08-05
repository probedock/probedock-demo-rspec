# encoding: UTF-8

module ProbedockDemoRspec
  class Calculator
    def add(left, right)
      left + right
    end

    def sub(left, right)
      left - right
    end

    def mul(left, right)
      left * right
    end

    def div(left, right)
      raise new ArgumentError('Right operand must be different from 0') if right == 0
      left / right
    end
  end
end
