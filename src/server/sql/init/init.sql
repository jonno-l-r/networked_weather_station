USE weather;

CREATE TABLE sensors (
       id INT NOT NULL AUTO_INCREMENT,
       measurement ENUM('temperature', 'pressure', 'humidity') NOT NULL,
       sensor VARCHAR(10) NOT NULL,
       unit ENUM('degree_c', 'Pa', '%'),

       PRIMARY KEY(id)
);

CREATE TABLE canberra_data (
       timestamp INT NOT NULL,
       sensor_id INT NOT NULL,
       value REAL,

       PRIMARY KEY(timestamp, sensor_id),
       CONSTRAINT FOREIGN KEY(sensor_id) REFERENCES sensors(id)
       ON UPDATE CASCADE ON DELETE NO ACTION
);

INSERT INTO sensors VALUES (10, 'temperature', 'BME280', 'degree_c');
INSERT INTO sensors VALUES (11, 'pressure', 'BME280', 'Pa');
INSERT INTO sensors VALUES (12, 'humidity', 'BME280', '%');
INSERT INTO sensors VALUES (13, 'temperature', 'MCP9808', 'degree_c');

GRANT select,insert ON weather_test.* TO 'utest';
FLUSH PRIVILEGES;
