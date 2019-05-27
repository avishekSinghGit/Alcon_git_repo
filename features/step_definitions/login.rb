#Step definition to enter the credentials in Emea login page
When(/^I enter the credentials to the Zenith application$/) do
  visit env
  sleep 30
  arg =getCredentialInfo
  fill_in "Username",:with => arg["Username"]
  fill_in "Password",:with => arg["Password"]
  find(:id,"Login").click
  puts "Logged in successfully"
  sleep 60
end

#Step definition login as BA
When(/^I login as BA$/) do
 visit env
  sleep 30
  arg =logIn_As_BA
  fill_in "Username",:with => arg["Username"]
  fill_in "Password",:with => arg["Password"]
  find(:id,"Login").click
  sleep 60
  if page.has_xpath?('//a[text()="Remind Me Later"]')
    find(:xpath, '//a[text()="Remind Me Later"]').click
  end
  puts "Logged in successfully"
  sleep 40
end

def logIn_As_BA
  yamlinput = "./features/support/test_data/Login.yml"
  myoptions = YAML.load_file(yamlinput)
  myoptions["Admin"]
end

Then(/^I should see the following:$/) do |text|
 page.should have_content(text)
end
