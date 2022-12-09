CREATE TABLE Worldcup_winners (ID int,
		nation varchar(255),
        gold int,
        silver int,
        bronze int,
        total int);

INSERT INTO worldcup_winners
	VALUES (1,'Brazil',5,2,2,9),
    (2,'Germany',4,4,4,12),
    (2,'Germany',4,4,4,12),
    (3,'Italy',4,2,1,7),
    (4,'Argentina',2,3,0,5),
    (5,'France',2,1,2,5),
    (6,'Uruguy',2,0,0,2),
    (7,'England',1,0,0,1),
    (8,'Spain',1,0,0,1),
    (9,'Netherlands',0,3,1,4),
    (9,'Netherlands',0,3,1,4),
    (10,'Czech Republic',0,2,0,2);

/-- Let's check for duplicate --/
SELECT nation, gold, silver,bronze
FROM worldcup_winners
GROUP BY nation
HAVING COUNT(*) > 1;

/-- There are 2 duplicates, so let's remove them --/

CREATE TABLE worldcup_winnerscopy
SELECT DISTINCT *
FROM worldcup_winners;

DROP TABLE worldcup_winners;

ALTER TABLE worldcup_winnerscopy
RENAME TO worldcup_winners;

/-- It seems like Uruguay is misspelled, let's correct that --/

UPDATE worldcup_winners
SET nation = "Uruguay"
WHERE ID = 6;

/-- Let's look at our table --/
SELECT *
FROM worldcup_winners;
