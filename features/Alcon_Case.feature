@Alcon @cases
Feature:
  In order to validate cases section
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to "Cases" tab in saleforce application

	
  @11092016-v1.7-1 @All-Users_Cases
  Scenario: Updated Case Types by Persona
    When I click on "Cases" from "All Tabs" page
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    And I able to see the "Record Type of new record" cases pickList fields


  @Case-01 @Case-07 @11222016-v2.1-1 @All-Users_Cases
  Scenario: Case-01 Case-07 create case booking request, verify milestone name, Updated the Case tab - Case Status Permissions
    Given I follow on "New" button
    Then I should see content "Select Case Record Type"
    And I select "Booking Request" from record type of new record
    Then I should see content "Case Edit"
    And I verify the case "Status" field is visible
    And I verify the case "Status" field should be editable for all users
    And I enter the mandatory field values under new case for booking request
    And I select "High" option from "Priority" picklist
    And I click on "Save" button from top row
    And I capture the case number
    Then I check case milestone and target date value for booking request


  @Case-02 @Case-07 @11222016-v2.1-1 @All-Users_Cases
  Scenario: Case-02 Case-07 create case data processing request, verify milestone name, Updated the Case tab - Case Status Permissions
    When I follow on "New" button
    Then I should see content "Select Case Record Type"
    And I select "Data Processing Request" from record type of new record
    Then I should see content "Case Edit"
    And I verify the case "Status" field is visible
    And I verify the case "Status" field should be editable for all users
    And I enter the mandatory field values under new case for data processing request
    And I select "Normal" option from "Priority" picklist
    And I click on "Save" button on top button row
    And I capture the case number
    Then I check case milestone and target date value for data processing request


  @Case-03 @Case-07 @11222016-v2.1-1 @All-Users_Cases
  Scenario: Case-03 Case-07 verify milestone name, Updated the Case tab - Case Status Permissions
    Given I follow on "New" button
    Then I should see content "Select Case Record Type"
    When I select "Lead Submission" from record type of new record
    Then I should see content "Case Edit"
    And I verify the case "Status" field is visible
    And I verify the case "Status" field should be editable for all users
    And I enter the mandatory field values under new case for lead submission
    And I select "Low" option from "Priority" picklist
    And I click on "Save" button on top button row
    And I capture the case number
    Then I check case milestone and target date value for lead submission


  @Case-04 @11222016-v2.1-1 @All-Users_Cases
  Scenario: Case-04 create case quote request, Updated the Case tab - Case Status Permissions
    Given I follow on "New" button
    Then I should see content "Select Case Record Type"
    When I select "Quote Request" from record type of new record
    Then I should see content "Case Edit"
    And I verify the case "Status" field is visible
    And I verify the case "Status" field should be editable for all users
    And I enter the mandatory field values under new case for quote request
    Then I click on "Save" button on top button row
    And I capture the case number


   @Case-05 @11222016-v2.1-1 @All-Users_Cases
   Scenario: Case-05 create case quote request, Updated the Case tab - Case Status Permissions
     Given I follow on "New" button
     Then I should see content "Select Case Record Type"
     When I select "Reporting Request" from record type of new record
     Then I should see content "Case Edit"
     And I enter the mandatory field values under new case for reporting request
     Then I click on "Save" button on top button row
     And I capture the case number


   @Case-06 @11222016-v2.1-1 @All-Users_Cases
   Scenario: Case-06 create case review request, Updated the Case tab - Case Status Permissions
     Given I follow on "New" button
     Then I should see content "Select Case Record Type"
     When I select "Review Request" from record type of new record
     Then I should see content "Case Edit"
     And I enter the mandatory field values under new case for Review Request
     Then I click on "Save" button on top button row
     And I capture the case number


   @Case-08 @All-Users_Cases
   Scenario: Case-08 validate escalation
     Given I follow on "New" button
     Then I should see content "Select Case Record Type"
     When I select "Review Request" from record type of new record
     Then I should see content "Case Edit"
     And I enter the mandatory field values under new case for Review Request
     Then I click on "Save" button on top button row
     And I note the case number which is just created
     And I click on "Edit" button on top button row
     And I check the request escalation check box
     And I enter value in the escalation reason field
     And I click on "Save" button from top row
     And I capture the case number
     Then I check case milestone and target date value for Review Request

   @Case-09 @All-Users_Cases
   Scenario: Case-09 create case data update request
     Given I follow on "New" button
     Then I should see content "Select Case Record Type"
     When I select "Data Update Request" from record type of new record
     Then I should see content "Case Edit"
     And I enter the mandatory field values under new case for data update request
     Then I click on "Save" button from top row
     And I capture the case number


   @Case-10 @All-Users_Cases
   Scenario: Case-10 validate HA NS approval process off
     Given I follow on "New" button
     Then I should see content "Select Case Record Type"
     When I select "Data Update Request" from record type of new record
     Then I should see content "Case Edit"
     And I enter the mandatory field values under new case for data update request
     And I select "House Account" option from "Sub Case Type" picklist
     And I select "HA - Bad Data - BDT" option from "Renewal Status" picklist
     And I click on "Save" button from top row
     And I capture the case number
     Then I check that lock icon does not appears next to edit button
     And I click on "Edit" button from top row
     And I select "No Service" option from "Sub Case Type" picklist
     And I select "NS - Client Product Replacement - PTR" option from "Renewal Status" picklist
     And I click on "Save" button from top row
     And I capture the case number
     Then I check that lock icon does not appears next to edit button



  @11302016-v2.2-1 @OpsMgr_cases @OpsRep_cases @SalesMgr_cases @SalesRep_cases @Admin_cases
  Scenario: Updated the Case PickList - SSI Result Reason values
    When I click on "Cases" from "All Tabs" page
    Then I able to see the "Recent Cases" page
    When I click on the "New" button
    Then I able to see the "Select Case Record Type" page
    And I able to see the "Record Type of new record" name
    When I select the "Data Update Request" from "Record Type of new record" pickList field
    And I click on the "Continue" button
    Then I able to see the "Case Edit" page
    And I enter the mandatory field values under new case for data update request
    And I select the "House Account" value from "Sub Case Type" pickList
    And I able to see the "Renewal Status" pickList values
    And I select the "Closed Sale" value from "Sub Case Type" pickList
    And I verify the case "Renewal Status" pickList values
    And I select the "No Service" value from "Sub Case Type" pickList
    And I able to see the case "Renewal Status" pickList values
    And I select the "Priority" is "High"
    And I select the "House Account" value from "Sub Case Type" pickList
    And I select the "HA - Duplicate - DUP" from "Renewal Status"
    And I click on "Save" button from new "Case Edit" page
    Then I able to see the "Data Update Request" created renewal case
    And I able to see the "Lock" icon next to "Edit" button

