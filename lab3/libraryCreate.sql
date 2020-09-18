CREATE TABLE member (
    memberID    INT             NOT NULL,
    first_name  VARCHAR(20)     NOT NULL,
    last_name   VARCHAR(20)     NOT NULL,
	DOB         VARCHAR(20)     NOT NULL,
	gender      char(1)         NOT NULL,
    PRIMARY KEY (memberID)
);

CREATE TABLE phone (
    pNumber     CHAR(14)    NOT NULL,
    ptype       CHAR(1)     NOT NULL,
    PRIMARY KEY (pNumber)
);


CREATE TABLE author (
    AuthorID     INT             NOT NULL,
    first_name    VARCHAR(20)     NOT NULL,
    last_name   VARCHAR(20)     NOT NULL,
    PRIMARY KEY (AuthorID)
);

CREATE TABLE publisher (
    PubID      INT             NOT NULL,
    pub_name   VARCHAR(50)     NOT NULL,
    PRIMARY KEY (PubID)
) 
;

CREATE TABLE book (
   ISBN              VARCHAR(20)        NOT NULL,
   title             VARCHAR(80)        NOT NULL,
   PubID             INT                NOT NULL,
   year_published    VARCHAR(4)         NOT NULL,
   FOREIGN KEY (PubID)  REFERENCES publisher(PubID)      ON DELETE CASCADE,
   PRIMARY KEY (ISBN)
);

CREATE TABLE libraries (
    library_name VARCHAR(100) NOT NULL,
    street       VARCHAR(100) NOT NULL,
    city         VARCHAR(100) NOT NULL,
    state_name   CHAR(2)      NOT NULL,
	PRIMARY KEY (library_name)
);



CREATE TABLE BorrowedBy (
    ISBN           VARCHAR(20)     NOT NULL,
    memberID       INT             NOT NULL,
    CheckoutDate   VARCHAR(20)           NOT NULL,
	CheckinDATE    VARCHAR(20),
    FOREIGN KEY (ISBN) REFERENCES book(ISBN) ON DELETE CASCADE,
	FOREIGN KEY (memberID) REFERENCES member(memberID) ON DELETE CASCADE,
    PRIMARY KEY (ISBN, memberID,CheckoutDate)
) 
; 

CREATE TABLE WrittenBy (
    ISBN           VARCHAR(20)     NOT NULL,
    AuthorID       INT             NOT NULL,
    FOREIGN KEY (ISBN) REFERENCES book(ISBN) ON DELETE CASCADE,
	FOREIGN KEY (AuthorID) REFERENCES author(AuthorID) ON DELETE CASCADE,
	PRIMARY KEY (ISBN, authorID)
) 
;

CREATE TABLE authorPhone (
	authorID INT NOT NULL,
	pNumber char(14) NOT NULL,
	FOREIGN KEY (pNumber) REFERENCES phone(pNumber) ON DELETE CASCADE,
	FOREIGN KEY (AuthorID) REFERENCES author(AuthorID) ON DELETE CASCADE,
	PRIMARY KEY (authorID,pNumber)

); 

CREATE TABLE pubPhone (
	PubID INT  NOT NULL,
	pNumber char(14) NOT NULL,
	FOREIGN KEY (pNumber) REFERENCES phone(pNumber) ON DELETE CASCADE,
	FOREIGN KEY (PubID) REFERENCES publisher(PubID) ON DELETE CASCADE,
	PRIMARY KEY (PubID,pNumber)
	

);

CREATE TABLE libraryBooks (
	 ISBN         VARCHAR(20)     NOT NULL,
     copies_total     INT         NOT NULL,
	 shelf_no         INT         NOT NULL,
	 floor_no         INT         NOT NULL,
	 library_name VARCHAR(100)    NOT NULL,
	 FOREIGN KEY (ISBN) REFERENCES book(ISBN),
	 FOREIGN KEY (library_name) REFERENCES libraries(library_name),
	 PRIMARY KEY (library_name,ISBN)
)
; 
CREATE TABLE logs (
    transaction_id  INT    NOT NULL AUTO_INCREMENT,
    date_time TIMESTAMP    NOT NULL,
    action    VARCHAR(100) NOT NULL,
	PRIMARY KEY (transaction_id)
);
