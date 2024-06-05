/**
 * 
 * @On(event = { "CREATE" }, entity = "cust_loyal_crSrv.Redemptions")
 * @param {Object} req - User information, tenant-specific CDS model, headers and query parameters
*/
module.exports = async function(req) {
    const { redeemedAmount, customer_ID } = req.data;
    const tx = cds.transaction(req);

    // Fetch the customer's current total reward points and total redeemed reward points
    const [{ totalRewardPoints, totalRedeemedRewardPoints }] = await tx.run(
        SELECT.from('cust_loyal_crSrv.Customers')
            .where({ ID: customer_ID })
            .columns('totalRewardPoints', 'totalRedeemedRewardPoints')
    );

    // Check if the customer has enough reward points to redeem
    if (totalRewardPoints < redeemedAmount) {
        req.error(400, 'Not enough reward points to redeem');
        return;
    }

    // Deduct the redeemed amount from the customer's total reward points
    // and add that to his total redeemed reward points
    const newTotalRewardPoints = totalRewardPoints - redeemedAmount;
    const newTotalRedeemedRewardPoints = totalRedeemedRewardPoints + redeemedAmount;

    // Update the customer's total reward points and total redeemed reward points
    await tx.run(
        UPDATE('cust_loyal_crSrv.Customers')
            .set({
                totalRewardPoints: newTotalRewardPoints,
                totalRedeemedRewardPoints: newTotalRedeemedRewardPoints
            })
            .where({ ID: customer_ID })
    );
};