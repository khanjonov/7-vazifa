CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT NOT NULL,
    publisher_id INT NOT NULL,
    genre VARCHAR(100),
    publish_date DATE,
    price DECIMAL(10, 2),
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id)
);

CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    birth_date DATE,
    country VARCHAR(100)
);

CREATE TABLE publishers (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    founded_year YEAR
);

CREATE TABLE book_reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    review_text TEXT,
    rating INT,
    review_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);


INSERT INTO authors (name, birth_date, country) VALUES
('Jane Austen', '1775-12-16', 'United Kingdom'),
('Mark Twain', '1835-11-30', 'United States'),
('Leo Tolstoy', '1828-09-09', 'Russia'),
('Gabriel Garcia Marquez', '1927-03-06', 'Colombia'),
('Haruki Murakami', '1949-01-12', 'Japan');

INSERT INTO publishers (name, city, founded_year) VALUES
('Penguin Random House', 'New York', 1927),
('HarperCollins', 'London', 1817),
('Macmillan Publishers', 'London', 1843),
('Simon & Schuster', 'New York', 1924),
('Hachette Book Group', 'Paris', 1826);

INSERT INTO books (title, author_id, publisher_id, genre, publish_date, price) VALUES
('Gurur va Xurofot', 1, 1, 'Romantika', '1813-01-28', 19.99),
('Tom Soyerning Sarguzashtlari', 2, 2, 'Sarguzasht', '1876-06-01', 14.99),
('Urush va Tinchlik', 3, 3, 'Tarixiy Roman', '1869-01-01', 24.99),
('Yolgizlikning Yuz Yili', 4, 4, 'Sehrli Realizm', '1967-06-05', 18.99),
('Norvegiya Ormoni', 5, 5, 'Drama', '1987-09-04', 15.99),
('Anna Karenina', 3, 3, 'Romantika', '1877-01-01', 21.99),
('Sohildagi Kafka', 5, 5, 'Fantastika', '2002-09-12', 16.99),
('Xolera Zamonida Sevgi', 4, 4, 'Romantika', '1985-09-03', 17.99),
('Qariya va Dengiz', 2, 1, 'Drama', '1952-09-01', 12.99),
('Jinoyat va Jazo', 3, 3, 'Psixologik Roman', '1866-01-01', 19.99);

INSERT INTO book_reviews (book_id, review_text, rating, review_date) VALUES
(1, 'Bu haqiqiy olmas asar!', 5, '2024-11-01'),
(3, 'Juda murakkab va epik.', 4, '2024-11-02'),
(4, 'Sehrli bir tajriba.', 5, '2024-11-03'),
(5, 'Juda gozal yozilgan.', 4, '2024-11-04'),
(10, 'Oylantiruvchi va kuchli.', 5, '2024-11-05');

SELECT * FROM books;

SELECT title AS "Book Title", genre AS "Genre", price AS "Price (USD)" FROM books;

SELECT * FROM authors ORDER BY name ASC;

SELECT * FROM books WHERE genre = 'Romance';

SELECT * FROM books LIMIT 3;

SELECT * FROM books WHERE genre IN ('Romance', 'Drama');

SELECT * FROM books WHERE price BETWEEN 15 AND 20;

SELECT * FROM books WHERE title LIKE '%Time%';

SELECT * FROM book_reviews WHERE review_text IS NULL;

SELECT genre, COUNT(*) AS "Number of Books" FROM books GROUP BY genre;

SELECT 
    books.title AS "Book Title",
    authors.name AS "Author",
    publishers.name AS "Publisher",
    books.genre,
    books.price
FROM books
JOIN authors ON books.author_id = authors.author_id
JOIN publishers ON books.publisher_id = publishers.publisher_id;

SELECT COUNT(*) AS "Total Books" FROM books;

SELECT AVG(price) AS "Average Price" FROM books;

SELECT SUM(price) AS "Total Revenue" FROM books;


