-- Select Data that I am using for this project.
SELECT publication_date, title, isbn13, book_id
FROM books
ORDER BY 1,3;

SELECT author, book_id, price
FROM bookprice
ORDER BY 3 DESC;

SELECT customer, quantity, city, book_id
FROM booksales
ORDER BY 2 DESC;

-- This will fetch us the most expensive book among the books that was sold

SELECT books.book_id, title, price
FROM books
INNER JOIN bookprice
ON books.book_id = bookprice.book_id
ORDER BY price DESC
LIMIT 1;

-- This will give us insight on the average price of the books sold.

SELECT AVG(price) AS Avg_price
FROM bookprice;

-- Here, my goal is to determine which book has been purchased the most so that my discovery can guide the store manager on how to restock their inventory.
-- This will provide the book that sold the most.

SELECT books.title, COUNT(*) AS num_sales
FROM booksales
INNER JOIN books
ON booksales.book_id = books.book_id
GROUP BY 1
ORDER BY num_sales DESC
LIMIT 1;

-- Similarly, we would like to identify the book that sold the least in order to provide valuable information for the manager's decision-making process.
-- This will fetch us the book that sold the least.

SELECT books.title, COUNT(*) AS num_sales
FROM booksales
INNER JOIN books
ON booksales.book_id = books.book_id
GROUP BY 1
ORDER BY num_sales ASC
LIMIT 1;

-- My objective is to determine the most popular books in each city to achieve better market segmentation.
-- This will get us the most popular books in each city.

SELECT city, book_id, SUM(quantity) AS total_copies_sold
FROM booksales
GROUP BY city, book_id
ORDER BY city, total_copies_sold DESC;

SELECT city, books.title, SUM(quantity) AS total_copies_sold
FROM booksales
INNER JOIN books
ON booksales.Book_id = books.book_id
GROUP BY city, title
ORDER BY city, total_copies_sold DESC;

-- My goal is to identify the top five cities that purchased the most books, in order to provide valuable insights to the supply sales director regarding high-performing territories and where to focus more attention.
-- This is to get the top three cities that bought most books

SELECT city, COUNT(*) as num_sales
FROM booksales
GROUP BY city
ORDER BY num_sales DESC
LIMIT 5;

-- This is the know the books that are published in the 2000's

SELECT title, publisher_id, publication_date
FROM books
WHERE publication_date BETWEEN '2000-05-01' AND '2019-12-31'
ORDER BY 3;

-- A customer want to buy some books, he/she can't remember the names but is certain that one was published on January 11, 1966 and the second March 1st 1987. The manager ask the data analysis team to help get this information.
-- This is to fetch book published in those dates.

SELECT title, book_id, publisher_id, publication_date
FROM books
WHERE publication_date IN ('1966-01-11','1987-03-01')
ORDER BY 1;

-- This is to select the top three books with the highest number of pages.

SELECT book_id, title, num_pages
FROM books
ORDER BY num_pages DESC
LIMIT 3;

-- To ensure that there is sufficient stock available to meet the demand, the store manager would like to know the most bought books that are published in the period between 1999 and 2019.
-- To is to uncover the most bought books that are published in the period between 1999 and 2019.

SELECT books.title, books.book_id, booksales.quantity
FROM books 
INNER JOIN booksales
ON books.book_id = booksales.book_id
WHERE publication_date BETWEEN '1999-01-01' AND '2019-12-31'
ORDER BY booksales.quantity DESC
LIMIT 10;





