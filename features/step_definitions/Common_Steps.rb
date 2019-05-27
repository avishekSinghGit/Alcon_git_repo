
Given(/^I login to the "([^"]*)" application$/) do |application|
  begin
    visit env
    sleep 8
    arg = getCredentialInfo
    fill_in "Username",:with => arg["Username"]
    fill_in "Password",:with => arg["Password"]
    sleep 5
    find("#Login").click
    sleep 10
    puts "Successfully entered the #{application} user credentials"
    sleep 3
  rescue Exception => ex
    raise "Error occurred while entering #{application} user credentials"
  end
end


Then(/^I able to see the logged in to "([^"]*)" application$/) do |app|
  sleep 5
  if page.has_css?("#userNav")
    puts "Successfully logged in to #{app} application"
  else
    raise "Failed to logged in to #{app} application"
  end
end


And(/^I click on the "([^"]*)" button$/) do |button_text|
  begin
    sleep 3
    if page.has_button?(button_text)
      click_on button_text
      sleep 2
      puts "Successfully click the #{button_text} button"
    else
      putstr "Failed to see the #{button_text} button"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on #{button_text} button"
  end
end


When(/^I click on the "([^"]*)" tab$/) do |tab|
  begin
    sleep 5
    first(:link, tab).click
    sleep 10
    puts "Successfully navigated to #{tab} tab"
  rescue Exception => ex
    putstr "Error occurred while navigate to the #{tab} tab"
  end
end

When(/^I click on "([^"]*)" link$/) do |name|
  begin
    sleep 3
    if page.has_content? name
      puts "Successfully see the the #{name} link"
      click_on name
    else
      raise "Failed to see the #{name} link"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{name} link"
  end
end


When(/^I click on "([^"]*)" button from "([^"]*)" page$/) do |name, currency|
  begin
    sleep 3
    if page.has_button? name
      puts "Successfully see the #{name} button"
      find(:xpath,"//input[@title='#{name}']").click
      sleep 2
      puts "Successfully click the #{name} button"
    else
      putstr "Failed to see the #{name} button"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on #{name} button from #{currency} page"
  end
end


When(/^I select the "([^"]*)" from "([^"]*)" pickList field$/) do |option, field|
  sleep 3
  if page.has_content?(field)
    puts "Successfully see the #{field} field"
    if page.has_css?("#p3")
      puts "Successfully see the #{field} pickList"
      sleep 2
      result = false
      find("#p3").all('option').each do |record_type|

        if record_type.text.to_s == option.to_s
          puts "Successfully see the #{field} pickList value: #{option}"
          result = true
          sleep 3
          find("#p3").send_keys option
        end
      end
      raise "Failed to see the #{field} pickList value: #{option}" unless result
      sleep 3
    else
      putstr "Failed to see the #{field} pickList"
    end
  else
    putstr "Failed to see the #{field} field"
  end
end


When(/^I click on "([^"]*)" link from user menu$/) do |setup|
  begin
    sleep 2
    find("#userNavButton").click
    sleep 2
    within("#userNav-menuItems") do
      click_on setup
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{setup} link"
  end
end

And(/^I click on "([^"]*)" button from new "([^"]*)" page$/) do |save, context|
  begin
    sleep 3
    within("#topButtonRow") do
      if page.has_button? save
        puts "Successfully see the #{save} button from #{context} page"
        click_on save
      else
        putstr "Failed to see the #{save} button from #{context} page"
      end
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{save} button from #{context} page"
  end
end


Then(/^I able to see the "([^"]*)" page$/) do |content|
  begin
    sleep 4
    if page.has_content? content
      puts "Successfully see the the #{content} page"
    else
      putstr "Failed to see the #{content} page"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{content} page"
  end
end

Then(/^I able to see the "([^"]*)" name$/) do |name|
  begin
    sleep 3
    if page.has_content? name
      puts "Successfully see the the #{name} name"
    else
      putstr "Failed to see the #{name} name"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{name} name"
  end
end

Then(/^I able to see the "([^"]*)" home page$/) do |name|
  begin
    sleep 2
    if page.has_content? name
      puts "Successfully see the the #{name} page"
    else
      raise "Failed to see the #{name} page"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{name} page"
  end
end


And(/^I fill the "([^"]*)" required fields$/) do |location_address|
  begin
    sleep 3
    arg = getDetails 'NewCasesInformation'

    $location_address = "#{arg["LocationAddressName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"

    if page.has_css?("#Name")
      puts "Successfully see the #{location_address} Name field"
      fill_in "Location Address Name",:with => $location_address

      puts "Successfully fill the the #{location_address} required fields"
      sleep 3
    else
      raise "Failed to see the #{location_address} Name field"
    end
  rescue Exception => ex
    putstr "Error occurred while filling the #{location_address} required fields"
  end
end


Then(/^I able to see the created "([^"]*)"$/) do |location_address|
  begin
    sleep 3
    if page.has_css?(".pageDescription")
      if find(".pageDescription").text == $location_address
        puts "Successfully created the #{location_address}: #{$location_address}"
      else
        putstr "Failed to created the #{location_address}: #{$location_address}"
      end
      within(".pbSubsection") do
        if find("#Name_ileinner").text == $location_address
          puts "Successfully created the #{location_address}: #{$location_address}"
        else
          putstr "Failed to created the #{location_address}: #{$location_address}"
        end
      end
    else
      putstr "Failed to created the #{location_address}: #{$location_address}"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the created #{location_address} record: #{$location_address}"
  end
end


And(/^I fill the all lead required fields$/) do
  begin
    sleep 2
    arg = getDetails 'NewLeadInformation'

    $lead_name = "#{arg["LastName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"


    if page.has_css?("#lea13")
      puts "Successfully see the Lead Status field"
      find("#lea13").send_keys arg["LeadStatus"]
    else
      putstr "Failed to find the Lead Status field"
    end

    if page.has_css?("#name_lastlea2")
      puts "Successfully see the Last Name field"
      find("#name_lastlea2").send_keys $lead_name
    else
      putstr "Failed to find the Last Name field"
    end

    if page.has_css?("#lea3")
      puts "Successfully see the company field"
      find("#lea3").send_keys arg["Company"]
    else
      putstr "Failed to find the company field"
    end

    sleep 3

    fill_in "Estimated Amount",:with => arg["LeadEstimatedAmount"]

    fill_in "Estimated Close Date",:with => arg["LeadEstimatedCloseDate"]


    if page.has_css?("#lea5")
      puts "Successfully see the Lead Source PickList"
      find("#lea5").select arg["LeadSource"]
    else
      putstr "Failed to find the Lead Source PickList"
    end

    sleep 4

    select(arg["LeadType"], :from => "Lead Type")

    select(arg["LeadSubType"], :from => "Lead Sub-Type")

    sleep 4
    puts "Successfully fill the all lead required fields"

  rescue Exception => ex
    putstr "Error occurred while filling the all lead required fields"
  end
end


And(/^I able to see the lead created successfully$/) do
  begin
    sleep 3
    if page.has_css?(".topName")
      if find(".topName").text == $lead_name
        puts "Successfully created the Lead: #{$lead_name}"
      else
        putstr "Failed to created the Lead: #{$lead_name}"
      end
      within all(".pbSubsection")[0] do
        if find("#lea2_ileinner").text == $lead_name
          puts "Successfully created the Lead: #{$lead_name}"
        else
          putstr "Failed to created the Lead: #{$lead_name}"
        end
      end
    else
      putstr "Failed to created the Lead: #{$lead_name}"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the created Lead record: #{$lead_name}"
  end
end


When(/^I fill the asset required fields$/) do
  begin
    sleep 2
    arg = getDetails 'OpportunityAssets'

    $asset_name = "#{arg["AssetName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"

    if page.has_css?("#Name")
      puts "Successfully see the Asset Name field"
      find("#Name").send_keys $asset_name
    else
      putstr "Failed to find the Asset Name field"
    end

    if page.has_css?("#Product2")
      puts "Successfully see the Product Lookup field"
      main = page.driver.browser.window_handles.first
      find(:xpath,"//a[@title='Product Lookup (New Window)']").click
      sleep 3
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      lookup = page.driver.browser.window_handles.last
      page.driver.browser.switch_to.frame("searchFrame")
      fill_in("lksrch",:with=> arg["AssetProductName"])
      sleep 3
      find_button('Go!').click
      sleep 4
      page.driver.browser.switch_to.window(lookup)
      page.driver.browser.switch_to.frame("resultsFrame")
      within('.pbBody') do
        all("tbody")[0].all('tr')[1].all('th')[0].find('a').click
      end
      page.driver.browser.switch_to.window(main)
      sleep 6
    else
      putstr "Failed to find the Product Lookup field"
    end

    #if page.has_css?("#Account")
    #  puts "Successfully see the Account field"
    #  main = page.driver.browser.window_handles.first
    #  find(:xpath,"//a[@title='Account Lookup (New Window)']").click
    #  sleep 3
    #  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    #  lookup = page.driver.browser.window_handles.last
    #  page.driver.browser.switch_to.frame("searchFrame")
    #  fill_in("lksrch",:with=> arg["AssetAccountName"])
    #  sleep 3
    #  find_button('Go!').click
    #  sleep 4
    #  page.driver.browser.switch_to.window(lookup)
    #  page.driver.browser.switch_to.frame("resultsFrame")
    #  within('.pbBody') do
    #    all("tbody")[0].all('tr')[1].all('th')[0].find('a').click
    #  end
    #  page.driver.browser.switch_to.window(main)
    #  sleep 6
    #else
    #  putstr "Failed to find the Account field"
    #end

    if page.has_css?("#Contact")
      puts "Successfully see the Contact field"
      main = page.driver.browser.window_handles.first
      find(:xpath,"//a[@title='Contact Lookup (New Window)']").click
      sleep 3
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      lookup = page.driver.browser.window_handles.last
      page.driver.browser.switch_to.frame("searchFrame")
      fill_in("lksrch",:with=> arg["AssetContactName"])
      sleep 3
      find_button('Go!').click
      sleep 4
      page.driver.browser.switch_to.window(lookup)
      page.driver.browser.switch_to.frame("resultsFrame")
      within('.pbBody') do
        all("tbody")[0].all('tr')[1].all('th')[0].find('a').click
      end
      page.driver.browser.switch_to.window(main)
      sleep 6
    else
      putstr "Failed to find the Contact field"
    end


    if page.has_css?("#SerialNumber")
      puts "Successfully see the Serial Number field"
      find("#SerialNumber").send_keys arg["AssetSerialNumber"]
    else
      putstr "Failed to find the Serial Number field"
    end

    puts "Successfully fill the asset required fields"
  rescue Exception => ex
    putstr "Error occurred while filling the asset required fields"
  end
end


Then(/^I able to see the asset created successfully$/) do
  begin
    sleep 3
    arg = getDetails 'OpportunityAssets'

    if page.has_content? arg["AssetDetailsPage"]
      puts "Successfully see the #{arg["AssetDetailsPage"]} page"

      if find(".pageDescription").text == $asset_name
        puts "Successfully created the Asset: #{$asset_name}"
      else
        putstr "Failed to created the Asset: #{$asset_name}"
      end

      within all(".pbSubsection")[0] do
        if find("#Name_ileinner").text.include? $asset_name
          puts "Successfully created the Asset: #{$asset_name}"
        else
          putstr "Failed to created the Asset: #{$asset_name}"
        end
      end

    else
      putstr "Failed to create the New Asset"
    end

  rescue Exception => ex
    putstr "Error occurred while creating the Asset: #{$asset_name}"
  end
end


When(/^I select the "([^"]*)" filter$/) do |filter_name|
  begin
    sleep 4
    if page.has_css?("#fcf")
      find('#fcf').select filter_name
      sleep 4
      puts "Successfully selected the opportunity filter: #{filter_name}"
    else
      putstr "Failed to selected the opportunity filter: #{filter_name}"
    end

    if page.has_css?(".fBody")
      within (".fBody") do
        click_button 'Go!'
      end
    end
    sleep 4
  rescue Exception => ex
    putstr "Error occurred while selecting the opportunity filter: #{filter_name}"
  end
end


When(/^I fill the service contract required fields$/) do
  begin
    sleep 2
    arg = getDetails 'NewAccountInformation'

    $service_contract_name = "#{arg["ServiceContractName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"

    if page.has_css?("#Name")
      puts "Successfully see the Service Contract Name field"
      find("#Name").send_keys $service_contract_name
    else
      putstr "Failed to find the Service Contract Name field"
    end

    puts "Successfully fill the service contract required fields"
  rescue Exception => ex
    putstr "Error occurred while filling the service contract required fields"
  end
end


Then(/^I able to see the service contract created successfully$/) do
  begin
    sleep 3
    arg = getDetails 'NewAccountInformation'

    if page.has_content? arg["ServiceContractDetailPage"]
      puts "Successfully see the #{arg["ServiceContractDetailPage"]} page"

      if find(".pageDescription").text == $service_contract_name
        puts "Successfully created the Service Contract: #{$service_contract_name}"
      else
        putstr "Failed to created the Service Contract: #{$service_contract_name}"
      end

      within all(".pbSubsection")[0] do
        if find("#Name_ileinner").text.include? $service_contract_name
          puts "Successfully created the Service Contract: #{$service_contract_name}"
        else
          putstr "Failed to created the Service Contract: #{$service_contract_name}"
        end
      end
    else
      putstr "Failed to create the New Service Contract"
    end
  rescue Exception => ex
    putstr "Error occurred while creating the Service Contract: #{$service_contract_name}"
  end
end


And(/^I should not able to see the "([^"]*)" field$/) do |field|
  begin
    sleep 3

    unless page.has_content?(field)
      puts "Unable to see the #{field} field"
    else
      putstr "Able to see the #{field} field"
    end

  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} field"
  end
end


When(/^I click on "([^"]*)" from "([^"]*)" page$/) do |tab, context|
  begin
    sleep 3
    if page.has_css?(".allTabsArrow")
      puts "Successfully find the #{context} plus icon"
      find(".allTabsArrow").click
      sleep 3
      if page.has_content? context
        first(:link, tab).click
        sleep 3
        puts "Successfully navigated to the #{tab} page"
      else
        putstr "Failed to navigated to the #{tab} page"
      end
    else
      putstr "Failed to find the #{context} plus icon"
    end
  rescue Exception => ex
    putstr "Error occurred while navigate to the #{tab} tab"
  end
end


When(/^I click on the "([^"]*)" button from "([^"]*)" page$/) do |save, product_edit|
  begin
    sleep 3
    within("#topButtonRow") do
      if page.has_button? save
        puts "Successfully see the #{save} button from #{product_edit} page"
        click_on save
      else
        putstr "Failed to see the #{save} button from #{product_edit} page"
      end
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{save} button from #{product_edit} page"
  end
end


Then(/^I able to see the "([^"]*)" section$/) do |content|
  begin
    sleep 4
    if page.has_content? content
      puts "Successfully see the the #{content} section"
    else
      putstr "Failed to see the #{content} section"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{content} section"
  end
end


And(/^I should not able to see the quote "([^"]*)" field$/) do |field|
  begin
    sleep 3

      unless page.has_content?(field)
        puts "Unable to see the #{field} field"
      else
        putstr "Able to see the #{field} field"
      end

  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} fields"
  end
end


When(/^I search the "([^"]*)" name$/) do |opportunity|
  begin
    sleep 5
    arg = getDetails 'NewQuotesDetails'

    if page.has_css?("#phSearchInput")
      puts "Successfully see the search text box"
      sleep 4
      find("#phSearchInput").send_keys arg["NewOpportunityName"]
      sleep 4
      puts "Successfully fill the Opportunity name: #{arg["NewOpportunityName"]}"

      within("#searchButtonContainer") do
        first("#phSearchButton").click
        puts "Successfully clicked the Search button"
      end
    else
      putstr "Failed to see the search text box"
    end
  rescue Exception => ex
    putstr "Error occurred while searching the #{opportunity} name"
  end
end


Then(/^I able to see the "([^"]*)" search results$/) do |opportunity|
  begin
    sleep 3
    arg = getDetails 'NewQuotesDetails'

    unless page.has_content? arg["NoOpportunityResults"]
      if page.has_css?("#secondSearchButton")
        puts "Successfully see the #{opportunity} search button"
        sleep 3
        if page.has_css?("#Opportunity")
          puts "Successfully see the #{opportunity} search results"
          sleep 3
        else
          putstr "Failed to see the #{opportunity} search results"
        end
      else
        putstr "Failed to see the #{opportunity} search button"
      end
    else
      putstr "No #{opportunity} results records found"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{opportunity} record"
  end
end


When(/^I click the "([^"]*)" record$/) do |opportunity|
  begin
    sleep 5
    arg = getDetails 'NewQuotesDetails'

    unless page.has_content? arg["NoOpportunityResults"]
      if page.has_css?("#Opportunity")
        puts "Successfully see the #{opportunity} search results"
        sleep 4

        within(".listRelatedObject.opportunityBlock") do
          within("#Opportunity_body") do
            tr = first("tbody").all(".dataRow")
            sleep 3
            result = false
            tr.each do |row|
              if row.first("th").first("a").text.include? arg["NewOpportunityName"]
                puts "Successfully see the #{opportunity} record"
                row.first("th").first("a").click
                sleep 5
                puts "Successfully clicked the #{opportunity} record"
                result = true
                break
              end
            end
            putstr "Failed to see the #{opportunity} record" unless result
            sleep 3
          end
        end
      else
        putstr "Failed to see the #{opportunity} search record"
      end
    else
      putstr "No #{opportunity} results records found"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking the #{opportunity} record"
  end
end


When(/^I click on "([^"]*)" link under "([^"]*)" section$/) do |opportunities, customize|
  begin
    sleep 3
    if page.has_content? customize
       puts "Successfully see the the #{customize} section"

       if page.has_css?("#Opportunity_font")
          puts "Successfully see the #{opportunities} link under #{customize} section"

         find("#Opportunity_font").click
         sleep 4
          puts "Successfully clicked the #{opportunities} link under #{customize} section"

       else
         putstr "Failed to see the #{opportunities} link under #{customize} section"
       end

    else
      putstr "Failed to see the #{customize} section"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{opportunities} link under #{customize} section"
  end
end


Then(/^I verify the "([^"]*)" rule should be visible and active$/) do |rule|
  begin
    sleep 3
    if page.has_content? rule
      puts "Successfully see the the #{rule} role"
      within(".listRelatedObject.setupBlock") do
        within(".list") do
          tr = first("tbody").all(".dataRow")
          sleep 3
          result = false
          tr.each do |row|
           if row.first("th").first("a").text == rule
            if row.all("td")[5].first("img")[:title] == "Checked"
              puts "#{rule} rule is active"
              result = true
              break
            else
              putstr "#{rule} rule is not active"
            end
           end
          end
           putstr "Failed to see the #{rule} rule" unless result
           sleep 3
        end
      end
    else
      putstr "Failed to see the #{rule} rule"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{rule} rule"
  end
end


Then(/^I verify the specific users with "([^"]*)" permission$/) do |permission_set_name|
  begin
    sleep 3
    if page.has_content? permission_set_name
      puts "Successfully see the the #{permission_set_name} permission"
    else
      putstr "Failed to see the #{permission_set_name} permission"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{permission_set_name} permission"
  end
end


And(/^I fill the account required fields$/) do
  begin
    sleep 2
    arg = getDetails 'NewAccountInformation'

    $account_name = "#{arg["AccountRequiredName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"

    if page.has_css?("#acc2")
      puts "Successfully see the Account Name field"
      find("#acc2").send_keys $account_name
    else
      putstr "Failed to find the Account Name field"
    end

    if page.has_css?("#acc3")
      puts "Successfully see the Parent Account Lookup field"
      main = page.driver.browser.window_handles.first
      find(:xpath,"//a[@title='Parent Account Lookup (New Window)']").click
      sleep 3
      page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
      lookup = page.driver.browser.window_handles.last
      page.driver.browser.switch_to.frame("searchFrame")
      fill_in("lksrch",:with=> arg["ParentAccountName"])
      sleep 3
      find_button('Go!').click
      sleep 4
      page.driver.browser.switch_to.window(lookup)
      page.driver.browser.switch_to.frame("resultsFrame")
      within('.pbBody') do
        all("tbody")[0].all('tr')[1].all('th')[0].find('a').click
      end
      page.driver.browser.switch_to.window(main)
      sleep 6
    else
      putstr "Failed to find the Parent Account Lookup field"
    end
    puts "Successfully fill the account required fields"
  rescue Exception => ex
    putstr "Error occurred while filling the account required fields"
  end
end

Then(/^I able to see the account created successfully$/) do
  begin
    sleep 3
    if page.has_css?(".topName")
      if find(".topName").text == $account_name
        puts "Successfully created the Account: #{$account_name}"
      else
        putstr "Failed to created the Account: #{$account_name}"
      end
      within all(".pbSubsection")[0] do
        if find("#acc2_ileinner").text.include? $account_name
          puts "Successfully created the Account: #{$account_name}"
        else
          putstr "Failed to created the Account: #{$account_name}"
        end
      end
    else
      putstr "Failed to created the Account: #{$account_name}"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the created Account record: #{$account_name}"
  end
end


When(/^I select the "([^"]*)" pickList value$/) do |risk_assessment_overall|
  begin
    sleep 2
    arg = getDetails 'NewAccountInformation'

    if page.has_select?(risk_assessment_overall)
      puts "Successfully see the #{risk_assessment_overall} field"
      select(arg["RiskAssessmentOverallValue"], :from => risk_assessment_overall)
      puts "Successfully selected the #{risk_assessment_overall} value: #{arg["RiskAssessmentOverallValue"]}"
    end

    puts "Successfully selected the #{risk_assessment_overall} field"
  rescue Exception => ex
    putstr "Error occurred while selecting the #{risk_assessment_overall} field"
  end
end


When(/^I verify the "([^"]*)" should be current system date and time$/) do |overall_risk_status_last_changed|
  begin
    sleep 3

    $current_date_time = "#{(Time.now.utc + Time.zone_offset('PDT')).strftime("%-m/%e/%Y %l:%M %p")}"

    within all(".pbSubsection")[0] do
      tr = first("tbody").all("tr")
      sleep 3
      result = false
      tr.each do |row|
        if row.all("td")[0].text == overall_risk_status_last_changed

          if row.all("td")[1].first("div").text.delete(' ').include? $current_date_time.delete(' ')
            puts "Successfully updated the #{overall_risk_status_last_changed} field with current system date and time"
            result = true
            break
          else
            putstr "Failed to updated the #{overall_risk_status_last_changed} field with current system date and time"
            result = true
            break
          end
        end
      end
       putstr "Failed to see the #{overall_risk_status_last_changed} field" unless result
       sleep 3
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{overall_risk_status_last_changed} should be current system date and time"
  end
end


And(/^I able to see the "([^"]*)" cases pickList fields$/) do |field|
  begin
  sleep 2
  arg = getDetails 'NewCasesInformation'

  if page.has_css?("#p3")

    puts "Successfully see the #{field} pickList"

    $case_types = []

    all(:xpath,"//select[@id='p3']/option").each do |options|

      $case_types << options.text
    end

    if $case_types.include?arg["CaseTypeQuoteRequest"]
      puts "Successfully see the #{field} pickList value: #{arg["CaseTypeQuoteRequest"]}"
    else
      putstr "Failed to see the #{field} pickList value: #{arg["CaseTypeQuoteRequest"]}"
    end

    if $case_types.include?arg["CaseTypeBookingRequest"]
      puts "Successfully see the #{field} pickList value: #{arg["CaseTypeBookingRequest"]}"
    else
      putstr "Failed to see the #{field} pickList value: #{arg["CaseTypeBookingRequest"]}"
    end

    if $case_types.include?arg["CaseTypeDataProcessing"]
      puts "Successfully see the #{field} pickList value: #{arg["CaseTypeDataProcessing"]}"
    else
      putstr "Failed to see the #{field} pickList value: #{arg["CaseTypeDataProcessing"]}"
    end

    if $case_types.include?arg["CasesTypeReviewRequest"]
      puts "Successfully see the #{field} pickList value: #{arg["CasesTypeReviewRequest"]}"
    else
      putstr "Failed to see the #{field} pickList value: #{arg["CasesTypeReviewRequest"]}"
    end

    if $case_types.include?arg["CaseTypeReportingRequest"]
      puts "Successfully see the #{field} pickList value: #{arg["CaseTypeReportingRequest"]}"
    else
      putstr "Failed to see the #{field} pickList value: #{arg["CaseTypeReportingRequest"]}"
    end

    if $case_types.include?arg["CaseTypeDataUpdateRequest"]
      puts "Successfully see the #{field} pickList value: #{arg["CaseTypeDataUpdateRequest"]}"
    else
      putstr "Failed to see the #{field} pickList value: #{arg["CaseTypeDataUpdateRequest"]}"
    end

    if $case_types.include?arg["CaseTypeLeadSubmission"]
      puts "Successfully see the #{field} pickList value: #{arg["CaseTypeLeadSubmission"]}"
    else
      putstr "Failed to see the #{field} pickList value: #{arg["CaseTypeLeadSubmission"]}"
    end

  else
    putstr "Failed to see the #{field} pickList"
  end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} pickList values"
 end
end


