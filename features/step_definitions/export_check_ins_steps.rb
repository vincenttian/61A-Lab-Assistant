Then /^I should download a file with the name "([^\"]*)" that has the extension "([^\"]*)"$/ do |filename, extension|
  header = page.response_headers['Content-Disposition']
  header.should match /^attachment/
  header.should match /filename="#{filename}.*\.#{extension}"$/
end