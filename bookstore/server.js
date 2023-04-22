const cds = require('@sap/cds');

cds.once('served',require('./srv/mashup'));

cds.once('bootstrap',(app) => {
    // app.serve('/bookshop').from('@aarini/products');
    // app.serve('/reviews').from('@aarini/reviews');
});

module.exports = cds.server;