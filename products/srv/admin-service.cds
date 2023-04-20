using { mybookshopdemo.products.db as products } from '../db/schema';

// @requires: 'admin'
service AdminService {
    entity Books as projection on products.Books;
    action setStock();
    entity Authors as projection on products.Authors;
}