CREATE DATABASE PembrokePS;
use PembrokePS;

SET default_storage_engine = INNODB;

CREATE TABLE STATUS
(
  ID int(11) NOT NULL AUTO_INCREMENT,
  Status_Name varchar (50) NOT NULL,
  HtmlColor varchar (10) Not NULL,
  HTML_Description varchar (20),
  PRIMARY KEY (ID),
  UNIQUE (Status_Name),
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE STATUS AUTO_INCREMENT=100;

CREATE TABLE RESULTS
(
  ID int(11) NOT NULL AUTO_INCREMENT,
  Result_Name varchar (50) NOT NULL,
  HtmlColor varchar (10) Not NULL,
  HTML_Description varchar (20),
  PRIMARY KEY (ID),
  UNIQUE (Result_Name),
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE RESULTS AUTO_INCREMENT=100;

CREATE TABLE PROPERTIES
(
  ID int(11) NOT NULL AUTO_INCREMENT,
  Prop_Name varchar (200) NOT NULL,
  Prop_Value varchar (500),
  STATUS_ID int (11) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE (Prop_Name),
  FOREIGN KEY (STATUS_ID) REFERENCES STATUS (ID),
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE ENDPOINT_PORTS
  (
  ID int(11) NOT NULL AUTO_INCREMENT,
  PORT int (11) NOT NULL,
  UNIQUE (PORT),
  PRIMARY KEY (ID),
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE QUEUE_MANAGER_TYPE
(
  ID int (11) NOT NULL AUTO_INCREMENT,
  Name varchar (255) NOT NULL,
  TableName varchar (255),
  PRIMARY KEY (ID),
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE QUEUE_MANAGER
(
  ID int(11) NOT NULL AUTO_INCREMENT,
  QUEUE_MANAGER_TYPE_ID int (11) NOT NULL,
  QMAN_PORT_ID int (11),
  KICKER_PORT_ID int (11),
  STATUS_ID int (11) NOT NULL,
  KICKER_STATUS_ID int (11) NOT NULL,
  Wait int (11) NOT NULL,
  Log_File varchar (255),
  Heartbeat varchar (255),
  KICKER_Heartbeat varchar (255),
  QMan_Description varchar (255),
  PRIMARY KEY (ID),
  FOREIGN KEY (STATUS_ID) REFERENCES STATUS (ID),
  FOREIGN KEY (KICKER_STATUS_ID) REFERENCES STATUS (ID),
  FOREIGN KEY (QMAN_PORT_ID) REFERENCES ENDPOINT_PORTS (ID),
  FOREIGN KEY (KICKER_PORT_ID) REFERENCES ENDPOINT_PORTS (ID),
  FOREIGN KEY (QUEUE_MANAGER_TYPE_ID) REFERENCES QUEUE_MANAGER_TYPE (ID),
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE WORKFLOW_MANAGER_TYPE
(
  ID int(11) NOT NULL AUTO_INCREMENT,
  Name varchar (255) NOT NULL,
  TableName varchar (255),
  PRIMARY KEY (ID),
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

  CREATE TABLE WORKFLOW_MANAGER
  (
  ID int(11) NOT NULL AUTO_INCREMENT,
  WORKFLOW_MANAGER_TYPE_ID int (11) NOT NULL,
  WKFLW_PORT_ID int (11),
  KICKER_PORT_ID int (11),
  STATUS_ID int (11) NOT NULL,
  KICKER_STATUS_ID int (11) NOT NULL,
  Wait int (11) NOT NULL,
  Max_Concurrent_Tasks int (11) NOT NULL,
  Log_File varchar (255),
  Heartbeat varchar (255),
  KICKER_Heartbeat varchar (255),
  WMan_Description varchar (255),
  PRIMARY KEY (ID),
  FOREIGN KEY (STATUS_ID) REFERENCES STATUS (ID),
  FOREIGN KEY (KICKER_STATUS_ID) REFERENCES STATUS (ID),
  FOREIGN KEY (WKFLW_PORT_ID) REFERENCES ENDPOINT_PORTS (ID),
  FOREIGN KEY (KICKER_PORT_ID) REFERENCES ENDPOINT_PORTS (ID),
  FOREIGN KEY (WORKFLOW_MANAGER_TYPE_ID) REFERENCES WORKFLOW_MANAGER_TYPE (ID),
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE PASSWORDS
(
  ID int(11) NOT NULL AUTO_INCREMENT,
  Username varchar (255) NOT NULL,
  Password varchar (255) NOT NULL,
  PRIMARY KEY (ID),  
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE Target_Types
(
  ID int(11) NOT NULL AUTO_INCREMENT,
  Name varchar (255) NOT NULL,
  STATUS_ID int (11) NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (STATUS_ID) REFERENCES STATUS (ID), 
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE SYSTEMS
(
  ID int(11) NOT NULL AUTO_INCREMENT,
  SYSTEM_Name varchar (255) NOT NULL,
  STATUS_ID int (11) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE (SYSTEM_Name), 
  FOREIGN KEY (STATUS_ID) REFERENCES STATUS (ID),
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE TARGETS
(
  ID int(11) NOT NULL AUTO_INCREMENT,
  Target_Name varchar (255) NOT NULL,
  Target_Type_ID int (11) NOT NULL,
  IP_Address varchar (255),
  STATUS_ID int (11) NOT NULL,
  Password_ID int (11) NOT NULL,
  System_ID int (11) NOT NULL,
  Target_Description varchar (255),
  PRIMARY KEY (ID),  
  FOREIGN KEY (STATUS_ID) REFERENCES STATUS (ID),
  FOREIGN KEY (Password_ID) REFERENCES PASSWORDS (ID),
  FOREIGN KEY (System_ID) REFERENCES SYSTEMS (ID),
  FOREIGN KEY (Target_Type_ID) REFERENCES Target_Types (ID),
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE TASK_TYPES
(
  ID int(11) NOT NULL AUTO_INCREMENT,
  Task_Name varchar (255) NOT NULL,
  Task_Path varchar (255) NOT NULL,
  STATUS_ID int (11) NOT NULL,
  PRIORITY int (11) NOT NULL,
  PRIMARY KEY (ID),
  UNIQUE (Task_Name), 
  FOREIGN KEY (STATUS_ID) REFERENCES STATUS (ID),
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE QMAN_TASK_TYPES
(
  ID int(11) NOT NULL AUTO_INCREMENT,
  QUEUE_MANAGER_TYPE_ID int (11) NOT NULL,
  TASK_TYPE_ID int (11) NOT NULL,
  STATUS_ID int (11) NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (QUEUE_MANAGER_TYPE_ID) REFERENCES STATUS (ID),
  FOREIGN KEY (TASK_TYPE_ID) REFERENCES TASK_TYPES (ID),
  FOREIGN KEY (STATUS_ID) REFERENCES STATUS (ID),
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE WMAN_TASK_TYPES
(
  ID int(11) NOT NULL AUTO_INCREMENT,
  WORKFLOW_MANAGER_TYPE_ID int (11) NOT NULL,
  TASK_TYPE_ID int (11) NOT NULL,
  STATUS_ID int (11) NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (WORKFLOW_MANAGER_TYPE_ID) REFERENCES STATUS (ID),
  FOREIGN KEY (TASK_TYPE_ID) REFERENCES TASK_TYPES (ID),
  FOREIGN KEY (STATUS_ID) REFERENCES STATUS (ID),
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE TASKS
(
  ID int(11) NOT NULL AUTO_INCREMENT,
  STATUS_ID int (11) NOT NULL,
  RESULT_ID int (11) NOT NULL,
  Log_file varchar (255),
  WORKFLOW_MANAGER_ID int (11),
  TASK_TYPE_ID int (11) NOT NULL,
  TARGET_ID int (11) NOT NULL,
  Arguments varchar (1000),
  Hidden int (11),
  PRIMARY KEY (ID),
  FOREIGN KEY (STATUS_ID) REFERENCES STATUS (ID),
  FOREIGN KEY (RESULT_ID) REFERENCES RESULTS (ID),
  FOREIGN KEY (TARGET_ID) REFERENCES TARGETS (ID),
  FOREIGN KEY (TASK_TYPE_ID) REFERENCES TASK_TYPES (ID),
  FOREIGN KEY (WORKFLOW_MANAGER_ID) REFERENCES WORKFLOW_MANAGER (ID),
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE MANAGED_FILES
(
  ID int(11) NOT NULL AUTO_INCREMENT,
  FILE_NAME varchar (255) NOT NULL,
  FILE_PATH varchar (255) NOT NULL,
  FILE_HASH varchar (255) NOT NULL,
  REBOOT_REQUIRED int (11) NOT NULL,
  STATUS_ID int (11) NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (STATUS_ID) REFERENCES STATUS (ID),
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE QUEUE_MANAGER_FILES
(
  ID int(11) NOT NULL AUTO_INCREMENT,
  QUEUE_MANAGER_ID int (11) NOT NULL,
  MANAGED_FILE_ID int (11) NOT NULL,
  QUEUE_MGR_HASH varchar (255),
  RESULT_ID int (11) NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (QUEUE_MANAGER_ID) REFERENCES QUEUE_MANAGER (ID),
  FOREIGN KEY (MANAGED_FILE_ID) REFERENCES MANAGED_FILES (ID),
  FOREIGN KEY (RESULT_ID) REFERENCES RESULTS (ID),
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE WORKFLOW_MANAGER_FILES
(
  ID int(11) NOT NULL AUTO_INCREMENT,
  WORKFLOW_MANAGER_ID int (11) NOT NULL,
  MANAGED_FILE_ID int (11) NOT NULL,
  WORKFLOW_MGR_HASH varchar (255),
  RESULT_ID int (11) NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (WORKFLOW_MANAGER_ID) REFERENCES WORKFLOW_MANAGER (ID),
  FOREIGN KEY (MANAGED_FILE_ID) REFERENCES MANAGED_FILES (ID),
  FOREIGN KEY (RESULT_ID) REFERENCES RESULTS (ID),
  date_modified TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);