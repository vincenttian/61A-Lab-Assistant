Given /the following Teaching Assistant exists/ do |teaching_assistant_table|
  teaching_assistant_table.hashes.each do |teaching_assistant|
    t = TeachingAssistant.create(first_name: teaching_assistant['first_name'], last_name: teaching_assistant['last_name'], email: teaching_assistant['email'], password: teaching_assistant['password'], validated: teaching_assistant['validated'])
  end
end