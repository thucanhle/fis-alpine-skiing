
create table Player (
	playerID nvarchar(30) primary key,
	firstName nvarchar(30) not null,
	lastName nvarchar(30) not null,
	gender char(1) not null),
	age int not null check (age > 15 ),
	phone nvarchar(15) UNIQUE,
	country nvarchar(10)
)

create table Category (
	categoryID nvarchar(30) primary key,
	numberOfPlayers int check(numberOfPlayers >=0),
	[rank] nvarchar(10),
	score int,
	categoryName nvarchar(10),
	CONSTRAINT FK_TO_Category FOREIGN KEY(categoryID)
	REFERENCES Player(playerID)
)

create table Manager(
	managerID nvarchar(30) primary key,
	firstName nvarchar(30) not null,
	lastName nvarchar(30) not null,
	phone nvarchar(15) UNIQUE,
	CONSTRAINT FK_TO_Manager FOREIGN KEY(managerID)
	REFERENCES Player(playerID)
)

create table Championship(
	ID nvarchar(30) PRIMARY KEY,
	location nvarchar(20) not null,
	sponsor nvarchar(30) not null,
	numberOfRounds int not null,
	prizeValue int not null,
	CONSTRAINT FK_TO_Championship FOREIGN KEY(ID)
	REFERENCES Player(playerID)
)

create table Team(
	teamID nvarchar(30) PRIMARY KEY,
	teamName nvarchar(20) not null,
	coach nvarchar(30) not null,
	contact int not null,
	CONSTRAINT FK_TO_team FOREIGN KEY(teamID)
	REFERENCES Player(playerID)
)

create table Country(
	countryCode nvarchar(30) primary key ,
	name nvarchar(30) not null,
	CONSTRAINT FK_TO_messenger FOREIGN KEY(countryCode)
	REFERENCES Player(playerID)
)
