Given /the following lab times exists/ do |la_table|
  days_of_week = {
    "Monday" => Date.new(2000, 1, 3),
    "Tuesday" => Date.new(2000, 1, 4),
    "Wednesday" => Date.new(2000, 1, 5),
    "Thursday" => Date.new(2000, 1, 6),
    "Friday" => Date.new(2000, 1, 7),
    "Saturday" => Date.new(2000, 1, 1),
    "Sunday" => Date.new(2000, 1, 2)
  }
  la_table.hashes.each do |la|
    a = LabTime.create(open: Time.parse(la['open']), close: Time.parse(la['close']), day: days_of_week[la['day']], id: la_table['id'])
  end
end

Given /I check all lab time checkboxes/ do
  all('input').select.first.set(true)
end

Then /^I should see all checkboxes as checked$/ do
  all('input').select.first.class.name.should == "Capybara::Node::Element"
end