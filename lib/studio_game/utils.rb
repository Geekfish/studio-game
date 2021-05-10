# frozen_string_literal: true

module StudioGame
  # Not currently used, just experimenting...
  def yield_block_or_function(proc_or_lambda = nil, &block)
    proc_or_lambda = block || proc_or_lambda
    proc_or_lambda.call
  end

  def play_with_blocks
    yield_block_or_function { puts 'block' }

    my_lambda = -> { puts 'lambda' }
    yield_block_or_function(my_lambda)

    my_proc = proc { puts 'proc' }
    yield_block_or_function(my_proc)
  end
end
