require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_has_a_name
    activity = Activity.new("Brunch")

    assert_equal "Brunch", activity.name
  end

  def test_it_initializes_empty_hash
    activity = Activity.new("Brunch")

    assert_instance_of Hash, activity.participants
    assert activity.participants.empty?
  end

  def test_add_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)

    assert_equal 1, activity.participants.keys.count
    assert_equal 1, activity.participants.values.count
  end

  def test_total_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)

    assert_equal 20, activity.total_cost
  end

  def test_total_cost_multiple
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)
    activity.add_participant("Joe", 40)

    assert_equal 60, activity.total_cost
  end

  def test_split
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)
    activity.add_participant("Joe", 40)

    assert_equal 30, activity.split
  end

  def test_owed
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)
    activity.add_participant("Joe", 40)

    owed_jim = activity.owed["Jim"]
    owed_joe = activity.owed["Joe"]

    assert_equal 10, owed_jim
    assert_equal -10, owed_joe
  end
end
