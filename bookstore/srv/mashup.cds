
using { mybookshopdemo.products.db.Books } from '@aarini/products';
using { mybookshopdemo.reviews.db.Reviews } from '@aarini/reviews';
using { mybookshopdemo.orders.db.Orders } from '@aarini/orders';

extend Books with {
    reviews: Composition of many  Reviews on reviews.subject = $self.ID;

    @Common.Label: 'Rating'
    rating: Decimal;

    @Common.Label: 'No of Reviews'
    numberOfReviews: Integer;
}