using { cust_loyal_cr as my } from '../db/schema.cds';

@path: '/service/cust_loyal_cr'
@requires: 'authenticated-user'
service cust_loyal_crSrv {
  @odata.draft.enabled
  entity Customers as projection on my.Customers;
  @odata.draft.enabled
  entity Purchases as projection on my.Purchases;
  @odata.draft.enabled
  entity Redemptions as projection on my.Redemptions;
}