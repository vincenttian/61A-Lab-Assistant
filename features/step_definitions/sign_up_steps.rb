Then(/^I should see a confirmation$/) do
  page.html.index("You will receive an email when you are accepted as a Teaching Assistant").should > 0
end

Then(/^I should see a invalid first name error message$/) do
  TeachingAssistant.all.to_a.size.should == 0 # not as legit as it could be
end

Then(/^I should see a invalid email error message$/) do
  TeachingAssistant.all.to_a.size.should == 0 # not as legit as it could be
end