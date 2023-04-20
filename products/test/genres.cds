using { mybookshopdemo.products.db as products } from '../db/schema';

service TestService {
    entity genres as projection on products.Genres;
}