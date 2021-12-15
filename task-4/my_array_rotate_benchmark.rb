require 'benchmark'
require_relative 'my_array_rotate'

Benchmark.bm do |x|
  puts 'my lab_rotate'
  x.report { (0..10_000).to_a.lab_rotate(100) }
  x.report { (0..10_000).to_a.lab_rotate(-100) }
  x.report { (0..10_000).to_a.lab_rotate }
  puts 'rotate'
  x.report { (0..10_000).to_a.rotate(100) }
  x.report { (0..10_000).to_a.rotate(-100) }
  x.report { (0..10_000).to_a.rotate }

  puts 'my lab_rotate!'
  x.report { (0..10_000).to_a.lab_rotate!(100) }
  x.report { (0..10_000).to_a.lab_rotate!(-100) }
  x.report { (0..10_000).to_a.lab_rotate! }
  puts 'rotate!'
  x.report { (0..10_000).to_a.rotate!(100) }
  x.report { (0..10_000).to_a.rotate!(-100) }
  x.report { (0..10_000).to_a.rotate! }

end