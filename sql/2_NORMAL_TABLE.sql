
DROP TABLE IF EXISTS educate_organisation, participants, loc, test, participants_eo;

CREATE TABLE loc (
    locid SERIAL PRIMARY KEY,
    locname varchar,
    locregname varchar,
    locareaname varchar,
    loctername varchar,
	UNIQUE(locname, locregname, loctername)
);


CREATE TABLE educate_organisation (
    eoid SERIAL PRIMARY KEY,
    eoname varchar,
    eoregname varchar,
    eoareaname varchar,
    eotername varchar,
    eoparent varchar,
    eotypename varchar,
    locid INTEGER,
    FOREIGN KEY (locid) REFERENCES loc (locid),
	UNIQUE(eoname, eotypename, eoparent)
);

CREATE TABLE participants (
    outid varchar PRIMARY KEY,
    birth numeric,
    sextypename varchar,
    regtypename varchar,
    classprofilename varchar,
    classlangname varchar,
    regname varchar,
    areaname varchar,
    tername varchar,
    tertypename varchar,
    zno_year INTEGER,
    locid INTEGER,
    FOREIGN KEY (locid) REFERENCES loc (locid)
);


CREATE TABLE test (
    testid SERIAL PRIMARY KEY,
	outid varchar,
    test varchar,
    testlang varchar,
    teststatus varchar,
    ball100 decimal,
    ball12 numeric,
    ball numeric,
    adaptscale numeric,
    dpalevel varchar,
    locid INTEGER,
    FOREIGN KEY (locid) REFERENCES loc (locid),
	FOREIGN KEY (outid) REFERENCES participants (outid),
	UNIQUE(outid, test)
);

CREATE TABLE participants_eo (
    outid varchar,
    eoid INTEGER,
    FOREIGN KEY (outid) REFERENCES participants (outid),
    FOREIGN KEY (eoid) REFERENCES educate_organisation (eoid),
	UNIQUE(outid, eoid)
);



