CREATE TABLE testamente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    art VARCHAR(10) NOT NULL -- z.B. 'AT' oder 'NT'
);

CREATE TABLE buecher (
    id INT AUTO_INCREMENT PRIMARY KEY,
    testament_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    FOREIGN KEY (testament_id) REFERENCES testamente(id)
);

CREATE TABLE kapitel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    buch_id INT NOT NULL,
    kapitel_nr INT NOT NULL,
    FOREIGN KEY (buch_id) REFERENCES buecher(id)
);

CREATE TABLE verse (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kapitel_id INT NOT NULL,
    vers_nr INT NOT NULL,
    FOREIGN KEY (kapitel_id) REFERENCES kapitel(id)
);

CREATE TABLE buch_kommentare (
    id INT AUTO_INCREMENT PRIMARY KEY,
    buch_id INT NOT NULL,
    user_id INT NOT NULL,
    kommentar TEXT,
    FOREIGN KEY (buch_id) REFERENCES buecher(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE kapitel_kommentare (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kapitel_id INT NOT NULL,
    user_id INT NOT NULL,
    kommentar TEXT,
    FOREIGN KEY (kapitel_id) REFERENCES kapitel(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE vers_kommentare (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vers_id INT NOT NULL,
    user_id INT NOT NULL,
    kommentar TEXT,
    FOREIGN KEY (vers_id) REFERENCES verse(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);