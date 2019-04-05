# CRM in Ruby

# Summary

This app is a custom CRM system designed with the insurance agent in mind. It combines instant messaging, click-to-call, payment processing, and exposure/hazard mapping into a single package. A video walkthrough can be found here: https://youtu.be/ddVXhJuaSTA

If you would like to explore the deployed version, you can login with either of the following at https://custom-broker-crm.herokuapp.com:
 - username: guest1@mauro.org
 - password: guest1

 - username: guest2@mauro.org
 - password: guest2
 
 Two logins have been provided to test the instant messaging feature.
 
 The following APIs have been used: Stripe, Twilio, and Google Maps.
 
 ## Planned Future Features:
* React front-end
* States for client pipeline
* Auto calculation for mock quotes
* Mock client-facing site with linked lead generation tool
    * Sample auto-quote tool for those visiting for an immediate quote

## Known Issues
* chat feature not fully functional on deployed site (console message: 'Error: can't connect to twilsock'); 
    * Status: under investigation
* Twilio trial account in effect; unverified numbers cannot be dialed at this time
    * Status: ~live phone number pending~  Resolved - create a client profile with your information to experience click-to-call, SMS updates, and Google Maps integration.
    
To test Stripe payments, simply use '4242 4242 4242 4242' as the credit card number and any random set of digits for the CCV and zip or postal code requested.
