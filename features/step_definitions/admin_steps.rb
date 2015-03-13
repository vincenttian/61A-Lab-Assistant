Given /the following admin exists/ do |admin_table|
  admin_table.hashes.each do |admin|
    a = Admin.create(first_name: admin['first_name'], last_name: admin['last_name'], email: admin['email'], password: admin['password'])
  end
end


Then(/^I should see 'Invalid login' on the page$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should receive an email$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should not receive an email$/) do
  pending # express the regexp above with the code you wish you had
end