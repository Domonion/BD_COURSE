create sequence UserIdSeq as integer increment by 1 minvalue 1;

create table Users(
    UserId integer primary key not null default nextval('UserIdSeq'),
    UserName varchar(80) not null constraint UsernameCheck check (length(UserName) > 3)
);

alter sequence UserIdSeq owned by Users.UserId;

create sequence VideoIdSeq as integer increment by 1 minvalue 1;

create table Videos(
    VideoId integer primary key not null default nextval('VideoIdSeq'), 
    Userid integer not null references Users(UserId) on delete cascade,
    VideoName varchar(150) not null constraint VideonameCheck check (length(VideoName) > 5),
    VideoDescription varchar(2000) not null,
    UploadedAt timestamp not null default current_timestamp,
    VideoLength interval not null
);

alter sequence VideoIdSeq owned by Videos.VideoId;

create sequence CategoryIdSeq as integer increment by 1 minvalue 1;

create table VideoCategories(
    CategoryId integer primary key default nextval('CategoryIdSeq'),
    CategoryName varchar(100) not null check(length > 5)
);

alter sequence CategoryIdSeq owned by VideoCategories.CategoryId;

-- select * from Videos left join (
--     select VideoId, count(UserId) as Likes from VideoLikes 
--     where IsLike = true
--     group by VideoId
-- ) s2 on Videos.VideoId = s2.VideoId
-- order by Likes desc;

create or replace function promoteUpdater() returns trigger as $promoteUpdater$
begin 
    update Categories 
    set CatValue = true
    where VideoId exists in 
    Videos natural join VideoCategories natural join (
            select VideoId, count(UserId) as Likes from VideoLikes
            where IsLike = true and LikedAt between current_timestamp - interval '1 day' and current_timestamp
            group by VideoId
    ) s100
    group by CategoryId
    having (10%);

    update Categories 
    set CatValue = true
    where VideoId not exists in 
    Videos natural join VideoCategories natural join (
            select VideoId, count(UserId) as Likes from VideoLikes
            where IsLike = true and LikedAt between current_timestamp - interval '1 day' and current_timestamp
            group by VideoId
    ) s100
    group by CategoryId
    having (10%);
end;
$promoteUpdater$ language plpgsql;

create trigger promoteUpdater after insert or update or delete
on VideoLikes
for each statement execute function promoteUpdater(); 

create table CategoriesPerVideo(
    VideoId integer not null reference Videos(VideoId) on delete cascade, 
    CategoryId integer not null reference VideoCategories(CategoryId) on delete cascade,
    CatValue boolean,
    primary key(VideoId, CategoryId)
);

create sequence CommentIdSeq as integer increment by 1 minvalue 1;

create table Comments(
    CommentId integer primary key not null default nextval('CommentIdSeq'),
    UserId integer not null references Users(UserId) on delete cascade,
    VideoId integer not null references Videos(VideoId) on delete cascade,
    CommentText varchar(1000) not null,
    CreatedAt timestamp not null default current_timestamp
);

alter sequence CommentIdSeq owned by Comments.CommentId;

create table CommentLikes(
    UserId integer not null references Users(UserId) on delete cascade,
    CommentId integer not null references Comments(CommentId) on delete cascade,
    IsLike boolean not null,
    primary key(UserId, CommentId)
);

create table VideoLikes(
    UserId integer not null references Users(UserId) on delete cascade,
    VideoId integer not null references Videos(Videoid) on delete cascade,
    IsLike boolean not null,
    primary key(UserId, Videoid)
);

create sequence PlaylistIdSeq as integer increment by 1 minvalue 1;

create table PlaylistsCreatedByUser(
    PlaylistId integer not null default nextval('PlaylistIdSeq'),
    UserId integer not null references Users(UserId) on delete cascade,
    PlaylistName varchar(120) not null check (length(PlaylistName) > 5),
    primary key(PlaylistId, UserId) 
);

alter sequence PlaylistIdSeq owned by PlaylistsCreatedByUser.PlaylistId;

create table AddedVideos(
    VideoId integer not null references Videos(VideoId) on delete cascade,
    PlaylistId integer not null,
    UserId integer not null,
    primary key(Videoid, PlaylistId, UserId),
    foreign key (PlaylistId, UserId) references PlaylistsCreatedByUser(PlaylistId, UserId) on delete cascade
);


-- postgres автоматически создает индексы на ключи, то есть так же тут неявно содержатся следующие индексы:
-- create unique index users_pkey on public.users using btree (userid)
-- create unique index videos_pkey on public.videos using btree (videoid)
-- create unique index comments_pkey on public.comments using btree (commentid)
-- create unique index commentlikes_pkey on public.commentlikes using btree (userid, commentid)
-- create unique index videolikes_pkey on public.videolikes using btree (userid, videoid)
-- create unique index playlistscreatedbyuser_pkey on public.playlistscreatedbyuser using btree (playlistid, userid)
-- create unique index addedvideos_pkey on public.addedvideos using btree (videoid, playlistid, userid)