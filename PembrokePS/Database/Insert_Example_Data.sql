use PembrokePS;

INSERT INTO STATUS (ID,STATUS_NAME,HTMLCOLOR,HTML_Description) 
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
(13,'Available','#006633','Green'),
(14,'Staged','#99CCFF','Light Blue');

INSERT INTO RESULTS (ID,RESULT_NAME,HTMLCOLOR,HTML_Description) 
VALUES 
(1,'PASS','#006633','Green'),
(2,'FAIL','#CC0000','Red'),
(3,'CRITICAL','#FFFF00','Yellow'),
(4,'SYSTEM_ERROR','#9933FF','Purple'),
(5,'ABORTED','#FF6600','Orange'),
(6,'UNKNOWN','#666666','Grey'),
(7,'INSYNC','#006633','Green');

INSERT INTO PROPERTIES (ID,PROP_NAME,PROP_VALUE,STATUS_ID) 
VALUES
(1,'FakePropertyEnabled','FakeValue',11),
(2,'FakePropertyDisabled','FakeValue',12),
(3,'WelcomeMessage','You can disable this message.',11),
(4,'system.Root','c:\\PembrokePS',11),
(5,'system.LogDirectory','c:\\PembrokePS\\Logs\\Tasks',11),
(6,'system.RequiredModules','PembrokePSrest,PembrokePSutilities,PowerLumber,RestPS',11),
(7,'system.RunLogLevel','DEBUG',11);

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

INSERT INTO QUEUE_MANAGER_TYPE (ID,NAME,TABLENAME) 
VALUES
(1,'Primary','TASKS'),
(2,'Admin','TASKS');

INSERT INTO QUEUE_MANAGER (ID,QUEUE_MANAGER_TYPE_ID,QMAN_PORT_ID,KICKER_PORT_ID,STATUS_ID,REGISTRATION_STATUS_ID,KICKER_STATUS_ID,HOSTNAME,IP_ADDRESS,WAIT,KICKER_WAIT,LOG_FILE,QMan_Description)
VALUES
(1,1,1,2,1,7,1,'localhost','127.0.0.1',30,30,'c:\\PembrokePS\\Logs\\qman\\qman_1.log','Primary TASK Queue Manager'),
(2,2,3,4,1,7,1,'localhost','127.0.0.1',30,30,'c:\\PembrokePS\\Logs\\qman\\qman_1.log','Admin TASK Queue Manager');

INSERT INTO WORKFLOW_MANAGER_TYPE (ID,NAME,TABLENAME) 
VALUES
(1,'Primary','TASKS'),
(2,'Admin','TASKS');

INSERT INTO WORKFLOW_MANAGER (ID,WORKFLOW_MANAGER_TYPE_ID,WKFLW_PORT_ID,KICKER_PORT_ID,STATUS_ID,REGISTRATION_STATUS_ID,KICKER_STATUS_ID,HOSTNAME,IP_ADDRESS,WAIT,KICKER_WAIT,MAX_CONCURRENT_TASKS,LOG_FILE,WMan_Description)
VALUES
(1,1,5,6,1,7,1,'localhost','127.0.0.1',30,30,4,'c:\\PembrokePS\\Logs\\wman\\wman_1.log','Primary WorkFlow Manager'),
(2,2,7,8,1,7,1,'localhost','127.0.0.1',30,30,4,'c:\\PembrokePS\\Logs\\wman\\wman_2.log','Admin WorkFlow Manager'),
(9999,2,7,8,1,7,1,'localhost','127.0.0.1',300,300,9999,'NoLog','UnAssigned');

INSERT INTO PASSWORDS (ID,USERNAME,PASSWORD)
VALUES
(1,'administrator','abcd1234');

INSERT INTO TARGET_TYPES (ID,NAME,STATUS_ID)
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

INSERT INTO PARENT_TARGET_TYPES (ID,PARENT_TARGET_TYPE_ID,CHILD_TARGET_TYPE_ID,STATUS_ID)
VALUES
(1,2,3,11),
(2,2,4,11),
(3,2,6,11),
(4,2,7,11),
(5,2,8,11),
(6,1,2,11);

INSERT INTO SYSTEMS (ID,SYSTEM_NAME,STATUS_ID)
VALUES 
(1,'HomeLab',11),
(2,'MultiLab',11),
(3,'Alpha',11),
(4,'SingleLab',11),
(5,'Production',11),
(6,'Beta',11);

INSERT INTO TARGETS (ID,TARGET_NAME,TARGET_TYPE_ID,IP_ADDRESS,STATUS_ID,PASSWORD_ID,SYSTEM_ID,Target_Description)
VALUES 
(1,'ProductionSystem',1,'127.0.0.1',11,1,1,'Production System');

INSERT INTO TASK_TYPES (ID,TASK_NAME,TASK_PATH,STATUS_ID,PRIORITY)
VALUES
(1,'SamplePassTask','SamplePassTask.ps1',11,1),
(2,'SampleFailTask','SampleFailTask.ps1',11,2),
(3,'SampleCriticalTask','SampleCriticalTask.ps1',11,3),
(4,'SampleMissingTask','SampleMissingTask.ps1',12,4);

INSERT INTO SUBTASK_GENERATOR (ID,TASK_TYPE_ID,PASS_SUBTASK_ID,FAIL_SUBTASK_ID,STATUS_ID)
VALUES
(1,1,2,2,11),
(2,2,3,3,11),
(3,3,4,4,11);

INSERT INTO QMAN_TASK_TYPES (ID,QUEUE_MANAGER_TYPE_ID,TASK_TYPE_ID,STATUS_ID)
VALUES
(1,1,1,11),
(2,1,2,12),
(3,2,1,12),
(4,2,2,11),
(5,1,3,11),
(6,1,4,12);

INSERT INTO WMAN_TASK_TYPES (ID,WORKFLOW_MANAGER_TYPE_ID,TASK_TYPE_ID,STATUS_ID)
VALUES
(1,1,1,11),
(2,1,2,12),
(3,2,1,12),
(4,2,2,11),
(5,1,3,11),
(6,1,4,12);

INSERT INTO TARGET_TASKS_TYPES (ID,TARGET_TYPE_ID,TASK_TYPE_ID,STATUS_ID,MAX_Retries)
VALUES
(1,1,1,11,3),
(2,1,2,11,3),
(3,2,1,12,3),
(4,1,3,11,3),
(5,1,4,11,3);

INSERT INTO TASKS (ID,STATUS_ID,RESULT_ID,LOG_FILE,WORKFLOW_MANAGER_ID,TASK_TYPE_ID,TARGET_ID,ARGUMENTS,HIDDEN)
VALUES
(1,9,1,'nolog',1,1,1,'SomeArg',0),
(2,9,4,'nolog',2,2,1,'SomeArg',0),
(3,9,4,'nolog',2,2,1,'SomeArg',0);

INSERT INTO PARENT_TASKS (ID,PARENT_TASK_ID,CHILD_TASK_ID,isRetry)
VALUES
(1,1,2,0),
(2,2,3,1);

INSERT INTO MANAGED_FILES (ID,FILE_NAME,FILE_PATH,FILE_HASH,REBOOT_REQUIRED,STATUS_ID)
VALUES
(1,'testfile.ps1','c:\\pembrokeps\\scripts\\','someHash',0,11),
(2,'testfile.ps1','c:\\pembrokeps\\scripts\\','badhash',1,12),
(3,'QMtestfile.ps1','c:\\pembrokeps\\scripts\\','badhash',1,12),
(4,'WMtestfile.ps1','c:\\pembrokeps\\scripts\\','badhash',1,12);

INSERT INTO MANAGED_FILE_QM_GROUPS (ID,MANAGED_FILE_ID,QUEUE_MANAGER_TYPE_ID,STATUS_ID)
VALUES
(1,1,1,11),
(2,2,2,12),
(3,2,1,12),
(4,3,2,11);

INSERT INTO MANAGED_FILE_WM_GROUPS (ID,MANAGED_FILE_ID,WORKFLOW_MANAGER_TYPE_ID,STATUS_ID)
VALUES
(1,1,1,11),
(2,2,2,12),
(3,1,1,12),
(4,4,2,11);

INSERT INTO QUEUE_MANAGER_FILES (ID,QUEUE_MANAGER_ID,MANAGED_FILE_ID,QUEUE_MGR_HASH,RESULT_ID)
VALUES
(1,1,1,'somehash',6),
(2,1,2,'somehash',2),
(3,2,1,'somehash',2),
(4,2,3,'badhash',6);

INSERT INTO WORKFLOW_MANAGER_FILES (ID,WORKFLOW_MANAGER_ID,MANAGED_FILE_ID,WORKFLOW_MGR_HASH,RESULT_ID)
VALUES
(1,1,1,'somehash',6),
(2,1,2,'somehash',2),
(3,2,1,'somehash',2),
(4,2,4,'badhash',6);

INSERT INTO ADDITIONAL_PS_MODULES (ID,NAME,GALLERY_NAME,MODULE_VERSION,STATUS_ID)
VALUES
(1,'PowerCLI','vmware.powercli','Latest',11),
(2,'PowerCLIcore','vmware.powercliCore','Latest',12);

INSERT INTO ADDL_MODULES_WMAN_GROUPS (ID,ADDL_MODULE_ID,WORKFLOW_MANAGER_TYPE_ID,STATUS_ID)
VALUES
(1,1,1,11),
(2,2,1,12),
(3,1,2,11),
(4,2,2,12);

INSERT INTO WORKFLOW_MANAGER_MODULES (ID,WORKFLOW_MANAGER_ID,ADDL_MODULE_ID,RESULT_ID)
VALUES
(1,1,1,1),
(2,1,2,2),
(3,2,1,1),
(4,2,2,2);