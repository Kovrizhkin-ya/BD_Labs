INSERT INTO loc (locname, locregname, locareaname, loctername)
SELECT 
	ukrptname,
	ukrptregname,
	ukrptareaname,
	ukrpttername
FROM zno
WHERE ukrptname IS NOT NULL
ON CONFLICT DO NOTHING;

INSERT INTO loc (locname, locregname, locareaname, loctername)
SELECT 
	histptname,
	histptregname,
	histptareaname,
	histpttername
FROM zno
WHERE histptname IS NOT NULL
ON CONFLICT DO NOTHING;


INSERT INTO loc (locname, locregname, locareaname, loctername)
SELECT 
	mathptname,
	mathptregname,
	mathptareaname,
	mathpttername
FROM zno
WHERE mathptname IS NOT NULL
ON CONFLICT DO NOTHING;

INSERT INTO loc (locname, locregname, locareaname, loctername)
SELECT 
    physptname,
    physptregname,
    physptareaname,
    physpttername
FROM zno
WHERE physptname IS NOT NULL
ON CONFLICT DO NOTHING;

INSERT INTO loc (locname, locregname, locareaname, loctername)
SELECT 
    bioptname,
    bioptregname,
    bioptareaname,
    biopttername
FROM zno
WHERE bioptname IS NOT NULL
ON CONFLICT DO NOTHING;

INSERT INTO loc (locname, locregname, locareaname, loctername)
SELECT 
    chemptname,
    chemptregname,
    chemptareaname,
    chempttername
FROM zno
WHERE chemptname IS NOT NULL
ON CONFLICT DO NOTHING;

INSERT INTO loc (locname, locregname, locareaname, loctername)
SELECT 
    geoptname,
    geoptregname,
    geoptareaname,
    geopttername
FROM zno
WHERE geoptname IS NOT NULL
ON CONFLICT DO NOTHING;


INSERT INTO loc (locname, locregname, locareaname, loctername)
SELECT 
    engptname,
    engptregname,
    engptareaname,
    engpttername
FROM zno
WHERE engptname IS NOT NULL
ON CONFLICT DO NOTHING;


INSERT INTO loc (locname, locregname, locareaname, loctername)
SELECT 
    fraptname,
    fraptregname,
    fraptareaname,
    frapttername
FROM zno
WHERE fraptname IS NOT NULL
ON CONFLICT DO NOTHING;


INSERT INTO loc (locname, locregname, locareaname, loctername)
SELECT 
    spaptname,
    spaptregname,
    spaptareaname,
    spapttername
FROM zno
WHERE spaptname IS NOT NULL
ON CONFLICT DO NOTHING;



INSERT INTO loc (locname, locregname, locareaname, loctername)
SELECT 
    deuptname,
    deuptregname,
    deuptareaname,
    deupttername
FROM zno
WHERE deuptname IS NOT NULL
ON CONFLICT DO NOTHING;








INSERT INTO educate_organisation (eoname, eoregname, eoareaname, eotername, eoparent, eotypename, locid)
SELECT DISTINCT
	eoname,
	eoregname,
	eoareaname,
	eotername,
	eoparent,
	eotypename,
	(SELECT locid
	 FROM loc
	 WHERE 
	 locregname = zno.eoregname AND
	 locareaname = zno.eoareaname AND
	 loctername = zno.eotername
	 LIMIT 1)
FROM zno
WHERE eoname IS NOT NULL
ON CONFLICT DO NOTHING;






INSERT INTO participants (outid, birth, sextypename, regtypename, classprofilename, classlangname, regname, areaname, tername, tertypename, zno_year, locid)
SELECT DISTINCT
	outid,
	birth,
	sextypename,
	regtypename,
	classprofilename,
	classlangname,
	regname,
	areaname,
	tername,
	tertypename,
	zno_year,
	(SELECT locid
	 FROM loc
	 WHERE 
	 locregname = zno.regname AND
	 locareaname = zno.areaname AND
	 loctername = zno.tername
	 LIMIT 1)
FROM zno
WHERE outid IS NOT NULL
ON CONFLICT DO NOTHING;







INSERT INTO participants_eo(eoid, outid)
SELECT DISTINCT
	(SELECT eoid FROM educate_organisation WHERE
	eoname = zno.eoname AND
	eotypename = zno.eotypename AND
	eoparent = zno.eoparent
	LIMIT 1), outid
FROM zno
WHERE eoname IS NOT NULL
ON CONFLICT DO NOTHING;







INSERT INTO test (outid, test, teststatus, ball100, ball12, ball, adaptscale, locid)
SELECT
    outid,
	ukrtest,
	ukrteststatus,
	ukrball100,
	ukrball12,
	ukrball,
	ukradaptscale,
	(SELECT locid FROM loc WHERE
	locregname = zno.ukrptregname AND
	locareaname = zno.ukrptareaname AND
	loctername = zno.ukrpttername
	LIMIT 1)
FROM zno
WHERE ukrtest IS NOT NULL
ON CONFLICT DO NOTHING;


INSERT INTO test (outid, test, testlang, teststatus, ball100, ball12, ball, locid)
SELECT
    outid,
	histtest,
	histlang,
	histteststatus,
	histball100,
	histball12,
	histball,
	(SELECT locid FROM loc WHERE
	locregname = zno.histptregname AND
	locareaname = zno.histptareaname AND
	loctername = zno.histpttername
	LIMIT 1)
FROM zno
WHERE histtest IS NOT NULL
ON CONFLICT DO NOTHING;


INSERT INTO test (outid, test, testlang, teststatus, ball100, ball12, ball, locid)
SELECT
    outid,
	mathtest,
	mathlang,
	mathteststatus,
	mathball100,
	mathball12,
	mathball,
	(SELECT locid FROM loc WHERE
	locregname = zno.mathptregname AND
	locareaname = zno.mathptareaname AND
	loctername = zno.mathpttername
	LIMIT 1)
FROM zno
WHERE mathtest IS NOT NULL
ON CONFLICT DO NOTHING;



INSERT INTO test (outid, test, testlang, teststatus, ball100, ball12, ball, locid)
SELECT
    outid,
    phystest,
	physlang,
    physteststatus,
    physball100,
    physball12,
    physball,
	(SELECT locid FROM loc WHERE
	locregname = zno.physptregname AND
	locareaname = zno.physptareaname AND
	loctername = zno.physpttername
	LIMIT 1)
FROM zno
WHERE phystest IS NOT NULL
ON CONFLICT DO NOTHING;




INSERT INTO test (outid, test, testlang, teststatus, ball100, ball12, ball, locid)
SELECT
    outid,
    chemtest,
	chemlang,
    chemteststatus,
    chemball100,
    chemball12,
    chemball,
	(SELECT locid FROM loc WHERE
	locregname = zno.chemptregname AND
	locareaname = zno.chemptareaname AND
	loctername = zno.chempttername
	LIMIT 1)
FROM zno
WHERE chemtest IS NOT NULL
ON CONFLICT DO NOTHING;



INSERT INTO test (outid, test, testlang, teststatus, ball100, ball12, ball, locid)
SELECT
    outid,
    biotest,
	biolang,
    bioteststatus,
    bioball100,
    bioball12,
    bioball,
	(SELECT locid FROM loc WHERE
	locregname = zno.bioptregname AND
	locareaname = zno.bioptareaname AND
	loctername = zno.biopttername
	LIMIT 1)
FROM zno
WHERE biotest IS NOT NULL
ON CONFLICT DO NOTHING;



INSERT INTO test (outid, test, testlang, teststatus, ball100, ball12, ball, locid)
SELECT
    outid,
    geotest,
	geolang,
    geoteststatus,
    geoball100,
    geoball12,
    geoball,
	(SELECT locid FROM loc WHERE
	locregname = zno.geoptregname AND
	locareaname = zno.geoptareaname AND
	loctername = zno.geopttername
	LIMIT 1)
FROM zno
WHERE geotest IS NOT NULL
ON CONFLICT DO NOTHING;



INSERT INTO test (outid, test, teststatus, ball100, ball12, dpalevel, ball, locid)
SELECT
    outid,
    engtest,
    engteststatus,
    engball100,
    engball12,
	engdpalevel,
    engball,
	(SELECT locid FROM loc WHERE
	locregname = zno.engptregname AND
	locareaname = zno.engptareaname AND
	loctername = zno.engpttername
	LIMIT 1)
FROM zno
WHERE engtest IS NOT NULL
ON CONFLICT DO NOTHING;




INSERT INTO test (outid, test, teststatus, ball100, ball12, dpalevel, ball, locid)
SELECT
    outid,
    fratest,
    frateststatus,
    fraball100,
    fraball12,
	fradpalevel,
    fraball,
	(SELECT locid FROM loc WHERE
	locregname = zno.fraptregname AND
	locareaname = zno.fraptareaname AND
	loctername = zno.frapttername
	LIMIT 1)
FROM zno
WHERE fratest IS NOT NULL
ON CONFLICT DO NOTHING;



INSERT INTO test (outid, test, teststatus, ball100, ball12, dpalevel, ball, locid)
SELECT
    outid,
    spatest,
    spateststatus,
    spaball100,
    spaball12,
	spadpalevel,
    spaball,
	(SELECT locid FROM loc WHERE
	locregname = zno.spaptregname AND
	locareaname = zno.spaptareaname AND
	loctername = zno.spapttername
	LIMIT 1)
FROM zno
WHERE spatest IS NOT NULL
ON CONFLICT DO NOTHING;



INSERT INTO test (outid, test, teststatus, ball100, ball12, dpalevel, ball, locid)
SELECT
    outid,
    deutest,
    deuteststatus,
    deuball100,
    deuball12,
    deudpalevel,
    deuball,
	(SELECT locid FROM loc WHERE
	locregname = zno.deuptregname AND
	locareaname = zno.deuptareaname AND
	loctername = zno.deupttername
	LIMIT 1)
FROM zno
WHERE deutest IS NOT NULL
ON CONFLICT DO NOTHING;