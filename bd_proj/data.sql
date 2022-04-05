insert into Users (UserName) 
values  ('kgeorgiy courses'),
        ('itmo'), 
        ('ct lectures'), 
        ('geny200 itmo'), 
        ('КитайскийТрамвай'),
        ('Artemiy Kononov'),
        ('Daniil Kononov');

insert into PlaylistsCreatedByUser (UserId, PlaylistName)
values  (1, 'Database course'),
        (1, 'Java course'),
        (1, 'Programming intro'),
        (3, 'Haskell'),
        (3, 'Algorithms and Data Structures'),
        (4, 'teorcode'),
        (5, 'Basov giga diffurs');

insert into Videos (UserId, VideoName, VideoDescription, VideoLength)
values  (1, 'db lecture 1: intro', 'description', interval '1 hour'),
        (1, 'db lecture 2: modelling', 'very long description', interval '1hour' + 30 * interval '1 minute'),
        (1, 'db lecture 3: functional dependence', 'another very long description', interval '1hour' + 25 * interval '1 minute'),
        (1, 'db lecture 4: normalization', 'small decr', interval '1hour' + 20 * interval '1 minute'),
        (1, 'db lecture 5: relational algebra', '', interval '1hour' + 15 * interval '1 minute'),
        (1, 'intro lecture 1: intro to prog', '', interval '1hour' + 10 * interval '1 minute'),
        (1, 'intro lecture 2: arrays and references', 'very long description', interval '1hour' + 5 * interval '1 minute'),
        (1, 'intro lecture 3: IO', 'description', interval '1hour' + 35 * interval '1 minute'),
        (1, 'java lecture 1: IO', '', 55 * interval '1 minute'),
        (1, 'java lecture 2: arrays and references', 'very long description', 15 * interval '1 minute'),
        (1, 'java lecture 3: collections', 'description', 180 * interval '1 minute'),
        (2, 'welcome to itmo!', 'This is welcome video to the best university in the world ever!!!1!1', interval '10 minute'),
        (3, 'fp lecture 1: hello', 'timecodes: 1, 2, 3, 4, 5', interval '2 hour'),
        (3, 'fp lecture 2: very useful lection', 'this is very usefull video! watch everyone!!', interval '2 hour'),
        (3, 'fp lecture 3: monads', 'monads', interval '2 hour'),
        (3, 'fp lecture 4: monads tranformers', 'fp lecture 4: monads tranformers', interval '2 hour'),
        (4, 'teorcode: viterbi alg', '', interval '2 hour'),
        (4, 'teorcode: bch codes', 'bch encoding, systematic bch encoding, extended euclidean algo, berleklamp-massey decoding', interval '2 hour'),
        (5, 'diffur lecture 1', '1', interval '2 hour'),
        (5, 'diffur lecture 2-3', '2-3', interval '3 hour'),
        (5, 'diffur lecture 4', '4', interval '2 hour'),
        (5, 'diffur lecture 5', '5', interval '2 hour'),
        (5, 'diffur lecture 6-7', '6-7', interval '4 hour'),
        (5, 'diffur lecture 8', '8', interval '2 hour');

insert into AddedVideos (VideoId, PlaylistId, UserId)
values  (1, 1, 1),
        (2, 1, 1),
        (3, 1, 1),
        (4, 1, 1),
        (5, 1, 1),
        (6, 3, 1),
        (7, 3, 1),
        (8, 3, 1),
        (9, 2, 1),
        (10, 2, 1),
        (11, 2, 1),
        (13, 4, 3),
        (14, 4, 3),
        (15, 4, 3),
        (16, 4, 3),
        (17, 6, 4),
        (18, 6, 4),
        (19, 7, 5),
        (20, 7, 5),
        (21, 7, 5),
        (22, 7, 5),
        (23, 7, 5),
        (24, 7, 5);

insert into Comments (UserId, VideoId, CommentText)
values  (6, 1, 'Nice video!'),
        (6, 5, 'Very nice video!'),
        (6, 10, 'Cool, thank you'),
        (6, 21, 'very cool dedushka, please continue your diffurs!'),
        (6, 23, 'boring, please, stop doing this'),
        (6, 11, 'Nice video!'),
        (6, 12, 'I decided to study in ITMO and never regret this'),
        (6, 18, 'This video helped me creating bch encoder/decoder for my hw!'),
        (7, 1, 'Nice video!'),
        (7, 2, 'Reccomend everyone watch it till the end'),
        (7, 2, 'Nice video!'),
        (7, 12, 'Thank you, but I will not study at ITMO University, prefer MSU');

insert into CommentLikes (UserId, CommentId, IsLike)
values  (1, 1, true),
        (2, 3, false),
        (3, 3, true),
        (4, 5, true),
        (5, 6, false),
        (6, 8, false),
        (7, 8, false),
        (6, 12, false),
        (6, 9, false),
        (6, 11, true);


insert into VideoLikes (UserId, VideoId, IsLike)
values  (1, 12, true),
        (2, 12, true),
        (3, 12, true),
        (4, 12, true),
        (5, 12, true),
        (6, 12, true),
        (7, 12, false),
        (6, 4, true),
        (6, 18, true),
        (6, 23, false);