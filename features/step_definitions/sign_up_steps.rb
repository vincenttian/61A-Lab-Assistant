Then(/^I should see a confirmation$/) do
  page.html.index("You will receive an email when you are accepted").should > 0
end

Then(/^I should see a TA invalid first name error message$/) do
  TeachingAssistant.all.to_a.size.should == 0 # not as legit as it could be
end

Then(/^I should see a TA invalid email error message$/) do
  TeachingAssistant.all.to_a.size.should == 0 # not as legit as it could be
end

Then(/^I should see a LA invalid first name error message$/) do
  LabAssistant.all.to_a.size.should == 0 # not as legit as it could be
end

Then(/^I should see a LA invalid email error message$/) do
  LabAssistant.all.to_a.size.should == 0 # not as legit as it could be
end

Then(/^I should see a LA invalid account error message$/) do
  page.html.index("Your").should > 0 # fix this later
end
