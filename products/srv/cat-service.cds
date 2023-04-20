using { mybookshopdemo.products.db as products } from '../db/schema';

@path: '/catalog'
service CatalogService {

    // To display list of books on the first page. 
    @readonly 
    entity ListOfBooks as projection on products.Books excluding { description };

    // Display books detail on the detail page 
    @readonly
    entity Books as projection on products.Books {
        *,
        author.firstName as authorName,
        author.lastName as initials,
    } excluding { createdBy, modifiedBy };

    // Entity that requires user permission
    @require: 'authenticated-user'
    action submitOrder( book: Books:ID, quantity: Integer ) returns { stock: Integer};
    event orderedBook: { book: Books:ID; quantity: Integer; buyer: String };
}