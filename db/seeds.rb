# Seed Courses
a = Course.create(name: 'CS61A')
b = Course.create(name: 'CS61B')
c = Course.create(name: 'CS61B')

[a, b, c].each do |course|
  # Seed Admin, TAs, and LAs
  Admin.create(first_name: 'big', last_name: 'boss', email: 'bigboss@test.com', password: 'password')
  (0..5).each do |i|
    ta = "TA#{i}"
    la = "LA#{i}"
    t = TeachingAssistant.create(first_name: ta, last_name: 'Smith', email: ta+'@test.com', password: 'password', course_id: course.id)
    l = LabAssistant.create(first_name: la, last_name: 'Doe', email: la+'@test.com', password: 'password', SID: 12345670 + i, course_id: course.id)
    l.teaching_assistant_id = t
    t.lab_assistants << l
  end
end

# Seed Lab Times
[a, b, c].each do |course|
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
  LabTime.all.to_a.each do |lt|
    lab_ids.append(lt.id)
  end
  LabAssistant.all.to_a.each do |l| 
    a = (1..7).to_a.shuffle 
    l.preferred_lab_times = (l.preferred_lab_times.dup << a.pop << a.pop << a.pop)
    l.save
  end
end


