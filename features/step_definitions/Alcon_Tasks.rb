

When(/^I click on "([^"]*)" button from "([^"]*)" section$/) do |new, my_task|
  begin
    sleep 3
    if page.has_xpath?("//input[@title='New Task']")
      find(:xpath,"//input[@title='New Task']").click
      sleep 2
      puts "Successfully click the #{new} button from #{my_task} section"
    else
      putstr "Failed to see the #{new} button from #{my_task} section"
    end
  rescue Exception => ex
    putstr "Error occurred while clicking on #{new} button from #{my_task} section"
  end
end


And(/^I able to see the "([^"]*)" tasks pickList fields$/) do |field|
  begin
    sleep 2
    arg = getDetails 'NewTaskInformation'

    if page.has_css?("#p3")

      puts "Successfully see the #{field} pickList"

      $task_types = []

      all(:xpath,"//select[@id='p3']/option").each do |options|

        $task_types << options.text
      end

        if $task_types.include?arg["TaskStandard"]
          puts "Successfully see the #{field} pickList value: #{arg["TaskStandard"]}"
        else
          putstr "Failed to see the #{field} pickList value: #{arg["TaskStandard"]}"
        end

        if $task_types.include?arg["TaskEmail"]
          puts "Successfully see the #{field} pickList value: #{arg["TaskEmail"]}"
        else
          putstr "Failed to see the #{field} pickList value: #{arg["TaskEmail"]}"
        end

        if $task_types.include?arg["TaskPhoneCalls"]
          puts "Successfully see the #{field} pickList value: #{arg["TaskPhoneCalls"]}"
        else
          putstr "Failed to see the #{field} pickList value: #{arg["TaskPhoneCalls"]}"
        end

        if $task_types.include?arg["TaskFax"]
          puts "Successfully see the #{field} pickList value: #{arg["TaskFax"]}"
        else
          putstr "Failed to see the #{field} pickList value: #{arg["TaskFax"]}"
        end

    else
      putstr "Failed to see the #{field} pickList"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} pickList values"
  end
end


And(/^I fill the task required fields$/) do
  begin
    sleep 3
    arg = getDetails 'NewTaskInformation'

    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Name Lookup (New Window)']").click
    sleep 2
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> arg["TaskContactName"])
    sleep 5
    find_button('Go!').click
    sleep 4
    page.driver.browser.switch_to.window(lookup)
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.pbBody') do
      all("tbody")[0].all('tr')[1].all('th')[0].find('a').click
    end
    sleep 2
    page.driver.browser.switch_to.window(main)
    sleep 2


    page.driver.browser.switch_to.window(main)
    sleep 4
    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Related To Lookup (New Window)']").click
    sleep 2
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> arg["TaskRelatedTo"])
    sleep 2
    find_button('Go!').click
    sleep 2
    page.driver.browser.switch_to.window(lookup)
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.pbBody') do
      sleep 3
      all("tbody")[0].all('tr')[1].all('th')[0].find('a').click
    end
    page.driver.browser.switch_to.window(main)
    sleep 4

    within all(".pbSubsection")[1] do

      if page.has_select?(arg["TasksPriorityField"])
        select(arg["TasksPriorityValue"], :from => arg["TasksPriorityField"])
      end

      if page.has_select?(arg["TasksStatusField"])
        select(arg["TasksStatusValue"], :from => arg["TasksStatusField"])
      end

      if page.has_content?(arg["TasksDueDateField"])
        fill_in arg["TasksDueDateField"],:with => arg["TasksDueDateValue"]
      end

    end
    sleep 2

    within all(".pbSubsection")[2] do

      $create_task = "#{arg["TaskSubjectName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"

      sleep 3
      if page.has_content?(arg["TasksSubjectField"])
        fill_in arg["TasksSubjectField"], :with => $create_task
      end

       sleep 3
      if page.has_content?(arg["TasksCommentsField"])
        fill_in arg["TasksCommentsField"],:with => arg["TaskComments"]
      end

      if page.has_select?(arg["TaskDirectionField"])
        select(arg["TaskDirectionValue"], :from => arg["TaskDirectionField"])
      end

    end
    sleep 3
    puts "Successfully fill the task required fields"
  rescue Exception => ex
    putstr "Error occurred while filling the task required fields"
  end
end


Then(/^I able to see the created "([^"]*)" successfully$/) do |task_type|
  begin
  sleep 3
  arg = getDetails 'NewTaskInformation'

  if page.has_content?(arg["MyTasksSection"])
    puts "Successfully see the #{arg["MyTasksSection"]} section"
    sleep 3
    if page.has_css?(".pShowMore")
      sleep 3
      puts "Successfully see the Task Pagination"
      within(".pShowMore") do
        first("a").click
      end
      puts "Successfully clicked the Task Pagination"
      sleep 3
    end
    sleep 3
    unless page.has_content?(arg["NoOpenTasksMessage"])
     within(".bMyTask") do
      within(".list") do
       if first("tbody").all(".dataRow").count > 0
         tr = first("tbody").all(".dataRow")
         sleep 3
         result = false
         tr.each do |row|
           if row.all("td")[2].all("a")[0].text == $create_task
             puts "Successfully created the #{task_type} Task: #{$create_task}"
             result = true
           end
         end
         putstr "Failed to create the #{task_type} Task: #{$create_task}" unless result
         sleep 3
       else
         putstr "No Tasks are available"
       end
      end
     end
    else
      putstr "You have no open tasks scheduled for this period"
    end
  else
    putstr "Failed to created the #{task_type} Task"
  end
  rescue Exception => ex
    putstr "Error occurred while creating the #{task_type} Task"
  end
end


When(/^I select the "([^"]*)" pickList value from "([^"]*)" section$/) do |option, section|
  sleep 3
  if page.has_content?(section)
    puts "Successfully see the #{section} section"
   if page.has_css?("#tasklist_mode")
      puts "Successfully see the #{section} pickList"
      sleep 2
      result = false
      find("#tasklist_mode").all('option').each do |record_type|

        if record_type.text.to_s == option.to_s
          puts "Successfully see the #{section} pickList value: #{option}"
          result = true
          sleep 3
          find("#tasklist_mode").send_keys option
          puts "Successfully selected the #{section} pickList value: #{option}"
          sleep 4
        end
      end
      raise "Failed to see the #{section} pickList value: #{option}" unless result
      sleep 3
    else
      putstr "Failed to see the #{section} pickList"
    end
  else
    putstr "Failed to see the #{section} section"
  end
end


And(/^I should not able to see the "([^"]*)" button$/) do |button_name|
  begin
    sleep 3
    unless page.has_button?(button_name)
      puts "Unable to see the #{button_name} button"
    else
      putstr "Able to see the #{button_name} button"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{button_name} button"
  end
end


When(/^I open the created "([^"]*)" Task record$/) do |task_type|
  begin
    sleep 3
    arg = getDetails 'NewTaskInformation'

    if page.has_content?(arg["MyTasksSection"])
      puts "Successfully see the #{arg["MyTasksSection"]} section"
      sleep 3
      if page.has_css?(".pShowMore")
        sleep 3
        puts "Successfully see the Task Pagination"
        within(".pShowMore") do
          first("a").click
        end
        puts "Successfully clicked the Task Pagination"
        sleep 3
      end
      sleep 3
      unless page.has_content?(arg["NoOpenTasksMessage"])
        within(".bMyTask") do
          within(".list") do
            if first("tbody").all(".dataRow").count > 0
              tr = first("tbody").all(".dataRow")
              sleep 3
              result = false
              tr.each do |row|
                if row.all("td")[2].all("a")[0].text == $create_task
                  puts "Successfully created the #{task_type} Task: #{$create_task}"
                  row.all("td")[2].all("a")[0].click
                  sleep 4
                  result = true
                  break
                end
              end
              putstr "Failed to create the #{task_type} Task: #{$create_task}" unless result
              sleep 3
            else
              putstr "No Tasks are available"
            end
          end
        end
      else
        putstr "You have no open tasks scheduled for this period"
      end
    else
      putstr "Failed to created the #{task_type} Task"
    end
  rescue Exception => ex
    putstr "Error occurred while creating the #{task_type} Task"
  end
end


When(/^I verify the "([^"]*)" related list$/) do |items_to_approve|
  begin
    sleep 3
    arg = getDetails 'NewTaskInformation'

    if page.has_content?(items_to_approve)
       puts "Successfully see the #{items_to_approve} related section"

        within(".listRelatedObject.processInstanceWorkitemBlock") do

          if page.has_css?("#PendingProcessWorkitemsList_title")
            puts "Successfully see the #{items_to_approve} related section"
          else
            putstr "Failed to see the #{items_to_approve} related section"
          end

        end
    else
      putstr "Failed to see the #{items_to_approve} related section"
    end
  rescue Exception => ex
    putstr "Error occurred while creating the #{items_to_approve} related section"
  end
end


When(/^I able to see the "([^"]*)" related list should be available for OpsMgr and SalesMgr$/) do |items_to_approve|
  begin
    sleep 2

    if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "salesmgrsit")

      if page.has_content?(items_to_approve)
        puts "Successfully see the #{items_to_approve} field"

        if page.has_css?("#PendingProcessWorkitemsList_title")
           puts "Successfully see the #{items_to_approve} related section"

           within(".listRelatedObject.processInstanceWorkitemBlock") do
             within(".list") do
               if first("tbody").all(".dataRow").count > 0
                 puts "Successfully see the #{items_to_approve} record from #{items_to_approve} related section"
               else
                 putstr "Failed to see the #{items_to_approve} record from #{items_to_approve} related section"
               end
             end
           end

        else
           putstr "Failed to see the #{items_to_approve} related section"
        end
      else
        putstr "Failed to see the #{items_to_approve} field"
      end
    else
      if (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "opsrepsit") || (ENV['UserRole'] == "salesrepsit") || (ENV['UserRole'] == "salesopssit")

        if page.has_content?(items_to_approve)
          puts "Successfully see the #{items_to_approve} field"

          if page.has_css?("#PendingProcessWorkitemsList_title")
            puts "Successfully see the #{items_to_approve} related section"

            within(".listRelatedObject.processInstanceWorkitemBlock") do
              within(".list") do
                if first("tbody").all(".dataRow").count > 0
                  puts "Successfully see the #{items_to_approve} record from #{items_to_approve} related section"
                else
                  putstr "Failed to see the #{items_to_approve} record from #{items_to_approve} related section"
                end
              end
            end

          else
            putstr "Failed to see the #{items_to_approve} related section"
          end
        else
          putstr "Failed to see the #{items_to_approve} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{items_to_approve} related list should be available for OpsMgr and SalesMgr"
  end
end



And(/^I verify the "([^"]*)" text box field is visible$/) do |competitor_name|
  begin
    sleep 2
    arg = getDetails 'NewTaskInformation'

    if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsrepsit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "salesmgrsit") || (ENV['UserRole'] == "salesrepsit")
      $task_fields = false
      if page.has_content?(competitor_name)
        puts "Successfully see the #{competitor_name} field"
        within all(".pbSubsection")[1] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[0].text == competitor_name
              if row.all("td")[1].first("input")[:type] == arg["TasksTextBoxType"]
                puts "Successfully see the #{competitor_name} text box field is editable"
                $task_fields = true
                result = true
                break
              else
                putstr "Failed to see the #{competitor_name} text box field is Read Only"
              end
            end
          end
          putstr "Failed to see the #{competitor_name} text box field" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{competitor_name} field"
      end
    else
      if (ENV['UserRole'] == "salesopssit")
        $task_fields = false
        if page.has_content?(competitor_name)
          puts "Successfully see the #{competitor_name} field"
          within all(".pbSubsection")[1] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[0].text == competitor_name
                begin
                  if row.all("td")[1].first("input")[:type] == arg["TasksTextBoxType"]
                    putstr "#{competitor_name} text box field is editable"
                    $task_fields = true
                    result = true
                    break
                  end
                rescue
                  puts "#{competitor_name} text box field is Read Only"
                  $task_fields = true
                  result = true
                  break
                end
              end
            end
            putstr "Failed to see the #{competitor_name} text box field" unless result
            sleep 3
          end
        else
          putstr "Failed to see the #{competitor_name} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{competitor_name} field is visible"
  end
end


And(/^I verify the "([^"]*)" text box field editable permissions except SalesOps$/) do |competitor_name|
  begin
    sleep 3
    arg = getDetails 'NewTaskInformation'

    if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsrepsit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "salesmgrsit") || (ENV['UserRole'] == "salesrepsit")

      if page.has_content?(competitor_name)
        puts "Successfully see the #{competitor_name} field"
        within all(".pbSubsection")[1] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[0].text == competitor_name
              if $task_fields == true
                if row.all("td")[1].first("input")[:type] == arg["TasksTextBoxType"]
                  puts "#{competitor_name} pickList field is editable"
                  result = true
                  break
                else
                  putstr "#{competitor_name} text box field is Read Only"
                end
              else
                putstr "#{competitor_name} text box field is not visible"
              end
            end
          end
          putstr "Failed to see the #{competitor_name} text box field" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{competitor_name} field"
      end
    else
      if (ENV['UserRole'] == "salesopssit")
        if page.has_content?(competitor_name)
          puts "Successfully see the #{competitor_name} field"
          within all(".pbSubsection")[1] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[0].text == competitor_name
                if $task_fields == true
                  begin
                    if row.all("td")[1].first("div").first("input")[:type] == arg["TasksTextBoxType"]
                      putstr "#{competitor_name} text box field is editable"
                      result = true
                      break
                    end
                  rescue
                    puts "#{competitor_name} text box field is Read Only"
                    result = true
                    break
                  end
                else
                  putstr "#{competitor_name} text box field is not visible"
                end
              end
            end
            putstr "Failed to see the #{competitor_name} text box field" unless result
            sleep 3
          end
        else
          putstr "Failed to see the #{competitor_name} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{competitor_name} pickList field is editable"
  end
end



And(/^I able to see the "([^"]*)" field is visible$/) do |field|
  begin
    sleep 2
    if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsrepsit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "salesmgrsit") || (ENV['UserRole'] == "salesrepsit")
      $task_fields = false
      if page.has_content?(field)
        puts "Successfully see the #{field} field"
        within all(".pbSubsection")[1] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[2].text == field
              health_status = row.all("td")[3].first("span").first("select").all('option').collect(&:text)
              if health_status.count > 0
                puts "Successfully see the #{field} pickList field is visible"
                $task_fields = true
                result = true
                break
              else
                putstr "Failed to see the #{field} pickList field is not visible"
              end
            end
          end
          putstr "Failed to see the #{field} pickList field" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{field} field"
      end
    else
      if (ENV['UserRole'] == "salesopssit")
        $task_fields = false
        if page.has_content?(field)
          puts "Successfully see the #{field} field"
          within(".pbSubsection") do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[2].text == field
                begin
                  health_status = row.all("td")[3].first("span").first("select").all('option').collect(&:text)
                  if health_status.count > 0
                    putstr "Successfully see the #{field} pickList field is visible"
                    $task_fields = true
                    result = true
                    break
                  end
                rescue
                  puts "Failed to see the #{field} pickList field is not visible"
                  $task_fields = true
                  result = true
                  break
                end
              end
            end
            putstr "Failed to see the #{field} pickList field" unless result
            sleep 3
          end
        else
          putstr "Failed to see the #{field} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} field is visible"
  end
end


And(/^I able to see the "([^"]*)" field editable permissions except SalesOps$/) do |field|
  begin
    sleep 3

    if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsrepsit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "salesmgrsit") || (ENV['UserRole'] == "salesrepsit")

      if page.has_content?(field)
        puts "Successfully see the #{field} field"
        within all(".pbSubsection")[1] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[2].text == field
              if $task_fields == true
                health_status = row.all("td")[3].first("span").first("select").all('option').collect(&:text)
                if health_status.count > 0
                  puts "#{field} pickList field is editable"
                  result = true
                  break
                else
                  putstr "#{field} text box field is Read Only"
                end
              else
                putstr "#{field} text box field is not visible"
              end
            end
          end
          putstr "Failed to see the #{field} text box field" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{field} field"
      end
    else
      if (ENV['UserRole'] == "salesopssit")
        if page.has_content?(field)
          puts "Successfully see the #{field} field"
          within all(".pbSubsection")[1] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[2].text == field
                if $task_fields == true
                  begin
                    health_status = row.all("td")[3].first("span").first("select").all('option').collect(&:text)
                    if health_status.count > 0
                      putstr "#{field} text box field is editable"
                      result = true
                      break
                    end
                  rescue
                    puts "#{field} text box field is Read Only"
                    result = true
                    break
                  end
                else
                  putstr "#{field} text box field is not visible"
                end
              end
            end
            putstr "Failed to see the #{field} text box field" unless result
            sleep 3
          end
        else
          putstr "Failed to see the #{field} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{field} pickList field is editable"
  end
end


And(/^I verify the "([^"]*)" pickList values$/) do |health_status|
  begin
    sleep 2
    arg = getDetails 'TasksHealthStatusPickListValues'

    sleep 2
    if page.has_content?(health_status)
      puts "Successfully see the #{health_status} field"

      if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsrepsit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "salesmgrsit") || (ENV['UserRole'] == "salesrepsit")

            within all(".pbSubsection")[1] do
              tr = first("tbody").all("tr")
              sleep 3
              result = false
              tr.each do |row|
                if row.all("td")[2].text == health_status

                  if $task_fields == true
                    result = true
                    $health_status_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)

                    if $health_status_values.count > 0

                      if $health_status_values.include?arg["HealthStatusBlack"]
                        puts "Successfully see the #{health_status} pickList value: #{arg["HealthStatusBlack"]}"
                      else
                        putstr "Failed to see the #{health_status} pickList value: #{arg["HealthStatusBlack"]}"
                      end

                      if $health_status_values.include?arg["HealthStatusGreen"]
                        puts "Successfully see the #{health_status} pickList value: #{arg["HealthStatusGreen"]}"
                      else
                        putstr "Failed to see the #{health_status} pickList value: #{arg["HealthStatusGreen"]}"
                      end

                      if $health_status_values.include?arg["HealthStatusRed"]
                        puts "Successfully see the #{health_status} pickList value: #{arg["HealthStatusRed"]}"
                      else
                        putstr "Failed to see the #{health_status} pickList value: #{arg["HealthStatusRed"]}"
                      end

                    else
                      putstr "#{health_status} pickList field is disabled mode"
                    end
                  else
                    putstr "Renewal Status #{health_status} pickList field is not visible"
                  end
                end
              end
              putstr "Failed to see the #{health_status} pickList field" unless result
              sleep 3
            end

      else
        if (ENV['UserRole'] == "salesopssit")
          begin

            within all(".pbSubsection")[1] do
              tr = first("tbody").all("tr")
              sleep 3
              result = false
              tr.each do |row|
                if row.all("td")[2].text == health_status

                  if $task_fields == true

                    result = true
                    $health_status_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)

                    if $health_status_values.count > 0


                      if $health_status_values.include?arg["HealthStatusBlack"]
                        puts "Successfully see the #{health_status} pickList value: #{arg["HealthStatusBlack"]}"
                      else
                        putstr "Failed to see the #{health_status} pickList value: #{arg["HealthStatusBlack"]}"
                      end

                      if $health_status_values.include?arg["HealthStatusGreen"]
                        puts "Successfully see the #{health_status} pickList value: #{arg["HealthStatusGreen"]}"
                      else
                        putstr "Failed to see the #{health_status} pickList value: #{arg["HealthStatusGreen"]}"
                      end

                      if $health_status_values.include?arg["HealthStatusRed"]
                        puts "Successfully see the #{health_status} pickList value: #{arg["HealthStatusRed"]}"
                      else
                        putstr "Failed to see the #{health_status} pickList value: #{arg["HealthStatusRed"]}"
                      end

                    else
                      putstr "#{health_status} pickList field is disabled mode"
                    end
                  else
                    putstr "Renewal Status #{health_status} pickList field is not visible"
                  end
                end
              end
              putstr "Failed to see the #{health_status} pickList field" unless result
              sleep 3
            end

          rescue
            puts "#{health_status} pickList field is not visible"
          end
        end
      end
    else
      putstr "Failed to see the #{health_status} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{health_status} pickList values"
  end
end


When(/^I able to see the task "([^"]*)" pickList values$/) do |health_status_reason|
  begin
    sleep 2
    arg = getDetails 'TasksHealthStatusReasonPickListValues'

    sleep 2
    if page.has_content?(health_status_reason)
      puts "Successfully see the #{health_status_reason} field"

      if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsrepsit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "salesmgrsit") || (ENV['UserRole'] == "salesrepsit")

        within all(".pbSubsection")[1] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[2].text == health_status_reason

              if $task_fields == true
                result = true
                $health_status_reason_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)

                if $health_status_reason_values.count > 0


                  if $health_status_reason_values.include?arg["HSRCustomerHealthy"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRCustomerHealthy"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRCustomerHealthy"]}"
                  end

                  if $health_status_reason_values.include?arg["HSROpportunity"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROpportunity"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROpportunity"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRCustomer"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRCustomer"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRCustomer"]}"
                  end

                  if $health_status_reason_values.include?arg["HSREscalation"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSREscalation"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSREscalation"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRServiceMaintenanceRequest"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRServiceMaintenanceRequest"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRServiceMaintenanceRequest"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRPricingContractRequest"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRPricingContractRequest"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRPricingContractRequest"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRProductComplexity"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductComplexity"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductComplexity"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRValue"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRValue"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRValue"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRChangeBusiness"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRChangeBusiness"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRChangeBusiness"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRChangeManagement"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRChangeManagement"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRChangeManagement"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRDowngrade"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRDowngrade"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRDowngrade"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRproductservice"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRproductservice"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRproductservice"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRBudget"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRBudget"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRBudget"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRValueTM"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRValueTM"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRValueTM"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRCustomerPreference"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRCustomerPreference"]}"
                    else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRCustomerPreference"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRServicePreference"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRServicePreference"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRServicePreference"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRValuePerception"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRValuePerception"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRValuePerception"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRparty"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRparty"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRparty"]}"
                  end

                if $health_status_reason_values.include?arg["HSRInHouse"]
                  puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRInHouse"]}"
                else
                  putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRInHouse"]}"
                end

                if $health_status_reason_values.include?arg["HSRProductReplacement"]
                  puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductReplacement"]}"
                else
                  putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductReplacement"]}"
                end

                if $health_status_reason_values.include?arg["HSRPricing"]
                  puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRPricing"]}"
                else
                  putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRPricing"]}"
                end

                if $health_status_reason_values.include?arg["HSRUniqueOffering"]
                  puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRUniqueOffering"]}"
                else
                  putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRUniqueOffering"]}"
                end

                if $health_status_reason_values.include?arg["HSRPerformanceIssues"]
                  puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRPerformanceIssues"]}"
                else
                  putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRPerformanceIssues"]}"
                end

                if $health_status_reason_values.include?arg["HSROverSold"]
                  puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROverSold"]}"
                else
                  putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROverSold"]}"
                end

                  if $health_status_reason_values.include?arg["HSRNotMeetingOutcomes"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRNotMeetingOutcomes"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRNotMeetingOutcomes"]}"
                  end

                  if $health_status_reason_values.include?arg["HSREOL"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSREOL"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSREOL"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRProductReplacement"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductReplacement"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductReplacement"]}"
                  end

                  if $health_status_reason_values.include?arg["HSROutOfBusiness"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROutOfBusiness"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROutOfBusiness"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRMA"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRMA"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRMA"]}"
                  end

                  if $health_status_reason_values.include?arg["HSRBusiness"]
                    puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRBusiness"]}"
                  else
                    putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRBusiness"]}"
                  end

                else
                  putstr "#{health_status_reason} pickList field is disabled mode"
                end
              else
                putstr "Renewal Status #{health_status_reason} pickList field is not visible"
              end
            end
          end
          putstr "Failed to see the #{health_status_reason} pickList field" unless result
          sleep 3
        end

      else
        if (ENV['UserRole'] == "salesopssit")
          begin

            within all(".pbSubsection")[1] do
              tr = first("tbody").all("tr")
              sleep 3
              result = false
              tr.each do |row|
                if row.all("td")[2].text == health_status_reason

                  if $task_fields == true

                    result = true
                    $health_status_reason_values = row.all("td")[3].first("span").first("select").all('option').collect(&:text)

                    if $health_status_reason_values.count > 0


                      if $health_status_reason_values.include?arg["HSRCustomerHealthy"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRCustomerHealthy"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRCustomerHealthy"]}"
                      end

                      if $health_status_reason_values.include?arg["HSROpportunity"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROpportunity"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROpportunity"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRCustomer"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRCustomer"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRCustomer"]}"
                      end

                      if $health_status_reason_values.include?arg["HSREscalation"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSREscalation"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSREscalation"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRServiceMaintenanceRequest"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRServiceMaintenanceRequest"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRServiceMaintenanceRequest"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRPricingContractRequest"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRPricingContractRequest"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRPricingContractRequest"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRProductComplexity"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductComplexity"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductComplexity"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRValue"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRValue"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRValue"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRChangeBusiness"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRChangeBusiness"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRChangeBusiness"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRChangeManagement"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRChangeManagement"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRChangeManagement"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRDowngrade"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRDowngrade"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRDowngrade"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRproductservice"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRproductservice"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRproductservice"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRBudget"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRBudget"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRBudget"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRValueTM"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRValueTM"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRValueTM"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRCustomerPreference"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRCustomerPreference"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRCustomerPreference"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRServicePreference"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRServicePreference"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRServicePreference"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRValuePerception"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRValuePerception"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRValuePerception"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRparty"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRparty"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRparty"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRInHouse"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRInHouse"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRInHouse"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRProductReplacement"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductReplacement"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductReplacement"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRPricing"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRPricing"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRPricing"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRUniqueOffering"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRUniqueOffering"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRUniqueOffering"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRPerformanceIssues"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRPerformanceIssues"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRPerformanceIssues"]}"
                      end

                      if $health_status_reason_values.include?arg["HSROverSold"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROverSold"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROverSold"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRNotMeetingOutcomes"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRNotMeetingOutcomes"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRNotMeetingOutcomes"]}"
                      end

                      if $health_status_reason_values.include?arg["HSREOL"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSREOL"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSREOL"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRProductReplacement"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRProductReplacement"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRProductReplacement"]}"
                      end

                      if $health_status_reason_values.include?arg["HSROutOfBusiness"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSROutOfBusiness"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSROutOfBusiness"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRMA"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRMA"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRMA"]}"
                      end

                      if $health_status_reason_values.include?arg["HSRBusiness"]
                        puts "Successfully see the #{health_status_reason} pickList value: #{arg["HSRBusiness"]}"
                      else
                        putstr "Failed to see the #{health_status_reason} pickList value: #{arg["HSRBusiness"]}"
                      end

                    else
                      putstr "#{health_status_reason} pickList field is disabled mode"
                    end
                  else
                    putstr "Renewal Status #{health_status_reason} pickList field is not visible"
                  end
                end
              end
              putstr "Failed to see the #{health_status_reason} pickList field" unless result
              sleep 3
            end

          rescue
            puts "#{health_status_reason} pickList field is not visible"
          end
        end
      end
    else
      putstr "Failed to see the #{health_status_reason} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{health_status_reason} pickList values"
  end
end


When(/^I able to see the task "([^"]*)" field is visible$/) do |rlm_play|
  begin
    sleep 2
    if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsrepsit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "salesmgrsit")
      $task_fields = false
      if page.has_content?(rlm_play)
        puts "Successfully see the #{rlm_play} field"
        within all(".pbSubsection")[1] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[0].text == rlm_play
              rlm_play_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
              if rlm_play_values.count > 0
                puts "Successfully see the #{rlm_play} pickList field is visible"
                $task_fields = true
                result = true
                break
              else
                putstr "Failed to see the #{rlm_play} pickList field is not visible"
              end
            end
          end
          putstr "Failed to see the #{rlm_play} pickList field" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{rlm_play} field"
      end
    else
      if (ENV['UserRole'] == "salesrepsit") || (ENV['UserRole'] == "salesopssit")
        $task_fields = false
        if page.has_content?(rlm_play)
          puts "Successfully see the #{rlm_play} field"
          within(".pbSubsection") do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[0].text == rlm_play
                begin
                  rlm_play_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
                  if rlm_play_values.count > 0
                    putstr "Successfully see the #{rlm_play} pickList field is visible"
                    $task_fields = true
                    result = true
                    break
                  end
                rescue
                  puts "Failed to see the #{rlm_play} pickList field is not visible"
                  $task_fields = true
                  result = true
                  break
                end
              end
            end
            putstr "Failed to see the #{rlm_play} pickList field" unless result
            sleep 3
          end
        else
          putstr "Failed to see the #{rlm_play} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{rlm_play} field is visible"
  end
end


When(/^I able to see the "([^"]*)" field editable for all excepts SalesRep & SalesOps$/) do |rlm_play|
  begin
    sleep 3

    if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsrepsit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "salesmgrsit")

      if page.has_content?(rlm_play)
        puts "Successfully see the #{rlm_play} field"
        within all(".pbSubsection")[1] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[0].text == rlm_play
              if $task_fields == true
                rlm_play_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
                if rlm_play_values.count > 0
                  puts "#{rlm_play} pickList field is editable"
                  result = true
                  break
                else
                  putstr "#{rlm_play} pickList is Read Only"
                end
              else
                putstr "#{rlm_play} pickList field is not visible"
              end
            end
          end
          putstr "Failed to see the #{rlm_play} text box field" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{rlm_play} field"
      end
    else
      if (ENV['UserRole'] == "salesrepsit") || (ENV['UserRole'] == "salesopssit")
        if page.has_content?(rlm_play)
          puts "Successfully see the #{rlm_play} field"
          within all(".pbSubsection")[1] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[0].text == rlm_play
                if $task_fields == true
                  begin
                    rlm_play_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)
                    if rlm_play_values.count > 0
                      putstr "#{rlm_play} pickList field is editable"
                      result = true
                      break
                    end
                  rescue
                    puts "#{rlm_play} pickList field is Read Only"
                    result = true
                    break
                  end
                else
                  putstr "#{rlm_play} pickList field is not visible"
                end
              end
            end
            putstr "Failed to see the #{rlm_play} pickList field" unless result
            sleep 3
          end
        else
          putstr "Failed to see the #{rlm_play} field"
        end
      end
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{rlm_play} pickList field is editable"
  end
end


When(/^I verify the task "([^"]*)" pickList values$/) do |rlm_play|
  begin
    sleep 2
    arg = getDetails 'TasksRLMPlayPickListValues'

    sleep 2
    if page.has_content?(rlm_play)
      puts "Successfully see the #{rlm_play} field"

      if (ENV['UserRole'] == "opsmgrsit") || (ENV['UserRole'] == "opsrepsit") || (ENV['UserRole'] == "Admin") || (ENV['UserRole'] == "salesmgrsit")

        within all(".pbSubsection")[1] do
          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|
            if row.all("td")[0].text == rlm_play

              if $task_fields == true
                result = true
                $rlm_play_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)

                if $rlm_play_values.count > 0

                  if $rlm_play_values.include?arg["RLMPlayOnBoarding"]
                    puts "Successfully see the #{rlm_play} pickList value: #{arg["RLMPlayOnBoarding"]}"
                  else
                    putstr "Failed to see the #{rlm_play} pickList value: #{arg["RLMPlayOnBoarding"]}"
                  end

                  if $rlm_play_values.include?arg["RLMPlayHealthCheck"]
                    puts "Successfully see the #{rlm_play} pickList value: #{arg["RLMPlayHealthCheck"]}"
                  else
                    putstr "Failed to see the #{rlm_play} pickList value: #{arg["RLMPlayHealthCheck"]}"
                  end

                  if $rlm_play_values.include?arg["RLMPlayRenewal"]
                    puts "Successfully see the #{rlm_play} pickList value: #{arg["RLMPlayRenewal"]}"
                  else
                    putstr "Failed to see the #{rlm_play} pickList value: #{arg["RLMPlayRenewal"]}"
                  end

                else
                  putstr "#{rlm_play} pickList field is disabled mode"
                end
              else
                putstr "Renewal Status #{rlm_play} pickList field is not visible"
              end
            end
          end
          putstr "Failed to see the #{rlm_play} pickList field" unless result
          sleep 3
        end

      else
        if (ENV['UserRole'] == "salesrepsit") || (ENV['UserRole'] == "salesopssit")

          within all(".pbSubsection")[1] do
            tr = first("tbody").all("tr")
            sleep 3
            result = false
            tr.each do |row|
              if row.all("td")[0].text == rlm_play

                if $task_fields == true

                  result = true
                  $rlm_play_values = row.all("td")[1].first("span").first("select").all('option').collect(&:text)

                  if $rlm_play_values.count > 0

                    if $rlm_play_values.include?arg["RLMPlayOnBoarding"]
                      puts "Successfully see the #{rlm_play} pickList value: #{arg["RLMPlayOnBoarding"]}"
                    else
                      putstr "Failed to see the #{rlm_play} pickList value: #{arg["RLMPlayOnBoarding"]}"
                    end

                    if $rlm_play_values.include?arg["RLMPlayHealthCheck"]
                      puts "Successfully see the #{rlm_play} pickList value: #{arg["RLMPlayHealthCheck"]}"
                    else
                      putstr "Failed to see the #{rlm_play} pickList value: #{arg["RLMPlayHealthCheck"]}"
                    end

                    if $rlm_play_values.include?arg["RLMPlayRenewal"]
                      puts "Successfully see the #{rlm_play} pickList value: #{arg["RLMPlayRenewal"]}"
                    else
                      putstr "Failed to see the #{rlm_play} pickList value: #{arg["RLMPlayRenewal"]}"
                    end

                  else
                    putstr "#{rlm_play} pickList field is disabled mode"
                  end
                else
                  putstr "Renewal Status #{rlm_play} pickList field is not visible"
                end
              end
            end
            putstr "Failed to see the #{rlm_play} pickList field" unless result
            sleep 3
          end
        end
      end
    else
      putstr "Failed to see the #{rlm_play} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{rlm_play} pickList values"
  end
end

When(/^I verify the task "([^"]*)" field is visible$/) do |status|
  begin
    sleep 2

    if page.has_content?(status)
      puts "Successfully see the #{status} field"

      if page.has_css?("#tsk12")
         puts "Successfully see the #{status} pickList field is editable"
      else
        putstr "Failed to see the #{status} pickList field is Read Only"
      end
    else
      putstr "Failed to see the #{status} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{status} field is visible"
  end
end


When(/^I verify the task "([^"]*)" field values$/) do |status|
  begin
    sleep 3
    arg = getDetails 'TasksStatusPickListValues'

    if page.has_content?(status)
      puts "Successfully see the #{status} field"

      if page.has_css?("#tsk12")

        puts "Successfully see the #{status} pickList"

        $task_status_values = []

        all(:xpath,"//select[@id='tsk12']/option").each do |options|

          $task_status_values << options.text
        end

        if $task_status_values.include?arg["TasksStatusNotStarted"]
          puts "Successfully see the #{status} pickList value: #{arg["TasksStatusNotStarted"]}"
        else
          putstr "Failed to see the #{status} pickList value: #{arg["TasksStatusNotStarted"]}"
        end

        if $task_status_values.include?arg["TasksStatusInProgress"]
          puts "Successfully see the #{status} pickList value: #{arg["TasksStatusInProgress"]}"
        else
          putstr "Failed to see the #{status} pickList value: #{arg["TasksStatusInProgress"]}"
        end

        if $task_status_values.include?arg["TasksStatusCompletedSuccessfully"]
          puts "Successfully see the #{status} pickList value: #{arg["TasksStatusCompletedSuccessfully"]}"
        else
          putstr "Failed to see the #{status} pickList value: #{arg["TasksStatusCompletedSuccessfully"]}"
        end

        if $task_status_values.include?arg["TasksStatusCompletedUnsuccessfully"]
          puts "Successfully see the #{status} pickList value: #{arg["TasksStatusCompletedUnsuccessfully"]}"
        else
          putstr "Failed to see the #{status} pickList value: #{arg["TasksStatusCompletedUnsuccessfully"]}"
        end

      else
        putstr "Failed to see the #{status} pickList field"
      end

    else
      putstr "Failed to see the #{status} field"
    end
  rescue Exception => ex
    putstr "Error occurred while verifying the #{status} pickList values"
  end
end


When(/^I update the task "([^"]*)" field$/) do |status|
  begin
    sleep 3
    arg = getDetails 'NewTaskInformation'

    if page.has_content?(status)
       puts "Successfully see the #{status} field"
       sleep 2

      if page.has_select?(arg["TasksStatusField"])
        select(arg["TasksStatusCompletedSuccessfully"], :from => arg["TasksStatusField"], :match => :first)
        puts "Successfully selected the #{status} field value: #{arg["TasksStatusCompletedSuccessfully"]}"
      end

    else
      putstr "Failed to see the #{status} field"
    end

  rescue Exception => ex
   putstr "Error occurred while selecting the #{status} field value"
 end
end



And(/^I click on the "([^"]*)" link from "([^"]*)" page$/) do |opportunity_name, task_details|
  begin
    sleep 4
    arg = getDetails 'NewTaskInformation'

    if page.has_content?(task_details)
      puts "Successfully see the #{task_details} page"

      within all(".pbSubsection")[0] do

        if page.has_content?(opportunity_name)
          puts "Successfully see the #{opportunity_name} record"

          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|

            if row.all("td")[2].text == opportunity_name
              puts "Successfully see the #{opportunity_name} record"

              row.all("td")[3].first("div").first("a").click

              puts "Successfully clicked the #{opportunity_name} link"
              sleep 5
              result = true
              break
            end
          end
          putstr "Failed to see the #{opportunity_name} record" unless result
          sleep 3
        else
          putstr "Failed to see the #{opportunity_name} record"
        end
      end
    else
      putstr "Failed to see the #{task_details} page"
    end

  rescue Exception => ex
    putstr "Error occurred while clicking the #{opportunity_name} link from #{task_details} page"
  end
end


Then(/^I verify the "([^"]*)" selected name should visible in "([^"]*)" page$/) do |competitor_name, opportunity_details|
  begin
    sleep 4
    arg = getDetails 'NewTaskInformation'

    if page.has_content?(opportunity_details)
      puts "Successfully see the #{opportunity_details} page"

      if page.has_content?(competitor_name)
        puts "Successfully see the #{competitor_name} field"

        within all(".pbSubsection")[0] do

          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|

            if row.all("td")[0].text == competitor_name
              puts "Successfully see the #{competitor_name} record"
              result = true
              if row.all("td")[1].first("div").text == arg["TasksCompetitorNameValue"]
                puts "Successfully see the set on the task value matching in #{opportunity_details} page"
                break
              else
                putstr "Failed to see the set on the task value matching in #{opportunity_details} page"
              end
            end
          end
          putstr "Failed to see the #{competitor_name} record" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{competitor_name} field"
      end
    else
      putstr "Failed to see the #{opportunity_details} page"
    end

  rescue Exception => ex
    putstr "Error occurred while set on the task value matching in #{opportunity_details} page"
  end
end


When(/^I able to see the "([^"]*)" selected name should visible in "([^"]*)" page$/) do |health_status, opportunity_details|
  begin
    sleep 4
    arg = getDetails 'NewTaskInformation'

    if page.has_content?(opportunity_details)
       puts "Successfully see the #{opportunity_details} page"

      if page.has_content?(health_status)
        puts "Successfully see the #{health_status} field"

        within all(".pbSubsection")[0] do

          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|

            if row.all("td")[2].text == health_status
              puts "Successfully see the #{health_status} record"
              result = true
              if row.all("td")[3].first("div").text == arg["TasksHealthStatusValue"]
                 puts "Successfully see the set on the task value matching in #{opportunity_details} page"
                 break
              else
                 putstr "Failed to see the set on the task value matching in #{opportunity_details} page"
              end
            end
          end
          putstr "Failed to see the #{health_status} record" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{health_status} field"
      end
    else
      putstr "Failed to see the #{opportunity_details} page"
    end

  rescue Exception => ex
    putstr "Error occurred while set on the task value matching in #{opportunity_details} page"
  end
end


When(/^I able to see the task "([^"]*)" selected name should visible in "([^"]*)" page$/) do |health_status_reason, opportunity_details|
  begin
    sleep 4
    arg = getDetails 'NewTaskInformation'

    if page.has_content?(opportunity_details)
      puts "Successfully see the #{opportunity_details} page"

      if page.has_content?(health_status_reason)
        puts "Successfully see the #{health_status_reason} field"

        within all(".pbSubsection")[0] do

          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|

            if row.all("td")[2].text == health_status_reason
              puts "Successfully see the #{health_status_reason} record"
              result = true
              if row.all("td")[3].first("div").text == arg["TaskHealthStatusReasonValue"]
                puts "Successfully see the set on the task value matching in #{opportunity_details} page"
                break
              else
                putstr "Failed to see the set on the task value matching in #{opportunity_details} page"
              end
            end
          end
          putstr "Failed to see the #{health_status_reason} record" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{health_status_reason} field"
      end
    else
      putstr "Failed to see the #{opportunity_details} page"
    end

  rescue Exception => ex
    putstr "Error occurred while set on the task value matching in #{opportunity_details} page"
  end
end


When(/^I verify the task "([^"]*)" selected name should visible in "([^"]*)" page$/) do |segmentation_tag, opportunity_details|
  begin
    sleep 4
    arg = getDetails 'NewTaskInformation'

    if page.has_content?(opportunity_details)
      puts "Successfully see the #{opportunity_details} page"

      if page.has_content?(segmentation_tag)
        puts "Successfully see the #{segmentation_tag} field"

        within all(".pbSubsection")[0] do

          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|

            if row.all("td")[0].text == segmentation_tag
              puts "Successfully see the #{segmentation_tag} record"
              result = true
              if row.all("td")[1].first("div").text == arg["TasksRLMPlayValue"]
                puts "Successfully see the set on the task value matching in #{opportunity_details} page"
                break
              else
                putstr "Failed to see the set on the task value matching in #{opportunity_details} page"
              end
            end
          end
          putstr "Failed to see the #{segmentation_tag} record" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{segmentation_tag} field"
      end
    else
      putstr "Failed to see the #{opportunity_details} page"
    end

  rescue Exception => ex
    putstr "Error occurred while set on the task value matching in #{opportunity_details} page"
  end
end


When(/^I select the "([^"]*)" asset name$/) do |related_to|
  begin
   sleep 3
   arg = getDetails 'NewTaskInformation'

   if page.has_css?("#tsk3_mlktp")
      puts "Successfully see the #{related_to} field"

      find("#tsk3_mlktp").select arg["TasksAssetField"]
      sleep 5
   else
     putstr "Failed to see the #{related_to} field"
   end

   page.driver.browser.window_handles.first
   main = page.driver.browser.window_handles.first
   find("img[alt='Related To Lookup (New Window)']").click
   sleep 2
   page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
   lookup = page.driver.browser.window_handles.last
   page.driver.browser.switch_to.frame("searchFrame")
   fill_in("lksrch",:with=> arg["TaskRelatedTo"])
   sleep 5
   find_button('Go!').click
   sleep 4
   page.driver.browser.switch_to.window(lookup)
   page.driver.browser.switch_to.frame("resultsFrame")
   within('.pbBody') do
     all("tbody")[0].all('tr')[1].all('th')[0].find('a').click
   end
   sleep 2
   page.driver.browser.switch_to.window(main)
   sleep 2

  rescue Exception => ex
    putstr "Error occurred while selecting the #{related_to} asset name"
  end
end


When(/^I enter the task required fields$/) do
  begin
    sleep 3
    arg = getDetails 'NewTaskInformation'

    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Name Lookup (New Window)']").click
    sleep 2
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> arg["TaskContactName"])
    sleep 5
    find_button('Go!').click
    sleep 4
    page.driver.browser.switch_to.window(lookup)
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.pbBody') do
      all("tbody")[0].all('tr')[1].all('th')[0].find('a').click
    end
    sleep 2
    page.driver.browser.switch_to.window(main)
    sleep 2


    page.driver.browser.switch_to.window(main)
    sleep 4
    page.driver.browser.window_handles.first
    main = page.driver.browser.window_handles.first
    find("img[alt='Related To Lookup (New Window)']").click
    sleep 2
    page.driver.browser.switch_to.window(page.driver.browser.window_handles.last)
    lookup = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.frame("searchFrame")
    fill_in("lksrch",:with=> arg["TaskRelatedTo"])
    sleep 2
    find_button('Go!').click
    sleep 2
    page.driver.browser.switch_to.window(lookup)
    page.driver.browser.switch_to.frame("resultsFrame")
    within('.pbBody') do
      sleep 3
      all("tbody")[0].all('tr')[1].all('th')[0].find('a').click
    end
    page.driver.browser.switch_to.window(main)
    sleep 4

    within all(".pbSubsection")[1] do

      if page.has_select?(arg["TasksPriorityField"])
        select(arg["TasksPriorityValue"], :from => arg["TasksPriorityField"])
      end

      if page.has_select?(arg["TasksStatusField"])
        select(arg["TasksStatusValue"], :from => arg["TasksStatusField"], :match => :first)
      end

      if page.has_content?(arg["TasksDueDateField"])
        fill_in arg["TasksDueDateField"],:with => arg["TasksDueDateValue"]
      end

      if page.has_select?(arg["TasksHealthStatusField"])
        select(arg["TasksHealthStatusValue"], :from => arg["TasksHealthStatusField"], :match => :first)
      end

      if page.has_content?(arg["TasksCompetitorNameField"])
        fill_in arg["TasksCompetitorNameField"], :with => arg["TasksCompetitorNameValue"]
      end

      if page.has_select?(arg["TasksRLMPlayField"])
        select(arg["TasksRLMPlayValue"], :from => arg["TasksRLMPlayField"])
      end

      if page.has_select?(arg["TaskHealthStatusReasonField"])
        select(arg["TaskHealthStatusReasonValue"], :from => arg["TaskHealthStatusReasonField"])
      end

    end
    sleep 2

    within all(".pbSubsection")[2] do

      $create_task = "#{arg["TaskSubjectName"]}#{Time.now.strftime('%m%d_%H%M_%S')}"

      sleep 3
      if page.has_content?(arg["TasksSubjectField"])
        fill_in arg["TasksSubjectField"], :with => $create_task
      end

      sleep 3
      if page.has_content?(arg["TasksCommentsField"])
        fill_in arg["TasksCommentsField"],:with => arg["TaskComments"]
      end

      if page.has_select?(arg["TaskDirectionField"])
        select(arg["TaskDirectionValue"], :from => arg["TaskDirectionField"])
      end

    end
    sleep 3
    puts "Successfully fill the task required fields"
  rescue Exception => ex
    putstr "Error occurred while filling the task required fields"
  end
end


Then(/^I verify the "([^"]*)" selected name is visible in "([^"]*)" page$/) do |competitor_name, opportunity_details|
  begin
    sleep 4
    arg = getDetails 'NewTaskInformation'

    if page.has_content?(opportunity_details)
      puts "Successfully see the #{opportunity_details} page"

      if page.has_content?(competitor_name)
        puts "Successfully see the #{competitor_name} field"

        within all(".pbSubsection")[0] do

          tr = first("tbody").all("tr")
          sleep 3
          result = false
          tr.each do |row|

            if row.all("td")[2].text == competitor_name
              puts "Successfully see the #{competitor_name} record"
              result = true
              if row.all("td")[3].first("div").text == arg["TasksCompetitorNameValue"]
                puts "Successfully see the set on the task value matching in #{opportunity_details} page"
                break
              else
                putstr "Failed to see the set on the task value matching in #{opportunity_details} page"
              end
            end
          end
          putstr "Failed to see the #{competitor_name} record" unless result
          sleep 3
        end
      else
        putstr "Failed to see the #{competitor_name} field"
      end
    else
      putstr "Failed to see the #{opportunity_details} page"
    end

  rescue Exception => ex
    putstr "Error occurred while set on the task value matching in #{opportunity_details} page"
  end
end