CREATE DATABASE IF NOT EXISTS PatoRestaurantDB;

USE PatoRestaurantDB;

CREATE TABLE IF NOT EXISTS Category
(
	Id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(30) NOT NULL UNIQUE,
    Image VARCHAR(200),
    Banner VARCHAR(200),
    HomeOrder TINYINT UNSIGNED 
);

CREATE TABLE IF NOT EXISTS ApplicationUser
(
	Id 			VARCHAR(255) NOT NULL PRIMARY KEY,
    UserName	VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS SocialEvent
(
	Id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name        	VARCHAR(60) NOT NULL,
    Description 	TEXT,
    EventDate   	DATETIME NOT NULL,
    Image 			VARCHAR(200),
    CreateDate 		DATETIME NOT NULL,
    CreatedUser		VARCHAR(255),
    ModifiedDate 	DATETIME,
    ModifiedUser 	VARCHAR(255),
    
    CONSTRAINT FK_SocialEvent_CreatedUser 	
		FOREIGN KEY (CreatedUser)  REFERENCES ApplicationUser(Id),
        
    CONSTRAINT FK_SocialEvent_ModifiedUser	
		FOREIGN KEY (ModifiedUser) REFERENCES ApplicationUser(Id)
); 

CREATE TABLE IF NOT EXISTS StatusReservation
(
	Id 		SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name    VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS Reservation
(
	Id 					SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name        		VARCHAR(60) NOT NULL,
    ReservationDate 	DATETIME NOT NULL,
    Phone				VARCHAR(20) NOT NULL,
    Guests				TINYINT UNSIGNED NOT NULL,
    Email				VARCHAR(100),
    CreatedDate			DATETIME NOT NULL,
    StatusReservationId SMALLINT UNSIGNED NOT NULL,
	CONSTRAINT FK_Reservation_Status 	
		FOREIGN KEY (StatusReservationId) REFERENCES StatusReservation(Id)
);

CREATE TABLE IF NOT EXISTS Review
(
	Id 				SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Name        	VARCHAR(60) NOT NULL,
    ReviewText		VARCHAR(2000),
    ReviewDate   	DATETIME NOT NULL,
    Image 			VARCHAR(200),
    Rating			TINYINT NOT NULL
);

 
