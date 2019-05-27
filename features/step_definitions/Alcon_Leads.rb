Then(/^I enter value to all the mandatory field under new lead$/) do
   sleep 3
  within all('.pbSubsection')[0] do
    if page.has_field?("name_salutationlea2")
      $fist_name = "Smoke_test_Leads_"+ Random.new.rand(1..20000).to_s
      $last_name = "01"
      fill_in "name_firstlea2",:with => $fist_name
      fill_in "name_lastlea2",:with => $last_name
      puts "Lead name is entered"
    end
    if page.has_field?("Company")
      fill_in("Company",:with=> "Smoke_test_PET")
    end
    if page.has_select?("Lead Currency")
      select("USD - U.S. Dollar", :from => "Lead Currency")
    end
    if page.has_select?("Lead Status")
      select("New", :from => "Lead Status")
    end
  end
end
