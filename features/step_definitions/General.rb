Given(/^I click on username in the top right corner then select setup$/) do
  sleep 4
  page.find(:id, "userNavLabel").click
  sleep 10
  within all('.mbrMenuItems')[0] do
    click_on 'Setup'
    sleep 2
  end
end

#When(/^I expand company profile from administration setup$/) do
#  sleep 4
#  click_on 'Company Profile'
#  sleep 4
#  click_on 'Business Hours'
#end

When(/^I click "([^"]*)" link$/) do |arg1|
  sleep 3
  click_on arg1
  sleep 2
end

When(/^I expand "([^"]*)" from administration setup$/) do |arg1|
  sleep 3
  click_on arg1
  sleep 2
end

When(/^I expand "([^"]*)" from app setup$/) do |arg1|
  sleep 3
  click_on arg1
  sleep 2
end

Given(/^I expand "([^"]*)" link under customize$/) do |arg1|
  sleep 4
  within all('.parent')[7] do
    sleep 4
#    puts "found link"
    find_link(arg1, :match => :prefer_exact).click
    puts "cliked on #{arg1}"
  end
end

When(/^I click on "([^"]*)" link$/) do |arg1|
  sleep 4
  within('.pbBody') do
    if find_link(arg1, :match => :prefer_exact).visible?
      find_link(arg1, :match => :prefer_exact).click
      #find( 'a', text: 'Berlin', exact: true )
    else
      writeFailure "#{arg1} link is not visible"
    end
  end
end

When(/^I check that currency shows USD and CAD$/) do
  within all('.pbBody')[0] do
    table = all("tbody")[0]
    sleep 2
		currency_code_1 = table.all('tr')[1].all('th')[0].text.to_s
#    puts currency_code_1
    if currency_code_1 == "CAD"
      puts "CAD is visible under Active Currencies"
    else
      writeFailure "CAD is not visible under Active Currencies"
    end
    currency_code_2 = table.all('tr')[2].all('th')[0].text.to_s
#    puts currency_code_2
    if currency_code_2 == "USD"
      puts "USD is visible under Active Currencies"
    else
      writeFailure "USD is not visible under Active Currencies"
    end
  end
end

 Then (/^I check the available currency code$/) do
 within all('.pbBody')[0] do
    table = all("tbody")[0]
    sleep 2
		currency_code_1 = table.all('tr')[1].all('th')[0].text.to_s
    if currency_code_1 == "CAD"
      puts "CAD is visible under Active Currencies"
    else
      writeFailure "CAD is not visible under Active Currencies"
    end
    currency_code_2 = table.all('tr')[2].all('th')[0].text.to_s
    if currency_code_2 == "EUR"
      puts "EUR is visible under Active Currencies"
    else
      writeFailure "EUR is not visible under Active Currencies"
    end
    currency_code_3 = table.all('tr')[3].all('th')[0].text.to_s
    if currency_code_3 == "GBP"
      puts "GBP is visible under Active Currencies"
    else
      writeFailure "GBP is not visible under Active Currencies"
    end
        currency_code_4 = table.all('tr')[4].all('th')[0].text.to_s
    if currency_code_4 == "UAH"
      puts "UAH is visible under Active Currencies"
    else
      writeFailure "UAH is not visible under Active Currencies"
    end
    currency_code_4 = table.all('tr')[5].all('th')[0].text.to_s
    if currency_code_4 == "USD"
      puts "USD is visible under Active Currencies"
    else
      writeFailure "USD is not visible under Active Currencies"
    end
  end
end

When(/^I verify nala time zone and Business Hours$/) do
  expected_time_zone = "(GMT-05:00) Central Daylight Time (America/Chicago)".to_s
  within('.pbSubsection') do
    table = all("tbody")[0]
    sleep 2
		actual_time_zone = table.all('tr')[0].all('td')[3].text.to_s
    puts "Expectes Time Zone: #{expected_time_zone}"
    puts "Actual Time Zone: #{actual_time_zone}"
    if expected_time_zone == actual_time_zone
      puts "Expectes Time Zone value and Actual Time Zone value are equal"
      puts "Time Zone is verified"
    else
      writeFailure "Expectes Time Zone value and Actual Time Zone value are not equal"
    end

    expected_sunday_value = "No Hours"
    actual_sunday_value = table.all('tr')[1].all('td')[1].all('tr')[0].all('td')[1].text
    puts "Expected sunday value: #{expected_sunday_value}"
    puts "Actual sunday value: #{actual_sunday_value}"
    if expected_sunday_value == actual_sunday_value
      puts "Expectes Business Hours for Sunday and Actual Business Hours for Sunday are equal"
      puts "Business Hours for Sunday is verified"
    else
      writeFailure "Expectes Business Hours for Sunday and Actual Business Hours for Sunday are not equal"
    end

    expected_monday_value = "8:00 AM to 12:00 AM".to_s
    actual_monday_value_1 = table.all('tr')[1].all('td')[1].all('tr')[1].all('td')[1].text.to_s
    actual_monday_value_2 = table.all('tr')[1].all('td')[1].all('tr')[1].all('td')[2].text.to_s
    actual_monday_value_3 = table.all('tr')[1].all('td')[1].all('tr')[1].all('td')[3].text.to_s
#    puts actual_monday_value_1
#    puts actual_monday_value_2
#    puts actual_monday_value_3
    actual_monday_value = actual_monday_value_1 + " " + actual_monday_value_2+ " " + actual_monday_value_3
    actual_monday_value = actual_monday_value.to_s
    puts "Expected monday value: #{expected_monday_value}"
    puts "Actual monday value: #{actual_monday_value}"
    if expected_monday_value == actual_monday_value
      puts "Expectes Business Hours for Monday and Actual Business Hours for Monday are equal"
      puts "Business Hours for Monday is verified"
    else
      writeFailure "Expectes Business Hours for Monday and Actual Business Hours for Monday are not equal"
    end

    expected_tuesday_value = "24 Hours"
    actual_tuesday_value = table.all('tr')[1].all('td')[1].all('tr')[2].all('td')[1].text.to_s
    puts "Expected tuesday value: #{expected_tuesday_value}"
    puts "Actual tuesday value: #{actual_tuesday_value}"
    if expected_tuesday_value == actual_tuesday_value
      puts "Expectes Business Hours for Tuesday and Actual Business Hours for Tuesday are equal"
      puts "Business Hours for Tuesday is verified"
    else
      writeFailure "Expectes Business Hours for Tuesday and Actual Business Hours for Tuesday are not equal"
    end

    expected_wednesday_value = "24 Hours"
    actual_wednesday_value = table.all('tr')[1].all('td')[1].all('tr')[3].all('td')[1].text.to_s
    puts "Expected Wednesday value: #{expected_wednesday_value}"
    puts "Actual Wednesday value: #{actual_wednesday_value}"
    if expected_wednesday_value == actual_wednesday_value
      puts "Expectes Business Hours for Wednesday and Actual Business Hours for Wednesday are equal"
      puts "Business Hours for Wednesday is verified"
    else
      writeFailure "Expectes Business Hours for Wednesday and Actual Business Hours for Wednesday are not equal"
    end

    expected_thursday_value = "24 Hours"
    actual_thursday_value = table.all('tr')[1].all('td')[1].all('tr')[4].all('td')[1].text.to_s
    puts "Expected Thursday value: #{expected_thursday_value}"
    puts "Actual Thursday value: #{actual_thursday_value}"
    if expected_thursday_value == actual_thursday_value
      puts "Expectes Business Hours for Thursday and Actual Business Hours for Thursday are equal"
      puts "Business Hours for Thursday is verified"
    else
      writeFailure "Expectes Business Hours for Thursday and Actual Business Hours for Thursday are not equal"
    end

    expected_friday_value = "12:00 AM to 5:00 PM".to_s
    actual_friday_value_1 = table.all('tr')[1].all('td')[1].all('tr')[5].all('td')[1].text.to_s
    actual_friday_value_2 = table.all('tr')[1].all('td')[1].all('tr')[5].all('td')[2].text.to_s
    actual_friday_value_3 = table.all('tr')[1].all('td')[1].all('tr')[5].all('td')[3].text.to_s
#    puts actual_friday_value_1
#    puts actual_friday_value_2
#    puts actual_friday_value_3
    actual_friday_value = actual_friday_value_1 + " " + actual_friday_value_2+ " " + actual_friday_value_3
    actual_friday_value = actual_friday_value.to_s
    puts "Expected monday value: #{expected_friday_value}"
    puts "Actual monday value: #{actual_friday_value}"
    if expected_friday_value == actual_friday_value
      puts "Expectes Business Hours for Friday and Actual Business Hours for Friday are equal"
      puts "Business Hours for Friday is verified"
    else
      writeFailure "Expectes Business Hours for Friday and Actual Business Hours for Friday are not equal"
    end

    expected_saturday_value = "No Hours"
    actual_saturday_value = table.all('tr')[1].all('td')[1].all('tr')[6].all('td')[1].text
    puts "Expected saturday value: #{expected_saturday_value}"
    puts "Actual saturday value: #{actual_saturday_value}"
    if expected_saturday_value == actual_saturday_value
      puts "Expectes Business Hours for Saturday and Actual Business Hours for Saturday are equal"
      puts "Business Hours for Saturday is verified"
    else
      writeFailure "Expectes Business Hours for Saturday and Actual Business Hours for Saturday are not equal"
    end
  end
end

Then(/^I should verify users$/) do
  begin
    sleep 10
    temp=""
    arg=getGeneralDetails1 'Users'
    excelsheet= WIN32OLE.new('excel.application')
    wrkbook= excelsheet.Workbooks.Open(arg["File_Path"])
    wrksheet= wrkbook.Worksheets(arg["Sheetname"])
    wrksheet.Select

    i=arg["Start_Row"]
    puts "----------------------------------------------------------------------------------------"
    #puts wrksheet.UsedRange.Rows.Count
    Capybara.default_max_wait_time =1
    for counter in i..wrksheet.UsedRange.Rows.Count

      lastName=arg["LastName"]+i.to_s
      lastName=wrksheet.Range(lastName).Value
      if lastName.nil?
        writeFailure "LastName -- is not found under cell --- #{arg["LastName"]+i.to_s}"
      else
        lastName=lastName.strip
      end

      firstName=arg["FirstName"]+i.to_s
      firstName=wrksheet.Range(firstName).Value
      if firstName.nil?
        writeFailure "FirstName -- is not found under cell --- #{arg["FirstName"]+i.to_s}"
      else
        firstName=firstName.strip
      end

      userName=arg["UserName"]+i.to_s
      userName=wrksheet.Range(userName).Value
      if userName.nil?
        writeFailure "FirstName -- is not found under cell --- #{arg["UserName"]+i.to_s}"
      else
        userName=userName.strip
      end

      profile=arg["Profile"]+i.to_s
      profile=wrksheet.Range(profile).Value
      if profile.nil?
        writeFailure "Profile -- is not found under cell --- #{arg["Profile"]+i.to_s}"
      else
        profile=profile.strip
      end
      username1=lastName+", "+firstName
      name_filter=lastName.to_s.chars.first


      if page.has_xpath?('//span[text()="'"#{name_filter}"'" and (@class="listItemSelected" or @class="listItemPad")]')
        find(:xpath, '(//span[text()="'"#{name_filter}"'" and (@class="listItemSelected" or @class="listItemPad")])[1]').click
      end

      #    if userStatus=="Active"
      # if page.has_xpath?('//a[text()="'"#{username1}"'"]/ancestor::tr[1]//td[3]/a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]//td[5]/a[text()="'"#{persona}"'"]/ancestor::tr[1]//td[6]/img[@title="Checked"]')
      if page.has_xpath?('//a[text()="'"#{username1}"'"]/ancestor::tr[1]//td[3]/a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]//td[7]/a[text()="'"#{profile}"'"]')
        puts "The user name #{userName} is present with last name as -#{lastName}- first name as - #{firstName} -  with profile -- #{profile} is present"
      else
        if page.has_xpath?('//a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]')
          if page.has_xpath?('//a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]//th[1]/a[contains(text(),"'"#{firstName}"'")]')
            puts "The first name is present as -#{firstName}"
            puts "The User name is present as -- #{userName} -- "
          else
            writeFailure "The first name is not present as -#{firstName} - for user -#{userName}"
          end
          if page.has_xpath?('//a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]//th[1]/a[contains(text(),"'"#{lastName}"'")]')
            puts "The last name is present as -#{lastName}"
          else
            writeFailure "The last name is not present as -#{lastName} - for user -#{userName}"
          end
          if page.has_xpath?('//a[contains(text(),"'"#{userName}"'")]/ancestor::tr[1]//td[7]/a[text()="'"#{profile}"'"]')
            puts "The user profile is present as -#{profile}"
          else
            writeFailure "The profile is not present as  - #{profile}"
          end
        else
          writeFailure "The user name - #{userName}- is not found"
        end
      end
      puts "----------------------------------------------------------------------------------------"

      i=i+1
    end
    excelsheet.Quit();
    Capybara.default_max_wait_time =30
  end
end


# Added on 23-03-2017
When(/^I click "([^"]*)" in setup$/) do |link_name|
  if page.has_xpath?('//div/a[text()="'"#{link_name}"'"]')
    find(:xpath, '//div/a[text()="'"#{link_name}"'"]').click
    puts"The link - #{link_name} - has been clicked"
  else
    writeFailure 'FAIL to click the link - #{link_name}'
  end
end

# click a link present under App Setup
Then(/^I clicked the "([^"]*)" link under "([^"]*)"$/) do |link_text, header_name|
  sleep 5
  #within(:xpath, '//a[text()="'"#{header_name}"'"]/ancestor::div[1]/following-sibling::div')do
  if page.has_xpath?('//a[text()="'"#{header_name}"'"]/ancestor::div[1]/following-sibling::div//a[text()="'"#{link_text}"'"]')
    find(:xpath, '//a[text()="'"#{header_name}"'"]/ancestor::div[1]/following-sibling::div//a[text()="'"#{link_text}"'"]').click
    puts "The - #{link_text} - link has been clicked"
    sleep 5
  else
    writeFailure "Fail to click - #{link_text} - link"
    #fail(ArgumentError.new('Fail'))
  end
end
#end

# select option from user menu
Then(/^I selected "([^"]*)" from user menu$/) do |option|
  sleep 5
  if page.has_xpath?('//div[@id="userNav-arrow"]')
    find(:xpath, '//div[@id="userNav-arrow"]').click
    sleep 5
  else
    writeFailure "Fail to click user menu"
    #fail(ArgumentError.new('Fail'))
  end
  if page.has_xpath?('(//a[@title="'"#{option}"'"])[1]')
    find(:xpath, '(//a[@title="'"#{option}"'"])[1]').click
    sleep 5
  else
    writeFailure "Fail to select #{option} option from user menu"
    #fail(ArgumentError.new('Fail'))
  end
end

# Verify if the checkbox is checked
Then(/^I should see the rule "([^"]*)" checkbox checked$/) do |link_text|
  sleep 5

  Capybara.default_wait_time =1
  if page.has_xpath?('//*[text()="'"#{link_text}"'"]')
    if page.has_xpath?('//*[text()="'"#{link_text}"'"]/ancestor::tr[1]//td/img[@title="Checked"]')
      puts "The checkbox - #{link_text} - is checked"
      sleep 5
    else
      writeFailure "The checkbox - #{link_text} - is not checked"
      #fail(ArgumentError.new('Fail'))
    end
  else
    writeFailure "The checkbox - #{link_text} - is not present over the page"
  end

  Capybara.default_wait_time =30
end

# click a link present under App Setup
Then(/^I should see the "([^"]*)" is present with "([^"]*)" status$/) do |link_text, status|
  sleep 25
  if page.has_xpath?('//a[text()="'"#{link_text}"'"]/parent::td[1]/following-sibling::td[text()="'"#{status}"'"]')
    puts "The - #{link_text} - is present with status - #{status} -"
  else
    writeFailure "Fail - the - #{link_text} - is NOT present with status - #{status} -"
    #fail(ArgumentError.new('Fail'))
  end
end