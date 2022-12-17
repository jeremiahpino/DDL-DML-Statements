-- Lab 2
-- jpino01
-- Oct 11, 2022

USE `jpino01`;
-- AIRLINES
-- Create and populate relational tables corresponding to the AIRLINES dataset (schema and data provided on Canvas)
DROP TABLE IF EXISTS flights;
DROP TABLE IF EXISTS airports;
DROP TABLE IF EXISTS airlines;

-- CREATE TABLES

-- airport table
CREATE TABLE airports(

-- declaration of attributes (columns)
City VARCHAR(255),
AirportCode VARCHAR(255), -- airport code is primary key
AirportName VARCHAR(255),
Country VARCHAR(255),
CountryAbbrev VARCHAR(255),

PRIMARY KEY(AirportCode)
);

-- insert statements airports
INSERT INTO airports(City, AirportCode, AirportName, Country, CountryAbbrev) values( "Aberdeen", "APG", "Phillips AAF", "United States", "US" );
INSERT INTO airports(City, AirportCode, AirportName, Country, CountryAbbrev) values( "Aberdeen", "ABR", "Municipal", "United States", "US" );
INSERT INTO airports(City, AirportCode, AirportName, Country, CountryAbbrev) values( "Abilene", "DYS", "Dyess AFB", "United States", "US" );
INSERT INTO airports(City, AirportCode, AirportName, Country, CountryAbbrev) values( "Abilene", "ABI", "Municipal", "United States", "US" );
INSERT INTO airports(City, AirportCode, AirportName, Country, CountryAbbrev) values( "Abingdon", "VJI", "Virginia Highlands", "United States", "US" );
INSERT INTO airports(City, AirportCode, AirportName, Country, CountryAbbrev) values( "Ada", "ADT", "Ada", "United States", "US" );
INSERT INTO airports(City, AirportCode, AirportName, Country, CountryAbbrev) values( "Adak Island", "ADK", "Adak Island Ns", "United States", "US" );
INSERT INTO airports(City, AirportCode, AirportName, Country, CountryAbbrev) values( "Adrian", "ADG", "Lenawee County", "United States", "US" );
INSERT INTO airports(City, AirportCode, AirportName, Country, CountryAbbrev) values( "Afton", "AFO", "Municipal", "United States", "US" );
INSERT INTO airports(City, AirportCode, AirportName, Country, CountryAbbrev) values( "Aiken", "AIK", "Municipal", "United States", "US" );
INSERT INTO airports(City, AirportCode, AirportName, Country, CountryAbbrev) values( "Ainsworth", "ANW", "Ainsworth", "United States", "US" );
INSERT INTO airports(City, AirportCode, AirportName, Country, CountryAbbrev) values( "Akhiok", "AKK", "Akhiok SPB", "United States", "US" );
INSERT INTO airports(City, AirportCode, AirportName, Country, CountryAbbrev) values( "Akiachak", "KKI", "Spb", "United States", "US" );
INSERT INTO airports(City, AirportCode, AirportName, Country, CountryAbbrev) values( "Akiak", "AKI", "Akiak", "United States", "US" );
INSERT INTO airports(City, AirportCode, AirportName, Country, CountryAbbrev) values( "Akron CO", "AKO", "Colorado Plains Regional Airport", "United States", "US" );
INSERT INTO airports(City, AirportCode, AirportName, Country, CountryAbbrev) values( "Akron/Canton OH", "CAK", "Akron/canton Regional", "United States", "US" );
INSERT INTO airports(City, AirportCode, AirportName, Country, CountryAbbrev) values( "Akron/Canton", "AKC", "Fulton International", "United States", "US" );

-- airline table 
CREATE TABLE airlines(

ID INTEGER, -- airline Id is a primary key
Airline VARCHAR(255),
Abbreviation VARCHAR(255),
Country VARCHAR(255),

-- add unique to ensure not duplicates
UNIQUE(Abbreviation),

-- key declaration
PRIMARY KEY(Id)
);

-- insert statements of airline
INSERT INTO airlines(ID, Airline, Abbreviation, Country) values( 1 , "United Airlines", "UAL", "USA" );
INSERT INTO airlines(ID, Airline, Abbreviation, Country) values( 2 , "US Airways", "USAir", "USA" );
INSERT INTO airlines(ID, Airline, Abbreviation, Country) values( 3 , "Delta Airlines", "Delta", "USA" );
INSERT INTO airlines(ID, Airline, Abbreviation, Country) values( 4 , "Southwest Airlines", "Southwest", "USA" );
INSERT INTO airlines(ID, Airline, Abbreviation, Country) values( 5 , "American Airlines", "American", "USA" );
INSERT INTO airlines(ID, Airline, Abbreviation, Country) values( 6 , "Northwest Airlines", "Northwest", "USA" );
INSERT INTO airlines(ID, Airline, Abbreviation, Country) values( 7 , "Continental Airlines", "Continental", "USA" );
INSERT INTO airlines(ID, Airline, Abbreviation, Country) values( 8 , "JetBlue Airways", "JetBlue", "USA" );
INSERT INTO airlines(ID, Airline, Abbreviation, Country) values( 9 , "Frontier Airlines", "Frontier", "USA" );
INSERT INTO airlines(ID, Airline, Abbreviation, Country) values( 10 , "AirTran Airways", "AirTran", "USA" );
INSERT INTO airlines(ID, Airline, Abbreviation, Country) values( 11 , "Allegiant Air", "Allegiant", "USA" );
INSERT INTO airlines(ID, Airline, Abbreviation, Country) values( 12 , "Virgin America", "Virgin", "USA" );

-- flight Table 
CREATE TABLE flights (

-- declaration of attributes (columns)
Airline INTEGER, -- foreign key to airline id
FlightNo INTEGER, 
SourceAirport VARCHAR(255) NOT NULL, 
DestAirport VARCHAR(255) NOT NULL,

-- key declarations 
PRIMARY KEY(Airline, FlightNo),

-- count of flights on United
FOREIGN KEY (Airline) REFERENCES airlines(Id),
FOREIGN KEY (SourceAirport) REFERENCES airports(AirportCode),
FOREIGN KEY (DestAirport) REFERENCES airports(AirportCode)
);

-- insert statements flights
INSERT INTO flights(Airline, FlightNo, SourceAirport, DestAirport) values(1 ,  28, "APG", "ABR" );
INSERT INTO flights(Airline, FlightNo, SourceAirport, DestAirport) values(1 ,  29, "AIK", "ADT" );
INSERT INTO flights(Airline, FlightNo, SourceAirport, DestAirport) values(1 ,  44, "AKO", "AKI" );
INSERT INTO flights(Airline, FlightNo, SourceAirport, DestAirport) values(1 ,  45, "CAK", "APG" );
INSERT INTO flights(Airline, FlightNo, SourceAirport, DestAirport) values(1 ,  54, "AFO", "AKO" );
INSERT INTO flights(Airline, FlightNo, SourceAirport, DestAirport) values(3 ,  2, "AIK", "ADT" );
INSERT INTO flights(Airline, FlightNo, SourceAirport, DestAirport) values(3 ,  3, "DYS", "ABI" );
INSERT INTO flights(Airline, FlightNo, SourceAirport, DestAirport) values(3 ,  26, "AKK", "VJI" );
INSERT INTO flights(Airline, FlightNo, SourceAirport, DestAirport) values(9 ,  1260, "AKO", "AKC" );
INSERT INTO flights(Airline, FlightNo, SourceAirport, DestAirport) values(9 ,  1261, "APG", "ABR" );
INSERT INTO flights(Airline, FlightNo, SourceAirport, DestAirport) values(9 ,  1286, "ABR", "APG" );
INSERT INTO flights(Airline, FlightNo, SourceAirport, DestAirport) values(9 ,  1287, "DYS", "ANW" );
INSERT INTO flights(Airline, FlightNo, SourceAirport, DestAirport) values(10 ,  6, "KKI", "AKC" );
INSERT INTO flights(Airline, FlightNo, SourceAirport, DestAirport) values(10 ,  7, "VJI", "APG" );
INSERT INTO flights(Airline, FlightNo, SourceAirport, DestAirport) values(10 ,  54, "ADT", "APG" );
INSERT INTO flights(Airline, FlightNo, SourceAirport, DestAirport) values(6 ,  4, "AIK", "AKO" );
INSERT INTO flights(Airline, FlightNo, SourceAirport, DestAirport) values(6 ,  5, "CAK", "APG" );
INSERT INTO flights(Airline, FlightNo, SourceAirport, DestAirport) values(6 ,  28, "AKO", "ABI" );
INSERT INTO flights(Airline, FlightNo, SourceAirport, DestAirport) values(6 ,  29, "ABR", "ABI" );

SELECT * FROM flights;
SELECT * FROM airports;
SELECT * FROM airlines;


USE `jpino01`;
-- KATZENJAMMER
-- Create and populate the KATZENJAMMER database
DROP TABLE IF EXISTS Tracklists;
DROP TABLE IF EXISTS Performance;
DROP TABLE IF EXISTS Vocals;
DROP TABLE IF EXISTS Instruments;
DROP TABLE IF EXISTS Songs;
DROP TABLE IF EXISTS Albums;
DROP TABLE IF EXISTS Band;


-- Create Tables

CREATE TABLE Songs(

-- Song Variables
SongId INTEGER,
Title VARCHAR(255),

-- *** add song with duplicate id NOT working
UNIQUE(SongId),

-- Song key declaration
PRIMARY KEY(SongId)
);

-- insert song statements
INSERT INTO Songs (SongId, Title) VALUES( 1 , "Overture" );
INSERT INTO Songs (SongId, Title) VALUES( 2 , "A Bar In Amsterdam" );
INSERT INTO Songs (SongId, Title) VALUES( 3 , "Demon Kitty Rag" );
INSERT INTO Songs (SongId, Title) VALUES( 4 , "Tea With Cinnamon" );
INSERT INTO Songs (SongId, Title) VALUES( 5 , "Hey Ho on the Devil's Back" );
INSERT INTO Songs (SongId, Title) VALUES( 6 , "Wading in Deeper" );
INSERT INTO Songs (SongId, Title) VALUES( 7 , "Le Pop" );
INSERT INTO Songs (SongId, Title) VALUES( 8 , "Der Kapitan" );
INSERT INTO Songs (SongId, Title) VALUES( 9 , "Virginia Clemm" );
INSERT INTO Songs (SongId, Title) VALUES( 10 , "Play My Darling" );
INSERT INTO Songs (SongId, Title) VALUES( 11 , "To the Sea" );
INSERT INTO Songs (SongId, Title) VALUES( 12 , "Mother Superior" );
INSERT INTO Songs (SongId, Title) VALUES( 13 , "Aint no Thang" );
INSERT INTO Songs (SongId, Title) VALUES( 14 , "A Kiss Before You Go" );
INSERT INTO Songs (SongId, Title) VALUES( 15 , "I Will Dance (When I Walk Away)" );
INSERT INTO Songs (SongId, Title) VALUES( 16 , "Cherry Pie" );
INSERT INTO Songs (SongId, Title) VALUES( 17 , "Land of Confusion" );
INSERT INTO Songs (SongId, Title) VALUES( 18 , "Lady Marlene" );
INSERT INTO Songs (SongId, Title) VALUES( 19 , "Rock-Paper-Scissors" );
INSERT INTO Songs (SongId, Title) VALUES( 20 , "Cocktails and Ruby Slippers" );
INSERT INTO Songs (SongId, Title) VALUES( 21 , "Soviet Trumpeter" );
INSERT INTO Songs (SongId, Title) VALUES( 22 , "Loathsome M" );
INSERT INTO Songs (SongId, Title) VALUES( 23 , "Shepherds Song" );
INSERT INTO Songs (SongId, Title) VALUES( 24 , "Gypsy Flee" );
INSERT INTO Songs (SongId, Title) VALUES( 25 , "Gods Great Dust Storm" );
INSERT INTO Songs (SongId, Title) VALUES( 26 , "Ouch" );
INSERT INTO Songs (SongId, Title) VALUES( 27 , "Listening to the World" );
INSERT INTO Songs (SongId, Title) VALUES( 28 , "Johnny Blowtorch" );
INSERT INTO Songs (SongId, Title) VALUES( 29 , "Flash" );
INSERT INTO Songs (SongId, Title) VALUES( 30 , "Driving After You" );
INSERT INTO Songs (SongId, Title) VALUES( 31 , "My Own Tune" );
INSERT INTO Songs (SongId, Title) VALUES( 32 , "Badlands" );
INSERT INTO Songs (SongId, Title) VALUES( 33 , "Old De Spain" );
INSERT INTO Songs (SongId, Title) VALUES( 34 , "Oh My God" );
INSERT INTO Songs (SongId, Title) VALUES( 35 , "Lady Gray" );
INSERT INTO Songs (SongId, Title) VALUES( 36 , "Shine Like Neon Rays" );
INSERT INTO Songs (SongId, Title) VALUES( 37 , "Flash in the Dark" );
INSERT INTO Songs (SongId, Title) VALUES( 38 , "My Dear" );
INSERT INTO Songs (SongId, Title) VALUES( 39 , "Bad Girl" );
INSERT INTO Songs (SongId, Title) VALUES( 40 , "Rockland" );
INSERT INTO Songs (SongId, Title) VALUES( 41 , "Curvaceous Needs" );
INSERT INTO Songs (SongId, Title) VALUES( 42 , "Borka" );
INSERT INTO Songs (SongId, Title) VALUES( 43 , "Let it Snow" );

CREATE TABLE Albums(

-- Album Variables
AlbumId INTEGER,
Title VARCHAR(255),
Year INTEGER,
Label VARCHAR(255),
aType VARCHAR(255),

-- Album key declaration
PRIMARY KEY(AlbumId)
);

CREATE TABLE Band(

-- Band Variables
Id INTEGER,
Firstname VARCHAR(255),
Lastname VARCHAR(255),

-- Band key declaration
PRIMARY KEY(Id)
);

CREATE TABLE Tracklists(

-- Tracklist Variables
AlbumId INTEGER, -- foriegn key to AlbumId in Albums
Position INTEGER,
SongId INTEGER, -- foreign key to SongId in Songs

-- Tracklist key declaration
PRIMARY KEY(AlbumId, Position),

FOREIGN KEY (AlbumId) REFERENCES Albums(AlbumId),
FOREIGN KEY (SongId) REFERENCES Songs(SongId)
);

CREATE TABLE Performance(

-- Performance Variables
SongId INTEGER, -- foreign key to SongId in Songs
Bandmate INTEGER, -- foreign key to Id in Band
StagePosition VARCHAR(255),
UNIQUE(SongId, Bandmate),

-- Performance key declaration
PRIMARY KEY(SongId, Bandmate, StagePosition),

FOREIGN KEY (SongId) REFERENCES Songs(SongId),
FOREIGN KEY (Bandmate) REFERENCES Band(Id)
);

CREATE TABLE Vocals(

-- Vocals Variables
SongId INTEGER, -- foreign key to SongId in Songs
Bandmate INTEGER, -- foreign key to Id in Band
vType VARCHAR(255),

-- Vocals key declaration
PRIMARY KEY(SongId, Bandmate),

FOREIGN KEY (SongId) REFERENCES Songs(SongId),
FOREIGN KEY (Bandmate) REFERENCES Band(Id)
);

CREATE TABLE Instruments(

-- Instruments Variables
SongId INTEGER, -- foreign key to SongId in Songs
BandmateId INTEGER, -- foreign key to Id in Band
Instrument VARCHAR(255),

-- Instruments key declaration
PRIMARY KEY(SongId, BandmateId, Instrument),

FOREIGN KEY (SongId) REFERENCES Songs(SongId),
FOREIGN KEY (BandmateId) REFERENCES Band(Id)
);


-- insert albums
INSERT INTO Albums (AlbumId, Title, Year, Label, aType) VALUES( 1 ,'Le Pop', 2008, 'Propeller Recordingst', 'Studio' );
INSERT INTO Albums (AlbumId, Title, Year, Label, aType) VALUES( 2 ,'A Kiss Before You Go', 2011, 'Propeller Recordings', 'Studio' );
INSERT INTO Albums (AlbumId, Title, Year, Label, aType) VALUES( 3 ,'A Kiss Before You Go: Live in Hamburg', 2012, 'Universal Music Group', 'Live' );
INSERT INTO Albums (AlbumId, Title, Year, Label, aType) VALUES( 4 ,'Rockland', 2015, 'Propeller Recordings', 'Studio' );

-- insert band
INSERT INTO Band (Id, Firstname, Lastname) VALUES( 1 ,'Solveig', 'Heilo' );
INSERT INTO Band (Id, Firstname, Lastname) VALUES( 2 ,'Marianne', 'Sveen' );
INSERT INTO Band (Id, Firstname, Lastname) VALUES( 3 ,'Anne-Marit', 'Bergheim' );
INSERT INTO Band (Id, Firstname, Lastname) VALUES( 4 ,'Turid', 'Jorgensen' );

-- insert tracklists
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 1 , 1 , 1 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 1 , 2 , 2 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 1 , 3 , 3 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 1 , 4 , 4 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 1 , 5 , 5 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 1 , 6 , 6 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 1 , 7 , 7 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 1 , 8 , 8 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 1 , 9 , 9 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 1 , 10 , 10 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 1 , 11 , 11 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 1 , 12 , 12 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 1 , 13 , 13 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 2 , 1 , 14 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 2 , 2 , 15 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 2 , 3 , 16 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 2 , 4 , 17 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 2 , 5 , 18 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 2 , 6 , 19 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 2 , 7 , 20 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 2 , 8 , 21 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 2 , 9 , 22 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 2 , 10 , 23 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 2 , 11 , 24 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 2 , 12 , 25 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 3 , 1 , 14 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 3 , 2 , 26 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 3 , 3 , 3 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 3 , 4 , 15 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 3 , 5 , 11 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 3 , 6 , 19 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 3 , 7 , 18 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 3 , 8 , 16 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 3 , 9 , 12 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 3 , 10 , 17 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 3 , 11 , 22 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 3 , 12 , 20 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 3 , 13 , 2 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 3 , 14 , 5 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 3 , 15 , 8 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 3 , 16 , 7 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 3 , 17 , 25 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 3 , 18 , 13 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 3 , 19 , 24 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 4 , 1 , 33 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 4 , 2 , 41 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 4 , 3 , 34 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 4 , 4 , 35 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 4 , 5 , 31 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 4 , 6 , 36 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 4 , 7 , 30 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 4 , 8 , 37 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 4 , 9 , 38 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 4 , 10 , 39 );
INSERT INTO Tracklists (AlbumId, Position, SongId) VALUES( 4 , 11 , 40 );

-- insert performance
INSERT INTO Performance (SongId, Bandmate, StagePosition) VALUES( 1 , 1 , 'back' );
INSERT INTO Performance (SongId, Bandmate, StagePosition) VALUES( 1 , 2 , 'left' );
INSERT INTO Performance (SongId, Bandmate, StagePosition) VALUES( 1 , 3 , 'center' );
INSERT INTO Performance (SongId, Bandmate, StagePosition) VALUES( 1 , 4 , 'right' );
INSERT INTO Performance (SongId, Bandmate, StagePosition) VALUES( 2 , 1 , 'center' );
INSERT INTO Performance (SongId, Bandmate, StagePosition) VALUES( 2 , 2 , 'back' );
INSERT INTO Performance (SongId, Bandmate, StagePosition) VALUES( 2 , 3 , 'left' );
INSERT INTO Performance (SongId, Bandmate, StagePosition) VALUES( 2 , 4 , 'right' );
INSERT INTO Performance (SongId, Bandmate, StagePosition) VALUES( 3 , 1 , 'back' );
INSERT INTO Performance (SongId, Bandmate, StagePosition) VALUES( 3 , 2 , 'right' );
INSERT INTO Performance (SongId, Bandmate, StagePosition) VALUES( 3 , 3 , 'center' );
INSERT INTO Performance (SongId, Bandmate, StagePosition) VALUES( 3 , 4 , 'left' );
INSERT INTO Performance (SongId, Bandmate, StagePosition) VALUES( 4 , 1 , 'back' );
INSERT INTO Performance (SongId, Bandmate, StagePosition) VALUES( 4 , 2 , 'center' );
INSERT INTO Performance (SongId, Bandmate, StagePosition) VALUES( 4 , 3 , 'left' );
INSERT INTO Performance (SongId, Bandmate, StagePosition) VALUES( 4 , 4 , 'right' );

-- insert vocals
INSERT INTO Vocals (SongId, Bandmate, vType) VALUES( 2 , 1, 'lead' );
INSERT INTO Vocals (SongId, Bandmate, vType) VALUES( 2 , 3, 'chorus' );
INSERT INTO Vocals (SongId, Bandmate, vType) VALUES( 2 , 4, 'chorus' );
INSERT INTO Vocals (SongId, Bandmate, vType) VALUES( 3 , 2, 'lead' );
INSERT INTO Vocals (SongId, Bandmate, vType) VALUES( 4 , 1, 'chorus' );
INSERT INTO Vocals (SongId, Bandmate, vType) VALUES( 4 , 2, 'lead' );
INSERT INTO Vocals (SongId, Bandmate, vType) VALUES( 4 , 3, 'chorus' );
INSERT INTO Vocals (SongId, Bandmate, vType) VALUES( 4 , 4, 'chorus' );

-- insert instruments
INSERT INTO Instruments (SongId, BandmateId, Instrument) VALUES( 1 , 1 , "trumpet" );
INSERT INTO Instruments (SongId, BandmateId, Instrument) VALUES( 1 , 2 , "keyboard" );
INSERT INTO Instruments (SongId, BandmateId, Instrument) VALUES( 1 , 3 , "accordion" );
INSERT INTO Instruments (SongId, BandmateId, Instrument) VALUES( 1 , 4 , "bass balalaika" );
INSERT INTO Instruments (SongId, BandmateId, Instrument) VALUES( 2 , 1 , "trumpet" );
INSERT INTO Instruments (SongId, BandmateId, Instrument) VALUES( 2 , 2 , "drums" );
INSERT INTO Instruments (SongId, BandmateId, Instrument) VALUES( 2 , 3 , "guitar" );
INSERT INTO Instruments (SongId, BandmateId, Instrument) VALUES( 2 , 4 , "bass balalaika" );
INSERT INTO Instruments (SongId, BandmateId, Instrument) VALUES( 3 , 1 , "drums" );
INSERT INTO Instruments (SongId, BandmateId, Instrument) VALUES( 3 , 1 , "ukalele" );
INSERT INTO Instruments (SongId, BandmateId, Instrument) VALUES( 3 , 2 , "banjo" );
INSERT INTO Instruments (SongId, BandmateId, Instrument) VALUES( 3 , 3 , "bass balalaika" );
INSERT INTO Instruments (SongId, BandmateId, Instrument) VALUES( 3 , 4 , "keyboards" );
INSERT INTO Instruments (SongId, BandmateId, Instrument) VALUES( 4 , 1 , "drums" );
INSERT INTO Instruments (SongId, BandmateId, Instrument) VALUES( 4 , 2 , "ukalele" );
INSERT INTO Instruments (SongId, BandmateId, Instrument) VALUES( 4 , 3 , "accordion" );
INSERT INTO Instruments (SongId, BandmateId, Instrument) VALUES( 4 , 4 , "bass balalaika" );


SELECT * FROM Songs;
SELECT * FROM Albums;
SELECT * FROM Band;
SELECT * FROM Tracklists;
SELECT * FROM Performance;
SELECT * FROM Vocals;
SELECT * FROM Instruments;


USE `jpino01`;
-- BAKERY
-- Create and populate the BAKERY database
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS goods;
DROP TABLE IF EXISTS receipts;
DROP TABLE IF EXISTS customers;

-- Create Tables

CREATE TABLE customers(

-- customer variables
CId INTEGER,
LastName VARCHAR(255),
FirstName VARCHAR(255),

-- customer key declaration
PRIMARY KEY(CId)
);

-- insert customer statements
INSERT INTO customers (CId, LastName, FirstName) VALUES( 1 , "LOGAN" , "JULIET" );
INSERT INTO customers (CId, LastName, FirstName) VALUES( 2 , "ARZT" , "TERRELL" );
INSERT INTO customers (CId, LastName, FirstName) VALUES( 3 , "ESPOSITA" , "TRAVIS" );
INSERT INTO customers (CId, LastName, FirstName) VALUES( 4 , "ENGLEY" , "SIXTA" );
INSERT INTO customers (CId, LastName, FirstName) VALUES( 5 , "DUNLOW" , "OSVALDO" );
INSERT INTO customers (CId, LastName, FirstName) VALUES( 6 , "SLINGLAND" , "JOSETTE" );
INSERT INTO customers (CId, LastName, FirstName) VALUES( 7 , "TOUSSAND" , "SHARRON" );
INSERT INTO customers (CId, LastName, FirstName) VALUES( 8 , "HELING" , "RUPERT" );
INSERT INTO customers (CId, LastName, FirstName) VALUES( 9 , "HAFFERKAMP" , "CUC" );
INSERT INTO customers (CId, LastName, FirstName) VALUES( 10 , "DUKELOW" , "CORETTA" );
INSERT INTO customers (CId, LastName, FirstName) VALUES( 11 , "STADICK" , "MIGDALIA" );
INSERT INTO customers (CId, LastName, FirstName) VALUES( 12 , "MCMAHAN" , "MELLIE" );
INSERT INTO customers (CId, LastName, FirstName) VALUES( 13 , "ARNN" , "KIP" );
INSERT INTO customers (CId, LastName, FirstName) VALUES( 14 , "S'OPKO" , "RAYFORD" );
INSERT INTO customers (CId, LastName, FirstName) VALUES( 15 , "CALLENDAR" , "DAVID" );
INSERT INTO customers (CId, LastName, FirstName) VALUES( 16 , "CRUZEN" , "ARIANE" );
INSERT INTO customers (CId, LastName, FirstName) VALUES( 17 , "MESDAQ" , "CHARLENE" );
INSERT INTO customers (CId, LastName, FirstName) VALUES( 18 , "DOMKOWSKI" , "ALMETA" );
INSERT INTO customers (CId, LastName, FirstName) VALUES( 19 , "STENZ" , "NATACHA" );
INSERT INTO customers (CId, LastName, FirstName) VALUES( 20 , "ZEME" , "STEPHEN" );

CREATE TABLE receipts(

-- receipt variables
RNumber VARCHAR(255),
-- SaleDate VARCHAR(255),
SaleDate DATE,
Customer INTEGER,

-- receipt key declaration
PRIMARY KEY(RNumber),

FOREIGN KEY(Customer) REFERENCES customers(CId)
);

-- insert statements for receipts
-- Date format: (28-Oct-2007) = 2007-10-28
INSERT INTO receipts (RNumber, SaleDate, Customer) VALUES( "18129" , DATE '2007-10-28' , "15" );
INSERT INTO receipts (RNumber, SaleDate, Customer) VALUES( "51991" , DATE '2007-10-17' , "14" );
INSERT INTO receipts (RNumber, SaleDate, Customer) VALUES( "83085" , DATE '2007-10-12' , "7" );
INSERT INTO receipts (RNumber, SaleDate, Customer) VALUES( "70723" , DATE '2007-10-28' , "20" );
INSERT INTO receipts (RNumber, SaleDate, Customer) VALUES( "13355" , DATE '2007-10-12' , "7" );
INSERT INTO receipts (RNumber, SaleDate, Customer) VALUES( "52761" , DATE '2007-10-27' , "8" );
INSERT INTO receipts (RNumber, SaleDate, Customer) VALUES( "99002" , DATE '2007-10-13' , "20" );
INSERT INTO receipts (RNumber, SaleDate, Customer) VALUES( "58770" , DATE '2007-10-22' , "18" );
INSERT INTO receipts (RNumber, SaleDate, Customer) VALUES( "84665" , DATE '2007-10-10' , "6" );

CREATE TABLE goods(

-- goods variables
GId VARCHAR(255),
Flavor VARCHAR(255),
Food VARCHAR(255),
Price DECIMAL(5,2),

UNIQUE(Flavor, Food),
-- goods key declaration
PRIMARY KEY(GId)
);

-- insert goods
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "20-BC-C-10" , "Chocolate" , "Cake" , 8.95 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "20-BC-L-10" , "Lemon" , "Cake" , 8.95 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "20-CA-7.5" , "Casino" , "Cake" , 15.95 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "24-8x10" , "Opera" , "Cake" , 15.95 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "25-STR-9" , "Strawberry" , "Cake" , 11.95 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "26-8x10" , "Truffle" , "Cake" , 15.95 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "45-CH" , "Chocolate" , "Eclair" , 3.25 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "45-CO" , "Coffee" , "Eclair" , 3.5 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "45-VA" , "Vanilla" , "Eclair" , 3.25 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "46-11" , "Napoleon" , "Cake" , 13.49 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "90-ALM-I" , "Almond" , "Tart" , 3.75 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "90-APIE-10" , "Apple" , "Pie" , 5.25 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "90-APP-11" , "Apple" , "Tart" , 3.25 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "90-APR-PF" , "Apricot" , "Tart" , 3.25 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "90-BER-11" , "Berry" , "Tart" , 3.25 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "90-BLK-PF" , "Blackberry" , "Tart" , 3.25 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "90-BLU-11" , "Blueberry" , "Tart" , 3.25 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "90-CH-PF" , "Chocolate" , "Tart" , 3.75 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "90-CHR-11" , "Cherry" , "Tart" , 3.25 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "90-LEM-11" , "Lemon" , "Tart" , 3.25 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "90-PEC-11" , "Pecan" , "Tart" , 3.75 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "70-GA" , "Ganache" , "Cookie" , 1.15 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "70-GON" , "Gongolais" , "Cookie" , 1.15 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "70-R" , "Raspberry" , "Cookie" , 1.09 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "70-LEM" , "Lemon" , "Cookie" , 0.79 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "70-M-CH-DZ" , "Chocolate" , "Meringue" , 1.25);
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "70-M-VA-SM-DZ" , "Vanilla" , "Meringue" , 1.15);
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "70-MAR" , "Marzipan" , "Cookie" , 1.25 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "70-TU" , "Tuile" , "Cookie" , 1.25 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "70-W" , "Walnut" , "Cookie" , 0.79 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "50-ALM" , "Almond" , "Croissant" , 1.45 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "50-APP" , "Apple" , "Croissant" , 1.45 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "50-APR" , "Apricot" , "Croissant" , 1.45 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "50-CHS" , "Cheese" , "Croissant" , 1.75 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "50-CH" , "Chocolate" , "Croissant" , 1.75 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "51-APR" , "Apricot" , "Danish" , 1.15 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "51-APP" , "Apple" , "Danish" , 1.15 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "51-ATW" , "Almond" , "Twist" , 1.15 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "51-BC" , "Almond" , "Bear Claw" , 1.95 );
INSERT INTO goods (GId, Flavor, Food, Price) VALUES( "51-BLU" , "Blueberry" , "Danish" , 1.15 );

CREATE TABLE items(

-- item variables
Receipt VARCHAR(255),
Ordinal INTEGER,
Item VARCHAR(255) NOT NULL,
 
-- item key declaration
PRIMARY KEY(Receipt, Ordinal),

FOREIGN KEY (Receipt) REFERENCES receipts(RNumber),
FOREIGN KEY (Item) REFERENCES goods(GId)
);

-- insert items
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "18129" ,  1 , "70-TU" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "51991" ,  1 , "90-APIE-10" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "51991" ,  2 , "90-CH-PF" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "51991" ,  3 , "90-APP-11" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "51991" ,  4 , "26-8x10" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "83085" ,  1 , "25-STR-9" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "83085" ,  2 , "24-8x10" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "83085" ,  3 , "90-APR-PF" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "83085" ,  4 , "51-ATW" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "83085" ,  5 , "26-8x10" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "70723" ,  1 , "45-CO" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "13355" ,  1 , "24-8x10" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "13355" ,  2 , "70-LEM" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "13355" ,  3 , "46-11" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "52761" ,  1 , "90-ALM-I" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "52761" ,  2 , "26-8x10" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "52761" ,  3 , "50-CHS" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "52761" ,  4 , "90-BLK-PF" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "52761" ,  5 , "90-ALM-I" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "99002" ,  1 , "50-CHS" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "99002" ,  2 , "45-VA" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "58770" ,  1 , "50-CHS" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "58770" ,  2 , "46-11" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "58770" ,  3 , "45-CH" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "58770" ,  4 , "20-CA-7.5" );
INSERT INTO items (Receipt, Ordinal, Item) VALUES( "84665" ,  1 , "90-BER-11" );

SELECT * FROM items;
SELECT * FROM goods;
SELECT * FROM receipts;
SELECT * FROM customers;


USE `jpino01`;
-- CUSTOM
-- Create and populate your custom database
DROP TABLE IF EXISTS owner;
DROP TABLE IF EXISTS finance;
DROP TABLE IF EXISTS team;


-- Table Creations

-- team table
CREATE TABLE team(

-- team variables
teamId INTEGER,
teamName VARCHAR(255),

UNIQUE(teamName),

-- key declarations
PRIMARY KEY(teamName)
);

-- insert statements for team table
INSERT INTO team (teamId, teamName) VALUES( 0 , "Dallas Cowboys (NFL)" );
INSERT INTO team (teamId, teamName) VALUES( 1 , "New York Yankees (MLB)" );
INSERT INTO team (teamId, teamName) VALUES( 2 , "New York Knicks (NBA)" );
INSERT INTO team (teamId, teamName) VALUES( 3 , "Barcelona (Soccer)" );
INSERT INTO team (teamId, teamName) VALUES( 4 , "Real Madrid (Soccer)" );
INSERT INTO team (teamId, teamName) VALUES( 5 , "Golden State Warriors (NBA)" );
INSERT INTO team (teamId, teamName) VALUES( 6 , "Los Angeles Lakers (NBA)" );
INSERT INTO team (teamId, teamName) VALUES( 7 , "New England Patriots (NFL)" );
INSERT INTO team (teamId, teamName) VALUES( 8 , "New York Giants (NFL)" );
INSERT INTO team (teamId, teamName) VALUES( 9 , "Bayern Munich (Soccer)" );
INSERT INTO team (teamId, teamName) VALUES( 10 , "Manchester United (Soccer)" );
INSERT INTO team (teamId, teamName) VALUES( 11 , "Liverpool (Soccer)" );
INSERT INTO team (teamId, teamName) VALUES( 12 , "Los Angeles Rams (NFL)" );
INSERT INTO team (teamId, teamName) VALUES( 13 , "Manchester City (Soccer)" );
INSERT INTO team (teamId, teamName) VALUES( 14 , "San Francisco 49ers (NFL)" );
INSERT INTO team (teamId, teamName) VALUES( 15 , "Los Angeles Dodgers (MLB)" );
INSERT INTO team (teamId, teamName) VALUES( 16 , "New York Jets (NFL)" );
INSERT INTO team (teamId, teamName) VALUES( 17 , "Chicago Bears (NFL)" );
INSERT INTO team (teamId, teamName) VALUES( 18 , "Washington Football Team (NFL)" );
INSERT INTO team (teamId, teamName) VALUES( 19 , "Boston Red Sox (MLB)" );
INSERT INTO team (teamId, teamName) VALUES( 20 , "Philadelphia Eagles (NFL)" );
INSERT INTO team (teamId, teamName) VALUES( 21 , "Chicago Cubs (MLB)" );
INSERT INTO team (teamId, teamName) VALUES( 22 , "Houston Texans (NFL)" );
INSERT INTO team (teamId, teamName) VALUES( 23 , "Chicago Bulls (NBA)" );
INSERT INTO team (teamId, teamName) VALUES( 24 , "Denver Broncos (NFL)" );
INSERT INTO team (teamId, teamName) VALUES( 25 , "Boston Celtics (NBA)" );
INSERT INTO team (teamId, teamName) VALUES( 26 , "Chelsea (Soccer)" );
INSERT INTO team (teamId, teamName) VALUES( 27 , "San Francisco Giants (MLB)" );
INSERT INTO team (teamId, teamName) VALUES( 28 , "Las Vegas Raiders (NFL)" );
INSERT INTO team (teamId, teamName) VALUES( 29 , "Seattle Seahawks (NFL)" );
INSERT INTO team (teamId, teamName) VALUES( 30 , "Green Bay Packers (NFL)" );
INSERT INTO team (teamId, teamName) VALUES( 31 , "Pittsburgh Steelers (NFL)" );
INSERT INTO team (teamId, teamName) VALUES( 32 , "Baltimore Ravens (NFL)" );

-- owner table
CREATE TABLE owner(

-- team variables
ownerName VARCHAR(255),
ownerTeamName VARCHAR(255),
YearPurchased VARCHAR(255),

-- key declarations
PRIMARY KEY(ownerName, OwnerTeamName),
FOREIGN KEY(ownerTeamName) REFERENCES team(teamName)
);

-- insert statements for owner table
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Jerry Jones" , "Dallas Cowboys (NFL)" , "1989" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Steinbrenner family" , "New York Yankees (MLB)" , "1973" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Madison Square Garden Sports" , "New York Knicks (NBA)" , "1997" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "club members" , "Barcelona (Soccer)" , "not applicable" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "club members" , "Real Madrid (Soccer)" , "not applicable" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Joe Lacob, Peter Gruber" , "Golden State Warriors (NBA)" , "2010" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Jerry Buss Family Trusts, Philip Anschutz" , "Los Angeles Lakers (NBA)" , "1979, 1998" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Robert Kraft" , "New England Patriots (NFL)" , "1994" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "John Mara, Steven Tisch" , "New York Giants (NFL)" , "1925, 1991" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "club members" , "Bayern Munich (Soccer)" , "not applicable" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Glazer family" , "Manchester United (Soccer)" , "2005" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "John Henry, Tom Werner" , "Liverpool (Soccer)" , "2010" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Stanley Kroenke" , "Los Angeles Rams (NFL)" , "2010" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "heikh Mansour bin Zayed Al Nahyan" , "Manchester City (Soccer)" , "2008" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Denise DeBartolo York, John York" , "San Francisco 49ers (NFL)" , "1977" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Guggenheim Baseball Management" , "Los Angeles Dodgers (MLB)" , "2012" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Johnson family" , "New York Jets (NFL)" , "2000" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "McCaskey family" , "Chicago Bears (NFL)" , "1920" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Daniel Snyder" , "Washington Football Team (NFL)" , "1999" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "John Henry, Tom Werner" , "Boston Red Sox (MLB)" , "2002" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Jeffrey Lurie" , "Philadelphia Eagles (NFL)" , "1994" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Ricketts family" , "Chicago Cubs (MLB)" , "2009" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Janice McNair" , "Houston Texans (NFL)" , "1999" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Jerry Reinsdorf" , "Chicago Bulls (NBA)" , "1985" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Pat Bowlen Trust" , "Denver Broncos (NFL)" , "1984" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Wycliffe Grousbeck, Irving Grousbeck, Robert Epstein, Stephen Pagliuca" , "Boston Celtics (NBA)" , "2002" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Roman Abramovich" , "Chelsea (Soccer)" , "2003" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Charles Johnson" , "San Francisco Giants (MLB)" , "1993" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Mark Davis" , "Las Vegas Raiders (NFL)" , "1966" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Paul G. Allen Trust" , "Seattle Seahawks (NFL)" , "1997" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "shareholders" , "Green Bay Packers (NFL)" , "1921" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Daniel Rooney Trust, Arthur Rooney II" , "Pittsburgh Steelers (NFL)" , "1933" );
INSERT INTO owner (ownerName, ownerTeamName, YearPurchased) VALUES( "Stephen Bisciotti" , "Baltimore Ravens (NFL)" , "2004" );

-- finances table
CREATE TABLE finance(

-- finances variables
FinanceTeamName VARCHAR(255),
TotalValue VARCHAR(255),
FiveYearChange VARCHAR(255),

UNIQUE(FinanceTeamName),

-- key declarations
PRIMARY KEY(FinanceTeamName, TotalValue),
FOREIGN KEY (FinanceTeamName) REFERENCES team(teamName)
);

-- insert statements for finance table
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Dallas Cowboys (NFL)" , "$5.7 billion" , "43%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "New York Yankees (MLB)" , "$5.25 billion" , "54%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "New York Knicks (NBA)" , "$5 billion" , "67%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Barcelona (Soccer)" , "$4.76 billion" , "34%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Real Madrid (Soccer)" , "$4.75 billion" , "30%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Golden State Warriors (NBA)" , "$4.7 billion" , "147%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Los Angeles Lakers (NBA)" , "$4.6 billion" , "70%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "New England Patriots (NFL)" , "$4.4 billion" , "38%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "New York Giants (NFL)" , "$4.3 billion" , "54%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Bayern Munich (Soccer)" , "$4.21 billion" , "57%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Manchester United (Soccer)" , "$4.2 billion" , "27%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Liverpool (Soccer)" , "$4.1 billion" , "165%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Los Angeles Rams (NFL)" , "$4 billion" , "176%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Manchester City (Soccer)" , "$4 billion" , "108%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "San Francisco 49ers (NFL)" , "$3.8 billion" , "41%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Los Angeles Dodgers (MLB)" , "$3.57 billion" , "43%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "New York Jets (NFL)" , "$3.55 billion" , "37%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Chicago Bears (NFL)" , "$3.53 billion" , "44%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Washington Football Team (NFL)" , "$3.5 billion" , "23%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Boston Red Sox (MLB)" , "$3.47 billion" , "51%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Philadelphia Eagles (NFL)" , "$3.4 billion" , "42%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Chicago Cubs (MLB)" , "$3.36 billion" , "53%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Houston Texans (NFL)" , "$3.3 billion" , "32%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Chicago Bulls (NBA)" , "$3.3 billion" , "43%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Denver Broncos (NFL)" , "$3.2 billion" , "65%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Boston Celtics (NBA)" , "$3.2 billion" , "52%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Chelsea (Soccer)" , "$3.2 billion" , "93%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "San Francisco Giants (MLB)" , "$3.18 billion" , "41%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Las Vegas Raiders (NFL)" , "$3.1 billion" , "117%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Seattle Seahawks (NFL)" , "$3.08 billion" , "64%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Green Bay Packers (NFL)" , "$3.05 billion" , "56%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Pittsburgh Steelers (NFL)" , "$3 billion" , "58%" );
INSERT INTO finance (financeTeamName, TotalValue, FiveYearChange) VALUES( "Baltimore Ravens (NFL)" , "$2.98 billion" , "54%" );


SELECT * FROM team;
SELECT * FROM owner;
SELECT * FROM finance;


