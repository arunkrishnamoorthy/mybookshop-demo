using { mybookshopdemo.reviews.db as db } from '../db/schema';

service ReviewsService {

    // synchronous API
    entity Reviews as projection on db.Reviews excluding { likes }
    action like(review: Reviews:ID);
    action unlike(review: Reviews:ID);

    // asynchronous API 
    event Reviewd: {
        subject: Reviews:subject;
        count: Integer;
        rating: Decimal;
    }

    // input validations
    annotate Reviews with {
        subject @mandatory;
        title @mandatory;
        rating @assert.range;
    }
}

// Service level annotations 
// annotate ReviewsService.Reviews with @restrict: [
//     { grant: 'READ', to: 'any'},
//     { grant: 'CREATE', to: 'authenticated-user'},
//     { grant: 'UPDATE', to: 'authenticated-user', where: 'reviewer=$user'},
//     { grant: 'DELETE', to: 'admin'}
// ];

// annotate ReviewsService with @restrict: [
//     { grant:'like',to:'identified-user'},
//     { grant:'unlike', to: 'identified-user',where: 'user=$user'}
// ];