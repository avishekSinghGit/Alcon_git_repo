Then(/^I click on new Opportunity button from Opportunity related section$/) do
  sleep 2
  find(:xpath, "//td/input[@name='newOpp']").click
  within('.pbSubsection') do
    select("Opportunity - Edit", :from => "Record Type of new record")
  end
  within('.pbBottomButtons') do
    if find(:button, "Continue").visible?
      click_on "Continue"
    else
      puts "Continue button is not visible"
    end
  end
end

Then(/^I should verify client territory picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000PFBew']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--", "Central","Central - R","Great Lakes","Mid Atlantic","North Central","Northeast","Northeast - R","South","South Central","Southeast","Southeast - R","Southwest","West","West - R"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in client territory picklist"
  else
    writeFailure "expected values are not visible in client territory picklist"
  end
end

Then(/^I should verify Client Region picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000PFBeu']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--", "Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware","Florida","Georgia","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky","Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska","Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Ohio","Oklahoma","Oregon","Pennsylvania","Rhode Island","South Carolina","South Dakota","Tennessee","Texas","Utah","Vermont","Virginia","Washington","West Virginia","Wisconsin"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Client Region picklist"
  else
    writeFailure "expected values are not visible in Client Region picklist"
  end
end

Then(/^I should verify Health Status Reason picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000PFBff']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--", "No Risk perceived- Customer Healthy","No Risk - upsell/cross sell opportunity","Customer Unresponsive","Customer Success - Escalation","Customer Success – General Inquiry","Customer Success – Service/Maintenance Request","Customer Success – Pricing/Contract Request","Risk – Lack of use: Training","Risk – Lack of use: Product Complexity","Risk – Lack of use: Value perception","Risk – Lack of use: Change in business/needs","Risk – Lack of use: Change management","Risk – Lack of use: Downgrade or downsell","Risk – Price: Cost of product/service","Risk – Price: Budget","Risk – Price: Value vs T&M","Risk – Price: Value vs T&M (Unattached Customer Preference)","Risk – Price: Value vs T&M (Unattached Product/Service Preference)","Risk – Price: Value Perception","Risk – Competitor: 3rd party","Risk – Competitor: In-house","Risk – Competitor: Product Replacement","Risk – Competitor: Pricing","Risk – Competitor: Unique Offering","Risk – Product/Service performance: Performance issues","Risk – Product/Service performance: Over-sold","Risk – Product/Service performance: Not meeting outcomes","Risk – Product/Service performance: EOL","Risk – Product/Service performance: Product Replacement (internal)","Risk -  CSAT : Poor customer experience","Risk – Cease of Business: Out of Business","Risk – Cease of Business: M&A","Risk – Cease of Business: Bankruptcy"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Health Status Reason picklist"
  else
    writeFailure "expected values are not visible in Health Status Reason picklist"
  end
end

When(/^I double click on Competitor Name and fill as "([^"]*)"$/) do |value|
  sleep 3
  element = page.find(:xpath,"//*[@id='00N3600000PFBfv_ileinner']")
  page.driver.browser.mouse.double_click(element.native)
  sleep 3
  fill_in("00N3600000PFBfv", :with=> value)
  sleep 3
end

Then(/^I should verify Renawal Status picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='j_id0:theFrm:pageBlockId:j_id29:j_id30:8:j_id31']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--","Open","Lost","Won"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Renawal Status picklist"
  else
    writeFailure "expected values are not visible in Renawal Status picklist"
  end
end

Then(/^I should verify Result Reason picklist values$/) do
  if page.has_content?('Result Reason')
  actualvalues =find(:xpath,".//*[@id='00N3600000PFBfe']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--","Black","Green","Red"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Health Status picklist"
  else
    writeFailure "expected values are not visible in Health Status picklist"
  end
  else
    writeFailure "Result Reason field is not visible"
  end
end

Then(/^I should verify Health Status picklist values$/) do
  actualvalues =find(:xpath,".//*[@id='00N3600000PFBfe']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--","Black","Green","Red"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Health Status picklist"
  else
    writeFailure "expected values are not visible in Health Status picklist"
  end
end


Then(/^I click on new quote button under quotes section$/) do
  sleep 2
  click_on "New Quote"
end

Then(/^I enter value to mandatory fields under new quote section$/) do
  sleep 2
  if page.has_field?("Quote Name")
    fill_in("Quote Name", :with=> "Smoke_test_quotes")
  else
    writeFailure "Quote Name field is not available"
  end
  if page.has_field?("00N3600000PFBhz")
    select("Direct", :from => "00N3600000PFBhz")
  else
    writeFailure "Quote Type field is not available"
  end
  if page.has_field?("00N3600000PFBhy")
    select("1", :from => "00N3600000PFBhy")
  else
    writeFailure "Quote Type Year field is not available"
  end
end

Then(/^I click on add line items button under quote line items section$/) do
  sleep 3
  click_on "Add Line Item"
end

Then(/^I select existing product name$/) do
  sleep 2
  page.find(:xpath, ".//*[@id='search']").set("smoke")
  sleep 2
  page.find(:id, "save_filter_PricebookEntry").click
  sleep 5
  within('.x-grid3-body') do
    table=all("tbody")[0]
    table.all('tr')[0].all('td')[0].click
    puts "opportunity is selected"
  end
end

Then(/^I clik on select button$/) do
  within('.selectButtons') do
    click_button("Select")
  end
end

Then(/^I note the product name under add quote line items to section$/) do
  within('.genericTable') do
    table=all('tbody')[0]
    $product_name = table.all('tr')[4].all('th')[0].text
    puts "Selected Product Name is: #{$product_name}"
  end
end

Then(/^I check that new line items added is be visible under products related list$/) do
  within all('.pbBody')[1] do
    if find_link($product_name).visible?
      puts "The new line items added is visible under products related list"
    else
      writeFailure "The new line items added is not visible under products related list"
    end
  end
end

Then(/^I enter start date field value$/) do
  sleep 2
  if page.has_field?("00N3600000PFBaQ01u5B000000pO52")
    fill_in("00N3600000PFBaQ01u5B000000pO52", :with=> "11/7/2016")
  else
    writeFailure "Start Date field is not present"
  end
end

Then(/^I double click on batch type and verify batch type picklist values$/) do
  sleep 3
  element = page.find(:xpath,".//*[@id='00N3600000PFBit_ileinner']")
  page.driver.browser.mouse.double_click(element.native)
  sleep 3
  actualvalues =find(:xpath,".//*[@id='00N3600000PFBit']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues = ["--None--","Expired","IBOW","Renewal","Warranty","Adds/Recovery Expired","Adds/Recovery Renewal","Adds/Recovery Uncovered","Campaign"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in batch type picklist"
  else
    writeFailure "expected values are not visible in batch type picklist"
  end
end

Then(/^I double click on Renewal Status and verify Renewal Status picklist values$/) do
  sleep 3
  element = page.find(:xpath,"//*[@id='00N3600000PFAvt_ileinner']")
  page.driver.browser.mouse.double_click(element.native)
  sleep 3
  actualvalues =find(:xpath,".//*[@id='00N3600000PFAvt']").all('option').collect(&:text)
  puts "actual values =  #{actualvalues}"
  expectedvalues =  ["--None--", "Open", "CS - Backdated - BKD", "CS - Co-term Long - CTL", "CS - Co-term Short - CTS", "CS - Discount - DIS", "CS - Multi-year Advance - MYA", "CS - Multi-year Annual - MYY", "CS - Pricing Change - PRC", "CS - Re-Cert Fee Included - RCT", "CS - Renewed at Par - R@P", "CS - Service Downgrade - DNG", "CS - Service Upgrade - UPG", "CS - Uncovered – UNC", "HA - Bad Data - BDT", "HA - Cancelled - CNL", "HA - Covered - COV", "HA - Duplicate - DUP", "HA - End of Life - EOL", "HA - Other - OTH", "HA - Product Return - PRT", "HA - Sales Pull Back – SPB", "HA - Client Product Replacement - CPR", "HA - System Relocation - SRL", "NS - Customer No Longer Exists - RNE", "NS - Customer Satifaction Driven - SSD", "NS - Product Decommissioned - PPD", "NS - Unresponsive End User - REU", "NS - Cost Benefit/Budget - CBB", "NS - Cost Benefit/Value - CBV", "NS - Instrument Low Usage - ILU", "NS - In-House Service Provider - ISP", "NS - Time and Materials - TNM", "NS - Competitive Product Replacement - PCP", "NS - Competitive Service Loss Other - SCS"]
  puts "expected values = #{expectedvalues}"
  if actualvalues.sort == expectedvalues.sort
    puts "expected values are visible in Renewal Status picklist"
  else
    writeFailure "expected values are not visible in Renewal Status picklist"
  end
end

When(/^I search existing opportunity and click$/) do
  fill_in("phSearchInput", :with=> "Smoke_test_opportinity_4991")
  sleep 5
  find(:xpath,".//*[@id='phSearchButton']").click
  sleep 5
  click_on "Smoke_test_opportinity_4991"
  sleep 20
end

Then(/^I enter end date field value$/) do
  sleep 2
  if page.has_field?("00N3600000PFBaM01u5B000000pO52")
    fill_in("00N3600000PFBaM01u5B000000pO52", :with=> "11/7/2017")
  else
    writeFailure "End Date field is not present"
  end
end

Then(/^I enter quantity field value$/) do
  sleep 20
  if page.has_field?("Quantity")
    fill_in("Quantity", :with=> "10")
  else
    writeFailure "Quantity field is not present"
  end
end

Then(/^I enter sales price field value$/) do
  sleep 2
  if page.has_field?("UnitPrice01u5B000000pO52")
    fill_in("UnitPrice01u5B000000pO52", :with=> "100")
  else
    writeFailure "sales price field is not present"
  end
end

Then(/^I select value from batch type field$/) do
  if page.has_field?("00N3600000PFBi501u5B000000pO52")
    select("Renewal", :from => "00N3600000PFBi501u5B000000pO52")
  else
    writeFailure "batch type field is not available"
  end
end

Then(/^I click on "([^"]*)" button under add quote line items to page$/) do |button_name|
  within('.genericTable') do
    sleep 2
    click_on(button_name, match: :first)
  end
end

Then(/^I click on "([^"]*)" button$/) do |button_name|
  sleep 5
  main = page.driver.browser.window_handles.first
  popup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.window(popup)
  within("div#syncQuoteOverlay_buttons") do #within("div#syncQuoteOverlay_buttons") --> id is used inside within
    click_on(button_name)
  end
  page.driver.browser.switch_to.window(main)
end

Then(/^I click on opportunity name link$/) do
  within all('.pbSubsection')[0] do
  sleep 4
  puts page.find(:xpath, "//div[@id='Opportunity_ileinner']/a").text
  page.find(:xpath, "//div[@id='Opportunity_ileinner']/a").click
  sleep 5
  end
end

Then(/^I enter data to all mandatory fields under renewable line item$/) do
  sleep 5
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Existing Product Lookup (New Window)']").click
  sleep 2
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
    sleep 5
    table.all('tr')[1].all('th')[0].find('a').click
  end
  page.driver.browser.switch_to.window(main)
  sleep 5

  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Owner Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  sleep 2
  if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsrepsit")
    fill_in("lksrch",:with=> "Operations")
  else
    if (ENV['UserRole'] == "salesmgrsit") || (ENV['UserRole'] == "salesrepsit") || (ENV['UserRole'] == "salesopssit")
      fill_in("lksrch",:with=> "Sales")
    else
      if (ENV['UserRole'] == "Admin")
        fill_in("lksrch",:with=> "DSIntegration")
      end
    end
  end
  sleep 5
  find_button('Go!').click
  sleep 4
  page.driver.browser.switch_to.window(lookup)
  page.driver.browser.switch_to.frame("resultsFrame")
  within('.pbBody') do
    sleep 2
    if (ENV['UserRole'] == "opsmgrsit")
      click_on "Operations Manager Alcon"
      puts "assigned to Operations Manager Alcon"
      sleep 2
    else if (ENV['UserRole'] == "opsrepsit")
        click_on "Operations Rep Alcon"
        puts "assigned to Operations Rep Alcon"
        sleep 2
      else if (ENV['UserRole'] == "salesmgrsit")
          click_on "Alcon Sales Manager"
          puts "assigned to Sales Manager Guidance"
          sleep 2
        else if (ENV['UserRole'] == "salesrepsit")
            click_on "Sales Rep Alcon"
            puts "assigned to Sales Rep Guidance"
            sleep 2
          else if (ENV['UserRole'] == "Admin")
              click_on "DSIntegration Admin"
              puts "assigned to DSIntegration Admin"
              sleep 2
            else if (ENV['UserRole'] == "salesopssit")
                click_on "Sales Ops Alcon"
                puts "assigned to Sales Ops Guidance"
                sleep 2
              end
            end
          end
        end
      end
    end
  end
  page.driver.browser.switch_to.window(main)
  sleep 10
  
  within('.pbSubsection') do
    if page.has_field?("Existing Start Date")
        fill_in("Existing Start Date",:with => "10/3/2016")
        puts "value for Existing Start Date field is entered"
      else
        puts "Existing Start Date field is not available"
      end
    if page.has_field?("New Start Date")
        fill_in("New Start Date",:with => "11/3/2016")
        puts "value for New Start Date field is entered"
    else
        puts "New Start Date field is not available"
    end
      if page.has_field?("Quantity")
      fill_in("Quantity",:with => "10")
        puts "value for Quantity field is entered"
    else
        puts "Quantity field is not available"
    end
      if page.has_field?("Existing End Date")
      fill_in("Existing End Date",:with => "11/3/2016")
        puts "value for Existing End Date field is entered"
    else
        puts "Existing End Date field is not available"
    end
      if page.has_field?("New End Date")
      fill_in("New End Date",:with => "11/3/2016")
        puts "value for New End Date field is entered"
    else
        puts "New End Date field is not available"
    end
    if page.has_field?("Previous Price")
      fill_in("Previous Price",:with => "20")
      puts "value for Previous Price field is entered"
    else
      puts "Previous Price field is not available"
    end
  end 
end


Then(/^I click on "([^"]*)" button under renewable line item section$/) do |button_name|
  sleep 3
  within all('.pbHeader')[2] do
    click_on button_name
  end
end

Then(/^I click on renewal opportunity link$/) do
  sleep 3
  puts page.find(:xpath, "//div[@id='CF00N3600000PFKcf_ileinner']/a").text
  page.find(:xpath, "//div[@id='CF00N3600000PFKcf_ileinner']/a").click
  sleep 2
end

Then(/^I click on "([^"]*)" button in renewable line item section$/) do |button_name|
  within('.pbHeader') do
    click_on button_name
  end
end

Then(/^I select any existing product line on the list$/) do
  page.find(:xpath, ".//*[@id='renewalRelationshipGrid']/tbody/tr[1]/td[1]/input").click
end

Then(/^I click on renewal status button$/) do  
  page.find(:xpath, ".//*[@id='updateRRStatus']").click
end

Then(/^I check that existing contract number field is visible$/) do
  within all('.pbSubsection')[0] do
      if page.has_field?("Existing Contract Number")
        puts "Existing Contract Number field is visible"
      else
        writeFailure "Existing Contract Number field is not visible"
      end
  end
end

Then(/^I check that SSI Result Reason field is visible$/) do
  within all('.pbSubsection')[0] do
      if page.has_field?("SSI Result Reason")
        puts "SSI Result Reason field is visible"
      else
        writeFailure "SSI Result Reason field is not visible"
      end
  end
end

Then(/^I check the SSI Result Reason picklist values$/) do
begin
    sleep 5
    arg = getOpportunitiesDetails 'opportunity_details'
    if page.has_select?("SSI Result Reason")
      puts "SSI Result Reason field is present and a picklist field"
      within all('.pbSubsection')[0] do
        actualvalue =find(:xpath, "//*[contains(@name, 'SSI Result Reason')]").all('option').collect(&:text)
        puts "actual values = #{actualvalue}"
        expectedvalue =Array.new
        expectedvalue = arg["SSI_Result_Reason"]
        puts "expectedvalues =  #{expectedvalue}"
        if  actualvalue.sort == expectedvalue.sort
          puts "expected values are visible in new record picklist"
        else
          writeFailure "expected values are not visible in new record picklist"
        end
      end
    else
      writeFailure "SSI Result Reason picklist is not present"
    end
  end
end