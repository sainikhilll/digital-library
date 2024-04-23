Create Database library;

use  library;


CREATE TABLE Patron (
    patronId INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255),
    studentId INT,
    address VARCHAR(2550),
    university VARCHAR(255)
);


CREATE TABLE books (
    bookId INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    language VARCHAR(50),
    pages INT,
    summary TEXT,
    image VARCHAR(255)
);
CREATE TABLE transactions (
    transactionId INT PRIMARY KEY AUTO_INCREMENT,
    borrowDate DATE,
    dueDate DATE,
    bookId INT,
    patronId INT,
    FOREIGN KEY (bookId) REFERENCES books(bookId),
    FOREIGN KEY (patronId) REFERENCES patron(patronId)
);
-- Altering borrowDate column
ALTER TABLE transactions
MODIFY COLUMN borrowDate VARCHAR(20);

-- Altering dueDate column
ALTER TABLE transactions
MODIFY COLUMN dueDate VARCHAR(20);

ALTER TABLE transactions
ADD COLUMN status VARCHAR(20);

INSERT INTO books (title, author, language, pages, summary, image) VALUES
('To Kill a Mockingbird', 'Harper Lee', 'English', 281, 'To Kill a Mockingbird is a novel by Harper Lee published in 1960. It was immediately successful, winning the Pulitzer Prize, and has become a classic of modern American literature. The plot and characters are loosely based on Lee''s observations of her family, her neighbors and an event that occurred near her hometown of Monroeville, Alabama, in 1936.', 'to_kill_a_mockingbird.jpg'),
('The Great Gatsby', 'F. Scott Fitzgerald', 'English', 180, 'The Great Gatsby is a 1925 novel by American writer F. Scott Fitzgerald. Set in the Jazz Age on Long Island, near New York City, the novel depicts first-person narrator Nick Carraway''s interactions with mysterious millionaire Jay Gatsby and Gatsby''s obsession to reunite with his former lover, Daisy Buchanan.', 'the_great_gatsby.jpg'),
('Pride and Prejudice', 'Jane Austen', 'English', 279, 'Pride and Prejudice is a romantic novel of manners written by Jane Austen in 1813. The novel follows the character development of Elizabeth Bennet, the dynamic protagonist of the book who learns about the repercussions of hasty judgments and comes to appreciate the difference between superficial goodness and actual goodness.', 'pride_and_prejudice.jpg'),
('War and Peace', 'Leo Tolstoy', 'English', 1225, 'War and Peace is a novel by the Russian author Leo Tolstoy, published serially, then in its entirety in 1869. It is regarded as one of Tolstoy''s finest literary achievements and remains an internationally praised classic of world literature. The novel explores many aspects of life in the early 19th century Russian society, including political movements, military strategies, family life, and the impact of war.', 'war_and_peace.jpg'),
('The Catcher in the Rye', 'J.D. Salinger', 'English', 277, 'The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951. It was originally intended for adults, but is often read by adolescents for its themes of angst, alienation, and as a critique on superficiality in society.', 'the_catcher_in_the_rye.jpg'),
('The Alchemist', 'Paulo Coelho', 'English', 197, 'The Alchemist is a novel by Brazilian author Paulo Coelho that was first published in 1988. Originally written in Portuguese, it became an international bestseller, translated into many languages. The novel follows a young Andalusian shepherd named Santiago in his journey to Egypt, after having a recurring dream of finding treasure there.', 'the_alchemist.jpg'),
('1984', 'George Orwell', 'English', 328, '1984 is a dystopian novel by George Orwell, published in 1949. It is set in a world where every aspect of life is controlled by the Party, led by the enigmatic figure Big Brother. The novel explores themes of totalitarianism, surveillance, and the loss of individuality.', '1984.jpg'),
('To the Lighthouse', 'Virginia Woolf', 'English', 209, 'To the Lighthouse is a novel by Virginia Woolf, published in 1927. The novel centers on the Ramsay family and their visits to the Isle of Skye in Scotland between 1910 and 1920. It explores themes of loss, subjectivity, and the passage of time.', 'to_the_lighthouse.jpg'),
('The Hobbit', 'J.R.R. Tolkien', 'English', 310, 'The Hobbit, or There and Back Again is a children''s fantasy novel by English author J. R. R. Tolkien. It was published on 21 September 1937 to wide critical acclaim, being nominated for the Carnegie Medal and awarded a prize from the New York Herald Tribune for best juvenile fiction.', 'the_hobbit.jpg');

INSERT INTO books (title, author, language, pages, summary, image) VALUES
('The Lord of the Rings', 'J.R.R. Tolkien', 'English', 1178, 'The Lord of the Rings is an epic high-fantasy novel by English author J. R. R. Tolkien. It was written in stages between 1937 and 1949, and is one of the best-selling novels ever written, with over 150 million copies sold.', 'the_lord_of_the_rings.jpg'),
('Moby-Dick', 'Herman Melville', 'English', 625, 'Moby-Dick; or, The Whale is an 1851 novel by American writer Herman Melville. The story follows the young sailor Ishmael''s voyage aboard the whaling ship Pequod, commanded by Captain Ahab, who is in obsessive pursuit of the giant white sperm whale Moby Dick.', 'moby_dick.jpg'),
('The Adventures of Huckleberry Finn', 'Mark Twain', 'English', 366, 'Adventures of Huckleberry Finn is a novel by Mark Twain, first published in the United Kingdom in December 1884 and in the United States in February 1885. It is set in the 1830s in the town of St. Petersburg, Missouri, on the banks of the Mississippi River.', 'huckleberry_finn.jpg');
