@Alcon @contacts
Feature: Contacts
  In order to validate cases section
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to "Contacts" tab in saleforce application

  @Con-01 @All-Users_Contacts
  Scenario: Con-01 create new contact
    Given I follow on "New" button
    Then I should see content "Contact Edit"
    And I enter data to reqired fields under new contacts section
    Then I click on "Save" button from top row

  @Con-02 @All-Users_Contacts
  Scenario: Con-02 removed channel sections from account contact opportunity and asset
    Given I follow on "New" button
    Then I should see content "Contact Edit"
    And I check that the "Channel" section is removed from "Contact details"