-- userinfo.sql

CREATE TABLE userinfo ( 
    region STRING       NOT NULL DEFAULT gateway_region(),
    ku string UNIQUE,
    data jsonb NOT NULL,
    email string AS (Data->>'Email') STORED, 
    PRIMARY KEY (region, ku),
    INDEX emailindex (email) WHERE (email) IS NOT NULL,
    FOREIGN KEY (region, KU) REFERENCES klei.userid (region, ku) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE);
    PARTITION BY LIST (region) (
       PARTITION "aws-us-west-2" VALUES IN ('aws-us-west-2'),
       PARTITION "aws-ap-southeast-1" VALUES IN ('aws-ap-southeast-1'),
       PARTITION "aws-eu-central-1" VALUES IN ('aws-eu-central-1')
    );

ALTER PARTITION "aws-us-west-2" OF INDEX userinfo@userinfo_pkey CONFIGURE ZONE USING
    constraints = '[+region=aws-us-west-2]';
ALTER PARTITION "aws-ap-southeast-1" OF INDEX userinfo@userinfo_pkey CONFIGURE ZONE USING
    constraints = '[+region=aws-ap-southeast-1]';
ALTER PARTITION "aws-eu-central-1" OF INDEX userinfo@userinfo_pkey CONFIGURE ZONE USING
    constraints = '[+region=aws-eu-central-1]'


insert into userinfo (ku, data) values('ID0001','{"id": "d78236", "firstName": "Arthur", "lastName": "Read", "birthdate": "2010-01-25", "school": "PVPHS", "credits": 120, "sports": "none"}');
insert into userinfo (ku, data) values('ID0002','{"id": "d78236", "firstName": "Arthur", "lastName": "Read", "birthdate": "2010-01-25", "school": "PVPHS", "credits": 120, "sports": "none"}');
insert into userinfo (ku, data) values('ID0003','{"id": "d78236", "firstName": "Arthur", "lastName": "Read", "birthdate": "2010-01-25", "school": "PVPHS", "credits": 120, "sports": "none"}');
insert into userinfo (ku, data) values('ID0004','{"id": "d78236", "firstName": "Arthur", "lastName": "Read", "birthdate": "2010-01-25", "school": "PVPHS", "credits": 120, "sports": "none"}');


CREATE TABLE userinfo ( 
    region STRING       NOT NULL DEFAULT gateway_region(),
    ku string UNIQUE,
    data jsonb NOT NULL,
    email string AS (Data->>'Email') STORED, 
    PRIMARY KEY (region, ku),
    INDEX emailindex (email) WHERE (email) IS NOT NULL,
    FOREIGN KEY (region, KU) REFERENCES klei.userid (region, ku) MATCH FULL ON DELETE CASCADE ON UPDATE CASCADE)
    locality regional by row;
    


