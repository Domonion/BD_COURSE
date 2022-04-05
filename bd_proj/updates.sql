-- check comment text - заменяет 'bad video' на 'good video' в комментариях
create or replace function CommentChecker() returns trigger as $CommentChecker$
begin 
    if lower(NEW.CommentText) like '%bad video%' then
        NEW.CommentText := regexp_replace(NEW.CommentText, 'bad video', 'good video', 'i');
    end if;
    return NEW;
end;
$CommentChecker$ language plpgsql;

-- триггер для CommentChecker
create trigger CommentChecker before insert or update 
on Comments
for each row execute function CommentChecker(); 

-- util procedure for liking comments
create or replace procedure SetCommentLike(comment integer, byUser integer, isLikeValue boolean)
language sql
as $$
insert into CommentLikes (UserId, CommentId, IsLike) 
values  (byUser, comment, isLikeValue)
on conflict(UserId, CommentId) do update 
set IsLike = isLikeValue
$$;

-- dislike comment
create or replace procedure DislikeComment(comment integer, byUser integer)
language sql
as $$
call SetCommentLike(comment, byUser, false)
$$;

-- like comment
create or replace procedure LikeComment(comment integer, byUser integer)
language sql
as $$
call SetCommentLike(comment, byUser, true)
$$;

-- util procedure for liking videos
create or replace procedure SetVideoLike(video integer, byUser integer, isLikeValue boolean)
language sql
as $$
insert into VideoLikes (UserId, VideoId, IsLike) 
values  (byUser, video, isLikeValue)
on conflict(UserId, VideoId) do update 
set IsLike = isLikeValue
$$;

-- dislike video
create or replace procedure DislikeVideo(video integer, byUser integer)
language sql
as $$
call SetVideoLike(video, byUser, false)
$$;

-- like video
create or replace procedure LikeVideo(video integer, byUser integer)
language sql
as $$
call SetVideoLike(video, byUser, true)
$$;


-- create playlist
create or replace procedure CreatePlaylist(byUser integer, nameOfPlaylist varchar(120))
language sql
as $$
insert into PlaylistsCreatedByUser (UserId, PlaylistName)
values (byUser, nameOfPlaylist)
$$;

-- create user
create or replace procedure CreateUser(nameOfUser varchar(80))
language sql
as $$
insert into Users (UserName)
values (nameOfUser)
$$;

-- upload video
create or replace procedure UploadVideo(byUser integer, nameOfVideo varchar(150), descriptionOfVideo varchar(2000), lengthOfVideo interval)
language sql
as $$
insert into Videos (UserId, VideoName, VideoDescription, VideoLength)
values (byUser, nameOfVideo, descriptionOfVideo, lengthOfVideo)
$$;

-- add video to playlist
create or replace procedure AddVideoToPlaylist(playlistToAdd integer, byUser integer, videoToAdd integer)
language sql
as $$
insert into AddedVideos(VideoId, PlaylistId, UserId) 
values (videoToAdd, playlistToAdd, byUser)
$$;

-- comment
create or replace procedure CommentVideo(videoToComment integer, byUser integer, content varchar(1000))
language sql
as $$
insert into Comments(UserId, VideoId, CommentText)
values (byUser, videoToComment, content)
$$;

-- update playlist name
create or replace procedure UpdatePlaylistName(playlistToUpdate integer, newPlaylistName varchar(120), byUser integer)
language sql
as $$
update PlaylistsCreatedByUser
set PlaylistName = newPlaylistName
where PlaylistId = playlistToUpdate and UserId = byUser
$$;

-- update username
create or replace procedure UpdateUserName(byUser integer, newUserName varchar(120))
language sql
as $$
update Users
set UserName = newUserName
where UserId = byUser
$$;

-- update videoname
create or replace procedure UpdateVideoName(videoToUpdate integer, newVideoName varchar(150), byUser integer)
language sql
as $$
update Videos
set VideoName = newVideoName
where Videoid = videoToUpdate and UserId = byUser
$$;

-- update videodescription
create or replace procedure UpdateVideoDescription(videoToUpdate integer, newVideoDescription varchar(150), byUser integer)
language sql
as $$
update Videos
set VideoDescription = newVideoDescription
where Videoid = videoToUpdate and UserId = byUser
$$;

-- update comment text
create or replace procedure UpdateCommentText(commentToUpdate integer, newText varchar(150), byUser integer)
language sql
as $$
update Comments
set CommentText = newText
where CommentId = commentToUpdate and UserId = byUser
$$;