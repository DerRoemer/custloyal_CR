sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'custloyalcr/Purchases/test/integration/FirstJourney',
		'custloyalcr/Purchases/test/integration/pages/PurchasesList',
		'custloyalcr/Purchases/test/integration/pages/PurchasesObjectPage'
    ],
    function(JourneyRunner, opaJourney, PurchasesList, PurchasesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('custloyalcr/Purchases') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePurchasesList: PurchasesList,
					onThePurchasesObjectPage: PurchasesObjectPage
                }
            },
            opaJourney.run
        );
    }
);