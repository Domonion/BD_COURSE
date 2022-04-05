-- в тренде - Выдает видео, отсортированные по убыванию лайков, загруженные за последний день
create view HotVideos as 
    select Videos.Videoid, Videos.UserId, Users.UserName, Videos.VideoName, Videos.UploadedAt, Likes 
    from Videos natural join Users left join (
        select VideoId, count(UserId) as Likes from VideoLikes
        where IsLike = true
        group by VideoId
    ) s5 on Videos.VideoId = s5.VideoId
    where UploadedAt between current_timestamp - interval '1 day' and current_timestamp
    order by Likes desc;

select * from HotVideos;

-- все видео
select * from Videos;

-- все видео, отсортированные по длительности
select * from Videos 
order by VideoLength desc;

-- все видео пользователей, у котороых в имени есть itmo
select * from Videos natural join Users
where UserName like '%itmo%';

-- видео в плейлистах со словом course
select * from PlaylistsCreatedByUser natural join AddedVideos natural join (
    select VideoId, VideoName, VideoDescription, UploadedAt, VideoLength from Videos
) s1
where PlaylistName like '%course%';

-- количество лайков для всех видео
select * from Videos left join (
    select VideoId, count(UserId) as Likes from VideoLikes 
    where IsLike = true
    group by VideoId
) s2 on Videos.VideoId = s2.VideoId
order by Likes desc;

-- количество комментариев для всех видео
select * from Videos left join (
    select VideoId, count(CommentId) as CommentsCount from Comments
    group by VideoId
) s3 on Videos.VideoId = s3.VideoId
order by CommentsCount desc;

-- пары (комменатрий, количество дизлайков) для всех комментариев
select * from Comments left join (
    select CommentId, count(UserId) as Likes from CommentLikes
    where IsLike = false
    group by CommentId
) s4 on Comments.CommentId = s4.CommentId
order by Likes desc;

-- видео за год
select * from Videos
where UploadedAt between '2021-01-15' and '2022-01-15';