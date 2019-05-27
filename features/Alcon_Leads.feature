@Alcon @leads
Feature:
  In order to validate cases section
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to "Leads" tab in saleforce application

  @Lds-01 @All-Users_Leads
  Scenario: Lds-01 create lead
    Given I follow on "New" button
    Then I should see content "Lead Edit"
    And I enter value to all the mandatory field under new lead
    Then I click on "Save" button from top row