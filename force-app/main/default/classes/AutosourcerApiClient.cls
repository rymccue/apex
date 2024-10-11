public class AutosourcerApiClient {
    private static final String BASE_URL = 'https://api.listwithclever.com';
    private static final String TOKEN_ENDPOINT = '/v2/api-clients/token/';
    private static final String DEALS_ENDPOINT = '/v2/leads-api/deals/';

    private String accessToken;

    public AutosourcerApiClient() {
        // Constructor
    }

    public void authenticate(String clientId, String clientSecret) {
        HttpRequest req = new HttpRequest();
        req.setEndpoint(BASE_URL + TOKEN_ENDPOINT);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        
        String body = JSON.serialize(new Map<String, String>{
            'client_id' => clientId,
            'client_secret' => clientSecret
        });
        req.setBody(body);

        Http http = new Http();
        HttpResponse res = http.send(req);

        if (res.getStatusCode() == 200) {
            Map<String, Object> responseMap = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            this.accessToken = (String) responseMap.get('access_token');
        } else {
            throw new AutosourcerApiException('Authentication failed: ' + res.getBody());
        }
    }

    public AutosourcerApiModels.LeadsApiDeal createDeal(AutosourcerApiModels.LeadsApiDeal deal) {
        if (String.isBlank(this.accessToken)) {
            throw new AutosourcerApiException('Not authenticated. Call authenticate() first.');
        }

        HttpRequest req = new HttpRequest();
        req.setEndpoint(BASE_URL + DEALS_ENDPOINT);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Authorization', 'Bearer ' + this.accessToken);
        req.setBody(JSON.serialize(deal, true));  // Use true for suppressing null values

        Http http = new Http();
        HttpResponse res = http.send(req);

        if (res.getStatusCode() == 201) {
            return (AutosourcerApiModels.LeadsApiDeal) JSON.deserialize(res.getBody(), AutosourcerApiModels.LeadsApiDeal.class);
        } else {
            throw new AutosourcerApiException('Failed to create deal: ' + res.getBody());
        }
    }

    public class AutosourcerApiException extends Exception {}
}
