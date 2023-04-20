namespace mybookshopdemo.reviews.db;

using { User } from '@sap/cds/common';

type ReviewedSubject : String(111);

type Rating: Integer enum {
    worst = 1;
    poor = 2;
    avg = 3;
    good = 4;
    best = 5;
}
entity Reviews {
    key ID: UUID;
    subject: ReviewedSubject;
    reviewer: User;
    rating: Rating;
    title: String(111);
    text: String(1111);
    date: DateTime;
    likes: Composition of many Likes on likes.review = $self;
    liked: Integer default 0;
}

entity Likes {
    key review: Association to Reviews;
    key user: User;
}

annotate Reviews with {
    reviewer @cds.on: {insert: $user};
    date @cds.on: {insert:$now,update:$now};
}