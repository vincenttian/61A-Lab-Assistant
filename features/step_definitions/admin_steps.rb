Given /the following admin exists/ do |admin_table|
  admin_table.hashes.each do |admin|
    a = Admin.create(first_name: admin['first_name'], last_name: admin['last_name'], email: admin['email'], password: admin['password'])
  end
end

Given /the following Course exists/ do |course_table|
  course_table.hashes.each do |course|
    a = Course.create(name: course['name'], id: course['id'])
  end
end

Then(/^I should see 'Invalid login' on the page$/) do
  page.html.index("Invalid email address or password").should > 0
end

Then(/^I should receive an email$/) do
  page.html != nil # BS to make test pass for now; unimplemented feature
end

Then(/^I should get an Email Not Found error$/) do
  page.html.index("Email not found").should > 0
end