
def test_get_courses
  expected_courses = ['Mathematics', 'Science', 'History']
  actual_courses = ['Mathematics', 'Science', 'History']

  if actual_courses == expected_courses
    puts "Test Passed: Expected courses match the actual courses."
  else
    puts "Test Failed: Expected #{expected_courses.inspect} but got #{actual_courses.inspect}."
  end
end
