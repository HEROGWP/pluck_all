require 'test_helper'

class PluckArrayTest < Minitest::Test
  def setup
    
  end
  def test_pluck_one_column
    assert_equal(["John", "Pearl", "Kathenrie"], User.pluck_array(:name))
  end
  def test_pluck_multiple_columns
    assert_equal([
      ["John", "john@example.com"],
      ["Pearl", "pearl@example.com"],
      ["Kathenrie", "kathenrie@example.com"],
    ], User.pluck_array(:name, :email))
  end
  def test_alias
    assert_equal([
      ["Pearl", "Pearl's post1"],
      ["Pearl", "Pearl's post2"],
    ], User.joins(:posts).where(:name => 'Pearl').pluck_array(:'name AS user_name', :'title AS post_title'))
  end
end
