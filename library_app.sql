SET NAMES utf8mb4;
CREATE DATABASE library_app CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

CREATE TABLE city (
  city_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  city_name VARCHAR(50)  NOT NULL
);

CREATE TABLE address (
  address_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  street_name VARCHAR(50) NOT NULL,
  flat_number VARCHAR(50) NOT NULL,
  house_number VARCHAR(30),
  postal_code VARCHAR(30),
  city_id INT UNSIGNED,
  FOREIGN KEY (city_id) REFERENCES city(city_id)
);

CREATE TABLE authoritie (
  authoritie_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  authoritie_name VARCHAR (30)
);

CREATE TABLE user (
  user_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  firstname VARCHAR(127) NOT NULL,
  lastname VARCHAR(127) NOT NULL,
  username VARCHAR(50) NOT NULL,
  password CHAR(32) NOT NULL,
  email VARCHAR(50) NOT NULL,
  reg_date DATETIME NOT NULL,
  date_of_birth TIMESTAMP NOT NULL,
  authoritie_id INT UNSIGNED,
  address_id INT UNSIGNED,
  FOREIGN KEY (address_id) REFERENCES address(address_id),
  FOREIGN KEY (authoritie_id) REFERENCES authoritie(authoritie_id)
);

CREATE TABLE category (
  category_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(50) NOT NULL
);

CREATE TABLE author (
  author_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  firstname VARCHAR(127) NOT NULL,
  lastname VARCHAR(127) NOT NULL
);

CREATE TABLE book_info (
  book_info_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  descrption VARCHAR(1024) NOT NULL,
  author_id INT UNSIGNED,
  category_id INT UNSIGNED,
  FOREIGN KEY (author_id) REFERENCES author(author_id),
  FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE book_author (
  book_info_id INT UNSIGNED,
  author_id INT UNSIGNED,
  PRIMARY KEY ( book_info_id, author_id),
  FOREIGN KEY (book_info_id) REFERENCES book_info(book_info_id),
  FOREIGN KEY (author_id) REFERENCES author(author_id)
);

CREATE TABLE book (
  book_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  book_info_id INT UNSIGNED,
  FOREIGN KEY (book_info_id) REFERENCES book_info(book_info_id),
  isbn CHAR(13),
  cower ENUM ('twarda', 'miękka')
);

CREATE TABLE book_category (
  book_id INT UNSIGNED,
  category_id INT UNSIGNED,
  PRIMARY KEY ( book_id, category_id),
  FOREIGN KEY (book_id) REFERENCES book(book_id),
  FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE borrow (
  borrow_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  requsted_by_id INT UNSIGNED,
  given_by_id INT UNSIGNED,
  taken_by_id INT UNSIGNED,
  book_id INT UNSIGNED,
  address_id INT UNSIGNED,
  request_date DATETIME NOT NULL,
  borrow_date DATETIME NOT NULL,
  return_date DATETIME NOT NULL,
  FOREIGN KEY (requsted_by_id) REFERENCES user(user_id),
  FOREIGN KEY (given_by_id) REFERENCES user(user_id),
  FOREIGN KEY (taken_by_id) REFERENCES user(user_id),
  FOREIGN KEY (book_id) REFERENCES book(book_id),
  FOREIGN KEY (address_id) REFERENCES address(address_id)
);