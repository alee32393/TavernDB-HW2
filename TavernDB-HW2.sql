USE ALee_2019

GO
/*drop tables*/
DROP TABLE IF EXISTS Guest;
DROP TABLE IF EXISTS GuestClass;
DROP TABLE IF EXISTS GuestStatus;
DROP TABLE IF EXISTS GuestLevel;
DROP TABLE IF EXISTS Status;
DROP TABLE IF EXISTS Service;
DROP TABLE IF EXISTS SuppliesReceived;
DROP TABLE IF EXISTS Supplies;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Tavern;

/* Created tables */
CREATE TABLE Tavern(
	TavernID INT identity Primary Key,
	TavernName TEXT,
	TavernLocation TEXT,
	OwnerName TEXT,
	SystemUsers TEXT,
	SystemsUserRole TEXT,
	TavernFloors INT
);
CREATE TABLE Users(
	UserName TEXT,
	UserRole TEXT,
	RoleDescription TEXT,
	TavernID INT FOREIGN KEY REFERENCES Tavern(TavernID)
);

CREATE TABLE Supplies(
	SupplyID INT identity Primary Key,
	SuppleName TEXT,
	SupplyUnit TEXT,
	SupplyQty INT,
	DatUpdated DATE,
	TavernID INT FOREIGN KEY REFERENCES Tavern(TavernID)
);
CREATE TABLE SuppliesReceived(
	ReceivedID INT identity Primary Key,
	COST DECIMAL,
	QtyReceived INT,
	DateReceived DATE,
	EmployeeReceiverName Text
);
CREATE TABLE Service(
	ServiceID INT identity Primary Key,
	ServiceName TEXT,
	/*StatusID INT FOREIGN KEY REFERENCES Status(StatusID)*/
);
CREATE TABLE Status(
	StatusID INT identity Primary Key,
	StatusName TEXT,

);

CREATE TABLE Sales(
	SalesID INT identity Primary Key,
	ServiceID INT FOREIGN KEY REFERENCES Service(ServiceID),
	GuestName TEXT,
	ServicePrice DECIMAL,
	PurchaseDate DATE,
	PaidAmount DECIMAL,
	TavernID INT FOREIGN KEY REFERENCES Tavern(TavernID)
);
CREATE TABLE GuestClass(
	GuestClassID INT identity Primary Key,
	GuestClassDesc TEXT
);

CREATE TABLE GuestStatus(
	GuestStatusID INT identity Primary Key,
	GuestStatusName TEXT
);

CREATE TABLE GuestLevel(
	GuestLevelID INT identity Primary Key,
	GuestLevel INT
);
CREATE TABLE Guest(
	GuestID INT identity Primary Key,
	GuestName TEXT,
	GuestNotes TEXT,
	CakeDays INT,
	GuestClassID INT FOREIGN KEY REFERENCES GuestClass(GuestClassID),
	GuestStatus INT FOREIGN KEY REFERENCES GuestStatus(GuestStatusID),
	GuestLevel INT FOREIGN KEY REFERENCES GuestLevel(GuestLevelID)
);
/*Adds a primary key to table user*/
ALTER TABLE Users ADD PRIMARY KEY UserID;

/*Adds to the supplies table a foreign key that references another table */
ALTER TABLE SuppliesReceived ADD FOREIGN KEY (TavernID) References Tavern(TavernID);
ALTER TABLE SuppliesReceived ADD FOREIGN KEY (SupplyID) References Supplies(SupplyID);

/*Alter a table in some way by dropping the TestDrop text field in SuppliesReceived*/
ALTER TABLE SuppliesReceived DROP COLUMN EmployeeReceiverName;


/* adding data to the tavern */

INSERT INTO Tavern 
VALUES
('Howl By the Moon','Atlantic City', 'Joe', 'Bob', 'Janitor',1),
('Moes Tavern', 'Springfield', 'Moe', 'Barney', 'drunk',12),
('Miller Ale House', 'Edison', 'Brittany', 'Trish', 'Waitress',4),
('Maggies Pub', 'Chester', 'Maggie', 'Josh', 'Bartender',10),
('Xfinity', 'Chester', 'John Smith', 'Paul','Janitor',6);

/* adding data to the user */

INSERT INTO Users
VALUES
('Joanna', 'Greeter','Greets Guest', 5),
('Peter', 'Maid','Cleans', 4),
('Steven', 'Manager','manages everything', 3),
('Rob', 'Greeter','Greets Guest', 2),
('Carrie', 'Assistant','assists around the place', 1);


/* adding data to the supplies */

INSERT INTO Supplies
VALUES
('Miller Lite','ounces','50','03/03/2019',1),
('Toilet Paper','roll','100','01/23/2015',1),
('Mugs','pounds','500','03/03/2019',1),
('Water','gallons','500','12/09/2000',1),
('Apple Cider Vinegar','milligrams','99','04/05/2014',1);

/* adding data to the supplies being received */

INSERT INTO SuppliesReceived
VALUES
(20.00, 100, 1000,1,2),
(30.00, 50, 1000,5,3),
(40.00, 99, 1000,2,5),
(99.99, 23, 1000,3,2),
(69.43, 4, 1000,1,3);

/* adding data to the services */

INSERT INTO Service
VALUES
('Room Service' , 1),
('Chiropractor' , 2),
('Television' , 1),
('Grub Hub' , 2),
('Room Service' , 1);

/* adding data to the statuses of the service */

INSERT INTO Status
VALUE
('Active'),
('Inactive'),
('Out of Stock'),
('Discontinued');

/* adding data to the sales */

INSERT INTO Sales
VALUE
(3,'Alex',199.99,'01/12/2020',199.99,4),
(2,'Jazz',67.45,'12/11/2000',199.99,5),
(3,'Oilver',150.00,'05/11/1999',150.00,1),
(5,'Bill',1099.00,'01/12/2020',35.00,2),
(1,'Dawn',245.02,'01/12/2020',245.02,3);

INSERT INTO Guest
VALUES
('Eric','manager',2,1,2,3),
('Bruce','CEO',3,5,3,9),
('Clark','reporter',5,3,1,7),
('Barry','scientist',1,1,5,1),
('Dianna','amazon',2,2,2,5);

INSERT INTO GuestClass
VALUE
('Warrior'),
('Mge'),
('Archer'),
('Thief'),
('Pirate');

INSERT INTO GuestStatus
('Sick'),
('0HP'),
('Alive'),
('Hungry'),
('Excited');

INSERT INTO GuestLevel
VALUE
(1),
(2),
(3),
(4),
(5);
