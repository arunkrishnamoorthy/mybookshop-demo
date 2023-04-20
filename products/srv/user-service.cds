/** 
 * Expose user information 
 * Singleton service: Singleton service expose/represent only one element in the entityset.
 * Post Operation is not supported in the singleton. 
 * The properties can be fetched without the keys 
 */

 service userService {
    @odata.singleton
    @cds.persistent.skip: true
    entity me {
        id: String;
        locale: String;
        tenant: String;
    }
    action login() returns me;
 }