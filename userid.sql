-- userid.sql
ALTER DATABASE system CONFIGURE ZONE USING lease_preferences = '[[+region=aws-us-west-2]]';

alter database klei primary region "aws-us-west-2";
alter database klei add region "aws-eu-central-1";
alter database klei add region "aws-ap-southeast-1";



use klei;

CREATE TABLE userid ( 
        ku string           NOT NULL,
        region STRING       NOT NULL DEFAULT gateway_region(),
        steamid             decimal,
        psnid               string,
        railcommonid        string,
        xboxid              string,
        epicid              string,
        nintendoaccountid   string,
        nintendosaid        string,
        PRIMARY KEY (ku ASC),
	UNIQUE INDEX (region, ku),
        UNIQUE INDEX steamidindex (steamid ASC) WHERE steamid IS NOT NULL,
        UNIQUE INDEX psnidindex (psnid ASC) WHERE psnid IS NOT NULL,
        UNIQUE INDEX railcommonidindex (railcommonid ASC) WHERE railcommonid IS NOT NULL,
        UNIQUE INDEX xboxidindex (xboxid ASC) WHERE xboxid IS NOT NULL,
        UNIQUE INDEX epicidindex (epicid ASC) WHERE epicid IS NOT NULL,
        UNIQUE INDEX nintendosaidindex (nintendosaid ASC) WHERE nintendosaid IS NOT NULL
) locality global;



insert into userid (ku) values ('ID0002');
INSERT 1


Time: 448ms total (execution 448ms / network 1ms)

insert into userid (ku) values ('ID0003');
INSERT 1


Time: 490ms total (execution 490ms / network 1ms)

insert into userid (ku) values ('ID0004');
INSERT 1


Time: 387ms total (execution 386ms / network 1ms)

