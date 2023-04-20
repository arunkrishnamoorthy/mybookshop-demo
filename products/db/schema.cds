namespace mybookshopdemo.products.db;

using {
    cuid,
    managed,
    Currency,
    sap.common.CodeList as CodeList
} from '@sap/cds/common';

entity Books : cuid, managed {
    title       : String(60);
    description : String;
    isbn        : String(15);
    publishedAt : Timestamp;
    price       : Decimal(9, 2);
    currency    : Currency;
    imageUrl    : String;
    stock       : Integer;
    author      : Association to Authors;
}

entity Authors : cuid, managed {
    firstName : String;
    lastName  : String;
    gender    : String(10);
    bio       : String;
    address   : Association to Address;
}

entity Genres : CodeList {
    key ID      : Integer;
        _parent : Association to Genres;
        _child  : Composition of many Genres
                      on _child._parent = $self;
}

entity Address : cuid, managed {
    addressLine1 : String;
    addressLine2 : String;
    district     : String;
    city         : String;
    country      : String;
    postalCode   : String;
}
