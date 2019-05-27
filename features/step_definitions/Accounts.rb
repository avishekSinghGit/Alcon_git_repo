Given(/^I enter value to all the mandatory field$/) do
  within all('.pbSubsection')[0] do
    sleep 2
    $account_name = "Smoke_test_accounts"+ Random.new.rand(1..20000).to_s
    fill_in "acc2",:with => $account_name
    puts $account_name
    puts "account name is: #{$account_name}"
  end
  if page.has_field?("Account Currency")
      select("USD - U.S. Dollar", :from => "Account Currency")
      puts "value for Account Currency is selected"
  else
      writeFailure "Account Currency field is not available"
  end
  sleep 3
end


When(/^I check that "([^"]*)" is visible and editable$/) do |arg1|
  if (ENV['UserRole'] == "salesopssit")
    if page.has_content?(arg1)
      puts "#{arg1} field is visible"
    else
      puts "#{arg1} field is not visible"
    end
    if page.has_field?(arg1)
      writeFailure "#{arg1} field is editable"
    else
      puts "#{arg1} field is not editable"
    end
  else
    if page.has_content?(arg1)
      puts "#{arg1} field is visible"
    else
      writeFailure "#{arg1} field is not visible"
    end
    if page.has_field?(arg1)
      puts "#{arg1} field is editable"
    else
      writeFailure "#{arg1} field is not editable"
    end
 end
end

Given(/^I check the picklist value of industry field$/) do
 begin
    sleep 5
    arg = getAccountsDetails 'account_details'
    if page.has_select?("Industry")
      puts "Industry picklist field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, 'acc7')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["industry"]
 #       expectedvalue = arg["industry"].split(',')
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "Industry picklist is not present"
    end
  end
end

Then(/^I select picklist value for industry field$/) do
  if page.has_field?("Industry")
      select("Hospitals/Clinics", :from => "Industry")
      puts "value for Industry is selected"
  else
      writeFailure "Industry field is not available"
  end
end


Then(/^I check that "([^"]*)" field is visible$/) do |field_name|
  sleep 2
  if page.has_content?(field_name)
    puts "#{field_name} field is visible"
  else
    writeFailure "#{field_name} field is not visible"
  end
end

Given(/^I click on account location lookup and select any value$/) do
 page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Account Location Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke_test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 2
    table.all('tr')[1].all('th')[0].find('a').click
  end
  sleep 4
  page.driver.browser.switch_to.window(main)
end

Then(/^I check that the "([^"]*)" section is removed from "([^"]*)"$/) do |arg1, arg2|
  sleep 5
  if page.has_content?("arg1")
    writeFailure "#{arg1} section is not removed from #{arg2}"
  else
    puts "#{arg1} section is removed from #{arg2}"
  end
end