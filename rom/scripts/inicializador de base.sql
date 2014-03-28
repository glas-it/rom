create database ROM;
use ROM;
create user 'rom-dev'@'localhost' identified by 'rom';
create user 'rom-test'@'localhost' identified by 'rom';
create user 'rom-prod'@'localhost' identified by 'rom';
GRANT ALL PRIVILEGES ON *.* TO 'rom-dev'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'rom-test'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'rom-prod'@'localhost';
