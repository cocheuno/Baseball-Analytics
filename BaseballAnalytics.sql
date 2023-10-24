CREATE DATABASE baseball_analytics;

USE baseball_analytics;

CREATE TABLE team (
  team_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

INSERT INTO team (name)  
VALUES ('Astros'),
       ('Yankees');
       
CREATE TABLE players (
  player_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  position VARCHAR(50) NOT NULL,
  team_id INT,
  FOREIGN KEY (team_id) REFERENCES team(team_id)
);

INSERT INTO players (name, position, team_id)  
VALUES ('Jose Altuve', '2B', 1),
       ('Alex Bregman', '3B', 1),
       ('Aaron Judge', 'RF', 2),
       ('Giancarlo Stanton', 'LF', 2);
       
CREATE TABLE batting (
  batting_id INT AUTO_INCREMENT PRIMARY KEY,
  player_id INT,
  ab INT,
  h INT,
  hr INT, 
  rbi INT,
  sb INT,
  avg DECIMAL(3,3),
  obp DECIMAL(3,3),
  slg DECIMAL(3,3),
  FOREIGN KEY (player_id) REFERENCES players(player_id)
);

INSERT INTO batting (player_id, ab, h, hr, rbi, sb, avg, obp, slg)
VALUES (1, 600, 200, 30, 100, 20, 0.333, 0.400, 0.555),  
       (2, 550, 180, 35, 120, 5, 0.327, 0.410, 0.580),
       (3, 575, 190, 45, 135, 2, 0.330, 0.430, 0.650),
       (4, 525, 165, 40, 125, 3, 0.314, 0.380, 0.580);
       
CREATE TABLE pitching (
  pitching_id INT AUTO_INCREMENT PRIMARY KEY,
  player_id INT,
  w INT,
  l INT,
  g INT,
  gs INT,
  sv INT,
  ip DECIMAL(3,1),
  h9 DECIMAL(3,2),
  hr9 DECIMAL(3,2),
  k9 DECIMAL(3,2),
  bb9 DECIMAL(3,2),
  era DECIMAL(3,2),
  FOREIGN KEY (player_id) REFERENCES players(player_id)
);

INSERT INTO pitching (player_id, w, l, g, gs, sv, ip, h9, hr9, k9, bb9, era)  
VALUES (1, 20, 5, 32, 32, 0, 210.0, 7.95, 0.86, 9.63, 2.37, 2.74),
       (2, 15, 10, 28, 28, 0, 186.0, 8.47, 1.16, 8.74, 2.58, 3.88),
       (3, 12, 15, 25, 25, 0, 171.1, 9.32, 1.05, 6.97, 3.57, 4.67),
       (4, 18, 6, 33, 33, 0, 219.2, 7.58, 0.82, 10.42, 1.94, 2.51);

CREATE VIEW batting_analytics AS
SELECT p.player_id, p.name, b.ab, b.h, b.hr, b.rbi, b.sb, b.avg, b.obp, b.slg
FROM players p 
JOIN batting b ON p.player_id = b.player_id;

CREATE VIEW pitching_analytics AS  
SELECT p.player_id, p.name, pt.w, pt.l, pt.g, pt.gs, pt.sv, pt.ip, pt.h9, pt.hr9, pt.k9, pt.bb9, pt.era
FROM players p
JOIN pitching pt ON p.player_id = pt.player_id;
