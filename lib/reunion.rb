require './lib/activity'

class Reunion
  attr_reader :name,
              :activities
  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    total = 0
    @activities.each do |activity|
      total += activity.total_cost
    end
  end

  def breakout
    results = {}
    @activities.each do |activity|
      activity.owed.keys.each do |participant|
        if results.include?(participant)
          results[participant] += activity.participants[participant]
        else
          results.store(participant, activity.participants[participant])
        end
      end
    end
    results
  end

  def print_summary
    owed = breakout
    owed.keys.each do |participant|
      puts "#{participant}: #{owed[participant]}"
    end
  end
end
