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
    total
  end

  def breakout
    results = {}
    @activities.each do |activity|
      activity.owed.keys.each do |participant|
        if results.include?(participant)
          results[participant] += activity.owed[participant]
        else
          results.store(participant, activity.owed[participant])
        end
      end
    end
    results
  end

  def print_summary
    owed = breakout
    message = ""
    owed.keys.each do |participant|
      message += p "#{participant}: #{owed[participant]}\n"
    end
    message
  end
end
