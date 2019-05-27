@Alcon @Asset
Feature: Assets
  In order to verify and validate Assets test cases
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to Assets tab in saleforce application

  @Asst01 @Asst02 @all-users-assets
  Scenario: Asst01 @Asst02 verify product line in asset module
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      Asset Edit
      New Asset
      """
    And I should see Product Line field picklist
    And I should verify product line picklist values

	
  @Asst02 @all-users-assets	
  Scenario: Asst02 verify SAP Equipment ID in asset module
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      Asset Edit
      New Asset
      """
   And I should see "Product Line" field with read only permission
   And I should see SAP Equipment ID field
   

  @Asst03 @all-users-assets
  Scenario: Asst03 verify status picklist in asset module
    And I wait for 5 seconds
    When I follow on "New" button
    And I wait for 5 seconds
    Then I should see the following:
      """
      Asset Edit
      New Asset
      """
   And I should see status field picklist
   And I should verify status picklist values
   When I fill all mandantory fields to create new assets
   Then I click on "Save" button on top button row
   When I wait for 5 seconds
   Then I should see content "Asset Detail"

   
  #Added by Avishek  on 23-march-2017
  @10282016-v1.3-2 @All-Users_Accounts
  Scenario: 10282016-v1.3-2 Add new fields to Asset page layout: Competitor Name, Health Status, Health Status Reason, Segmentation Tag
#    Given I created new account record "Smoke-Test_Account-Avi" as test data
#    And I created new contact record "Smoke-Test_Contact-Avi" as test data
#    And I created new asset record "Smoke-Test_Asset-Avi" as test data
    When I enter the credentials to the Zenith application
    And I search and open the existing asset "Smoke-Test_Asset-Avi"
    And I click Edit button from top button row
    Then I should see the field "Competitor Name" with RW permission except salesops
    And I should see the field "Health Status" with RW permission except salesops
    And I should see "Health Status" field picklist options
    And I should see the field "Health Status Reason" with RW permission except salesops
    And I should see "Health Status Reason" field picklist options
    And I should see the field "Segmentation Tag" with RW permission except salesops

