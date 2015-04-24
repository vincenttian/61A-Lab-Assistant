# Seed Courses
a = Course.create(name: 'CS61A')
b = Course.create(name: 'CS61B')
c = Course.create(name: 'CS61C')
courses = [a, b, c]

# Seed admin
Admin.create(first_name: 'big', last_name: 'boss', email: 'bigboss@test.com', password: 'password')

# Seed TAs, and LAs for all classes
course_map = {}
course_map[a] = 1
course_map[b] = 2 
course_map[c] = 3

courses.each do |course|
  (0..2).each do |i|
    ta = "#{course.name}_TA#{i}"
    la = "#{course.name}_LA#{i}"
    t = TeachingAssistant.create(first_name: ta, last_name: 'Smith', email: ta+'@test.com', password: 'password', course_id: course.id)
    l = LabAssistant.create(first_name: la, last_name: 'Doe', email: la+'@test.com', password: 'password', SID: 12345600 + i + course_map[course] * 10, course_id: course.id)
    l.teaching_assistant_id = t
    t.lab_assistants << l
  end
end

# Seed Lab Times for all classes
courses.each do |course|
  days_of_week = {
    "Monday" => Date.new(2000, 1, 3),
    "Tuesday" => Date.new(2000, 1, 4),
    "Wednesday" => Date.new(2000, 1, 5),
    "Thursday" => Date.new(2000, 1, 6),
    "Friday" => Date.new(2000, 1, 7),
    "Saturday" => Date.new(2000, 1, 1),
    "Sunday" => Date.new(2000, 1, 2)
  }
  times = [
    ["8:00:00", "9:00:00"],
    ["9:00:00", "10:00:00"],
    ["10:00:00", "11:00:00"],
    ["11:00:00", "12:00:00"],
    ["8:00:00", "9:00:00"],
    ["9:00:00", "10:00:00"],
    ["10:00:00", "11:00:00"]
  ]
  (0..6).each do |i|
    a = LabTime.create(open: Time.parse(times[i][0]), close: Time.parse(times[i][1]), day: days_of_week[days_of_week.keys[i]], course_id: course.id)
  end

  # seed lab time preferences of all lab assistants
  lab_ids = []
  LabTime.where(course_id: course.id).to_a.each do |lt|
    lab_ids.append(lt.id)
  end
  LabAssistant.where(course_id: course.id).to_a.each do |l| 
    a = lab_ids.shuffle 
    l.preferred_lab_times = (l.preferred_lab_times.dup << a.pop << a.pop << a.pop)
    l.save
  end
end


