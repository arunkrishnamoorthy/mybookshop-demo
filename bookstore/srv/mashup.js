module.exports = async () => {
    const cds = require('@sap/cds');
    const adminLog = cds.log('AdminLog');
    const db = cds.connect.to('db');
    const CatalogService = await cds.connect.to('CatalogService');
    const AdminService = await cds.connect.to('AdminService');
    const ReviewService = await cds.connect.to('ReviewsService');
    // const { Books } = db.entities('mybookshopdemo.products.db');

    CatalogService.prepend((srv) => {
        srv.on('READ', 'Books/reviews', (request) => {
            const [ id ] = request.params, { columns, limit } = request.query.SELECT;
            return ReviewService.read('Reviews',columns).limit(limit).where({subject: String(id)});
        });
    });

    AdminService.prepend((srv) => {
        srv.on('READ','Books', (request)=> {
            adminLog.log('> delegating to the Admin Books service');
        });
    });

}