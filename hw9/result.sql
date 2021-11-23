create table if not exists Flights (
        FlightId integer primary key not null, 
        FlightTime timestamp not null, 
        PlaneId integer not null,
        SeatRows integer not null -- how many rows in plane available at flight
    );

create table if not exists Seats(
        PlaneId integer not null,
        SeatNo varchar(4) not null,
        FlightId integer not null, -- we cant buy seat on plane. we buy seat at certain flight at some plane
        SeatState SeatStatus not null,
        LastStateChange timestamp not null default now(), -- used to check book availability
        UserId integer, -- who bought
        Passport varchar(100), -- who will fly
        primary key (PlaneId, FlightId)
    );

create or replace function FreeSeats(flight integer) 
returns table (PlaneId integer, FlightId integer, SeatNo varchar(4))
language plpgsql
as $$
begin
return query 
    select PlaneId, FlightId, SeatNo
    from Seats
    where PlaneId = (select PlaneId from Flights where FlightId = flight) and FlightId = flight 
    and (SeatState != 'bought'::SeatStatus or now() > dateadd(day, 3, LastStateChange));
end
$$;