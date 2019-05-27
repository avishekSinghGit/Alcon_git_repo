@Tasks_feature
Feature: All scenarios related to Tasks feature

  Background: Login to the Application
    Given I login to the "Alcon" application
    Then I able to see the logged in to "Alcon" application


  @Tsk-01 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: Task Types by persona updated
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    And I able to see the "Record Type of new record" tasks pickList fields


  @Tsk-01 @11022016-v1.4-3 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: Task layout fields updated - Email, Removed Repeat this Task Field and Create Recurring Series of Tasks button from page layout (All Task Types)
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Task - Email" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    When I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    And I select the "All Open" pickList value from "My Tasks" section
    Then I able to see the created "Task - Email" successfully
    When I open the created "Task - Email" Task record
    Then I able to see the "Task Detail" page
    And I should not able to see the "Repeat this Task" field
    And I should not able to see the "Create Recurring Series of Tasks" button


  @Tsk-02 @11022016-v1.4-3 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: Task layout, fields updated - Fax, Removed Repeat this Task Field and Create Recurring Series of Tasks button from page layout (All Task Types)
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Task - Fax" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    When I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    And I select the "All Open" pickList value from "My Tasks" section
    Then I able to see the created "Task - Fax" successfully
    When I open the created "Task - Fax" Task record
    Then I able to see the "Task Detail" page
    And I should not able to see the "Repeat this Task" field
    And I should not able to see the "Create Recurring Series of Tasks" button


  @Tsk-03 @11022016-v1.4-3 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: Task layout, fields updated - Phone Calls, Removed Repeat this Task Field and Create Recurring Series of Tasks button from page layout (All Task Types)
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Task - Phone Calls" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    When I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    And I select the "All Open" pickList value from "My Tasks" section
    Then I able to see the created "Task - Phone Calls" successfully
    When I open the created "Task - Phone Calls" Task record
    Then I able to see the "Task Detail" page
    And I should not able to see the "Repeat this Task" field
    And I should not able to see the "Create Recurring Series of Tasks" button


  @Tsk-04 @11022016-v1.4-3 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks @SalesOps_tasks
  Scenario: Task layout, fields updated - Standard, Removed Repeat this Task Field and Create Recurring Series of Tasks button from page layout (All Task Types)
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Task - Standard" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    When I fill the task required fields
    And I click on "Save" button from new "Task Edit" page
    And I select the "All Open" pickList value from "My Tasks" section
    Then I able to see the created "Task - Standard" successfully
    When I open the created "Task - Standard" Task record
    Then I able to see the "Task Detail" page
    And I should not able to see the "Repeat this Task" field
    And I should not able to see the "Create Recurring Series of Tasks" button


  @10282016-v1.3-3 @OpsMgr_tasks @SalesMgr_tasks
  Scenario: Home Page Tab - Added Items to Approve related list
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I verify the "Items to Approve" related list
    And I able to see the "Items to Approve" related list should be available for OpsMgr and SalesMgr


  @11032016-v1.5-1 @10282016-v1.3-3 @10282016-v1.3-4 @11022016-v1.4-1 @11022016-v1.4-2 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks
  Scenario: Add new task type CSM and add new fields, pickList to CSM task, Updated RLM Play and  Health Status pickList to Read Only for the Sales Rep,Updated Task Status pickList, Updated Process Builder
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "CSM Task" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    And I verify the "Competitor Name" text box field is visible
    And I verify the "Competitor Name" text box field editable permissions except SalesOps
    And I able to see the "Health Status" field is visible
    And I able to see the "Health Status" field editable permissions except SalesOps
    And I verify the "Health Status" pickList values
    And I able to see the "Health Status Reason" field is visible
    And I able to see the "Health Status Reason" field editable permissions except SalesOps
    And I able to see the task "Health Status Reason" pickList values
    And I able to see the task "RLM Play" field is visible
    And I able to see the "RLM Play" field editable for all excepts SalesRep & SalesOps
    And I verify the task "RLM Play" pickList values
    And I verify the task "Status" field is visible
    And I verify the task "Status" field values
    When I enter the task required fields
    And I click on "Save" button from new "Task Edit" page
    And I select the "All Open" pickList value from "My Tasks" section
    Then I able to see the created "CSM Task" successfully
    When I open the created "CSM Task" Task record
    Then I able to see the "Task Detail" page
    When I click on the "Edit" button from "Task Detail" page
    And I update the task "Status" field
    And I click on "Save" button from new "Task Edit" page
    When I click on the "Related To" link from "Task Detail" page
    Then I verify the "Competitor Name" selected name should visible in "Opportunity Detail" page
    And I verify the task "Segmentation Tag" selected name should visible in "Opportunity Detail" page
    And I able to see the "Health Status" selected name should visible in "Opportunity Detail" page
    And I able to see the task "Health Status Reason" selected name should visible in "Opportunity Detail" page

  @10282016-v1.3-4 @OpsMgr_tasks @OpsRep_tasks @SalesMgr_tasks @SalesRep_tasks @Admin_tasks
  Scenario: Updated Process Builder
    When I click on the "Home" tab
    Then I able to see the "Home" page
    And I able to see the "My Tasks" name
    When I click on "New" button from "My Tasks" section
    Then I able to see the "Select Task Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "CSM Task" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Task Edit" page
    When I enter the task required fields
    And I select the "Related To" asset name
    And I click on "Save" button from new "Task Edit" page
    And I select the "All Open" pickList value from "My Tasks" section
    Then I able to see the created "CSM Task" successfully
    When I open the created "CSM Task" Task record
    Then I able to see the "Task Detail" page
    When I click on the "Edit" button from "Task Detail" page
    And I update the task "Status" field
    And I click on "Save" button from new "Task Edit" page
    When I click on the "Related To" link from "Task Detail" page
    Then I verify the "Competitor Name" selected name is visible in "Asset Detail" page
    And I verify the task "Segmentation Tag" selected name should visible in "Asset Detail" page
    And I able to see the "Health Status" selected name should visible in "Asset Detail" page
    And I able to see the task "Health Status Reason" selected name should visible in "Asset Detail" page
