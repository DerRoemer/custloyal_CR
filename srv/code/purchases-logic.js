/**
 * 
 * @On(event = { "CREATE" }, entity = "cust_loyal_crSrv.Purchases")
 * @param {Object} request - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(request) {
    // Calculate reward points as one tenth of the purchase value
    request.data.rewardPoints = Math.floor(request.data.purchaseValue / 10);

    // Get the related customer
    const customer = await SELECT.one('cust_loyal_crSrv.Customers')
        .where({ ID: request.data.customer_ID });

    if (!customer) {
        request.error(400, 'Customer not found');
        return;
    }

    // Update the total purchase value and total reward points of the related customer
    await UPDATE('cust_loyal_crSrv.Customers')
        .set({
            totalPurchaseValue: { '+=': request.data.purchaseValue },
            totalRewardPoints: { '+=': request.data.rewardPoints }
        })
        .where({ ID: customer.ID });
}