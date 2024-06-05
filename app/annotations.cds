using { cust_loyal_crSrv } from '../srv/service.cds';

annotate cust_loyal_crSrv.Customers with @UI.HeaderInfo: { TypeName: 'Customer', TypeNamePlural: 'Customers' };
annotate cust_loyal_crSrv.Customers with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate cust_loyal_crSrv.Customers with @UI.DataPoint #email: {
  Value: email,
  Title: 'Email',
};
annotate cust_loyal_crSrv.Customers with @UI.DataPoint #customerNumber: {
  Value: customerNumber,
  Title: 'Customer Number',
};
annotate cust_loyal_crSrv.Customers with {
  name @title: 'Name';
  email @title: 'Email';
  customerNumber @title: 'Customer Number';
  totalPurchaseValue @title: 'Total Purchase Value';
  totalRewardPoints @title: 'Total Reward Points';
  totalRedeemedRewardPoints @title: 'Total Redeemed Reward Points'
};

annotate cust_loyal_crSrv.Customers with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: customerNumber },
    { $Type: 'UI.DataField', Value: totalPurchaseValue },
    { $Type: 'UI.DataField', Value: totalRewardPoints },
    { $Type: 'UI.DataField', Value: totalRedeemedRewardPoints }
];

annotate cust_loyal_crSrv.Customers with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: name },
    { $Type: 'UI.DataField', Value: email },
    { $Type: 'UI.DataField', Value: customerNumber },
    { $Type: 'UI.DataField', Value: totalPurchaseValue },
    { $Type: 'UI.DataField', Value: totalRewardPoints },
    { $Type: 'UI.DataField', Value: totalRedeemedRewardPoints }
  ]
};

annotate cust_loyal_crSrv.Customers with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#email' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#customerNumber' }
];

annotate cust_loyal_crSrv.Customers with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate cust_loyal_crSrv.Purchases with @UI.HeaderInfo: { TypeName: 'Purchase', TypeNamePlural: 'Purchases' };
annotate cust_loyal_crSrv.Purchases with {
  customer @Common.ValueList: {
    CollectionPath: 'Customers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: customer_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerNumber'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalPurchaseValue'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalRewardPoints'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalRedeemedRewardPoints'
      },
    ],
  }
};
annotate cust_loyal_crSrv.Purchases with @UI.DataPoint #purchaseValue: {
  Value: purchaseValue,
  Title: 'Purchase Value',
};
annotate cust_loyal_crSrv.Purchases with @UI.DataPoint #rewardPoints: {
  Value: rewardPoints,
  Title: 'Reward Points',
};
annotate cust_loyal_crSrv.Purchases with {
  purchaseValue @title: 'Purchase Value';
  rewardPoints @title: 'Reward Points';
  selectedProduct @title: 'Selected Product'
};

annotate cust_loyal_crSrv.Purchases with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: purchaseValue },
    { $Type: 'UI.DataField', Value: rewardPoints },
    { $Type: 'UI.DataField', Value: selectedProduct },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
];

annotate cust_loyal_crSrv.Purchases with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: purchaseValue },
    { $Type: 'UI.DataField', Value: rewardPoints },
    { $Type: 'UI.DataField', Value: selectedProduct },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
  ]
};

annotate cust_loyal_crSrv.Purchases with {
  customer @Common.Label: 'Customer'
};

annotate cust_loyal_crSrv.Purchases with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#purchaseValue' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#rewardPoints' }
];

annotate cust_loyal_crSrv.Purchases with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate cust_loyal_crSrv.Purchases with @UI.SelectionFields: [
  customer_ID
];

annotate cust_loyal_crSrv.Redemptions with @UI.HeaderInfo: { TypeName: 'Redemption', TypeNamePlural: 'Redemptions' };
annotate cust_loyal_crSrv.Redemptions with {
  customer @Common.ValueList: {
    CollectionPath: 'Customers',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: customer_ID, 
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'email'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'customerNumber'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalPurchaseValue'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalRewardPoints'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'totalRedeemedRewardPoints'
      },
    ],
  }
};
annotate cust_loyal_crSrv.Redemptions with @UI.DataPoint #redeemedAmount: {
  Value: redeemedAmount,
  Title: 'Redeemed Amount',
};
annotate cust_loyal_crSrv.Redemptions with {
  redeemedAmount @title: 'Redeemed Amount'
};

annotate cust_loyal_crSrv.Redemptions with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: redeemedAmount },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
];

annotate cust_loyal_crSrv.Redemptions with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: redeemedAmount },
    { $Type: 'UI.DataField', Label: 'Customer', Value: customer_ID }
  ]
};

annotate cust_loyal_crSrv.Redemptions with {
  customer @Common.Label: 'Customer'
};

annotate cust_loyal_crSrv.Redemptions with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#redeemedAmount' }
];

annotate cust_loyal_crSrv.Redemptions with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];

annotate cust_loyal_crSrv.Redemptions with @UI.SelectionFields: [
  customer_ID
];

