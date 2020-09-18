--#1
INSERT INTO book VALUES
('96-42013-10510', 'Growing your own Weeds',10000,2012);
INSERT INTO libraryBooks VALUES
('96-42013-10510',2, 8, 1,'Main');

--#2
UPDATE libraryBooks
   SET copies_total = 8
 WHERE ISBN = '96-42103-10907'
       AND library_name = 'Main';

--#3
DELETE FROM author
      WHERE AuthorID = 205;

---#4
INSERT INTO author VALUES
(305, 'Commander', 'Adams');
INSERT INTO phone VALUES
('970-555-5555', 'o');
INSERT INTO authorPhone VALUES
(305, '970-555-5555');

---#5
INSERT INTO libraryBooks VALUES
('96-42013-10510',3, 8, 1,'South Park');

---#6
DELETE FROM libraryBooks
      WHERE ISBN = '96-42103-11003'
            AND library_name = 'Main';
 
---#7 
UPDATE libraryBooks
   SET copies_total = copies_total + 2
 WHERE ISBN = '96-42103-11604'
       AND library_name = 'South Park';

---#8
INSERT INTO book VALUES
('96-42013-10513', 'Growing your own Weeds',90000,2012);
INSERT INTO libraryBooks VALUES
('96-42013-10513',2, 8, 1,'Main');

---#9
SELECT * FROM logs;