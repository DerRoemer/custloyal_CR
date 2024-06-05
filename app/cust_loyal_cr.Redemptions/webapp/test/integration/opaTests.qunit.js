sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'custloyalcr/Redemptions/test/integration/FirstJourney',
		'custloyalcr/Redemptions/test/integration/pages/RedemptionsList',
		'custloyalcr/Redemptions/test/integration/pages/RedemptionsObjectPage'
    ],
    function(JourneyRunner, opaJourney, RedemptionsList, RedemptionsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('custloyalcr/Redemptions') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRedemptionsList: RedemptionsList,
					onTheRedemptionsObjectPage: RedemptionsObjectPage
                }
            },
            opaJourney.run
        );
    }
);