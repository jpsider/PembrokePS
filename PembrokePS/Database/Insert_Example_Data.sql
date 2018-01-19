use PembrokePS;

INSERT INTO STATUS (ID, Status_Name, HtmlColor, HTML_Description) 
VALUES 
(1,'Down','#CC0000','Red'),
(2,'Up','#006633','Green'),
(3,'Starting Up','#FFFF00','Yellow'),
(4,'Shutting Down','#FF6600','Orange'),
(5,'Submitted','#666666','Grey'),
(6,'Queued','#FFFFFF','White'),
(7,'Assigned','#6699FF','SkyBlue'),
(8,'Running','#0066FF','Blue'),
(9,'Complete','#00CC66','LightGreen'),
(10,'Cancelled','#333333','Charcoal'),
(11,'Enabled','#006633','Green'),
(12,'Disabled','#CC0000','Red'),
(13,'Available','#CC0000','Red');

INSERT INTO RESULTS (ID, Result_Name, HtmlColor, HTML_Description) 
VALUES 
(1,'PASS','#006633','Green'),
(2,'FAIL','#CC0000','Red'),
(3,'CRITICAL','#FFFF00','Yellow'),
(4,'AGENT_ERROR','#9933FF','Purple'),
(5,'ABORTED','#FF6600','Orange'),
(6,'UNKNOWN','#666666','Grey'),
(7,'INSYNC','#006633','Green');

INSERT INTO PROPERTIES (ID,Prop_Name,Prop_Value,STATUS_ID) 
VALUES
(1,'FakePropertyEnabled','FakeValue',11),
(2,'FakePropertyDisabled','FakeValue',12);

INSERT INTO ENDPOINT_PORTS (ID,PORT,ENDPOINT_ASSIGNED_STATUS,ENDPOINT_STATUS) 
VALUES
(1,8001,7,8),
(2,8002,7,8),
(3,8003,7,8),
(4,8004,7,8),
(5,8005,7,8),
(6,8006,7,8),
(7,8007,7,8),
(8,8008,7,8),
(9,8009,13,1),
(10,8010,13,1);

INSERT INTO QUEUE_MANAGER_TYPE (ID,Name,TableName) 
VALUES
(1,'Primary','Tasks'),
(2,'Admin','Tasks');

INSERT INTO QUEUE_MANAGER (ID,QUEUE_MANAGER_TYPE_ID,QMAN_PORT_ID,KICKER_PORT_ID,STATUS_ID,KICKER_STATUS_ID,Wait,Kicker_Wait,Log_File,QMan_Description)
VALUES
(1,1,1,2,1,1,300,300,'NoLog','Primary Task Queue Manager'),
(2,2,3,4,1,1,300,300,'NoLog','Admin Task Queue Manager');

INSERT INTO WORKFLOW_MANAGER_TYPE (ID,Name,TableName) 
VALUES
(1,'Primary','Tasks'),
(2,'Admin','Tasks');

INSERT INTO WORKFLOW_MANAGER (ID,WORKFLOW_MANAGER_TYPE_ID,WKFLW_PORT_ID,KICKER_PORT_ID,STATUS_ID,KICKER_STATUS_ID,Wait,Max_Concurrent_Tasks,Log_File,WMan_Description)
VALUES
(1,1,5,6,1,1,300,4,'NoLog','Primary WorkFlow Manager'),
(2,1,7,8,1,1,300,4,'NoLog','Admin WorkFlow Manager');

INSERT INTO PASSWORDS (ID,Username,Password)
VALUES
(1,'administrator','abcd1234');

INSERT INTO Target_Types (ID,Name,Status_ID)
VALUES 
(1,'System',11),
(2,'vcenter',11),
(3,'DataCenter',11),
(4,'Cluster',11),
(5,'VM',11),
(6,'vds',11),
(7,'Host',11),
(8,'DSCluster',11),
(9,'Network',11);

INSERT INTO SYSTEMS (ID,SYSTEM_Name,STATUS_ID)
VALUES 
(1,'HomeLab',11),
(2,'MultiLab',11),
(3,'Alpha',11),
(4,'SingleLab',11),
(5,'Production',11),
(6,'Beta',11);

INSERT INTO TARGETS (ID,Target_Name,Target_Type_ID,IP_Address,STATUS_ID,Password_ID,System_ID,Target_Description)
VALUES 
(1,'ProductionSystem',1,'127.0.0.1',11,1,1,'Production System');

INSERT INTO TASK_TYPES (ID,Task_Name,Task_Path,STATUS_ID,MAX_Retries,PRIORITY)
VALUES
(1,'SampleTask','SampleTask.ps1',11,0,1),
(2,'SampleDisabledTask','SampleDisabledTask.ps1',12,1,2);

INSERT INTO SUBTASK_GENERATOR (ID,TASK_TYPE_ID,Pass_SubTask_ID,Fail_SubTask_ID,Status_ID)
VALUES
(1,1,1,2,11),
(2,2,1,2,11);

INSERT INTO QMAN_TASK_TYPES (ID,QUEUE_MANAGER_TYPE_ID,TASK_TYPE_ID,STATUS_ID)
VALUES
(1,1,1,11),
(2,1,2,12),
(3,2,1,12),
(4,2,2,11);

INSERT INTO WMAN_TASK_TYPES (ID,WORKFLOW_MANAGER_TYPE_ID,TASK_TYPE_ID,STATUS_ID)
VALUES
(1,1,1,11),
(2,1,2,12),
(3,2,1,12),
(4,2,2,11);

INSERT INTO Tasks (ID,STATUS_ID,RESULT_ID,Log_File,WORKFLOW_MANAGER_ID,TASK_TYPE_ID,TARGET_ID,Arguments,Hidden)
VALUES
(1,9,1,'nolog',1,1,1,'SomeArg',0),
(2,9,4,'nolog',2,2,1,'SomeArg',0);

INSERT INTO MANAGED_FILES (ID,FILE_NAME,FILE_PATH,FILE_HASH,REBOOT_REQUIRED,STATUS_ID)
VALUES
(1,'testfile.ps1','c:\\pembrokeps\\scripts\\','someHash',0,11),
(2,'testfile.ps1','c:\\pembrokeps\\scripts\\','badhash',1,12);

INSERT INTO QUEUE_MANAGER_FILES (ID,QUEUE_MANAGER_ID,MANAGED_FILE_ID,QUEUE_MGR_HASH,RESULT_ID)
VALUES
(1,1,1,'somehash',6),
(2,1,2,'somehash',2),
(3,2,1,'somehash',2),
(4,2,2,'badhash',6);

INSERT INTO WORKFLOW_MANAGER_FILES (ID,WORKFLOW_MANAGER_ID,MANAGED_FILE_ID,WORKFLOW_MGR_HASH,RESULT_ID)
VALUES
(1,1,1,'somehash',6),
(2,1,2,'somehash',2),
(3,2,1,'somehash',2),
(4,2,2,'badhash',6);