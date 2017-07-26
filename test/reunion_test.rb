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
end
