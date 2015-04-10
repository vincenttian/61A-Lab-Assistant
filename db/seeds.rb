# Teaching assistant for boss
Admin.create(first_name: 'big', last_name: 'boss', email: 'bigboss@test.com', password: 'password')
(0..5).each do |i|
  ta = "TA#{i}"
  la = "LA#{i}"
  t = TeachingAssistant.create(first_name: ta, last_name: 'Smith', email: ta+'@test.com', password: 'password')
  l = LabAssistant.create(first_name: la, last_name: 'Doe', email: la+'@test.com')
  l.teaching_assistant_id = t
  t.lab_assistants << l
end