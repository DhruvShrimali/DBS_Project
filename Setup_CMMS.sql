create database CMMS;
use CMMS;

CREATE TABLE Team (
  team_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  coach_name VARCHAR(50),
  home_ground VARCHAR(50) UNIQUE
);

CREATE TABLE Player (
  player_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  player_name VARCHAR(50) NOT NULL,
  player_age INT,
  player_position VARCHAR(50),
  team_id INT,
  FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

CREATE TABLE Team_Name (
  team_id INT,
  team_name VARCHAR(50) UNIQUE NOT NULL,
  PRIMARY KEY (team_id, team_name),
  FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

CREATE TABLE Matches (
  match_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  match_date DATE NOT NULL,
  location VARCHAR(50) NOT NULL,
  team1_id INT NOT NULL,
  team2_id INT NOT NULL,
  result INT,
  FOREIGN KEY (team1_id) REFERENCES Team(team_id),
  FOREIGN KEY (team2_id) REFERENCES Team(team_id),
  FOREIGN KEY (result) REFERENCES Team(team_id)
);

CREATE TABLE Batting_Score (
  match_id INT NOT NULL,
  player_id INT NOT NULL,
  runs_scored INT NOT NULL,
  overs_played FLOAT NOT NULL,
  PRIMARY KEY (match_id, player_id),
  FOREIGN KEY (match_id) REFERENCES Matches(match_id),
  FOREIGN KEY (player_id) REFERENCES Player(player_id)
);

CREATE TABLE Bowling_Score (
  match_id INT NOT NULL,
  player_id INT NOT NULL,
  wickets_taken INT NOT NULL,
  overs_bowled FLOAT NOT NULL,
  PRIMARY KEY (match_id, player_id),
  FOREIGN KEY (match_id) REFERENCES Matches(match_id),
  FOREIGN KEY (player_id) REFERENCES Player(player_id)
);

CREATE TABLE Match_Score (
  match_id INT NOT NULL,
  team_id INT NOT NULL,
  runs_scored INT NOT NULL,
  wickets_taken INT NOT NULL,
  overs_played FLOAT NOT NULL,
  PRIMARY KEY (match_id, team_id),
  FOREIGN KEY (match_id) REFERENCES Matches(match_id),
  FOREIGN KEY (team_id) REFERENCES Team(team_id)
);


INSERT INTO Team (coach_name, home_ground) VALUES
('Ravi Shastri', 'Wankhede Stadium'),
('Mickey Arthur', 'Gaddafi Stadium'),
('Eoin Morgan', 'Lords Cricket Ground'),
('Brendon McCullum', 'Hagley Oval'),
('Kane Williamson', 'Bay Oval'),
('Justin Langer', 'Perth Stadium'),
('Babar Azam', 'Rawalpindi Cricket Stadium'),
('Kieron Pollard', 'Kensington Oval'),
('Tamim Iqbal', 'Sher-e-Bangla National Cricket Stadium'),
('Dimuth Karunaratne', 'R. Premadasa Stadium');


INSERT INTO Team_Name (team_id, team_name) VALUES
(1, 'India'),
(2, 'Pakistan'),
(3, 'England'),
(4, 'New Zealand'),
(5, 'South Africa'),
(6, 'Australia'),
(7, 'Afghanistan'),
(8, 'West Indies'),
(9, 'Bangladesh'),
(10, 'Sri Lanka');

INSERT INTO Player (player_name, player_age, player_position, team_id) VALUES 
('Virat Kohli', 33, 'Batsman', 1),
('Rohit Sharma', 34, 'Batsman', 1),
('Jasprit Bumrah', 27, 'Bowler', 1),
('Ravindra Jadeja', 33, 'All-rounder', 1),
('Hardik Pandya', 28, 'All-rounder', 1),
('Mohammed Shami', 31, 'Bowler', 1),
('KL Rahul', 29, 'Batsman', 1),
('Yuzvendra Chahal', 31, 'Bowler', 1),
('Shikhar Dhawan', 35, 'Batsman', 1),
('Bhuvneshwar Kumar', 31, 'Bowler', 1),
('Rishabh Pant', 23, 'Wicketkeeper Batsman', 1),
('Babar Azam', 27, 'Batsman', 2),
('Fakhar Zaman', 31, 'Batsman', 2),
('Shaheen Afridi', 21, 'Bowler', 2),
('Hasan Ali', 26, 'Bowler', 2),
('Shadab Khan', 22, 'All-rounder', 2),
('Mohammad Hafeez', 41, 'All-rounder', 2),
('Imad Wasim', 33, 'All-rounder', 2),
('Haris Rauf', 28, 'Bowler', 2),
('Sarfaraz Ahmed', 34, 'Wicketkeeper Batsman', 2),
('Mohammad Rizwan', 29, 'Wicketkeeper Batsman', 2),
('Fahim Ashraf', 27, 'All-rounder', 2),
('Joe Root', 31, 'Batsman', 3),
('Ben Stokes', 30, 'All-rounder', 3),
('Jofra Archer', 26, 'Bowler', 3),
('Jos Buttler', 30, 'Wicketkeeper Batsman', 3),
('Jonny Bairstow', 31, 'Wicketkeeper Batsman', 3),
('Chris Woakes', 32, 'All-rounder', 3),
('Adil Rashid', 33, 'Bowler', 3),
('Moeen Ali', 33, 'All-rounder', 3),
('Mark Wood', 31, 'Bowler', 3),
('Liam Livingstone', 27, 'All-rounder', 3),
('Sam Curran', 23, 'All-rounder', 3),
('Kane Williamson', 31, 'Batsman', 4),
('Tom Latham', 29, 'Batsman', 4),
('Ross Taylor', 37, 'Batsman', 4),
('Henry Nicholls', 29, 'Batsman', 4),
('Tom Blundell', 31, 'Batsman', 4),
('Colin de Grandhomme', 35, 'All-rounder', 4),
('Mitchell Santner', 29, 'All-rounder', 4),
('Tim Southee', 33, 'Bowler', 4),
('Trent Boult', 32, 'Bowler', 4),
('Kyle Jamieson', 27, 'Bowler', 4),
('Matt Henry', 29, 'Bowler', 4),
('AB de Villiers', 39, 'Wicketkeeper batsman', 5),
('Hashim Amla', 40, 'Batsman', 5),
('Farhaan Behardien', 39, 'All-rounder', 5),
('Quinton de Kock', 30, 'Wicketkeeper batsman', 5),
('David Miller', 33, 'Batsman', 5),
('Faf du Plessis', 38, 'Batsman', 5),
('Jean-Paul Duminy', 39, 'All-rounder', 5),
('Imran Tahir', 44, 'Bowler', 5),
('Keshav Maharaj', 33, 'All-rounder', 5),
('Morne Morkel', 38, 'Bowler', 5),
('Kagiso Rabada', 27, 'Bowler', 5),
('Aaron Finch', 35, 'Batsman', 6),
('David Warner', 34, 'Batsman', 6),
('Steve Smith', 32, 'Batsman', 6),
('Marnus Labuschagne', 27, 'Batsman', 6),
('Glenn Maxwell', 33, 'All-rounder', 6),
('Marcus Stoinis', 32, 'All-rounder', 6),
('Pat Cummins', 28, 'Bowler', 6),
('Mitchell Starc', 31, 'Bowler', 6),
('Adam Zampa', 29, 'Bowler', 6),
('Josh Hazlewood', 30, 'Bowler', 6),
('Andrew Tye', 34, 'Bowler', 6),
('Hashmatullah Shahidi', 29, 'Batsman', 7),
('Najibullah Zadran', 30, 'Batsman', 7),
('Ibrahim Zadran', 21, 'Batsman', 7),
('Ikram Alikhil', 23, 'Wicketkeeper batsman', 7),
('Mohammad Nabi', 38, 'All-rounder', 7),
('Azmatullah Omarzai', 23, 'All-rounder', 7),
('Mujeeb Ur Rahman', 22, 'Bowler', 7),
('Fareed Ahmad', 29, 'Bowler', 7),
('Rashid Khan', 25, 'Bowler', 7),
('Yamin Ahmadzai', 31, 'Bowler', 7),
('Noor Ahmad', 18, 'Bowler', 7),
('Kieron Pollard', 34, 'All-rounder', 8),
('Evin Lewis', 29, 'Batsman', 8),
('Shimron Hetmyer', 24, 'Batsman', 8),
('Chris Gayle', 42, 'Batsman', 8),
('Nicholas Pooran', 25, 'Wicketkeeper batsman', 8),
('Jason Holder', 29, 'All-rounder', 8),
('Fabian Allen', 26, 'All-rounder', 8),
('Dwayne Bravo', 38, 'Bowler', 8),
('Sheldon Cottrell', 31, 'Bowler', 8),
('Obed McCoy', 24, 'Bowler', 8),
('Hayden Walsh Jr.', 29, 'Bowler', 8),
('Tamim Iqbal', 32, 'Opening Batsman', 9),
('Liton Das', 27, 'Wicketkeeper Batsman', 9),
('Shakib Al Hasan', 34, 'All-rounder', 9),
('Mushfiqur Rahim', 34, 'Wicketkeeper Batsman', 9),
('Mahmudullah', 35, 'All-rounder', 9),
('Mehidy Hasan', 23, 'Bowler', 9),
('Taskin Ahmed', 26, 'Bowler', 9),
('Mustafizur Rahman', 25, 'Bowler', 9),
('Rubel Hossain', 32, 'Bowler', 9),
('Mohammad Saifuddin', 24, 'All-rounder', 9),
('Nasum Ahmed', 27, 'Bowler', 9),
('Dimuth Karunaratne', 33, 'Batsman', 10),
('Danushka Gunathilaka', 30, 'Batsman', 10),
('Kusal Perera', 30, 'Wicketkeeper Batsman', 10),
('Kusal Mendis', 26, 'Batsman', 10),
('Angelo Mathews', 34, 'All-rounder', 10),
('Dhananjaya de Silva', 29, 'All-rounder', 10),
('Wanindu Hasaranga', 24, 'Bowler', 10),
('Isuru Udana', 33, 'Bowler', 10),
('Lahiru Kumara', 24, 'Bowler', 10),
('Nuwan Pradeep', 34, 'Bowler', 10),
('Dushmantha Chameera', 29, 'Bowler', 10);

INSERT INTO Matches (match_date, location, team1_id, team2_id, result)
VALUES
('2023-04-10', 'Wankhede Stadium', 1, 4, 4),
('2023-04-11', 'Gaddafi Stadium', 2, 6, 6),
('2023-04-12', 'Lords Cricket Ground', 3, 5, 3),
('2023-04-13', 'Hagley Oval', 4, 8, 8),
('2023-04-14', 'Bay Oval', 5, 10, 5),
('2023-04-15', 'Perth Stadium', 6, 9, 6),
('2023-04-16', 'Rawalpindi Cricket Stadium', 7, 1, 7),
('2023-04-17', 'Kensington Oval', 8, 3, 3),
('2023-04-18', 'Sher-e-Bangla National Cricket Stadium', 9, 2, 2),
('2023-04-19', 'R. Premadasa Stadium', 10, 6, 6);

INSERT INTO Batting_Score (match_id, player_id, runs_scored, overs_played) VALUES
	('1', '2', '38', '6.2'),
	('1', '3', '149', '3.1'),
	('1', '4', '10', '1.4'),
	('1', '5', '14', '2.2'),
	('1', '6', '26', '4.2'),
	('1', '7', '38', '6.2'),
	('1', '8', '214', '2.2'),
	('1', '9', '3', '0.3'),
	('1', '10', '6', '1'),
	('1', '11', '2', '0.2'),
	('1', '35', '40', '6.3'),
	('1', '36', '10', '2.4'),
	('1', '37', '18', '5.1'),
	('1', '1', '9', '2'),
	('1', '38', '24', '7.2'),
	('1', '39', '11', '3.2'),
	('1', '40', '140', '13'),
	('1', '41', '57', '7.3'),
	('1', '42', '0', '0.1'),
	('1', '43', '8', '1.1'),
	('1', '44', '1', '0.1'),
	('2', '12', '48', '12.5'),
	('2', '13', '40', '10.1'),
	('2', '14', '0', '0.1'),
	('2', '15', '9', '2.1'),
	('2', '16', '30', '9.2'),
	('2', '17', '6', '2.2'),
	('2', '18', '8', '3.4'),
	('2', '19', '3', '2.5'),
	('2', '20', '11', '4'),
	('2', '21', '0', '0.1'),
	('2', '22', '0', '0.3'),
	('2', '56', '15', '3.4'),
	('2', '57', '26', '9.1'),
	('2', '58', '0', '0.2'),
	('2', '59', '66', '15.3'),
	('2', '60', '7', '3'),
	('2', '61', '41', '11.2'),
	('2', '62', '10', '3.3'),
	('2', '63', '18', '2.5'),
	('2', '64', '3', '1'),
	('3', '23', '15', '1.5'),
	('3', '24', '14', '2.3'),
	('3', '25', '134', '21.2'),
	('3', '26', '5', '1'),
	('3', '27', '17', '3.4'),
	('3', '28', '29', '5.4'),
	('3', '29', '11', '2.5'),
	('3', '30', '14', '3'),
	('3', '31', '34', '6.4'),
	('3', '32', '10', '1.4'),
	('3', '33', '0', '0.1'),
	('3', '45', '86', '14'),
	('3', '46', '69', '9.3'),
	('3', '47', '80', '13'),
	('3', '48', '4', '1'),
	('3', '49', '21', '4.4'),
	('3', '50', '20', '4.4'),
	('4', '34', '24', '6.3'),
	('4', '35', '25', '4'),
	('4', '36', '34', '8.2'),
	('4', '37', '4', '2.3'),
	('4', '38', '12', '3.1'),
	('4', '39', '20', '5.2'),
	('4', '40', '31', '5.3'),
	('4', '41', '25', '6.2'),
	('4', '42', '12', '2.5'),
	('4', '43', '0', '0.2'),
	('4', '44', '1', '0.3'),
	('4', '78', '26', '4'),
	('4', '79', '6', '1.3'),
	('4', '80', '79', '15.1'),
	('4', '81', '11', '3.2'),
	('4', '82', '28', '7.5'),
	('4', '83', '12', '3'),
	('4', '84', '13', '4.1'),
	('5', '45', '10', '3'),
	('5', '46', '9', '2'),
	('5', '47', '16', '4.5'),
	('5', '48', '31', '7.2'),
	('5', '49', '47', '11.5'),
	('5', '50', '13', '2'),
	('5', '51', '6', '1.4'),
	('5', '52', '16', '6.3'),
	('5', '53', '29', '6.3'),
	('5', '54', '10', '4.2'),
	('5', '55', '2', '0.4'),
	('5', '100', '18', '3.1'),
	('5', '101', '2', '0.4'),
	('5', '102', '1', '1.1'),
	('5', '103', '5', '0.5'),
	('5', '104', '22', '5'),
	('5', '105', '2', '1.1'),
	('5', '106', '17', '6'),
	('5', '107', '18', '4'),
	('5', '108', '8', '2.1'),
	('5', '109', '15', '2.5'),
	('5', '110', '9', '3.1'),
	('6', '56', '166', '24.3'),
	('6', '57', '53', '8.3'),
	('6', '58', '89', '12'),
	('6', '59', '32', '1.4'),
	('6', '60', '17', '1.5'),
	('6', '61', '1', '0.2'),
	('6', '62', '11', '1.2'),
	('6', '89', '62', '12.2'),
	('6', '90', '10', '1.2'),
	('6', '91', '41', '6.5'),
	('6', '92', '102', '16.1'),
	('6', '93', '20', '2.5'),
	('6', '94', '69', '8.2'),
	('6', '95', '0', '0.1'),
	('6', '96', '6', '1.1'),
	('6', '97', '6', '0.5'),
	('7', '1', '6', '0.3'),
	('7', '2', '99', '15.1'),
	('7', '3', '57', '11.2'),
	('7', '4', '25', '5.1'),
	('7', '5', '34', '7.2'),
	('7', '6', '4', '1.4'),
	('7', '7', '0', '0.2'),
	('7', '8', '7', '2.2'),
	('7', '9', '38', '3.2'),
	('7', '10', '9', '3'),
	('7', '11', '1', '0.1'),
	('7', '67', '37', '6.1'),
	('7', '68', '13', '2.1'),
	('7', '69', '117', '19.3'),
	('7', '70', '12', '2'),
	('7', '71', '25', '4.1'),
	('7', '72', '49', '8.1'),
	('7', '73', '29', '4.5'),
	('7', '74', '14', '2.2'),
	('8', '23', '56', '7.1'),
	('8', '24', '82', '12.1'),
	('8', '25', '5', '1.4'),
	('8', '26', '103', '14.4'),
	('8', '27', '150', '12.5'),
	('8', '28', '11', '1.4'),
	('8', '29', '0', '0.1'),
	('8', '78', '162', '16.1'),
	('8', '79', '15', '1.3'),
	('8', '80', '5', '1.1'),
	('8', '81', '61', '9.5'),
	('8', '82', '6', '0.2'),
	('8', '83', '29', '5.5'),
	('8', '84', '50', '6'),
	('8', '85', '43', '6.5'),
	('8', '86', '0', '0.2'),
	('8', '87', '0', '0'),
	('8', '88', '0', '0.1'),
	('9', '12', '6', '2.4'),
	('9', '13', '0', '0.5'),
	('9', '14', '5', '0.4'),
	('9', '15', '99', '19.2'),
	('9', '16', '60', '14'),
	('9', '17', '9', '1.4'),
	('9', '18', '25', '5.1'),
	('9', '19', '12', '1.5'),
	('9', '20', '13', '2.1'),
	('9', '21', '1', '0.3'),
	('9', '22', '0', '0'),
	('9', '89', '1', '0.4'),
	('9', '90', '83', '17.3'),
	('9', '91', '1', '0.3'),
	('9', '92', '10', '1.1'),
	('9', '93', '30', '8.3'),
	('9', '94', '4', '4'),
	('9', '95', '31', '7.5'),
	('9', '96', '8', '3.1'),
	('9', '97', '8', '1.5'),
	('9', '98', '14', '3.2'),
	('9', '99', '13', '1.4'),
	('10', '100', '8', '2.2'),
	('10', '101', '2', '0.4'),
	('10', '102', '26', '6.4'),
	('10', '103', '6', '1.5'),
	('10', '104', '14', '4.3'),
	('10', '105', '1', '0.3'),
	('10', '106', '4', '0.2'),
	('10', '107', '75', '12.3'),
	('10', '108', '4', '3.5'),
	('10', '109', '15', '8.4'),
	('10', '110', '2', '1.2'),
	('10', '56', '10', '1.2'),
	('10', '57', '0', '0.3'),
	('10', '58', '24', '8.2'),
	('10', '59', '5', '1.4'),
	('10', '60', '31', '9.4'),
	('10', '61', '45', '10.5'),
	('10', '62', '16', '2.5'),
	('10', '63', '25', '4.2');
    
    
INSERT INTO Bowling_Score (match_id, player_id, wickets_taken, overs_bowled) VALUES
	('1', '7', '0', '7'),
	('1', '8', '2', '7.2'),
	('1', '9', '2', '8'),
	('1', '10', '1', '7'),
	('1', '11', '4', '10'),
	('1', '34', '1', '10'),
	('1', '39', '2', '5'),
	('1', '40', '0', '6'),
	('1', '41', '1', '10'),
	('1', '42', '1', '10'),
	('1', '43', '1', '10'),
	('1', '44', '2', '9'),
	('2', '17', '0', '9'),
	('2', '18', '1', '10'),
	('2', '19', '2', '10'),
	('2', '20', '0', '7'),
	('2', '21', '0', '6'),
	('2', '22', '3', '8'),
	('2', '60', '1', '10'),
	('2', '61', '1', '6'),
	('2', '62', '1', '3.1'),
	('2', '63', '2', '10'),
	('2', '64', '0', '2'),
	('2', '65', '1', '18'),
	('2', '66', '3', '6'),
	('3', '28', '0', '1.5'),
	('3', '29', '1', '10'),
	('3', '30', '1', '7'),
	('3', '31', '0', '10'),
	('3', '32', '0', '10'),
	('3', '33', '2', '8'),
	('3', '50', '1', '10'),
	('3', '51', '3', '3'),
	('3', '52', '0', '10'),
	('3', '53', '0', '7'),
	('3', '54', '1', '10'),
	('3', '55', '3', '10'),
	('4', '40', '0', '4'),
	('4', '41', '1', '7'),
	('4', '42', '0', '8'),
	('4', '43', '2', '10'),
	('4', '44', '2', '10'),
	('4', '84', '1', '9'),
	('4', '85', '1', '10'),
	('4', '86', '3', '8.2'),
	('4', '87', '3', '10'),
	('4', '88', '2', '8'),
	('5', '50', '1', '4'),
	('5', '51', '0', '4'),
	('5', '52', '4', '8'),
	('5', '53', '2', '10'),
	('5', '54', '1', '3'),
	('5', '55', '2', '1'),
	('5', '104', '1', '1'),
	('5', '105', '0', '1'),
	('5', '106', '2', '10'),
	('5', '107', '1', '10'),
	('5', '108', '2', '10'),
	('5', '109', '3', '10'),
	('5', '110', '0', '8'),
	('6', '61', '1', '9'),
	('6', '62', '2', '8'),
	('6', '63', '2', '10'),
	('6', '64', '0', '3'),
	('6', '65', '0', '10'),
	('6', '66', '2', '10'),
	('6', '94', '3', '8'),
	('6', '95', '0', '10'),
	('6', '96', '0', '9'),
	('6', '97', '0', '6'),
	('6', '98', '1', '9'),
	('6', '99', '0', '8'),
	('7', '6', '0', '1'),
	('7', '7', '2', '10'),
	('7', '8', '0', '9'),
	('7', '9', '1', '9.5'),
	('7', '10', '2', '10'),
	('7', '11', '1', '10'),
	('7', '72', '1', '10'),
	('7', '73', '0', '3'),
	('7', '74', '0', '7'),
	('7', '75', '2', '10'),
	('7', '76', '2', '10'),
	('7', '77', '3', '10'),
	('8', '28', '0', '2'),
	('8', '29', '5', '10'),
	('8', '30', '1', '8'),
	('8', '31', '0', '8'),
	('8', '32', '4', '10'),
	('8', '33', '0', '10'),
	('8', '83', '2', '10'),
	('8', '84', '2', '10'),
	('8', '85', '0', '4'),
	('8', '86', '1', '10'),
	('8', '87', '0', '7'),
	('8', '88', '1', '9'),
	('9', '17', '1', '5'),
	('9', '18', '1', '10'),
	('9', '19', '1', '8'),
	('9', '20', '0', '7'),
	('9', '21', '4', '10'),
	('9', '22', '2', '10'),
	('9', '94', '1', '10'),
	('9', '95', '0', '2'),
	('9', '96', '0', '8'),
	('9', '97', '2', '9.5'),
	('9', '98', '2', '10'),
	('9', '99', '4', '9'),
	('10', '105', '0', '4'),
	('10', '106', '1', '3'),
	('10', '107', '0', '9.3'),
	('10', '108', '3', '10'),
	('10', '109', '2', '10'),
	('10', '110', '0', '3'),
	('10', '60', '1', '2'),
	('10', '61', '0', '7'),
	('10', '62', '0', '1'),
	('10', '63', '2', '6.1'),
	('10', '64', '2', '10'),
	('10', '65', '1', '10'),
	('10', '66', '2', '7');

INSERT INTO Match_Score (match_id, team_id, runs_scored, wickets_taken, overs_played) VALUES
	('1', '1', '349', '10', '50'),
	('1', '4', '121', '7', '49.2'),
	('2', '2', '171', '6', '47.1'),
	('2', '6', '198', '9', '50'),
	('3', '3', '418', '4', '50'),
	('3', '5', '287', '8', '46.5'),
	('4', '4', '190', '5', '48'),
	('4', '8', '193', '10', '39'),
	('5', '5', '203', '10', '50'),
	('5', '10', '125', '9', '30'),
	('6', '6', '381', '8', '50'),
	('6', '9', '333', '5', '50'),
	('7', '1', '321', '6', '50'),
	('7', '7', '322', '9', '49.5'),
	('8', '8', '389', '6', '48'),
	('8', '3', '418', '10', '50'),
	('9', '9', '202', '10', '50'),
	('9', '2', '239', '9', '48.5'),
	('10', '10', '160', '6', '43.1'),
	('10', '6', '164', '10', '39.3');


