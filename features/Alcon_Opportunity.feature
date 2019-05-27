@Alcon-opportunity
Feature:
  In order to test opportunity module
  As a tester
  And I should verify all functionalities as per client requirement

  @Opp-01 @10242016-v1.2-2 @11172016-v2.0-1 @All-Users_Opportunity
  Scenario: Opp-01 validate new button for opportunity related list
    Given I should navigate to "Accounts" tab in saleforce application
    When I click on new button
    Then I should see content "New Account"
    And I enter value to all the mandatory field under new account section
    And I click on "Save" button from top row
    Then I should see content "Account Detail"
    And I navigate to "Accounts" tab
    And I click on the just created account name
    And I click on new Opportunity button from Opportunity related section
    And I wait for 10 seconds
    Then I should see content "New Opportunity"
    And I should verify client territory picklist values
    And I should verify Client Region picklist values
    And I should verify Health Status Reason picklist values
    And I should verify Health Status picklist values
    And I should see "Competitor Name" field with read and write permission
    And I should see "Health Status" field with read and write permission
    And I should see "Segmentation Tag" field with read and write permission
    And I should see "Batch Type" field with read only permission
    And I enter data to required fields under new opportunity section
    And I click on "Save" button from top row
    Then I should see content "Opportunity Detail"
    When I double click on Competitor Name and fill as "Sample-test"
    And I click on "Save" button from top row

  @Opp-02 @All-Users_Opportunity
  Scenario: Opp-02 removed channel sections from account contact opportunity and asset
    Given I should navigate to "Opportunities" tab in saleforce application
    When I click on new button
    Then I select opportunity edit from record type of new record
    Then I should see content "New Opportunity"
    And I check that the "Channel" section is removed from "Opportunity Edit"

  @Opp-04-1 @All-Users_Opportunity
  Scenario: Opp-04 create quote line items
    Given I should navigate to "Opportunities" tab in saleforce application
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    And I click on new quote button under quotes section
    Then I should see content "New Quote"
    And I enter value to mandatory fields under new quote section
    And I click on "Save" button from top row
    Then I should see content "Quote Detail"
    And I click on add line items button under quote line items section
    And I select existing product name
    And I clik on select button
    And I enter quantity field value
    And I click on "Save" button under add quote line items to page
     Then I should see content "Quote Detail"
    And I click on "Start Sync" button from top row

  @Opp-08 @Opp-07 @Opp-06-1 @newupdate @All-Users_Opportunity
  Scenario: Opp-08 Opp-07 updated result reason picklist values
    Given I should navigate to "Opportunities" tab in saleforce application
    When I search existing opportunity and click
    Then I should see content "Opportunity Detail"
    And I click on "New Renewable Line Item" button under renewable line item section
    Then I should verify Renawal Status picklist values
    When I enter data to all mandatory fields under renewable line item
    And I click on "Save" button in renewable line item section
    Then I should see content "Renewable Line Item Detail"
    And I should see content "Renewal Status"
    And I should see content "Existing Contract Number"
    And I should see content "Batch Type"
    And I double click on batch type and verify batch type picklist values
    And I double click on Renewal Status and verify Renewal Status picklist values