public with sharing class LWCBoxAuthController {
   
    private static String client_id='q1ta3bn47brotcr7h393xzbmzox6irxo';
    private static String client_secret='d2noxKiCpLyZYntS2gIGcAWYgBCKnOKd';
    
    public PageReference redirectUser(){    
        return new PageReference('https://account.box.com/api/oauth2/authorize?response_type=code&client_id='+LWCBoxAuthController.client_id);        
    }

    
    @AuraEnabled
    public static String getAuthStatus(String code){
    	Http http = new Http();
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.box.com/oauth2/token');
        req.setMethod('POST');
        req.setHeader('Accept', 'application/json');
        req.setBody('grant_type=authorization_code&code='+code+'&client_id='+LWCBoxAuthController.client_id+'&client_secret='+LWCBoxAuthController.client_secret);
        
        System.debug('Request: ===> '+req);
        
        HttpResponse res = http.send(req);
        
        String response = res.getBody();

        System.debug('Response: ===> '+response);
        
        
		if(res.getStatusCode() == 200)
            return 'Successfully Authenticated';

        return 'Authentication Failed';
        
        
    }
    
	
    public String fetchFolderItems(String access_token){
        
        Http http = new Http();
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.box.com/2.0/folders/52364966125/items');
        req.setMethod('GET');
        req.setHeader('Accept', 'application/json');
        req.setHeader('Authorization', 'Bearer '+access_token);
        
        HttpResponse res = http.send(req);
        
        return res.getBody();
        
    }
  
    
    public class handleTokens{
        public String access_token;	//IOohlqmDnvmNO96HBKHqtoNJfKkOAJyd
        public Integer expires_in;	//3687
        public cls_restricted_to[] restricted_to;
        public String refresh_token;	//STkLNLCHG042WDN0zddDQ6cBPbXxb2NcI3quEm93F42ZGubMlxR81gvRBKniZGlM
        public String token_type;	//bearer
	}
    
    class cls_restricted_to {
	}

    // class cls_restricted_to{
    //     public String scope;
    //     public String object;
    //     public String id;
    // }
}