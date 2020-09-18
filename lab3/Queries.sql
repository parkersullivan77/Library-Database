---ANSWERS TO NUMBER 5
SELECT * FROM libraries ORDER BY library_name;

SELECT * FROM libraryBooks ORDER BY ISBN;

SELECT title, copies_total, library_name
    FROM libraryBooks NATURAL JOIN book WHERE ISBN IN
		(SELECT ISBN FROM libraryBooks GROUP BY ISBN HAVING COUNT(*) > 1)
ORDER BY title;

SELECT library_name, COUNT(*) AS titles FROM libraryBooks
GROUP BY library_name
ORDER BY library_name;


---TRIGGERS FOR NUMBER 6
 
 CREATE TRIGGER authors_insert
AFTER INSERT ON author
   FOR EACH ROW INSERT INTO logs (action) VALUES
                ('Author added');

 CREATE TRIGGER books_insert
AFTER INSERT ON libraryBooks
   FOR EACH ROW INSERT INTO logs (action) VALUES
                ('Book added');
				
 CREATE TRIGGER book_update
AFTER UPDATE ON libraryBooks
   FOR EACH ROW INSERT INTO logs (action) VALUES
                ('Book updated');

 CREATE TRIGGER book_delete
AFTER DELETE ON libraryBooks
   FOR EACH ROW INSERT INTO logs (action) VALUES
                ('Book deleted');
				
---VIEWS
CREATE SQL SECURITY INVOKER VIEW BAL
AS SELECT title, GROUP_CONCAT(first_name, ' ', last_name SEPARATOR ', ') AS author, library_name
     FROM book
          NATURAL JOIN WrittenBy
          NATURAL JOIN author
          NATURAL JOIN libraryBooks
 GROUP BY title, library_name;
 
 ---#8
 
SELECT title, author, shelf_no, library_name
    FROM (SELECT bal.title, author, library_name, ISBN
            FROM BAL AS bal
                 INNER JOIN book AS b
           WHERE bal.title = b.title) AS a
         NATURAL JOIN libraryBooks
ORDER BY title;



