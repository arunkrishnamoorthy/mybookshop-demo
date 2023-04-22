using  { mybookshopdemo.orders.db as db } from '../db/model';

service OrdersService {
    entity Orders as projection on db.Orders;
}