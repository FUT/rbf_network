class RBFCell
  SKO = 10

  attr_reader :last_output
  attr_accessor :delta, :weights

  def initialize(means)
    @weights = means
  end

  def fire(input)
    @last_output = activation_function(input)
  end

  def update_weight(inputs, training_rate)
  end

  def inspect
    @weights
  end

  private

  def activation_function(input)
    sum = 0
    input.each_with_index do |n, index|
#      puts "index:#{index} weight: #{@weights[index]} input: #{n} input_size: #{input.size}"
      sum +=  (n - @weights[index]) ** 2
    end
    # sum += @weights.last * -1 #bias node
    gauss_function(sum)
  end

  def gauss_function(x)
    Math.exp(-x / SKO)
  end
end
