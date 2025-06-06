-- IMDB Database Schema
-- Generated on: 2025-03-31 08:56:46

-- Drop existing tables if they exist
DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS role_mapping;
DROP TABLE IF EXISTS director_mapping;
DROP TABLE IF EXISTS genre;
DROP TABLE IF EXISTS movie;
DROP TABLE IF EXISTS names;

-- Create Names table (needs to be created first due to foreign key references)
CREATE TABLE names (
    name_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    height INT,
    date_of_birth DATE,
    known_for_movies VARCHAR(255)
);

-- Create Movie table
CREATE TABLE movie (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    year INT,
    date_published DATE,
    duration INT,
    country VARCHAR(100),
    worlwide_gross_income VARCHAR(50),
    languages VARCHAR(100),
    production_company VARCHAR(100)
);

-- Create Genre table
CREATE TABLE genre (
    movie_id INT,
    genre VARCHAR(50) NOT NULL,
    PRIMARY KEY (movie_id, genre),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);

-- Create Director Mapping table
CREATE TABLE director_mapping (
    movie_id INT,
    name_id INT,
    PRIMARY KEY (movie_id, name_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (name_id) REFERENCES names(name_id)
);

-- Create Role Mapping table
CREATE TABLE role_mapping (
    movie_id INT,
    name_id INT,
    category VARCHAR(50) NOT NULL,
    PRIMARY KEY (movie_id, name_id, category),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (name_id) REFERENCES names(name_id)
);

-- Create Ratings table
CREATE TABLE ratings (
    movie_id INT PRIMARY KEY,
    avg_rating DECIMAL(3,1) NOT NULL,
    total_votes INT NOT NULL,
    median_rating INT NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);

-- Insert sample data into Names table
INSERT INTO names (name_id, name, height, date_of_birth, known_for_movies) VALUES
(1, 'Christopher Nolan', 181, '1970-07-30', 'Inception'),
(2, 'Steven Spielberg', 172, '1946-12-18', 'Jurassic Park'),
(3, 'Tom Hanks', 183, '1956-07-09', 'Forrest Gump'),
(4, 'Leonardo DiCaprio', 183, '1974-11-11', 'Titanic'),
(5, 'Meryl Streep', 168, '1949-06-22', 'The Devil Wears Prada'),
(6, 'Martin Scorsese', 168, '1942-11-17', 'Goodfellas'),
(7, 'Robert De Niro', 177, '1943-08-17', 'Taxi Driver'),
(8, 'Al Pacino', 170, '1940-04-25', 'The Godfather'),
(9, 'Brad Pitt', 180, '1963-12-18', 'Fight Club'),
(10, 'Natalie Portman', 160, '1981-06-09', 'Black Swan'),
(11, 'Scarlett Johansson', 160, '1984-11-22', 'Lost in Translation'),
(12, 'Quentin Tarantino', 185, '1963-03-27', 'Pulp Fiction'),
(13, 'Uma Thurman', 180, '1970-04-29', 'Kill Bill'),
(14, 'Samuel L. Jackson', 189, '1948-12-21', 'Pulp Fiction'),
(15, 'Francis Ford Coppola', 182, '1939-04-07', 'The Godfather');

-- Insert sample data into Movie table
INSERT INTO movie (movie_id, title, year, date_published, duration, country, worlwide_gross_income, languages, production_company) VALUES
(1, 'The Shawshank Redemption', 1994, '1994-10-14', 142, 'USA', '$28,341,469', 'English', 'Columbia Pictures'),
(2, 'The Godfather', 1972, '1972-03-24', 175, 'USA', '$245,066,411', 'English, Italian', 'Paramount Pictures'),
(3, 'The Dark Knight', 2008, '2008-07-18', 152, 'USA', '$1,005,973,645', 'English', 'Warner Bros.'),
(4, 'Inception', 2010, '2010-07-16', 148, 'USA', '$836,836,967', 'English', 'Warner Bros.'),
(5, 'Pulp Fiction', 1994, '1994-10-14', 154, 'USA', '$213,928,762', 'English', 'Miramax Films'),
(6, 'Forrest Gump', 1994, '1994-07-06', 142, 'USA', '$678,226,133', 'English', 'Paramount Pictures'),
(7, 'The Matrix', 1999, '1999-03-31', 136, 'USA', '$463,517,383', 'English', 'Warner Bros.'),
(8, 'Schindler''s List', 1993, '1994-02-04', 195, 'USA', '$322,116,234', 'English, German, Polish', 'Universal Pictures'),
(9, 'Goodfellas', 1990, '1990-09-21', 146, 'USA', '$46,836,214', 'English', 'Warner Bros.'),
(10, 'Fight Club', 1999, '1999-10-15', 139, 'USA', '$101,227,049', 'English', '20th Century Fox'),
(11, 'The Silence of the Lambs', 1991, '1991-02-14', 118, 'USA', '$272,742,922', 'English', 'Orion Pictures'),
(12, 'The Green Mile', 1999, '1999-12-10', 189, 'USA', '$286,801,374', 'English', 'Warner Bros.'),
(13, 'Interstellar', 2014, '2014-11-07', 169, 'USA', '$701,729,206', 'English', 'Paramount Pictures'),
(14, 'Taxi Driver', 1976, '1976-02-08', 114, 'USA', '$28,262,574', 'English', 'Columbia Pictures'),
(15, 'The Departed', 2006, '2006-10-06', 151, 'USA', '$291,465,034', 'English', 'Warner Bros.'),
(16, 'Titanic', 1997, '1997-12-19', 194, 'USA', '$2,187,463,944', 'English', '20th Century Fox'),
(17, 'Jurassic Park', 1993, '1993-06-11', 127, 'USA', '$1,029,939,903', 'English', 'Universal Pictures'),
(18, 'Avatar', 2009, '2009-12-18', 162, 'USA', '$2,847,246,203', 'English', '20th Century Fox'),
(19, 'The Lion King', 1994, '1994-06-24', 88, 'USA', '$968,483,777', 'English', 'Walt Disney Pictures'),
(20, 'The Avengers', 2012, '2012-05-04', 143, 'USA', '$1,518,812,988', 'English', 'Marvel Studios'),
(21, 'The Godfather: Part II', 1974, '1974-12-20', 202, 'USA', '$93,000,000', 'English, Italian, Spanish', 'Paramount Pictures'),
(22, 'The Lord of the Rings: The Return of the King', 2003, '2003-12-17', 201, 'New Zealand, USA', '$1,146,030,912', 'English', 'New Line Cinema'),
(23, 'Psycho', 1960, '1960-09-08', 109, 'USA', '$50,000,000', 'English', 'Paramount Pictures'),
(24, 'Casablanca', 1942, '1943-01-23', 102, 'USA', '$10,462,500', 'English, French, German', 'Warner Bros.'),
(25, 'Rear Window', 1954, '1954-09-01', 112, 'USA', '$36,764,313', 'English', 'Paramount Pictures'),
(26, 'Citizen Kane', 1941, '1941-09-05', 119, 'USA', '$1,594,107', 'English', 'RKO Radio Pictures'),
(27, 'The Wizard of Oz', 1939, '1939-08-25', 102, 'USA', '$26,096,000', 'English', 'Metro-Goldwyn-Mayer'),
(28, 'Ganga Tere Desh Mein', 2019, '2019-03-15', 143, 'India', '$15,000,000', 'Hindi', 'Bollywood Films'),
(29, 'Chennai Express', 2019, '2019-08-08', 141, 'India', '$62,000,000', 'Hindi, Tamil', 'Red Chillies Entertainment'),
(30, 'Der Untergang', 2004, '2004-09-16', 156, 'Germany', '$92,181,558', 'German', 'Constantin Film'),
(31, 'La vita è bella', 1997, '1997-12-20', 116, 'Italy', '$230,098,753', 'Italian', 'Melampo Cinematografica'),
(32, 'The Gladiator', 2018, '2018-05-05', 155, 'USA', '$457,640,427', 'English', 'DreamWorks Pictures'),
(33, 'The Dark Lord', 2018, '2018-09-12', 122, 'USA', '$201,879,276', 'English', 'Universal Pictures'),
(34, 'The Rising Sun', 2018, '2018-07-23', 118, 'Japan, USA', '$102,470,687', 'Japanese, English', 'Toho Company'),
(35, 'Eagle Eye', 2018, '2018-12-01', 145, 'USA', '$178,066,569', 'English', 'DreamWorks Pictures'),
(36, 'Bombshell', 2017, '2017-03-10', 108, 'USA', '$61,404,831', 'English', 'Lionsgate Films'),
(37, 'Mystic River', 2017, '2017-03-15', 138, 'USA', '$156,822,020', 'English', 'Warner Bros.'),
(38, 'The Eternal Sun', 2017, '2017-03-22', 112, 'USA', '$72,340,943', 'English', 'Focus Features'),
(39, 'The Spotlight', 2019, '2019-04-01', 129, 'USA', '$98,346,053', 'English', 'Open Road Films'),
(40, 'Iron Man', 2008, '2008-05-02', 126, 'USA', '$585,174,222', 'English', 'Marvel Studios');

-- Insert sample data into Genre table
INSERT INTO genre (movie_id, genre) VALUES
(1, 'Drama'),
(2, 'Crime'),
(2, 'Drama'),
(3, 'Action'),
(3, 'Crime'),
(3, 'Drama'),
(4, 'Action'),
(4, 'Adventure'),
(4, 'Sci-Fi'),
(5, 'Crime'),
(5, 'Drama'),
(6, 'Drama'),
(6, 'Romance'),
(7, 'Action'),
(7, 'Sci-Fi'),
(8, 'Biography'),
(8, 'Drama'),
(8, 'History'),
(9, 'Biography'),
(9, 'Crime'),
(9, 'Drama'),
(10, 'Drama'),
(11, 'Crime'),
(11, 'Drama'),
(11, 'Thriller'),
(12, 'Crime'),
(12, 'Drama'),
(12, 'Fantasy'),
(13, 'Adventure'),
(13, 'Drama'),
(13, 'Sci-Fi'),
(14, 'Crime'),
(14, 'Drama'),
(15, 'Crime'),
(15, 'Drama'),
(15, 'Thriller'),
(16, 'Drama'),
(16, 'Romance'),
(17, 'Adventure'),
(17, 'Sci-Fi'),
(17, 'Thriller'),
(18, 'Action'),
(18, 'Adventure'),
(18, 'Fantasy'),
(19, 'Animation'),
(19, 'Adventure'),
(19, 'Drama'),
(20, 'Action'),
(20, 'Adventure'),
(20, 'Sci-Fi'),
(21, 'Crime'),
(21, 'Drama'),
(22, 'Action'),
(22, 'Adventure'),
(22, 'Drama'),
(23, 'Horror'),
(23, 'Mystery'),
(23, 'Thriller'),
(24, 'Drama'),
(24, 'Romance'),
(24, 'War'),
(25, 'Mystery'),
(25, 'Thriller'),
(26, 'Drama'),
(26, 'Mystery'),
(27, 'Adventure'),
(27, 'Family'),
(27, 'Fantasy'),
(28, 'Drama'),
(28, 'Action'),
(29, 'Comedy'),
(29, 'Romance'),
(30, 'Biography'),
(30, 'Drama'),
(30, 'History'),
(31, 'Comedy'),
(31, 'Drama'),
(31, 'Romance'),
(32, 'Action'),
(32, 'Adventure'),
(32, 'Drama'),
(33, 'Horror'),
(33, 'Mystery'),
(34, 'Action'),
(34, 'Thriller'),
(35, 'Mystery'),
(35, 'Thriller'),
(36, 'Drama'),
(37, 'Crime'),
(37, 'Drama'),
(37, 'Mystery'),
(38, 'Drama'),
(38, 'Romance'),
(39, 'Drama'),
(39, 'Biography'),
(40, 'Action'),
(40, 'Adventure'),
(40, 'Sci-Fi');

-- Insert sample data into Director Mapping table
INSERT INTO director_mapping (movie_id, name_id) VALUES
(1, 1),
(2, 15),
(3, 1),
(4, 1),
(5, 12),
(6, 2),
(8, 2),
(9, 6),
(13, 1),
(14, 6),
(15, 6),
(16, 2),
(17, 2),
(21, 15),
(30, 6),
(31, 2);

-- Insert sample data into Role Mapping table
INSERT INTO role_mapping (movie_id, name_id, category) VALUES
(1, 3, 'actor'),
(2, 8, 'actor'),
(3, 4, 'actor'),
(4, 4, 'actor'),
(5, 13, 'actress'),
(5, 14, 'actor'),
(6, 3, 'actor'),
(7, 9, 'actor'),
(8, 3, 'actor'),
(9, 7, 'actor'),
(10, 9, 'actor'),
(14, 7, 'actor'),
(15, 7, 'actor'),
(15, 4, 'actor'),
(16, 4, 'actor'),
(1, 1, 'director'),
(2, 15, 'director'),
(3, 1, 'director'),
(4, 1, 'director'),
(5, 12, 'director'),
(5, 12, 'producer'),
(6, 2, 'director'),
(14, 6, 'director'),
(15, 6, 'director'),
(16, 2, 'director'),
(21, 15, 'director');

-- Insert sample data into Ratings table
INSERT INTO ratings (movie_id, avg_rating, total_votes, median_rating) VALUES
(1, 9.3, 2343110, 9),
(2, 9.2, 1620367, 9),
(3, 9.0, 2303232, 9),
(4, 8.8, 2037659, 9),
(5, 8.9, 1826291, 9),
(6, 8.8, 1809221, 9),
(7, 8.7, 1676426, 9),
(8, 8.9, 1213505, 9),
(9, 8.7, 1006486, 9),
(10, 8.8, 1852844, 9),
(11, 8.6, 1287108, 8),
(12, 8.6, 1181662, 8),
(13, 8.6, 1475561, 9),
(14, 8.3, 700264, 8),
(15, 8.5, 1198333, 8),
(16, 7.8, 1045972, 8),
(17, 8.1, 856788, 8),
(18, 7.8, 1123625, 8),
(19, 8.5, 938220, 9),
(20, 8.0, 1263813, 8),
(21, 9.0, 1142340, 9),
(22, 8.9, 1657990, 9),
(23, 8.5, 589513, 9),
(24, 8.5, 523758, 9),
(25, 8.4, 438045, 9),
(26, 8.3, 403348, 8),
(27, 8.0, 370260, 8),
(28, 4.5, 2500, 4),
(29, 6.5, 45000, 6),
(30, 8.2, 325294, 8),
(31, 8.6, 615267, 9),
(32, 8.3, 150000, 8),
(33, 4.2, 35000, 4),
(34, 6.8, 28000, 7),
(35, 7.2, 42000, 7),
(36, 6.7, 1200, 7),
(37, 7.9, 6500, 8),
(38, 8.3, 1800, 8),
(39, 8.1, 425000, 8),
(40, 7.9, 920015, 8);
