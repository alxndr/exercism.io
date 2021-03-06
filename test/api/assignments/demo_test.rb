require './test/test_helper'
require './test/fixtures/fake_curricula'

require 'exercism/named'
require 'exercism/exercise'
require 'exercism/trail'
require 'exercism/curriculum'
require 'exercism/assignment'
require 'api/assignments/demo'

class APIAssignmentsDemoTest < MiniTest::Unit::TestCase

  def test_demo_assignments
    curriculum = Curriculum.new('./test/fixtures')
    curriculum.add FakePythonCurriculum.new
    curriculum.add FakeRubyCurriculum.new

    demo = API::Assignments::Demo.new(curriculum)
    expected = [
      ["python", "one"],
      ["ruby", "one"],
    ]
    assert_equal expected, demo.assignments.map {|a| [a.language, a.slug]}
  end
end

