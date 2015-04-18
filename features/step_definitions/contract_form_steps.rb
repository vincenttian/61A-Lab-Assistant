Then(/^I should see a contract form confirmation$/) do
  page.html.index("submitted your contract as a Lab Assistant, you may now log in.").should > 0
end
