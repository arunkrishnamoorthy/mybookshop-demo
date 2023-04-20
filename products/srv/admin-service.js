const cds = require('@sap/cds');
const db = cds.connect.to('db');

module.exports = async (srv) => {   
    
    const { Books } = cds.entities('mybookshopdemo.products.db');

    // Rule: Cannot insert two books with the same ISBN number. 
    srv.before('CREATE','Books', async (request,next)=>{
        const book = await SELECT.from(Books).where({ isbn: request.data.isbn });
        if(book.length > 0){
            request.reject(409, 'Two books cannot have the Same ISBN Number');
        }
    });

    srv.on('error', (error,arguments) => {
        console.log(error);
    });

    srv.on('setStock', async (request) => {
        // get all the books and update the stock by 100;
        // Objective is to use the expression 
        // const updatedBooks = await UPDATE(Books).with({ stock: stock+=100 });
        const books = await SELECT.from(Books);
        const promises = books.map( async (book) => {
           await UPDATE(Books).where({ID:book.ID}).with({ stock: 100 });
        });
    });

}