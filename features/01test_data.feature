@Guidance @create_data
Feature:
  In order to create test data for different entities
  As a tester
  I should validate the functionalities as per test case

  Background:
    Given I should navigate to "Home" tab in saleforce application

  @create_account @CreateData
  Scenario: create a new account
    Given I should navigate to "Accounts" tab
    When I click on new button
    Then I should see content "New Account"
    And I enter value to all the mandatory field under new account section
    And I click on "Save" button from top row
    Then I should see content "Account Detail"

  @create_contacts @CreateData
  Scenario: create a new contact
   Given I should navigate to "Contacts" tab
   When I click on new button
   Then I should see content "New Contact"
   And I enter data to reqired fields under new contacts section
   And I click on "Save" button from top row
   Then I should see content "Contact Detail"
   And I note the contact name created above

  @create_opportunity @CreateData
  Scenario: create a new opportunity
   Given I should navigate to "Opportunities" tab
   When I click on new button
   Then I select opportunity edit from record type of new record
   Then I should see content "New Opportunity"
   And I enter data to reqired fields under new opportunity section
   And I click on "Save" button from top row
   Then I should see content "Opportunity Detail"

 @create_location_address @CreateData
 Scenario: create a new location address
  Given I should navigate to "Location Address" tab
  When I click on new button
  Then I should see content "Location Address"
  And I enter data to reqired fields under new location address section
  And I click on "Save" button from top row
  Then I should see content "Location Address Detail"

  @create_product @CreateData_Admin
  Scenario: create a new product
   Given I should navigate to "Products" tab
   When I click on new button
   Then I should see content "New Product"
   And I enter data to reqired fields under new product section
   And I enter value to standard price
   And I click on save button under add standard price
   Then I should see content "Product Detail"
