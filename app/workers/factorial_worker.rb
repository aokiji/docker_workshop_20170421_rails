class FactorialWorker
  include Sidekiq::Worker

  def perform(of)
    n = of.to_i
    value = 1
    while n > 0
      value *= n
      n-= 1
    end

    Factorial.create!(of: of, is: value)
  end
end
