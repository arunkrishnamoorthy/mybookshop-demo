using { cuid, managed, User, Currency } from '@sap/cds/common';

namespace mybookshopdemo.orders.db;

entity Orders: cuid, managed {
    OrderNumber: String(22);
    Items: Composition of many {
        key ID: UUID;
        products: Association to Products;
        quanitty: Integer;
        price: Double;
    };
    buyer: User;
    currency: Currency;
}

entity Products @(cds.persistence.skip: 'always') {
    key ID: String;
}