# Autosourcer API Client

This project contains a Salesforce Apex client for the Autosourcer API, which allows interaction with Clever's API for creating and managing deals.

## Requirements

- [Salesforce DX](https://www.salesforce.com/products/platform/products/salesforce-dx/)

## Installation

1. Clone this repository or copy the contents into your Salesforce DX project.
2. Deploy the code to your Salesforce org using Salesforce DX:

   ```bash
   sfdx force:source:deploy -p force-app/main/default/classes
   ```

## Usage

The main class for interacting with the Autosourcer API is `AutosourcerApiClient`. Here's a basic example of how to use it:

```apex
// Create an instance of the API client
AutosourcerApiClient client = new AutosourcerApiClient();

// Authenticate
client.authenticate('your_client_id', 'your_client_secret');

// Create a deal
AutosourcerApiModels.LeadsApiDeal deal = new AutosourcerApiModels.LeadsApiDeal();
// Populate deal fields...

AutosourcerApiModels.LeadsApiDeal createdDeal = client.createDeal(deal);
```

## Classes

### AutosourcerApiClient

This is the main class for interacting with the Autosourcer API. It provides methods for authentication and creating deals.

### AutosourcerApiModels

This class contains the data models used by the API, including `LeadsApiDeal`, `LeadsApiCustomer`, `LeadsApiLoanOfficer`, and `LeadSource`.

### AutosourcerApiClientTest

This class contains unit tests for the `AutosourcerApiClient` class.

## Testing

To run the tests, use the following Salesforce DX command:

```bash
sfdx force:apex:test:run -n AutosourcerApiClientTest -r human
```

## Docker Support

This project includes Docker support for development. To use it:

1. Build the Docker image:
   ```bash
   docker-compose build
   ```

2. Start the container:
   ```bash
   docker-compose up -d
   ```

3. Execute Salesforce DX commands inside the container:
   ```bash
   docker-compose exec apex-dev sfdx force:org:list
   ```

## Author

Clever Engineering Team

