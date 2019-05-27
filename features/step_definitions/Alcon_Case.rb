When(/^I enter the mandatory field values under new case for lead submission$/) do
  if page.has_field?("Status")
    select("New", :from => "Status")
  end
  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Contact Name Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10

  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Opportunity Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 5

  if page.has_field?("Description")
    fill_in("Description",:with=> "testing")
  end
  if page.has_field?("00N3600000PFKjW")
    select("Booking", :from => "00N3600000PFKjW")
  end
  if page.has_field?("Product(s) That Needs To Be Quoted")
    fill_in("Product(s) That Needs To Be Quoted",:with=> "testing")
  end
  if page.has_field?("Applicable Discounts")
    fill_in("Applicable Discounts",:with=> "testing")
  end
  if page.has_field?("New Term Dates")
    fill_in("New Term Dates",:with=> "testing")
  end
end

Then(/^I select "([^"]*)" option from "([^"]*)" picklist$/) do |option_val, field_val|
  if page.has_field?(field_val)
    select(option_val, :from => field_val)
  end
end

When(/^I enter the mandatory field values under new case for data update request$/) do
  if page.has_field?("Status")
    select("New", :from => "Status")
  end
  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Opportunity Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 5

  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Contact Name Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke-test")
  sleep 2
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 3
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 3

  if page.has_field?("Description")
    fill_in("Description",:with=> "testing")
  end
end


Then(/^I check case milestone and target date value for booking request$/) do
  sleep 5
  within all('.pbBody')[8] do
    table=all("tbody")[0]
    sleep 5
    puts table.all('tr')[1].all('th')[0].all('a')[0].text.to_s
    @@target_date = table.all('tr')[1].all('td')[2].text.to_s
    puts "Target Date is #{@@target_date}"
  end
  sleep 2
  within all('.pbSubsection')[3] do
    table=all("tbody")[0]
    sleep 5
    @@entitlement_process_start_time = table.all('tr')[0].all('td')[1].text.to_s
    puts "Entitlement Process Start Time field value is: #{@@entitlement_process_start_time}"
  end
end

Then(/^I check case milestone and target date value for lead submission$/) do
  sleep 5
  within all('.pbBody')[8] do
    table=all("tbody")[0]
    sleep 5
    puts table.all('tr')[1].all('th')[0].all('a')[0].text.to_s
    @@target_date = table.all('tr')[1].all('td')[2].text.to_s
    puts "Target Date is #{@@target_date}"
  end
  sleep 2
  within all('.pbSubsection')[3] do
    table=all("tbody")[0]
    sleep 5
    @@entitlement_process_start_time = table.all('tr')[0].all('td')[1].text.to_s
    puts "Entitlement Process Start Time field value is: #{@@entitlement_process_start_time}"
  end
end

Given(/^I enter the mandatory field values under new case for quote request$/) do
  if page.has_field?("Status")
    select("New", :from => "Status")
  end
  if page.has_field?("Sub Case Type")
    select("New", :from => "Sub Case Type")
  end
  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Opportunity Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10

  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Contact Name Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10

  if page.has_field?("Description")
    fill_in("Description",:with=> "testing")
  end
  if page.has_field?("Quote Type")
    select("1 Year", :from => "Quote Type")
  end
end

Then(/^I enter the mandatory field values under new case for reporting request$/) do
  if page.has_field?("Status")
    select("New", :from => "Status")
  end
  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Opportunity Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10

  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Contact Name Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10

  if page.has_field?("Description")
    fill_in("Description",:with=> "testing")
  end
end

When(/^I capture the case number$/) do
  sleep 5
  if page.has_xpath?('//td[text()="Case Number"]/following-sibling::td[1]//div')
    $caseNumber=find(:xpath, '//td[text()="Case Number"]/following-sibling::td[1]//div').text
    puts "The case number is - #{$caseNumber} -"
  else
    writeFailure "FAIL to capture the case numebr"
  end
  Capybara.default_wait_time =30
end

When(/^I enter the mandatory field values under new case for booking request$/) do
  if page.has_field?("Status")
    select("New", :from => "Status")
  end
  if page.has_field?("Sub Case Type")
    select("New", :from => "Sub Case Type")
  end
  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Opportunity Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10

  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Contact Name Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10

  if page.has_field?("Description")
    fill_in("Description",:with=> "testing")
  end
  if page.has_field?("Contract Amount")
    fill_in("Contract Amount",:with=> "100")
  end
end

When(/^I choose contact name through look up field$/) do
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='cas3_lkwgt']/img").click
  sleep 1
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
end

When(/^I choose opportunity through lookup field$/) do
  main = page.driver.browser.window_handles.first
  find(:xpath,".//*[@id='CF00N3600000PVaFA_lkwgt']/img").click
  sleep 1
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  sleep 5
  fill_in("lksrch",:with=> "smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
end

When(/^I note the case number which is just created$/) do
  $case_num = find(:xpath,"//h2[@class='pageDescription']").text
  puts $case_num
end

When(/^I check the request escalation check box$/) do
  if page.has_field?("00N3600000PFBdL")
    find(:id, "00N3600000PFBdL").click
    puts "request escalation field is checked"
  else
    writeFailure "request escalation field is not available"
  end
end

When(/^I enter value in the escalation reason field$/) do
  if page.has_field?("Escalation Reason")
    fill_in("Escalation Reason",:with=> "test")
  else
    writeFailure "Escalation Reason field is not available"
  end
end

Then(/^I logout from the current user$/) do
  begin
    sleep 5
    find(:id,"userNavLabel").click
		within all('.mbrMenuItems')[0] do
			click_on 'Logout'
			sleep 4
		end
		sleep 2
		puts "Logged out Successfully"
    sleep 2
	end
end

When(/^I should click on approve button$/) do
  sleep 5
  find_button('Approve').click
end

When(/^I check that lock icon appears next to edit button$/) do
  if page.has_xpath?("//td[@id='topButtonRow']/img[@alt='Locked']")
    puts "Lock icon appears next to edit button"
  else
    writeFailure "Lock icon is not appearing next to edit button"
  end
end

Then(/^I check that lock icon does not appears next to edit button$/) do
  if page.has_no_xpath?("//td[@id='topButtonRow']/img[@alt='Locked']")
    puts "Lock icon is not appearing next to edit button"
  else
    writeFailure "Lock icon appears next to edit button"
  end
end


When(/^I select "([^"]*)" from record type of new record$/) do |arg1|
  select arg1, :from => "Record Type of new record"
  sleep 3
  if find(:button,'Continue').visible?
    sleep 2
    click_on('Continue')
    puts "clicked on continue button"
  else
    puts "Continue button is not available for this user"
  end
end


When(/^I enter the mandatory field values under new case for data processing request$/) do
  if page.has_field?("Description")
    fill_in("Subject",:with=> "Smoke_data_processing_request")
  end
  if page.has_field?("Status")
    select("New", :from => "Status")
  end
  sleep 5
  # if page.has_field?("Opportunity")
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Opportunity Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 3
  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Contact Name Lookup (New Window)']").click
  sleep 5
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 3
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 3
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 5
  if page.has_field?("Description")
    fill_in("Description",:with=> "testing")
  end
end

When(/^I update sub case type picklist value to no service$/) do
  if page.has_field?("Sub Case Type")
    select("No Service", :from => "Sub Case Type")
  end
end

Then(/^I enter the mandatory field values under new case for Review Request$/) do
  if page.has_field?("Status")
    select("New", :from => "Status")
  end
  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Opportunity Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10

  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Contact Name Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke-test")
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    table=all("tbody")[0]
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 10

  if page.has_field?("Description")
    fill_in("Description",:with=> "testing")
  end
end

Then(/^I check case milestone and target date value for data processing request$/) do
  sleep 5
  within all('.pbBody')[8] do
    table=all("tbody")[0]
    sleep 5
    puts table.all('tr')[1].all('th')[0].all('a')[0].text.to_s
    @@target_date = table.all('tr')[1].all('td')[2].text.to_s
    puts "Target Date is #{@@target_date}"
  end
  sleep 2
  within all('.pbSubsection')[3] do
    table=all("tbody")[0]
    sleep 5
    @@entitlement_process_start_time = table.all('tr')[0].all('td')[1].text.to_s
    puts "Entitlement Process Start Time field value is: #{@@entitlement_process_start_time}"
  end
end

Then(/^I check case milestone and target date value for Review Request$/) do
  sleep 5
  within all('.pbBody')[8] do
    table=all("tbody")[0]
    sleep 5
    puts table.all('tr')[1].all('th')[0].all('a')[0].text.to_s
    @@target_date = table.all('tr')[1].all('td')[2].text.to_s
    puts "Target Date is #{@@target_date}"
  end
  sleep 2
  within all('.pbSubsection')[3] do
    table=all("tbody")[0]
    sleep 5
    @@entitlement_process_start_time = table.all('tr')[0].all('td')[1].text.to_s
    puts "Entitlement Process Start Time field value is: #{@@entitlement_process_start_time}"
  end
end



And(/^I select the "([^"]*)" value from "([^"]*)" pickList$/) do |option, sub_case_type|
  begin
    sleep 3
    $sub_case_type_status = false
    if page.has_content?(sub_case_type)
      puts "Successfully see the #{sub_case_type} field"
      within all(".pbSubsection")[0] do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|
          if row.all("td")[0].text == sub_case_type
            $sub_case_type_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
            if $sub_case_type_values.count > 0
              puts "Successfully see the #{sub_case_type} pickList field is enabled"
              if page.has_select?(sub_case_type)
                select(option, :from => sub_case_type)
                puts "Successfully selected the #{option} from #{sub_case_type}"
                sleep 3
              end
              $sub_case_type_status = true
              result = true
              break
            else
              putstr "Failed to see the #{sub_case_type} pickList field is disabled"
            end
          end
        end
        putstr "Failed to see the #{sub_case_type} pickList field" unless result
        sleep 3
      end
    else
      putstr "Failed to see the #{sub_case_type} field"
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the #{option} from #{sub_case_type}"
  end
end



And(/^I select the "([^"]*)" from "([^"]*)"$/) do |option, field_name|
  begin
    sleep 3
    $account_status = false
    if page.has_content?(field_name)
      puts "Successfully see the #{field_name} field"
      within all(".pbSubsection")[0] do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|
          if row.all("td")[0].text == field_name
            $field_status = row.all("td")[1].first("span").first("span").first("select").all('option').collect(&:text)
            if $field_status.count > 0
              puts "Successfully see the #{field_name} pickList field is enabled"
              if page.has_select?(field_name)
                select(option, :from => field_name)
                puts "Successfully selected the #{option} from #{field_name}"
                sleep 3
              end
              $account_status = true
              result = true
              break
            else
              putstr "Failed to see the #{field_name} pickList field is disabled"
            end
          end
        end
        putstr "Failed to see the #{field_name} pickList field" unless result
        sleep 3
      end
    else
      putstr "Failed to see the #{field_name} field"
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the #{option} from #{field_name}"
  end
end


And(/^I select the "([^"]*)" is "([^"]*)"$/) do |priority, state|
  begin
    sleep 3
    within all(".pbSubsection")[0] do

      $priority_status = state

      if page.has_select?(priority)
        select(state, :from => priority)
      end
      puts "Successfully selected the #{priority} is #{state}"
    end
  rescue Exception => ex
    putstr "Error occurred while selecting the #{priority} is #{state}"
  end
end


Then(/^I able to see the "([^"]*)" created renewal case$/) do |record_type|
  begin
    sleep 3
    arg = getDetails 'NewCasesInformation'

    if (page.has_content?(arg["CasesDetailsPage"]))  && (page.has_content?(arg["CasesDetailsApprovalHistory"]))
      puts "Successfully see the #{arg["CasesDetailsPage"]} page"

      sleep 2
      within all(".pbSubsection")[0] do

        if page.has_content? record_type
          puts "Successfully see the the case #{record_type}"
        else
          putstr "Failed to see the case #{record_type}"
        end

      end

    else
      putstr "Failed to created the case #{arg["CasesDetailsPage"]} page"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying case #{record_type}"
  end
end


And(/^I able to see the "([^"]*)" icon next to "([^"]*)" button$/) do |lock, edit|
  begin
    sleep 3
    if page.has_xpath?("//input[@title='Edit']/preceding-sibling::img[@title='Locked']")
      puts "Successfully see the #{lock} icon next to #{edit} button"
    else
      putstr "Failed to see the #{lock} icon next to #{edit} button"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{lock} icon next to #{edit} button"
  end
end


When(/^I able to see the "([^"]*)" pickList values$/) do |renewal_status|
  begin
    sleep 3
    arg = getDetails 'HouseAccountRenewalStatusPickListValues'

    if page.has_content?(renewal_status)
      puts "Successfully see the #{renewal_status} field"
      within all(".pbSubsection")[0] do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|
          if row.all("td")[0].text == renewal_status

            if $sub_case_type_status == true
              result = true
              $renewal_status = row.all("td")[1].first("span").first("span").first("select").all('option').collect(&:text)

              if $renewal_status.count > 0


                if $renewal_status.include?arg["RenewalStatusHABDT"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusHABDT"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusHABDT"]}"
                end

                if $renewal_status.include?arg["RenewalStatusHACNL"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusHACNL"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusHACNL"]}"
                end

                if $renewal_status.include?arg["RenewalStatusHACOV"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusHACOV"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusHACOV"]}"
                end

                if $renewal_status.include?arg["RenewalStatusHADUP"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusHADUP"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusHADUP"]}"
                end

                if $renewal_status.include?arg["RenewalStatusHAEOL"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusHAEOL"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusHAEOL"]}"
                end

                if $renewal_status.include?arg["RenewalStatusHAOTH"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusHAOTH"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusHAOTH"]}"
                end

                if $renewal_status.include?arg["RenewalStatusHAPRT"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusHAPRT"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusHAPRT"]}"
                end

                if $renewal_status.include?arg["RenewalStatusHASPB"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusHASPB"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusHASPB"]}"
                end

                if $renewal_status.include?arg["RenewalStatusHACPR"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusHACPR"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusHACPR"]}"
                end

                if $renewal_status.include?arg["RenewalStatusHASRL"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusHASRL"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusHASRL"]}"
                end

              else
                putstr "#{renewal_status} pickList field is disabled mode"
              end
            else
              putstr "Renewal Status #{renewal_status} pickList field is not visible"
            end
          end
        end
        putstr "Failed to see the #{renewal_status} pickList field" unless result
        sleep 3
      end
    else
      putstr "Failed to see the #{renewal_status} pickList field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{renewal_status} pickList value"
  end
end



When(/^I verify the case "([^"]*)" pickList values$/) do |renewal_status|
  begin
    sleep 3
    arg = getDetails 'ClosedSaleRenewalStatusPickListValues'

    if page.has_content?(renewal_status)
      puts "Successfully see the #{renewal_status} field"
      within all(".pbSubsection")[0] do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|
          if row.all("td")[0].text == renewal_status

            if $sub_case_type_status == true
              result = true
              $renewal_status = row.all("td")[1].first("span").first("span").first("select").all('option').collect(&:text)

              if $renewal_status.count > 0


                if $renewal_status.include?arg["RenewalStatusCSBKD"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusCSBKD"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusCSBKD"]}"
                end

                if $renewal_status.include?arg["RenewalStatusCSCTL"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusCSCTL"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusCSCTL"]}"
                end

                if $renewal_status.include?arg["RenewalStatusCSCTS"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusCSCTS"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusCSCTS"]}"
                end

                if $renewal_status.include?arg["RenewalStatusCSDIS"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusCSDIS"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusCSDIS"]}"
                end

                if $renewal_status.include?arg["RenewalStatusCSMYA"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusCSMYA"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusCSMYA"]}"
                end

                if $renewal_status.include?arg["RenewalStatusCSMYY"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusCSMYY"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusCSMYY"]}"
                end

                if $renewal_status.include?arg["RenewalStatusCSPRC"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusCSPRC"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusCSPRC"]}"
                end

                if $renewal_status.include?arg["RenewalStatusCSRCT"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusCSRCT"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusCSRCT"]}"
                end

                if $renewal_status.include?arg["RenewalStatusCSRP"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusCSRP"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusCSRP"]}"
                end

                if $renewal_status.include?arg["RenewalStatusCSDNG"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusCSDNG"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusCSDNG"]}"
                end

                if $renewal_status.include?arg["RenewalStatusCSUPG"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusCSUPG"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusCSUPG"]}"
                end

                if $renewal_status.include?arg["RenewalStatusCSUNC"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusCSUNC"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusCSUNC"]}"
                end

              else
                putstr "#{renewal_status} pickList field is disabled mode"
              end
            else
              putstr "Renewal Status #{renewal_status} pickList field is not visible"
            end
          end
        end
        putstr "Failed to see the #{renewal_status} pickList field" unless result
        sleep 3
      end
    else
      putstr "Failed to see the #{renewal_status} pickList field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{renewal_status} pickList value"
  end

end


When(/^I able to see the case "([^"]*)" pickList values$/) do |renewal_status|
  begin
    sleep 3
    arg = getDetails 'NoServiceRenewalStatusPickListValues'

    if page.has_content?(renewal_status)
      puts "Successfully see the #{renewal_status} field"
      within all(".pbSubsection")[0] do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|
          if row.all("td")[0].text == renewal_status

            if $sub_case_type_status == true

              result = true
              $renewal_status = row.all("td")[1].first("span").first("span").first("select").all('option').collect(&:text)

              if $renewal_status.count > 0

                if $renewal_status.include?arg["RenewalStatusNSPCP"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusNSPCP"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusNSPCP"]}"
                end

                if $renewal_status.include?arg["RenewalStatusNSSCS"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusNSSCS"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusNSSCS"]}"
                end

                if $renewal_status.include?arg["RenewalStatusNSRNE"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusNSRNE"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusNSRNE"]}"
                end

                if $renewal_status.include?arg["RenewalStatusNSSSD"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusNSSSD"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusNSSSD"]}"
                end

                if $renewal_status.include?arg["RenewalStatusNSPPD"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusNSPPD"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusNSPPD"]}"
                end

                if $renewal_status.include?arg["RenewalStatusNSREU"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusNSREU"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusNSREU"]}"
                end

                if $renewal_status.include?arg["RenewalStatusNSCBB"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusNSCBB"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusNSCBB"]}"
                end

                if $renewal_status.include?arg["RenewalStatusNSCBV"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusNSCBV"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusNSCBV"]}"
                end

                if $renewal_status.include?arg["RenewalStatusNSISP"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusNSISP"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusNSISP"]}"
                end

                if $renewal_status.include?arg["RenewalStatusNSTNM"]
                  puts "Successfully see the #{renewal_status} pickList value: #{arg["RenewalStatusNSTNM"]}"
                else
                  putstr "Failed to see the #{renewal_status} pickList value: #{arg["RenewalStatusNSTNM"]}"
                end

              else
                putstr "#{renewal_status} pickList field is disabled mode"
              end
            else
              putstr "Renewal Status #{renewal_status} pickList field is not visible"
            end
          end
        end
        putstr "Failed to see the #{renewal_status} pickList field" unless result
        sleep 3
      end
    else
      putstr "Failed to see the #{renewal_status} pickList field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{renewal_status} pickList value"
  end
end


When(/^I verify the case "([^"]*)" field is visible$/) do |status|
  begin
    sleep 3
    $case_fields = false
    if page.has_content?(status)
      puts "Successfully see the #{status} field"
      within all(".pbSubsection")[0] do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|

          if row.all("td")[2].first("label").text.include? status
            quote_field_values = row.all("td")[3].first("div").first("span").first("select").all('option').collect(&:text)
            if quote_field_values.count > 0
              puts "Successfully see the #{status} pickList field is editable"
              $case_fields = true
              result = true
              break
            else
              putstr "Failed to see the #{status} pickList field is read only"
            end
          end
        end
        putstr "Failed to see the #{status} pickList field" unless result
        sleep 3
      end
    else
      putstr "Failed to see the #{status} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{status} field is visible"
  end
end


When(/^I verify the case "([^"]*)" field should be editable for all users$/) do |status|
  begin
    sleep 3

    if page.has_content?(status)
      puts "Successfully see the #{status} field"
      within all(".pbSubsection")[0] do
        tr = first("tbody").all("tr")
        sleep 3
        result = false
        tr.each do |row|
          if row.all("td")[2].first("label").text.include? status
            if $case_fields == true
              quote_field_values = row.all("td")[3].first("div").first("span").first("select").all('option').collect(&:text)
              if quote_field_values.count > 0
                puts "#{status} pickList field is editable"
                result = true
                break
              else
                putstr "#{status} pickList field is not editable"
              end
            else
              putstr "#{status} pickList field is not visible"
            end
          end
        end
        putstr "Failed to see the #{status} pickList field" unless result
        sleep 3
      end
    else
      putstr "Failed to see the #{status} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{status} pickList field is editable"
  end
end
