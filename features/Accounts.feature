@Alcon @accounts
Feature: Accounts
  In order to validate cases section
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to "Accounts" tab in saleforce application
	
@Acc-01 @LaunchBrowser
 Scenario: Acc-01 create new account
  Given I should navigate to "Accounts" tab in saleforce application

@Acc-01 @All-Users_Accounts1
 Scenario: Acc-01 create new account
  Given I follow on "New" button
  Then I should see content "Account Edit"
  And I enter value to all the mandatory field
  Then I click on "Save" button from top row

@Acc-02 @All-Users_Accounts
 Scenario: Acc-02 added account location to account  page layout
  Given I follow on "New" button
  Then I should see content "Account Edit"
  And I check that "Account Location" field is visible
  Then I click on account location lookup and select any value  

@Acc-03 @All-Users_Accounts
 Scenario: Acc-03 validate industry picklist
  Given I follow on "New" button
  Then I should see content "Account Edit"
  And I enter value to all the mandatory field
  And I check the picklist value of industry field
  Then I select picklist value for industry field

@Acc-04 @All-Users_Accounts
 Scenario: Acc-04 removed channel sections from account contact opportunity and asset
  Given I follow on "New" button
  Then I should see content "Account Edit"
  And I check that the "Channel" section is removed from "Account details"