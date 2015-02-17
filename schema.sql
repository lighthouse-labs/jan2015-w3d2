# PG SQL 
CREATE TABLE pets (
  id        serial NOT NULL PRIMARY KEY,
  name      varchar(40) NOT NULL,
  breed     varchar(40),
  age       integer,
  attack_power integer
);