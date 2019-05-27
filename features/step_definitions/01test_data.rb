Given(/^I should navigate to "Accounts" tab in emea application$/) do
  sleep 5
  step 'I enter the credentials to the Zenith application'
  puts "Accounts tab is clicked"
  click_on "Accounts"
end

Given(/^I should navigate to "([^"]*)" tab in saleforce application$/) do |tab|
  step 'I enter the credentials to the Zenith application'
  sleep 30
  click_link(tab)
  sleep 30
end

Given(/^I should navigate to "([^"]*)" tab$/) do |tab|
  sleep 5
  click_link(tab)
  sleep 5
end



When(/^I click on new button$/) do
  sleep 5
  within('.bRelatedList') do
    sleep 3
    within('.pbHeader') do
      click_on " New "
      puts "clicked on new button"
    end
  end
end

When(/^I enter data to reqired fields under new contacts section$/) do
  sleep 3
  within all('.pbSubsection')[0] do
    if page.has_field?("name_salutationcon2")
      $fist_name = "Smoke_test_contacts_"+ Random.new.rand(1..20000).to_s
      $last_name = "01"
      fill_in "name_firstcon2",:with => $fist_name
      fill_in "name_lastcon2",:with => $last_name
      puts "contact name is entered"
    end
  end
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Account Name Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke_test_accounts")
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


Then(/^I select opportunity edit from record type of new record$/) do
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

Then(/^I enter data to required fields under new opportunity section$/) do
  within all('.pbSubsection')[0] do
    sleep 2
    $opp_name = "Smoke_test_opportinity_"+ Random.new.rand(1..20000).to_s
    fill_in("Opportunity Name", :with=> $opp_name)
    puts "opportunity name is: #{$opp_name}"
    sleep 2
    if page.has_field?("opp11")
      select("Contacted", :from => "opp11")
      puts "value for stage field is selected"
    else
      puts "stage field is not available"
    end
    sleep 2
    if page.has_field?("opp9")
      fill_in("opp9",:with => "5/17/2017")
      puts "value for close date field is entered"
    else
      puts "close date field is not available"
    end
  end
  if page.has_field?("Opportunity Type")
    select("Enterprise", :from => "00N3600000PFBg4")
    puts "value for Opportunity Type field is selected"
  else
    puts "Opportunity Type field is not available"
  end
  if page.has_field?("Business Line")
    select("Core", :from => "Business Line")
    puts "value for Business Line field is selected"
  else
    puts "Business Line field is not available"
  end
  if page.has_field?("00N3600000PFBew")
    select("Central", :from => "00N3600000PFBew")
    puts "value for Client Territory field is selected"
  else
    puts "Client Territory field is not available"
  end
  if page.has_field?("00N3600000PFBeu")
    select("New York", :from => "00N3600000PFBeu")
    puts "value for Client Region field is selected"
  else
    puts "Client Region field is not available"
  end
  if page.has_field?("Country")
    select("United States", :from => "Country")
    puts "value for Country field is selected"
  else
    puts "Country field is not available"
  end
  if page.has_field?("00N3600000PFBgF")
    select("NALA", :from => "00N3600000PFBgF")
    puts "value for SSI Theatre field is selected"
  else
    puts "SSI Theatre field is not available"
  end
  if page.has_field?("opp16")
    select("USD - U.S. Dollar", :from => "opp16")
    puts "value for Opportunity Currency field is selected"
  else
    puts "Opportunity Currency field is not available"
  end
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Account Name Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Smoke_test_accounts")
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

  sleep 3
  page.driver.browser.window_handles.first
  main = page.driver.browser.window_handles.first
  find("img[alt='Price Book Lookup (New Window)']").click
  sleep 2
  page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
  lookup = page.driver.browser.window_handles.last
  page.driver.browser.switch_to.frame("searchFrame")
  fill_in("lksrch",:with=> "Standard")
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



Given(/^I enter value to all the mandatory field under new account section$/) do
  within all('.pbSubsection')[0] do
    sleep 2
    $account_name = "Smoke_test_accounts_"+ Random.new.rand(1..20000).to_s
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
end

Then(/^I click on the just created account name$/) do
  within('.pbHelp') do
    sleep 2
    select("Recently Created", :from => "hotlist_mode")
    puts "Recently created accounts are selected"
  end
  within('.pbBody') do
    sleep 2
    find_link($account_name).click
    puts "#{$account_name} is selected"
  end
end

Then(/^I note the contact name created above$/) do
  within all('.pbSubsection')[0] do
    table= all("tbody")[0]
    $contact_name = all('tr')[0].all('td')[1].all('div')[0].text
    puts $contact_name
  end
end

And(/^I enter data to reqired fields under new location address section$/) do
  if page.has_field?("Location Address Name")
    $location_address = "Smoke_test_"+ Random.new.rand(100..30000).to_s
    fill_in("Location Address Name",:with=> $location_address)
    puts "Location Address Name field is available"
  else
    writeFailure "Location Address Name field is not available"
  end
end

And(/^I enter data to reqired fields under new product section$/) do
  if page.has_field?("Name")
    $product_name = "smoke_test_product_"+ Random.new.rand(1..30000).to_s
    fill_in("Name", :with=> $product_name)
  end
  if page.has_field?("Product Currency")
    select("USD - U.S. Dollar", :from => "Product Currency")
    puts "value for Product Currency is selected"
  end
  if page.has_field?("IsActive")
    find(:id, "IsActive").click
    puts "Active checkbox is checked"
  end
end

And(/^I enter value to standard price$/) do
  sleep 2
  if page.has_xpath?(".//td[contains(text(), 'USD - U.S. Dollar')]/following-sibling::td/input[@title='Unit Price']")
    find(:xpath, ".//td[contains(text(), 'USD - U.S. Dollar')]/following-sibling::td/input[@title='Unit Price']").set("10")
  end
  sleep 2
end

And(/^I click on save button under add standard price$/) do
  sleep 2
  click_on("Save", match: :first)
end


When(/^I created new contact record "([^"]*)" as test data$/) do |contact_name|
  step 'I login as BA'
  sleep 3
  flag=0
  find(:xpath, '//input[@title="Search..."]').set contact_name
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 10

  if page.has_xpath?('//div[contains(@class,"contactBlock")]//a[text()="'"#{contact_name}"'"]')
    flag=0
  elsif page.has_xpath?('//div[text()="No matches found"]')
    flag=1
  end

  if flag==1
    step 'I login as BA'
    step 'I navigate to "Contacts" tab in the application'
    step 'I follow on "New" button'

    #$last_name = "Smoke_test_contacts_Avi"
    if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//span//input')
      find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//span//input').set "Smoke-Test_Account-Avi"
      puts "Entered -- Smoke_test_accounts_avi -- in account name field"
    else
      writeFailure "Fail to enter data in - Account Name - field "
    end
    if page.has_xpath?('//label[text()="Last Name"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Last Name"]/parent::td[1]/following-sibling::td[1]//input').set contact_name
      puts "Entered -- #{contact_name} -- in last name field"
    else
      writeFailure "Fail to enter data in last name field"
    end
    step 'I click Save button from top button row'
    step 'The "Contacts" record should save seccessfully'
    step 'I selected "Logout" from user menu'
  end
end

When(/^I created new account record "([^"]*)" as test data$/) do |account_name|
  sleep 3
  step 'I login as BA'
  
  flag=0
  find(:xpath, '//input[@title="Search..."]').set account_name
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 10

  if page.has_xpath?('//div[contains(@class,"accountBlock")]//a[text()="'"#{account_name}"'"]')
    flag=0
  elsif page.has_xpath?('//div[text()="No matches found"]')
    flag=1
  end

  if flag==1
    #step 'I login as BA'
    step 'I navigate to "Accounts" tab in the application'
    step 'I follow on "New" button'

    if page.has_xpath?('//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Account Name"]/parent::td[1]/following-sibling::td[1]//input').set account_name
      puts "Enter - #{account_name} - in account name field"
    else
      writeFailure "Fail to enter data in - Account Name - field "
    end
    
    if page.has_xpath?('//label[text()="Account Currency"]/parent::td[1]/following-sibling::td[1]//select')
      find(:xpath, '//label[text()="Account Currency"]/parent::td[1]/following-sibling::td[1]//select').select "USD - U.S. Dollar"
      puts "The option -- USD - U.S. Dollar -- is selected from -- Account Currency -- dropdown"
    end

    step 'I click Save button from top button row'
    step 'The "Account" record should save seccessfully'
    step 'I selected "Logout" from user menu'

  end
end


When(/^I created new asset record "([^"]*)" as test data$/) do |asset_name|
  sleep 3
  step 'I login as BA'

  flag=0
  find(:xpath, '//input[@title="Search..."]').set asset_name
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 10

  if page.has_xpath?('//div[contains(@class,"assetBlock")]//a[text()="'"#{asset_name}"'"]')
    flag=0
  elsif page.has_xpath?('//div[text()="No matches found"]')
    flag=1
  elsif page.has_xpath?('//div[contains(@class,"assetBlock")]//a[text()="'"#{asset_name}"'"]')==false
    flag=1
  end

  if flag==1
    #step 'I login as BA'
    step 'I navigate to "Assets" tab in the application'
    step 'I follow on "New" button'

    if page.has_xpath?('//label[text()="Asset Name"]/parent::td[1]/following-sibling::td[1]//input')
      find(:xpath, '//label[text()="Asset Name"]/parent::td[1]/following-sibling::td[1]//input').set asset_name
      puts "Enter - #{asset_name} - in account name field"
    else
      writeFailure "Fail to enter data in - Asset Name - field "
    end
    if page.has_xpath?('//label[text()="Account"]/parent::td[1]/following-sibling::td[1]//span/input')
      find(:xpath, '//label[text()="Account"]/parent::td[1]/following-sibling::td[1]//span/input').set "Smoke-Test_Account-Avi"
      puts "Enter - Smoke-Test_Account-Avi - in account name field"
    else
      writeFailure "Fail to enter data in - Account Name - field "
    end
    if page.has_xpath?('//label[text()="Contact"]/parent::td[1]/following-sibling::td[1]//span/input')
      find(:xpath, '//label[text()="Contact"]/parent::td[1]/following-sibling::td[1]//span/input').set "Smoke-Test_Contact-Avi"
      puts "Enter - Smoke-Test_Contact-Avi - in Contact field"
    else
      writeFailure "Fail to enter - 1234 - in account Number field "
    end
    
    step 'I click Save button from top button row'
    step 'The "Asset" record should save seccessfully'
    step 'I selected "Logout" from user menu'

  end
end

When(/^I search and open the existing asset "([^"]*)"$/) do |asset_name|
  sleep 3
  find(:xpath, '//input[@title="Search..."]').set asset_name
  sleep 5
  find(:xpath, '//input[@value="Search"]').click
  sleep 10
  
  if page.has_xpath?('//div[contains(@class,"assetBlock")]//a[text()="'"#{asset_name}"'"]')
    find(:xpath, '//div[contains(@class,"assetBlock")]//a[text()="'"#{asset_name}"'"]').click
    puts "The asset - #{asset_name} - is found and selected"
  elsif page.has_xpath?('//div[text()="No matches found"]')
    writeFailure "Fail to locate asset - #{asset_name}"
  elsif page.has_xpath?('//div[contains(@class,"assetBlock")]//a[text()="'"#{asset_name}"'"]')==false
    writeFailure "Fail to locate asset - #{asset_name}"
  end
end