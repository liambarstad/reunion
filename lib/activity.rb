class Activity
  attr_reader :name,
              :participants,
              :total_cost
  def initialize(name)
    @name = name
    @participants = {}
    @total_cost = 0
  end

  def add_participant(name, dollars)
    @participants.store(name, dollars)
    @total_cost += dollars
  end

  def split
    @total_cost / @participants.keys.length
  end

  def owed
    owed_results = {}
    @participants.keys.each do |name|
      owed = split - @participants[name]
      owed_results.store(name, owed)
    end
    owed_results
  end
end
