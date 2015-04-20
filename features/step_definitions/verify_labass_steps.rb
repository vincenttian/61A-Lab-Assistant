Given /the following Lab Assistant exists/ do |la_table|
  la_table.hashes.each do |la|
    a = LabAssistant.create(first_name: la['first_name'], last_name: la['last_name'], email: la['email'], password: la['password'], validated: la['validated'])
  end
end

Given /I check Alices checkbox/ do
  all('input').select.first.set(true)
end

Given /I should see a confirmation containing/ do 
  page.html.index("Valid").should > 0
end

Given(/^I debug$/) do
  puts page.html
end