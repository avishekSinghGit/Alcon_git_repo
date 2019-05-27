
#step definition to verify the content in a web page that specified in an feature step
Then(/^I should see content "([^"]*)"$/) do |content|
  sleep 5
  if page.has_content? content
    puts "#{content} content is present"
  else
    fail(ArgumentError.new(content + 'content is not present'))
  end
end

Then(/^I should see "([^"]*)" field with read and write permission$/) do |value|
  if page.has_field?(value)
    puts "#{value} field is visible with editable permission"
  elsif page.has_content?(value)
    writeFailure "#{value} field is visible with readable permission"
  else
    writeFailure "#{value} field is not visible"
  end
end

Then(/^I should see "([^"]*)" field with read only permission$/) do |value|
  if page.has_content?(value)
    puts "#{value} field is visible with readable permission"
  else
    writeFailure "#{value} field is not visible"
  end
end

#step definition to click on bottom row button
When(/^I click on "([^"]*)" button from bottom row$/) do |val|
  within(:id,'bottomButtonRow') do
    if find(:button, val).visible?
      click_on val
    end
  end
end

#step definition to verify the link in a web page that specified in an feature step
Then(/^I should see "([^"]*)" link$/) do |link|
  if page.find_link(link).visible?
    puts "#{link} link is visible"
  else
    fail(ArgumentError.new(link + ' link is not visible'))
  end
end

#step definition to click the particular link in a web page that specified in an feature step
When(/^I follow "([^"]*)" link$/) do |link|
  find_link(link).visible?
  click_link(link)
end

#step definition to wait for time we mention in a method
When(/^I wait for (\d+) seconds$/) do |seconds|
  sleep(seconds.to_i)
end

#step definition to click on button under top button row
When(/^I click on "([^"]*)" button on top button row$/) do |button_name|
  sleep 5
  within all('.pbButton')[0] do
    click_on button_name
  end
end

#step definition to select a value from drop down
When(/^I select "([^"]*)" from "([^"]*)"$/) do |value, locator|
  sleep 10
  if page.has_select? locator
    select(value, :from => locator)
  else
    fail(ArgumentError.new(value + ' is not editable for current user '))
  end
end

#Step to verify the drop down options appearing against requirement
Then(/^I should see "([^"]*)" field picklist options$/) do |select_field|
  begin
    sleep 5
    arg=getGeneralDetails1 "CommonData"
    resultArray=[]
    actualArrayOption=[]
    expectedArrayOption=[]

    if page.has_select?(select_field)
      actualArrayOption=find_field(select_field).all('option').collect(&:text)
    elsif page.has_xpath?('//td[text()="'"#{select_field}"'"]')
      writeFailure "The dropdown - #{select_field} - is appearing with - R Permission -"
    elsif page.has_xpath?('//*[text()="'"#{select_field}"'"]')==false
      writeFailure "The dropdown - #{select_field} - is not present over the page"
      next
    end
    expectedArrayOption=arg[select_field]
    resultArray=expectedArrayOption.sort-actualArrayOption.sort
    if resultArray.count==0
      puts "The expected options for the field - #{select_field} - is present"
    else
      writeFailure "The following options from - #{select_field} -  dropdown is missing"
      writeFailure resultArray
    end
    resultArray=actualArrayOption.sort-expectedArrayOption.sort
    if resultArray.count!=0
      writeFailure "The following extra options are appearing in  - #{select_field} -  dropdown"
      writeFailure resultArray
    end
    sleep 5
  rescue Exception => ex
		writeFailure "Error while verifying - #{select_field} - picklist option"
		writeFailure ex.message
  end
end


#Step to click on new button
When(/^I follow on "([^"]*)" button$/) do |button_name|
  if find_button(button_name).visible?
    click_on button_name
  else
    fail(ArgumentError.new(+button_name+ ' button is not visible'))
  end
  sleep 5
end


#step definition to click on edit,save,cancel Button in the opened Quotes page
When(/^I click on "([^"]*)" button from top row$/) do |val|
  sleep 2
  within(:id,'topButtonRow') do
    if find(:button, val).visible?
      click_on val
    end
  end
  sleep 2
  if page.has_content?("Error: Invalid Data. ")
    fail(ArgumentError.new('Not'+val+ 'd successfully due to Invalid Data. '))
  else
    puts val + "d successfully"
  end
  sleep 2
end

#step definition to click on go button
When(/^I follow go button$/) do
  within('.bFilterView') do
    click_on("Go!", match: :first)
    sleep 5
  end
end

#step definition to verify the field is visible or not
Then(/^I should see "([^"]*)" field is visible$/) do |label_name|
  if find_field(label_name).visible?
    puts label_name + " field is present"
  else
    fail(ArgumentError.new(label_name + 'field is not present'))
  end
end

#Step definition to verify the field is select type
Then(/^I verify "([^"]*)" field is of type select$/) do |select_type|
  if page.has_select?(select_type)
    puts "The #{select_type} is of type select"
  else
    fail(ArgumentError.new('The' + select_type + 'is not of type select'))
  end
end

#Step definition to enter date in date field
And(/^I entered todays date in "([^"]*)" field$/) do |field_name|
  currentTime=Time.now.strftime("%m/%d/%Y")
  page.find_field(field_name).set(currentTime)
end

#step definition to navigate to particular tab
When(/^I navigate to "([^"]*)" tab$/) do |tab|
  sleep 5
  click_link(tab)
end

#step definition to verify button under top row
Then(/^I should see "([^"]*)" button in top row$/) do |button_value|
  within(:id,'topButtonRow') do
    if find_button(button_value).visible?
      puts button_value + "button is visible"
    else
      fail(ArgumentError.new(button_value + 'button is not visible'))
    end
  end
end

When(/^I click on "([^"]*)" tab$/) do |tab|
  click_on(tab)
end

#Added on 23-march-2017 - Avishek Kumar Singh
#click on tab
When(/^I navigate to "([^"]*)" tab in the application$/) do |tab|
  sleep 5
  if page.has_xpath?('//li/a[text()="'"#{tab}"'"]')
    find(:xpath, '//li/a[text()="'"#{tab}"'"]').click
    puts "The #{tab} tab has been clicked"
  elsif page.has_xpath?('//img[@title="All Tabs"]')
    find(:xpath, '//img[@title="All Tabs"]').click
    sleep 3
    find(:xpath, '//a[text()="'"#{tab}"'"]').click
    puts "The #{tab} tab has been clicked"
  else
    writeFailure "Fail to find tab - #{tab} -"
    #fail(ArgumentError.new('Fail to find tab - '+ tab))
  end
end

# click a link present under App Setup
Then(/^I clicked the link "([^"]*)"$/) do |currency_Code|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//a[text()="'"#{currency_Code}"'"]')
    find(:xpath, '//a[text()="'"#{currency_Code}"'"]').click
    puts "The link #{currency_Code} has been clicked"
    sleep 5
  else
    writeFailure "FAIL to click the link #{currency_Code}"
    #fail(ArgumentError.new('Fail'))
  end
  Capybara.default_wait_time =30
end

# Verify if the checkbox is checked
Then(/^I should see rule "([^"]*)" is "([^"]*)" to "([^"]*)"$/) do |field1_text, symbol, field2_text|
  sleep 5
  Capybara.default_wait_time =1
  #if page.has_xpath?('//option[@selected="selected"  and text()="'"#{field1_text}"'"]/ancestor::tr[1]//span[text()="'"#{symbol}"'"]/ancestor::tr[1]//span[text()="'"#{field2_text}"'"]')
  if page.has_xpath?('//option[@selected="selected"  and text()="'"#{field1_text}"'"]/ancestor::tr[1]//span[text()="'"#{field2_text}"'"]')
    if page.has_xpath?('//option[@selected="selected"  and text()="'"#{field1_text}"'"]/ancestor::tr[1]//*[contains(text(),"=")]')
      puts "The - #{field1_text} - is - #{symbol} - to - #{field2_text}"
    end
  else
    writeFailure "FAIL - The - #{field1_text} - is - #{symbol} - to - #{field2_text}  -- is not present over the page"
  end
  Capybara.default_wait_time =30
end

# Clicking Save button
Then(/^I click Save button from top button row$/) do
  sleep 5
  Capybara.default_wait_time =1
  if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Save"]')
    find(:xpath, '//td[@id="topButtonRow"]/input[@title="Save"]').click
    puts "The Save button has been clicked"
    sleep 7
  end
  Capybara.default_wait_time =30
end

# Verify if the account record saves successfully
Then(/^The "([^"]*)" record should save seccessfully$/) do |record_type|
  sleep 5
  Capybara.default_wait_time =1
  if page.has_content?("Error: Invalid Data.") or page.has_content?("Error:")
    writeFailure "-- #{record_type} record -- NOT saved successfully due to Invalid Data. "
  else
    puts "-- #{record_type} record -- created successfully"
  end
  Capybara.default_wait_time =30
end

# Verify if the field is appearing with RW permission
Then(/^I should see the field "([^"]*)" with RW permission except salesops$/) do |field_name|
  #step 'I click Edit button from top button row'
  sleep 5
  Capybara.default_wait_time =1
  if (ENV['UserRole'] == "SalesOperationSit")
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::*[1]/following-sibling::td[1][not(*)]')
      puts "The field - #{field_name} - is present with - R Only - Permission"
    elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::*[1]/following-sibling::td[1]//*')
      writeFailure "The field - #{field_name} - is present with - RW - Permission"
    end
  else
    if page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::*[1]/following-sibling::td[1]//*')
      puts "The field - #{field_name} - is present with - RW - Permission"
    elsif page.has_xpath?('//label[text()="'"#{field_name}"'"]/ancestor::*[1]/following-sibling::td[1][not(*)]')
      writeFailure "The field - #{field_name} - is present with - R Only - Permission"
    else
      writeFailure "The field is not present over the page"
    end
  end
  #step 'I click Save button from top button row'
  Capybara.default_wait_time =30
end

# Clicking edit button
Then(/^I click Edit button from top button row$/) do
  sleep 5
  Capybara.default_wait_time =1
  #step 'I click Save button from top button row'
  if page.has_xpath?('//td[@id="topButtonRow"]/input[@title="Edit"]')
    find(:xpath, '//td[@id="topButtonRow"]/input[@title="Edit"]').click
    puts "The Edit button has been clicked"
    sleep 7
  end
  Capybara.default_wait_time =30
end