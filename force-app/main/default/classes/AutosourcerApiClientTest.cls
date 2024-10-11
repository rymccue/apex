@IsTest
private class AutosourcerApiClientTest {
    @IsTest
    static void testAuthentication() {
        Test.setMock(HttpCalloutMock.class, new AutosourcerApiMock());
        
        AutosourcerApiClient client = new AutosourcerApiClient();
        Test.startTest();
        client.authenticate('test_client_id', 'test_client_secret');
        Test.stopTest();
        
        // Assert that no exception was thrown
        System.assert(true, 'Authentication should succeed');
    }
    
    @IsTest
    static void testCreateDeal() {
        Test.setMock(HttpCalloutMock.class, new AutosourcerApiMock());
        
        AutosourcerApiClient client = new AutosourcerApiClient();
        client.authenticate('test_client_id', 'test_client_secret');
        
        AutosourcerApiModels.LeadsApiDeal deal = new AutosourcerApiModels.LeadsApiDeal();
        deal.dealtype = AutosourcerApiModels.DealtypeEnum.BUY;
        deal.customer_price_range = AutosourcerApiModels.CustomerPriceRangeEnum.K150_TO_350K;
        deal.buyer_commission_model_id = 'test_id';
        deal.location = 'Test Location';
        
        deal.customer = new AutosourcerApiModels.LeadsApiCustomer();
        deal.customer.email = 'test@example.com';
        deal.customer.firstname = 'John';
        deal.customer.lastname = 'Doe';
        deal.customer.is_call_eligible = true;
        deal.customer.phone = '+15555555555';
        deal.customer.text_consent_opt_in = true;
        
        deal.loan_officer = new AutosourcerApiModels.LeadsApiLoanOfficer();
        deal.loan_officer.email = 'officer@example.com';
        deal.loan_officer.firstname = 'Jane';
        deal.loan_officer.lastname = 'Smith';
        deal.loan_officer.company_name = 'Test Company';
        deal.loan_officer.phone = '+15555555556';
        
        deal.lead_source_data = new AutosourcerApiModels.LeadSource();
        deal.lead_source_data.vendor = AutosourcerApiModels.VendorEnum.CLEVER;
        
        Test.startTest();
        AutosourcerApiModels.LeadsApiDeal createdDeal = client.createDeal(deal);
        Test.stopTest();
        
        System.assertNotEquals(null, createdDeal, 'Created deal should not be null');
        System.assertEquals(AutosourcerApiModels.DealtypeEnum.BUY, createdDeal.dealtype, 'Deal type should match');
        System.assertEquals('test@example.com', createdDeal.customer.email, 'Customer email should match');
    }
    
    private class AutosourcerApiMock implements HttpCalloutMock {
        public HTTPResponse respond(HTTPRequest req) {
            HttpResponse res = new HttpResponse();
            res.setHeader('Content-Type', 'application/json');
            
            if (req.getEndpoint().endsWith('/v2/api-clients/token/')) {
                res.setStatusCode(200);
                res.setBody('{"access_token": "test_access_token"}');
            } else if (req.getEndpoint().endsWith('/v2/leads-api/deals/')) {
                res.setStatusCode(201);
                res.setBody('{"dealtype": "BUY", "customer": {"email": "test@example.com"}}');
            }
            
            return res;
        }
    }
}
