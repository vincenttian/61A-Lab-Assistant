Given(/^I am assigned to lab time 1$/) do
  LabTime.first.lab_assistants << LabAssistant.first
end

Then(/^I should be assigned to a lab$/) do
  page.html.index("Matched Lab Times").should > 0
end

Given(/^I have signed in to lab$/) do
  c = CheckInForm.create(name: "Alice1", SID: 12345672, event: 'lab', course_id: 1)
end

Then(/^I should see my check in to lab$/) do
  page.html.index("lab on ").should > 0
end