@Alcon @general
Feature: General
  In order to validate general test cases
  As a tester
  I should validate the functionalities as per test case

  Background:
    #Given I should navigate to "Home" tab in saleforce application

  @Gen-01 @Admin_general
  Scenario: Gen01 verify business hours
    Given I click on username in the top right corner then select setup
    When I expand "Company Profile" from administration setup
    And I click "Business Hours" link
    And I click on "NALA" link
    Then I verify nala time zone and Business Hours

  @Gen-02 @Admin_general
  Scenario: Gen02 Validate Users setup
    Given I click on username in the top right corner then select setup
    When I expand "Manage Users" from administration setup
    And I click "Users" link
    Then I should see content "All Users"

  @10142016-v1.1-1 @Admin_General
  Scenario: 10142016-v1.1-1 Proactive Rules
    When I navigate to "Proactive Rules" tab in the application
    And I clicked the link "120 DIA Quotes"
    Then I should see rule "Stage" is "=" to "Not Contacted"
    And I should see rule "Sum of Quote Request Case" is "=" to "0"
    And I should see rule "Earliest Expiration Date" is "≤" to "Next_N_Days:120"
    And I should see rule "Earliest Expiration Date" is "≥" to "TODAY"
    And I should see rule "Record Type ID" is "=" to "Quote Record Type"
    And I should see rule "Target DIA" is "=" to "120"
    And I should see rule "Case Origin" is "=" to "Proactive Rule Case"
    And I should see rule "Priority" is "=" to "Normal"
    And I should see rule "Quote Type" is "=" to "1 Year"
    And I should see rule "Sub Case Type" is "=" to "New"

  @10242016-v1.2-2 @Admin_General
  Scenario: 10242016-v1.2-2 Add rule: Competitor Name is required when Health Status Reason is Risk and Competitor related
    When I selected "Setup" from user menu
    And I clicked the "Customize" link under "App Setup"
    And I click "Opportunities" in setup
    And I click "Validation Rules" in setup
    And I should see the rule "Competiter_Name_Required" checkbox checked

  @10282016-v1.3-3 @Admin_General
  Scenario: 10282016-v1.3-3 Competitor Name validation rules for Asset and Task
    When I selected "Setup" from user menu
    And I clicked the "Customize" link under "App Setup"
    And I click "Assets" in setup
    And I click "Validation Rules" in setup
    And I should see the rule "Competiter_Name_Required" checkbox checked
    And I click "Activities" in setup
    And I click "Task Validation Rules" in setup
    And I should see the rule "Competiter_Name_Required" checkbox checked

  @10282016-v1.3-4 @Admin_General
  Scenario: 10282016-v1.3-4 Updated Process Builder
    When I selected "Setup" from user menu
    And I clicked the "Create" link under "App Setup"
    And I click "Workflow & Approvals" in setup
    And I click "Process Builder" in setup
    And I should see the "CSM Task updates to Opportunity" is present with "Active" status
    And I should see the "CSM Task updates to Asset" is present with "Active" status

  @11032016-v1.5-4 @Admin_General
  Scenario: 11032016-v1.5-4 Enabled field tracking on the Health Status field on Opportunity, Asset, and Task
    When I selected "Setup" from user menu
    And I clicked the "Customize" link under "App Setup"
    And I click "Opportunities" in setup
    And I click "Fields" in setup
    Then I should see the rule "SSI_ZTH__Opportunity_Picklist_1__c" checkbox checked
    And I click "Assets" in setup
    And I click "Fields" in setup
    Then I should see the rule "Health Status" checkbox checked
    And I click "Activities" in setup
    And I click "Task Fields" in setup
    Then I should see the rule "Health Status" checkbox checked
