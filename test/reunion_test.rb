require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def test_it_has_name
    reunion = Reunion.new("Denver")

    assert_equal "Denver", reunion.name
  end

  def test_it_initializes_empty_array
    reunion = Reunion.new("Denver")

    assert_instance_of Array, reunion.activities
    assert reunion.activities.empty?
  end

  def test_add_activity
    reunion = Reunion.new("Denver")
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)
    activity.add_participant("Joe", 40)
    reunion.add_activity(activity)

    assert_instance_of Activity, reunion.activities[0]
    assert_equal 1, reunion.activities.length
  end

  def test_total_cost
    reunion = Reunion.new("Denver")
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)
    activity.add_participant("Joe", 40)
    reunion.add_activity(activity)

    assert_equal 60, reunion.total_cost
  end

  def test_total_cost_multiple
    reunion = Reunion.new("Denver")
    activity1 = Activity.new("Brunch")
    activity1.add_participant("Jim", 20)
    activity1.add_participant("Joe", 40)
    reunion.add_activity(activity1)
    activity2 = Activity.new("Cards")
    activity2.add_participant("Sally", 60)
    activity2.add_participant("Jim", 10)
    reunion.add_activity(activity2)

    assert_equal 130, reunion.total_cost
  end

  def test_breakout
    reunion = Reunion.new("Denver")
    activity1 = Activity.new("Brunch")
    activity1.add_participant("Jim", 20)
    activity1.add_participant("Joe", 40)
    reunion.add_activity(activity1)
    activity2 = Activity.new("Cards")
    activity2.add_participant("Sally", 60)
    activity2.add_participant("Jim", 10)
    reunion.add_activity(activity2)

    people = reunion.breakout.keys.length

    assert_equal 3, people
    assert_equal 35, reunion.breakout["Jim"]
    assert_equal -10, reunion.breakout["Joe"]
    assert_equal -25, reunion.breakout["Sally"]
  end

  def test_print_summary
    reunion = Reunion.new("Denver")
    activity1 = Activity.new("Brunch")
    activity1.add_participant("Jim", 20)
    activity1.add_participant("Joe", 40)
    reunion.add_activity(activity1)
    activity2 = Activity.new("Cards")
    activity2.add_participant("Sally", 60)
    activity2.add_participant("Jim", 10)
    reunion.add_activity(activity2)

    message = reunion.print_summary

    assert_equal "Jim: 35\nJoe: -10\nSally: -25\n", message
  end
end
