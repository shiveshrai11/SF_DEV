import { LightningElement } from 'lwc';
import getAuthStatus from '@salesforce/apex/LWCBoxAuthController.getAuthStatus';

export default class LwcBoxAuthInitiator extends LightningElement {
    
    connectedCallback(){
        // 1. grab the URL from the address bar
        const url = window.location.href;


        // 2. convert the string to URL instance
        const code = new URL(url).searchParams.get('c__code'); 

        // 3. Strip the value of the key c__code

        // 4. If the value is not null, then call the apex method to get the access token
        getAuthStatus({code: code})
            .then(response => {
                console.log('response: ', response);
            })
            .catch(error=>console.log('error on getting authStatus==> ', error));
    }
    
    handleAuthenticate(){
        console.log('heelloo');
        console.log(window.location.href);
        window.location.href = 'https://account.box.com/api/oauth2/authorize?response_type=code&client_id=q1ta3bn47brotcr7h393xzbmzox6irxo';
        //window.location.href('https://google.com');
        console.log(window.location.href);
    }
}