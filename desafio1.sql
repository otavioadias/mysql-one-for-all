-- Active: 1660743942348@@127.0.0.1@3307
DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

   CREATE TABLE SpotifyClone.plan(
      plan_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      plan_type VARCHAR(50) NOT NULL,
      value_plan DECIMAL(3, 2) NOT NULL
  );

    CREATE TABLE SpotifyClone.artist(
      `artist_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      `artist_name` VARCHAR(255) NOT NULL
  );

  CREATE TABLE SpotifyClone.user(
      user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      username VARCHAR(255) NOT NULL,
      `plan_id` INTEGER,
      `signature_date` DATE,
      age INT NOT NULL,
      FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plan (plan_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
      `album_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      `album_name` VARCHAR(255) NOT NULL,
      `artist_id` INTEGER,
      `release_year` INT NOT NULL,
      FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist (artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.songs(
      `song_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      `album_id` INTEGER,
      `song` VARCHAR(255) NOT NULL,
      `duration` INT NOT NULL,
      FOREIGN KEY (album_id) REFERENCES SpotifyClone.album (album_id)
  );

   CREATE TABLE SpotifyClone.followers(
      `user_id` INTEGER,
      `artist_id` INTEGER,
      `artist_name` VARCHAR(255) NOT NULL,
      CONSTRAINT PRIMARY KEY(user_id, artist_id),
      FOREIGN KEY (user_id) REFERENCES user (user_id),
      FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
  );
  CREATE TABLE SpotifyClone.history(
      `user_id` INTEGER,
      `song_id` INTEGER,
      `date` DATETIME,
      `song` VARCHAR(255) NOT NULL,
       CONSTRAINT PRIMARY KEY(user_id, song_id),
      FOREIGN KEY (user_id) REFERENCES user (user_id),
      FOREIGN KEY (song_id) REFERENCES songs (song_id)
  );

  INSERT INTO SpotifyClone.plan (plan_type, value_plan)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

   INSERT INTO SpotifyClone.artist (artist_name)
  VALUES ('Beyoncé'), ('Queen'), ('Elis Regina'), ('Baco Exu do Blues'), ('Blind Guardian'), ('Nina Simone');


  INSERT INTO SpotifyClone.user (username, age, plan_id, signature_date)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander ', 85, 4, '2019-06-05'),
    ('Judith Butler ', 45, 4, '2020-05-13'),
    ('Jorge Amado ', 58, 4, '2017-02-17');

  INSERT INTO SpotifyClone.album (album_name, artist_id, release_year)
  VALUES 
    ('Renaissance', 1, 2022),
    ('Jazz', 2, 1978), 
    ('Hot Space', 2, 1982), 
    ('Falso Brilhante', 3, 1998), 
    ('Vento de Maio', 3, 2001), 
    ('QVVJFA?', 4, 2003),
    ('Somewhere Far Beyond', 5, 2007),
    ('I Put A Spell On You', 6, 2012);

  INSERT INTO SpotifyClone.songs (album_id, song, duration)
  VALUES
    (1, 'BREAK MY SOUL', 279),
    (1, 'VIRGO’S GROOVE', 369),
    (1, 'ALIEN SUPERSTAR', 116),
    (2, "Don't Stop Me Now", 203),
    (3, 'Under Pressure', 152),
    (4, 'Como Nossos Pais', 105),
    (5, 'O Medo de Amar é o Medo de Ser Livre', 207),
    (6, 'Samba em Paris', 267),
    (7, "The Bard’s Song", 244),
    (8, 'Feeling Good', 100);

INSERT INTO SpotifyClone.followers (user_id, artist_id, artist_name)
  VALUES
    (1, 1, 'Beyoncé'),
    (1, 2, 'Queen'),
    (1, 3, 'Elis Regina'),
    (2, 1, 'Beyoncé'),
    (2, 3, 'Elis Regina'),
    (3, 2, 'Queen'),
    (4, 4, 'Baco Exu do Blues'),
    (5, 5, 'Blind Guardian'),
    (5, 6, 'Nina Simone'),
    (6, 1, 'Beyoncé'),
    (6, 6, 'Nina Simone'),
    (7, 6, 'Nina Simone'),
    (9, 3, 'Elis Regina'),
    (10, 2, 'Queen');

    INSERT INTO SpotifyClone.history (user_id, song_id, date, song)
  VALUES
    (1, 8, "2022-02-28 10:45:55", "Samba em Paris"),
    (1, 2, "2020-05-02 05:30:35", "VIRGO’S GROOVE"),
    (1, 10, "2020-03-06 11:22:33", "Feeling Good"),
    (2, 10, "2022-08-05 08:05:17", "Feeling Good" ),
    (2, 7, "2022-08-05 08:05:17", "O Medo de Amar é o Medo de Ser Livre"),
    (3, 10, "2020-11-13 16:55:13", "Feeling Good"),
    (3, 2, "2020-12-05 18:38:30", "VIRGO’S GROOVE"),
    (4, 8, "2021-08-15 17:10:10", "Samba em Paris"),
    (5, 8, "2022-01-09 01:44:33", "Samba em Paris"),
    (5, 5, "2020-08-06 15:23:43", "Under Pressure"),
    (6, 7, "2017-01-24 00:31:17", "O Medo de Amar é o Medo de Ser Livre" ),
    (6, 1, "2017-10-12 12:35:20", "BREAK MY SOUL"),
    (7, 4, "2011-12-15 22:30:49", "Don’t Stop Me Now"),
    (8, 4, "2012-03-17 14:56:41", "Don’t Stop Me Now"),
    (9, 9, "2022-02-24 21:14:22", "The Bard’s Song"),
    (10, 3, "2015-12-13 08:30:22", "ALIEN SUPERSTAR");
