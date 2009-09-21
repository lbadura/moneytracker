require 'factory_girl'

Factory.define :operation do |ao|
  ao.amount rand(100.0)
  ao.title { %w[food drinks holidays books music phone][rand(6)] }
  ao.datetime { DateTime.now() }
end
