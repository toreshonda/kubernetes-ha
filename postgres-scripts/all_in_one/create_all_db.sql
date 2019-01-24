CREATE DATABASE WSO2UM_DB;
CREATE DATABASE WSO2AM_DB;
CREATE DATABASE WSO2REG_DB;
CREATE DATABASE WSO2AM_STATS_DB;
CREATE DATABASE WSO2MB_STORE_DB;
CREATE DATABASE WSO2AM_METRICS_DB;
CREATE DATABASE WSO2AM_CARBON_DB;
CREATE DATABASE WSO2BPS_IS_KM_DB;
CREATE DATABASE WSO2_METRIKS_IS_KM_DB;
CREATE DATABASE activiti;
CREATE DATABASE nseec;
CREATE DATABASE logs;
CREATE DATABASE dead_message;
CREATE DATABASE sessions;


--  CREATE TABLES FOR ACTIVITI
\c activiti;

\echo 'CREATE TABLES FOR ACTIVITI';

create table ACT_GE_PROPERTY (
    NAME_ varchar(64),
    VALUE_ varchar(300),
    REV_ integer,
    primary key (NAME_)
);

insert into ACT_GE_PROPERTY
values ('schema.version', '5.21.0.0', 1);

insert into ACT_GE_PROPERTY
values ('schema.history', 'create(5.21.0.0)', 1);

insert into ACT_GE_PROPERTY
values ('next.dbid', '1', 1);

create table ACT_GE_BYTEARRAY (
    ID_ varchar(64),
    REV_ integer,
    NAME_ varchar(255),
    DEPLOYMENT_ID_ varchar(64),
    BYTES_ bytea,
    GENERATED_ boolean,
    primary key (ID_)
);

create table ACT_RE_DEPLOYMENT (
    ID_ varchar(64),
    NAME_ varchar(255),
    CATEGORY_ varchar(255),
    TENANT_ID_ varchar(255) default '',
    DEPLOY_TIME_ timestamp,
    primary key (ID_)
);

create table ACT_RE_MODEL (
    ID_ varchar(64) not null,
    REV_ integer,
    NAME_ varchar(255),
    KEY_ varchar(255),
    CATEGORY_ varchar(255),
    CREATE_TIME_ timestamp,
    LAST_UPDATE_TIME_ timestamp,
    VERSION_ integer,
    META_INFO_ varchar(4000),
    DEPLOYMENT_ID_ varchar(64),
    EDITOR_SOURCE_VALUE_ID_ varchar(64),
    EDITOR_SOURCE_EXTRA_VALUE_ID_ varchar(64),
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
);

create table ACT_RU_EXECUTION (
    ID_ varchar(64),
    REV_ integer,
    PROC_INST_ID_ varchar(64),
    BUSINESS_KEY_ varchar(255),
    PARENT_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    SUPER_EXEC_ varchar(64),
    ACT_ID_ varchar(255),
    IS_ACTIVE_ boolean,
    IS_CONCURRENT_ boolean,
    IS_SCOPE_ boolean,
    IS_EVENT_SCOPE_ boolean,
    SUSPENSION_STATE_ integer,
    CACHED_ENT_STATE_ integer,
    TENANT_ID_ varchar(255) default '',
    NAME_ varchar(255),
    LOCK_TIME_ timestamp,
    primary key (ID_)
);

create table ACT_RU_JOB (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    TYPE_ varchar(255) NOT NULL,
    LOCK_EXP_TIME_ timestamp,
    LOCK_OWNER_ varchar(255),
    EXCLUSIVE_ boolean,
    EXECUTION_ID_ varchar(64),
    PROCESS_INSTANCE_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    RETRIES_ integer,
    EXCEPTION_STACK_ID_ varchar(64),
    EXCEPTION_MSG_ varchar(4000),
    DUEDATE_ timestamp,
    REPEAT_ varchar(255),
    HANDLER_TYPE_ varchar(255),
    HANDLER_CFG_ varchar(4000),
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
);

create table ACT_RE_PROCDEF (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    CATEGORY_ varchar(255),
    NAME_ varchar(255),
    KEY_ varchar(255) NOT NULL,
    VERSION_ integer NOT NULL,
    DEPLOYMENT_ID_ varchar(64),
    RESOURCE_NAME_ varchar(4000),
    DGRM_RESOURCE_NAME_ varchar(4000),
    DESCRIPTION_ varchar(4000),
    HAS_START_FORM_KEY_ boolean,
    HAS_GRAPHICAL_NOTATION_ boolean,
    SUSPENSION_STATE_ integer,
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
);

create table ACT_RU_TASK (
    ID_ varchar(64),
    REV_ integer,
    EXECUTION_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    NAME_ varchar(255),
    PARENT_TASK_ID_ varchar(64),
    DESCRIPTION_ varchar(4000),
    TASK_DEF_KEY_ varchar(255),
    OWNER_ varchar(255),
    ASSIGNEE_ varchar(255),
    DELEGATION_ varchar(64),
    PRIORITY_ integer,
    CREATE_TIME_ timestamp,
    DUE_DATE_ timestamp,
    CATEGORY_ varchar(255),
    SUSPENSION_STATE_ integer,
    TENANT_ID_ varchar(255) default '',
    FORM_KEY_ varchar(255),
    primary key (ID_)
);

create table ACT_RU_IDENTITYLINK (
    ID_ varchar(64),
    REV_ integer,
    GROUP_ID_ varchar(255),
    TYPE_ varchar(255),
    USER_ID_ varchar(255),
    TASK_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    PROC_DEF_ID_ varchar (64),
    primary key (ID_)
);

create table ACT_RU_VARIABLE (
    ID_ varchar(64) not null,
    REV_ integer,
    TYPE_ varchar(255) not null,
    NAME_ varchar(255) not null,
    EXECUTION_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    TASK_ID_ varchar(64),
    BYTEARRAY_ID_ varchar(64),
    DOUBLE_ double precision,
    LONG_ bigint,
    TEXT_ varchar(4000),
    TEXT2_ varchar(4000),
    primary key (ID_)
);

create table ACT_RU_EVENT_SUBSCR (
    ID_ varchar(64) not null,
    REV_ integer,
    EVENT_TYPE_ varchar(255) not null,
    EVENT_NAME_ varchar(255),
    EXECUTION_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    ACTIVITY_ID_ varchar(64),
    CONFIGURATION_ varchar(255),
    CREATED_ timestamp not null,
    PROC_DEF_ID_ varchar(64),
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
);

create table ACT_EVT_LOG (
    LOG_NR_ SERIAL PRIMARY KEY,
    TYPE_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    TASK_ID_ varchar(64),
    TIME_STAMP_ timestamp not null,
    USER_ID_ varchar(255),
    DATA_ bytea,
    LOCK_OWNER_ varchar(255),
    LOCK_TIME_ timestamp null,
    IS_PROCESSED_ smallint default 0
);

create table ACT_PROCDEF_INFO (
	ID_ varchar(64) not null,
    PROC_DEF_ID_ varchar(64) not null,
    REV_ integer,
    INFO_JSON_ID_ varchar(64),
    primary key (ID_)
);

create index ACT_IDX_EXEC_BUSKEY on ACT_RU_EXECUTION(BUSINESS_KEY_);
create index ACT_IDX_TASK_CREATE on ACT_RU_TASK(CREATE_TIME_);
create index ACT_IDX_IDENT_LNK_USER on ACT_RU_IDENTITYLINK(USER_ID_);
create index ACT_IDX_IDENT_LNK_GROUP on ACT_RU_IDENTITYLINK(GROUP_ID_);
create index ACT_IDX_EVENT_SUBSCR_CONFIG_ on ACT_RU_EVENT_SUBSCR(CONFIGURATION_);
create index ACT_IDX_VARIABLE_TASK_ID on ACT_RU_VARIABLE(TASK_ID_);

create index ACT_IDX_BYTEAR_DEPL on ACT_GE_BYTEARRAY(DEPLOYMENT_ID_);
alter table ACT_GE_BYTEARRAY
    add constraint ACT_FK_BYTEARR_DEPL
    foreign key (DEPLOYMENT_ID_) 
    references ACT_RE_DEPLOYMENT (ID_);

alter table ACT_RE_PROCDEF
    add constraint ACT_UNIQ_PROCDEF
    unique (KEY_,VERSION_, TENANT_ID_);
    
create index ACT_IDX_EXE_PROCINST on ACT_RU_EXECUTION(PROC_INST_ID_);
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PROCINST 
    foreign key (PROC_INST_ID_) 
    references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_EXE_PARENT on ACT_RU_EXECUTION(PARENT_ID_);
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PARENT
    foreign key (PARENT_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
create index ACT_IDX_EXE_SUPER on ACT_RU_EXECUTION(SUPER_EXEC_);
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_SUPER
    foreign key (SUPER_EXEC_) 
    references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_EXE_PROCDEF on ACT_RU_EXECUTION(PROC_DEF_ID_); 
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PROCDEF 
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);    

create index ACT_IDX_TSKASS_TASK on ACT_RU_IDENTITYLINK(TASK_ID_);
alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_TSKASS_TASK
    foreign key (TASK_ID_) 
    references ACT_RU_TASK (ID_);
    
create index ACT_IDX_ATHRZ_PROCEDEF on ACT_RU_IDENTITYLINK(PROC_DEF_ID_);
alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_ATHRZ_PROCEDEF
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);
    
create index ACT_IDX_IDL_PROCINST on ACT_RU_IDENTITYLINK(PROC_INST_ID_);
alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_IDL_PROCINST
    foreign key (PROC_INST_ID_) 
    references ACT_RU_EXECUTION (ID_);    
    
create index ACT_IDX_TASK_EXEC on ACT_RU_TASK(EXECUTION_ID_);
alter table ACT_RU_TASK
    add constraint ACT_FK_TASK_EXE
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION (ID_);
    
create index ACT_IDX_TASK_PROCINST on ACT_RU_TASK(PROC_INST_ID_);
alter table ACT_RU_TASK
    add constraint ACT_FK_TASK_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION (ID_);
    
create index ACT_IDX_TASK_PROCDEF on ACT_RU_TASK(PROC_DEF_ID_);
alter table ACT_RU_TASK
  	add constraint ACT_FK_TASK_PROCDEF
  	foreign key (PROC_DEF_ID_)
  	references ACT_RE_PROCDEF (ID_);
  
create index ACT_IDX_VAR_EXE on ACT_RU_VARIABLE(EXECUTION_ID_);
alter table ACT_RU_VARIABLE 
    add constraint ACT_FK_VAR_EXE
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_VAR_PROCINST on ACT_RU_VARIABLE(PROC_INST_ID_);
alter table ACT_RU_VARIABLE
    add constraint ACT_FK_VAR_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION(ID_);

create index ACT_IDX_VAR_BYTEARRAY on ACT_RU_VARIABLE(BYTEARRAY_ID_);
alter table ACT_RU_VARIABLE 
    add constraint ACT_FK_VAR_BYTEARRAY 
    foreign key (BYTEARRAY_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

create index ACT_IDX_JOB_EXCEPTION on ACT_RU_JOB(EXCEPTION_STACK_ID_);
alter table ACT_RU_JOB 
    add constraint ACT_FK_JOB_EXCEPTION
    foreign key (EXCEPTION_STACK_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

create index ACT_IDX_EVENT_SUBSCR on ACT_RU_EVENT_SUBSCR(EXECUTION_ID_);
alter table ACT_RU_EVENT_SUBSCR
    add constraint ACT_FK_EVENT_EXEC
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION(ID_);

create index ACT_IDX_MODEL_SOURCE on ACT_RE_MODEL(EDITOR_SOURCE_VALUE_ID_);
alter table ACT_RE_MODEL 
    add constraint ACT_FK_MODEL_SOURCE 
    foreign key (EDITOR_SOURCE_VALUE_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

create index ACT_IDX_MODEL_SOURCE_EXTRA on ACT_RE_MODEL(EDITOR_SOURCE_EXTRA_VALUE_ID_);
alter table ACT_RE_MODEL 
    add constraint ACT_FK_MODEL_SOURCE_EXTRA 
    foreign key (EDITOR_SOURCE_EXTRA_VALUE_ID_) 
    references ACT_GE_BYTEARRAY (ID_);
    
create index ACT_IDX_MODEL_DEPLOYMENT on ACT_RE_MODEL(DEPLOYMENT_ID_);    
alter table ACT_RE_MODEL 
    add constraint ACT_FK_MODEL_DEPLOYMENT 
    foreign key (DEPLOYMENT_ID_) 
    references ACT_RE_DEPLOYMENT (ID_);        

create index ACT_IDX_PROCDEF_INFO_JSON on ACT_PROCDEF_INFO(INFO_JSON_ID_);
alter table ACT_PROCDEF_INFO 
    add constraint ACT_FK_INFO_JSON_BA 
    foreign key (INFO_JSON_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

create index ACT_IDX_PROCDEF_INFO_PROC on ACT_PROCDEF_INFO(PROC_DEF_ID_);
alter table ACT_PROCDEF_INFO 
    add constraint ACT_FK_INFO_PROCDEF 
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);
    
alter table ACT_PROCDEF_INFO
    add constraint ACT_UNIQ_INFO_PROCDEF
    unique (PROC_DEF_ID_);
    
create table ACT_HI_PROCINST (
    ID_ varchar(64) not null,
    PROC_INST_ID_ varchar(64) not null,
    BUSINESS_KEY_ varchar(255),
    PROC_DEF_ID_ varchar(64) not null,
    START_TIME_ timestamp not null,
    END_TIME_ timestamp,
    DURATION_ bigint,
    START_USER_ID_ varchar(255),
    START_ACT_ID_ varchar(255),
    END_ACT_ID_ varchar(255),
    SUPER_PROCESS_INSTANCE_ID_ varchar(64),
    DELETE_REASON_ varchar(4000),
    TENANT_ID_ varchar(255) default '',
    NAME_ varchar(255),
    primary key (ID_),
    unique (PROC_INST_ID_)
);

create table ACT_HI_ACTINST (
    ID_ varchar(64) not null,
    PROC_DEF_ID_ varchar(64) not null,
    PROC_INST_ID_ varchar(64) not null,
    EXECUTION_ID_ varchar(64) not null,
    ACT_ID_ varchar(255) not null,
    TASK_ID_ varchar(64),
    CALL_PROC_INST_ID_ varchar(64),
    ACT_NAME_ varchar(255),
    ACT_TYPE_ varchar(255) not null,
    ASSIGNEE_ varchar(255),
    START_TIME_ timestamp not null,
    END_TIME_ timestamp,
    DURATION_ bigint,
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
);

create table ACT_HI_TASKINST (
    ID_ varchar(64) not null,
    PROC_DEF_ID_ varchar(64),
    TASK_DEF_KEY_ varchar(255),
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    NAME_ varchar(255),
    PARENT_TASK_ID_ varchar(64),
    DESCRIPTION_ varchar(4000),
    OWNER_ varchar(255),
    ASSIGNEE_ varchar(255),
    START_TIME_ timestamp not null,
    CLAIM_TIME_ timestamp,
    END_TIME_ timestamp,
    DURATION_ bigint,
    DELETE_REASON_ varchar(4000),
    PRIORITY_ integer,
    DUE_DATE_ timestamp,
    FORM_KEY_ varchar(255),
    CATEGORY_ varchar(255),
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
);

create table ACT_HI_VARINST (
    ID_ varchar(64) not null,
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    TASK_ID_ varchar(64),
    NAME_ varchar(255) not null,
    VAR_TYPE_ varchar(100),
    REV_ integer,
    BYTEARRAY_ID_ varchar(64),
    DOUBLE_ double precision,
    LONG_ bigint,
    TEXT_ varchar(4000),
    TEXT2_ varchar(4000),
    CREATE_TIME_ timestamp,
    LAST_UPDATED_TIME_ timestamp,
    primary key (ID_)
);

create table ACT_HI_DETAIL (
    ID_ varchar(64) not null,
    TYPE_ varchar(255) not null,
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    TASK_ID_ varchar(64),
    ACT_INST_ID_ varchar(64),
    NAME_ varchar(255) not null,
    VAR_TYPE_ varchar(64),
    REV_ integer,
    TIME_ timestamp not null,
    BYTEARRAY_ID_ varchar(64),
    DOUBLE_ double precision,
    LONG_ bigint,
    TEXT_ varchar(4000),
    TEXT2_ varchar(4000),
    primary key (ID_)
);

create table ACT_HI_COMMENT (
    ID_ varchar(64) not null,
    TYPE_ varchar(255),
    TIME_ timestamp not null,
    USER_ID_ varchar(255),
    TASK_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    ACTION_ varchar(255),
    MESSAGE_ varchar(4000),
    FULL_MSG_ bytea,
    primary key (ID_)
);

create table ACT_HI_ATTACHMENT (
    ID_ varchar(64) not null,
    REV_ integer,
    USER_ID_ varchar(255),
    NAME_ varchar(255),
    DESCRIPTION_ varchar(4000),
    TYPE_ varchar(255),
    TASK_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    URL_ varchar(4000),
    CONTENT_ID_ varchar(64),
    TIME_ timestamp,
    primary key (ID_)
);

create table ACT_HI_IDENTITYLINK (
    ID_ varchar(64),
    GROUP_ID_ varchar(255),
    TYPE_ varchar(255),
    USER_ID_ varchar(255),
    TASK_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    primary key (ID_)
);


create index ACT_IDX_HI_PRO_INST_END on ACT_HI_PROCINST(END_TIME_);
create index ACT_IDX_HI_PRO_I_BUSKEY on ACT_HI_PROCINST(BUSINESS_KEY_);
create index ACT_IDX_HI_ACT_INST_START on ACT_HI_ACTINST(START_TIME_);
create index ACT_IDX_HI_ACT_INST_END on ACT_HI_ACTINST(END_TIME_);
create index ACT_IDX_HI_DETAIL_PROC_INST on ACT_HI_DETAIL(PROC_INST_ID_);
create index ACT_IDX_HI_DETAIL_ACT_INST on ACT_HI_DETAIL(ACT_INST_ID_);
create index ACT_IDX_HI_DETAIL_TIME on ACT_HI_DETAIL(TIME_);
create index ACT_IDX_HI_DETAIL_NAME on ACT_HI_DETAIL(NAME_);
create index ACT_IDX_HI_DETAIL_TASK_ID on ACT_HI_DETAIL(TASK_ID_);
create index ACT_IDX_HI_PROCVAR_PROC_INST on ACT_HI_VARINST(PROC_INST_ID_);
create index ACT_IDX_HI_PROCVAR_NAME_TYPE on ACT_HI_VARINST(NAME_, VAR_TYPE_);
create index ACT_IDX_HI_PROCVAR_TASK_ID on ACT_HI_VARINST(TASK_ID_);
create index ACT_IDX_HI_ACT_INST_PROCINST on ACT_HI_ACTINST(PROC_INST_ID_, ACT_ID_);
create index ACT_IDX_HI_ACT_INST_EXEC on ACT_HI_ACTINST(EXECUTION_ID_, ACT_ID_);
create index ACT_IDX_HI_IDENT_LNK_USER on ACT_HI_IDENTITYLINK(USER_ID_);
create index ACT_IDX_HI_IDENT_LNK_TASK on ACT_HI_IDENTITYLINK(TASK_ID_);
create index ACT_IDX_HI_IDENT_LNK_PROCINST on ACT_HI_IDENTITYLINK(PROC_INST_ID_);
create index ACT_IDX_HI_TASK_INST_PROCINST on ACT_HI_TASKINST(PROC_INST_ID_);

create table ACT_ID_GROUP (
    ID_ varchar(64),
    REV_ integer,
    NAME_ varchar(255),
    TYPE_ varchar(255),
    primary key (ID_)
);

create table ACT_ID_MEMBERSHIP (
    USER_ID_ varchar(64),
    GROUP_ID_ varchar(64),
    primary key (USER_ID_, GROUP_ID_)
);

create table ACT_ID_USER (
    ID_ varchar(64),
    REV_ integer,
    FIRST_ varchar(255),
    LAST_ varchar(255),
    EMAIL_ varchar(255),
    PWD_ varchar(255),
    PICTURE_ID_ varchar(64),
    primary key (ID_)
);

create table ACT_ID_INFO (
    ID_ varchar(64),
    REV_ integer,
    USER_ID_ varchar(64),
    TYPE_ varchar(64),
    KEY_ varchar(255),
    VALUE_ varchar(255),
    PASSWORD_ bytea,
    PARENT_ID_ varchar(255),
    primary key (ID_)
);

create index ACT_IDX_MEMB_GROUP on ACT_ID_MEMBERSHIP(GROUP_ID_);
alter table ACT_ID_MEMBERSHIP 
    add constraint ACT_FK_MEMB_GROUP
    foreign key (GROUP_ID_) 
    references ACT_ID_GROUP (ID_);

create index ACT_IDX_MEMB_USER on ACT_ID_MEMBERSHIP(USER_ID_);
alter table ACT_ID_MEMBERSHIP 
    add constraint ACT_FK_MEMB_USER
    foreign key (USER_ID_) 
    references ACT_ID_USER (ID_);

    INSERT INTO public.act_id_user
(id_, rev_, first_, last_, email_, pwd_, picture_id_)
VALUES('nseec', 2, 'nseec', 'nseec', 'nseec@iba.by', 'nseec', NULL);
    
	INSERT INTO public.act_id_group
	(id_, rev_, name_, type_)
	VALUES('management', 1, 'Management', 'assignment');
	INSERT INTO public.act_id_group
	(id_, rev_, name_, type_)
	VALUES('sales', 1, 'Sales', 'assignment');
	INSERT INTO public.act_id_group
	(id_, rev_, name_, type_)
	VALUES('marketing', 1, 'Marketing', 'assignment');
	INSERT INTO public.act_id_group
	(id_, rev_, name_, type_)
	VALUES('engineering', 1, 'Engineering', 'assignment');
	INSERT INTO public.act_id_group
	(id_, rev_, name_, type_)
	VALUES('user', 1, 'User', 'security-role');
	INSERT INTO public.act_id_group
	(id_, rev_, name_, type_)
	VALUES('admin', 1, 'Admin', 'security-role');
	
	INSERT INTO public.act_id_membership
	(user_id_, group_id_)
	VALUES('nseec', 'management');
	INSERT INTO public.act_id_membership
	(user_id_, group_id_)
	VALUES('nseec', 'sales');
	INSERT INTO public.act_id_membership
	(user_id_, group_id_)
	VALUES('nseec', 'marketing');
	INSERT INTO public.act_id_membership
	(user_id_, group_id_)
	VALUES('nseec', 'engineering');
	INSERT INTO public.act_id_membership
	(user_id_, group_id_)
	VALUES('nseec', 'user');
	INSERT INTO public.act_id_membership
	(user_id_, group_id_)
	VALUES('nseec', 'admin');


create table ACT_BPS_SUBSTITUTES (
    USERNAME varchar(255) not null,
    SUBSTITUTE varchar(255) not null,
    TASK_LIST varchar(1000),
    SUBSTITUTION_START timestamp not null,
    SUBSTITUTION_END timestamp null,
    ENABLED smallint default 1,
    CREATED timestamp,
    UPDATED timestamp,
    TRANSITIVE_SUBSTITUTE varchar(255) null,
    TENANT_ID integer NOT NULL,
    primary key (USERNAME, TENANT_ID)
);

--  CREATE TABLES FOR SESSIONS AWP_WEB

\c sessions;

\echo 'CREATE TABLES FOR SESSIONS AWP_WEB';

CREATE TABLE SPRING_SESSION (
	PRIMARY_ID CHAR(36) NOT NULL,
	SESSION_ID CHAR(36) NOT NULL,
	CREATION_TIME BIGINT NOT NULL,
	LAST_ACCESS_TIME BIGINT NOT NULL,
	MAX_INACTIVE_INTERVAL INT NOT NULL,
	EXPIRY_TIME BIGINT NOT NULL,
	PRINCIPAL_NAME VARCHAR(100),
	CONSTRAINT SPRING_SESSION_PK PRIMARY KEY (PRIMARY_ID)
);

CREATE UNIQUE INDEX SPRING_SESSION_IX1 ON SPRING_SESSION (SESSION_ID);
CREATE INDEX SPRING_SESSION_IX2 ON SPRING_SESSION (EXPIRY_TIME);
CREATE INDEX SPRING_SESSION_IX3 ON SPRING_SESSION (PRINCIPAL_NAME);

CREATE TABLE SPRING_SESSION_ATTRIBUTES (
	SESSION_PRIMARY_ID CHAR(36) NOT NULL,
	ATTRIBUTE_NAME VARCHAR(200) NOT NULL,
	ATTRIBUTE_BYTES BYTEA NOT NULL,
	CONSTRAINT SPRING_SESSION_ATTRIBUTES_PK PRIMARY KEY (SESSION_PRIMARY_ID, ATTRIBUTE_NAME),
	CONSTRAINT SPRING_SESSION_ATTRIBUTES_FK FOREIGN KEY (SESSION_PRIMARY_ID) REFERENCES SPRING_SESSION(PRIMARY_ID) ON DELETE CASCADE
);

--  CREATE CHEMA AND TABLES FOR NSEEC

\c nseec;
\echo 'CREATE CHEMA AND TABLES FOR NSEEC';
--

CREATE SCHEMA classifiers;


ALTER SCHEMA classifiers OWNER TO postgres;

SET search_path = classifiers, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 197 (class 1259 OID 18671)
-- Name: accreditationcertificatestatusclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE accreditationcertificatestatusclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048)
);


ALTER TABLE accreditationcertificatestatusclassifier OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 18677)
-- Name: accreditationcertificatestatusclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE accreditationcertificatestatusclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE accreditationcertificatestatusclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4677 (class 0 OID 0)
-- Dependencies: 198
-- Name: accreditationcertificatestatusclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE accreditationcertificatestatusclassifier_id_seq OWNED BY accreditationcertificatestatusclassifier.id;


--
-- TOC entry 199 (class 1259 OID 18679)
-- Name: additionalparamsforcustomsfeesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE additionalparamsforcustomsfeesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    ref character varying(20),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE additionalparamsforcustomsfeesclassifier OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 18685)
-- Name: additionalparamsforcustomsfeesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE additionalparamsforcustomsfeesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE additionalparamsforcustomsfeesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4678 (class 0 OID 0)
-- Dependencies: 200
-- Name: additionalparamsforcustomsfeesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE additionalparamsforcustomsfeesclassifier_id_seq OWNED BY additionalparamsforcustomsfeesclassifier.id;


--
-- TOC entry 201 (class 1259 OID 18687)
-- Name: addresskindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE addresskindclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE addresskindclassifier OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 18693)
-- Name: addresskindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE addresskindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE addresskindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4679 (class 0 OID 0)
-- Dependencies: 202
-- Name: addresskindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE addresskindclassifier_id_seq OWNED BY addresskindclassifier.id;


--
-- TOC entry 203 (class 1259 OID 18695)
-- Name: bankidentitykindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE bankidentitykindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE bankidentitykindclassifier OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 18701)
-- Name: bankidentitykindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE bankidentitykindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bankidentitykindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4680 (class 0 OID 0)
-- Dependencies: 204
-- Name: bankidentitykindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE bankidentitykindclassifier_id_seq OWNED BY bankidentitykindclassifier.id;


--
-- TOC entry 205 (class 1259 OID 18703)
-- Name: biologicalsexclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE biologicalsexclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE biologicalsexclassifier OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 18709)
-- Name: biologicalsexclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE biologicalsexclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE biologicalsexclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4681 (class 0 OID 0)
-- Dependencies: 206
-- Name: biologicalsexclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE biologicalsexclassifier_id_seq OWNED BY biologicalsexclassifier.id;


--
-- TOC entry 207 (class 1259 OID 18711)
-- Name: brakingsystemtypeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE brakingsystemtypeclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    vehicletechnicalcertificatetypescode character varying(512),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE brakingsystemtypeclassifier OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 18717)
-- Name: brakingsystemtypeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE brakingsystemtypeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE brakingsystemtypeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4682 (class 0 OID 0)
-- Dependencies: 208
-- Name: brakingsystemtypeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE brakingsystemtypeclassifier_id_seq OWNED BY brakingsystemtypeclassifier.id;


--
-- TOC entry 209 (class 1259 OID 18719)
-- Name: businessentitytypeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE businessentitytypeclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE businessentitytypeclassifier OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 18725)
-- Name: businessentitytypeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE businessentitytypeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE businessentitytypeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4683 (class 0 OID 0)
-- Dependencies: 210
-- Name: businessentitytypeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE businessentitytypeclassifier_id_seq OWNED BY businessentitytypeclassifier.id;


--
-- TOC entry 211 (class 1259 OID 18727)
-- Name: businessentitytypecodeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE businessentitytypecodeclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE businessentitytypecodeclassifier OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 18733)
-- Name: businessentitytypecodeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE businessentitytypecodeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE businessentitytypecodeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4684 (class 0 OID 0)
-- Dependencies: 212
-- Name: businessentitytypecodeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE businessentitytypecodeclassifier_id_seq OWNED BY businessentitytypecodeclassifier.id;


--
-- TOC entry 213 (class 1259 OID 18735)
-- Name: cargolocationclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE cargolocationclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE cargolocationclassifier OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 18741)
-- Name: cargolocationclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE cargolocationclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cargolocationclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4685 (class 0 OID 0)
-- Dependencies: 214
-- Name: cargolocationclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE cargolocationclassifier_id_seq OWNED BY cargolocationclassifier.id;


--
-- TOC entry 215 (class 1259 OID 18743)
-- Name: cargopackagekindsclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE cargopackagekindsclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    int_name character varying(255),
    contriesspecificlimits character varying(255)
);


ALTER TABLE cargopackagekindsclassifier OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 18749)
-- Name: cargopackagekindsclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE cargopackagekindsclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cargopackagekindsclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4686 (class 0 OID 0)
-- Dependencies: 216
-- Name: cargopackagekindsclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE cargopackagekindsclassifier_id_seq OWNED BY cargopackagekindsclassifier.id;


--
-- TOC entry 217 (class 1259 OID 18751)
-- Name: certificatioorganizationkindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE certificatioorganizationkindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE certificatioorganizationkindclassifier OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 18757)
-- Name: certificatioorganizationkindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE certificatioorganizationkindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE certificatioorganizationkindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4687 (class 0 OID 0)
-- Dependencies: 218
-- Name: certificatioorganizationkindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE certificatioorganizationkindclassifier_id_seq OWNED BY certificatioorganizationkindclassifier.id;


--
-- TOC entry 219 (class 1259 OID 18759)
-- Name: communicationchannelclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE communicationchannelclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE communicationchannelclassifier OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 18765)
-- Name: communicationchannelclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE communicationchannelclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE communicationchannelclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4688 (class 0 OID 0)
-- Dependencies: 220
-- Name: communicationchannelclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE communicationchannelclassifier_id_seq OWNED BY communicationchannelclassifier.id;


--
-- TOC entry 221 (class 1259 OID 18767)
-- Name: conformityassessmentdocstypesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE conformityassessmentdocstypesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    shortname character varying(512),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE conformityassessmentdocstypesclassifier OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 18773)
-- Name: conformityassessmentdocstypesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE conformityassessmentdocstypesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE conformityassessmentdocstypesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4689 (class 0 OID 0)
-- Dependencies: 222
-- Name: conformityassessmentdocstypesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE conformityassessmentdocstypesclassifier_id_seq OWNED BY conformityassessmentdocstypesclassifier.id;


--
-- TOC entry 223 (class 1259 OID 18775)
-- Name: countriesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE countriesclassifier (
    id integer NOT NULL,
    code character varying(20),
    shortname character varying(255),
    name character varying(2048),
    sequence character varying(20),
    contriesspecificlimits character varying(255),
    appliedforcountry character varying(20),
    reference character varying(1024),
    technicalinfo character varying(255),
    addinfro character varying(255)
);


ALTER TABLE countriesclassifier OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 18781)
-- Name: countriesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE countriesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countriesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4690 (class 0 OID 0)
-- Dependencies: 224
-- Name: countriesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE countriesclassifier_id_seq OWNED BY countriesclassifier.id;


--
-- TOC entry 225 (class 1259 OID 18783)
-- Name: currencyclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE currencyclassifier (
    id integer NOT NULL,
    digitalcode integer,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE currencyclassifier OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 18789)
-- Name: currencyclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE currencyclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE currencyclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4691 (class 0 OID 0)
-- Dependencies: 226
-- Name: currencyclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE currencyclassifier_id_seq OWNED BY currencyclassifier.id;


--
-- TOC entry 227 (class 1259 OID 18791)
-- Name: customcheckpointcctvplacementclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customcheckpointcctvplacementclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE customcheckpointcctvplacementclassifier OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 18797)
-- Name: customcheckpointcctvplacementclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customcheckpointcctvplacementclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customcheckpointcctvplacementclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4692 (class 0 OID 0)
-- Dependencies: 228
-- Name: customcheckpointcctvplacementclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customcheckpointcctvplacementclassifier_id_seq OWNED BY customcheckpointcctvplacementclassifier.id;


--
-- TOC entry 229 (class 1259 OID 18799)
-- Name: customcheckpointcommchannelclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customcheckpointcommchannelclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE customcheckpointcommchannelclassifier OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 18805)
-- Name: customcheckpointcommchannelclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customcheckpointcommchannelclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customcheckpointcommchannelclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4693 (class 0 OID 0)
-- Dependencies: 230
-- Name: customcheckpointcommchannelclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customcheckpointcommchannelclassifier_id_seq OWNED BY customcheckpointcommchannelclassifier.id;


--
-- TOC entry 231 (class 1259 OID 18807)
-- Name: customprocesskindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customprocesskindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE customprocesskindclassifier OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 18813)
-- Name: customprocesskindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customprocesskindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customprocesskindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4694 (class 0 OID 0)
-- Dependencies: 232
-- Name: customprocesskindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customprocesskindclassifier_id_seq OWNED BY customprocesskindclassifier.id;


--
-- TOC entry 233 (class 1259 OID 18815)
-- Name: customsconclusionsclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customsconclusionsclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE customsconclusionsclassifier OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 18821)
-- Name: customsconclusionsclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customsconclusionsclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customsconclusionsclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4695 (class 0 OID 0)
-- Dependencies: 234
-- Name: customsconclusionsclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customsconclusionsclassifier_id_seq OWNED BY customsconclusionsclassifier.id;


--
-- TOC entry 235 (class 1259 OID 18823)
-- Name: customsfeesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customsfeesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    chapter_code character varying(20)
);


ALTER TABLE customsfeesclassifier OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 18829)
-- Name: customsfeesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customsfeesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customsfeesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4696 (class 0 OID 0)
-- Dependencies: 236
-- Name: customsfeesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customsfeesclassifier_id_seq OWNED BY customsfeesclassifier.id;


--
-- TOC entry 237 (class 1259 OID 18831)
-- Name: customsfeesclassifierchapters; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customsfeesclassifierchapters (
    id integer NOT NULL,
    chapter_code character varying(20),
    chapter_name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE customsfeesclassifierchapters OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 18837)
-- Name: customsfeesclassifierchapters_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customsfeesclassifierchapters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customsfeesclassifierchapters_id_seq OWNER TO postgres;

--
-- TOC entry 4697 (class 0 OID 0)
-- Dependencies: 238
-- Name: customsfeesclassifierchapters_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customsfeesclassifierchapters_id_seq OWNED BY customsfeesclassifierchapters.id;


--
-- TOC entry 239 (class 1259 OID 18839)
-- Name: customsfeesfeaturesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customsfeesfeaturesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE customsfeesfeaturesclassifier OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 18845)
-- Name: customsfeesfeaturesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customsfeesfeaturesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customsfeesfeaturesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4698 (class 0 OID 0)
-- Dependencies: 240
-- Name: customsfeesfeaturesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customsfeesfeaturesclassifier_id_seq OWNED BY customsfeesfeaturesclassifier.id;


--
-- TOC entry 241 (class 1259 OID 18847)
-- Name: customsfeesguaranteemethodsclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customsfeesguaranteemethodsclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE customsfeesguaranteemethodsclassifier OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 18853)
-- Name: customsfeesguaranteemethodsclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customsfeesguaranteemethodsclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customsfeesguaranteemethodsclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4699 (class 0 OID 0)
-- Dependencies: 242
-- Name: customsfeesguaranteemethodsclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customsfeesguaranteemethodsclassifier_id_seq OWNED BY customsfeesguaranteemethodsclassifier.id;


--
-- TOC entry 243 (class 1259 OID 18855)
-- Name: customsfeesmethodsclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customsfeesmethodsclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE customsfeesmethodsclassifier OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 18861)
-- Name: customsfeesmethodsclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customsfeesmethodsclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customsfeesmethodsclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4700 (class 0 OID 0)
-- Dependencies: 244
-- Name: customsfeesmethodsclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customsfeesmethodsclassifier_id_seq OWNED BY customsfeesmethodsclassifier.id;


--
-- TOC entry 245 (class 1259 OID 18863)
-- Name: customstransitmovementofgoodsclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customstransitmovementofgoodsclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE customstransitmovementofgoodsclassifier OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 18869)
-- Name: customstransitmovementofgoodsclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customstransitmovementofgoodsclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customstransitmovementofgoodsclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4701 (class 0 OID 0)
-- Dependencies: 246
-- Name: customstransitmovementofgoodsclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customstransitmovementofgoodsclassifier_id_seq OWNED BY customstransitmovementofgoodsclassifier.id;


--
-- TOC entry 247 (class 1259 OID 18871)
-- Name: customsvalueconclusionclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE customsvalueconclusionclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE customsvalueconclusionclassifier OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 18877)
-- Name: customsvalueconclusionclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE customsvalueconclusionclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customsvalueconclusionclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4702 (class 0 OID 0)
-- Dependencies: 248
-- Name: customsvalueconclusionclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE customsvalueconclusionclassifier_id_seq OWNED BY customsvalueconclusionclassifier.id;


--
-- TOC entry 249 (class 1259 OID 18879)
-- Name: dataformatclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE dataformatclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE dataformatclassifier OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 18885)
-- Name: dataformatclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE dataformatclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dataformatclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4703 (class 0 OID 0)
-- Dependencies: 250
-- Name: dataformatclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE dataformatclassifier_id_seq OWNED BY dataformatclassifier.id;


--
-- TOC entry 251 (class 1259 OID 18887)
-- Name: declarationofgoodsfeaturesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE declarationofgoodsfeaturesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE declarationofgoodsfeaturesclassifier OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 18893)
-- Name: declarationofgoodsfeaturesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE declarationofgoodsfeaturesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE declarationofgoodsfeaturesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4704 (class 0 OID 0)
-- Dependencies: 252
-- Name: declarationofgoodsfeaturesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE declarationofgoodsfeaturesclassifier_id_seq OWNED BY declarationofgoodsfeaturesclassifier.id;


--
-- TOC entry 253 (class 1259 OID 18895)
-- Name: definingcustomsvaluemethodsclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE definingcustomsvaluemethodsclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE definingcustomsvaluemethodsclassifier OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 18901)
-- Name: definingcustomsvaluemethodsclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE definingcustomsvaluemethodsclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE definingcustomsvaluemethodsclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4705 (class 0 OID 0)
-- Dependencies: 254
-- Name: definingcustomsvaluemethodsclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE definingcustomsvaluemethodsclassifier_id_seq OWNED BY definingcustomsvaluemethodsclassifier.id;


--
-- TOC entry 255 (class 1259 OID 18903)
-- Name: docstatstatusclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE docstatstatusclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE docstatstatusclassifier OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 18909)
-- Name: docstatstatusclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE docstatstatusclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE docstatstatusclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4706 (class 0 OID 0)
-- Dependencies: 256
-- Name: docstatstatusclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE docstatstatusclassifier_id_seq OWNED BY docstatstatusclassifier.id;


--
-- TOC entry 257 (class 1259 OID 18911)
-- Name: documentprocessingresultcodeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE documentprocessingresultcodeclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE documentprocessingresultcodeclassifier OWNER TO postgres;

--
-- TOC entry 258 (class 1259 OID 18917)
-- Name: documentprocessingresultcodeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE documentprocessingresultcodeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE documentprocessingresultcodeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4707 (class 0 OID 0)
-- Dependencies: 258
-- Name: documentprocessingresultcodeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE documentprocessingresultcodeclassifier_id_seq OWNED BY documentprocessingresultcodeclassifier.id;


--
-- TOC entry 259 (class 1259 OID 18919)
-- Name: electronicvehicleandchassiscertificatestatusclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE electronicvehicleandchassiscertificatestatusclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    shortname character varying(512),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE electronicvehicleandchassiscertificatestatusclassifier OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 18925)
-- Name: electronicvehicleandchassiscertificatestatusclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE electronicvehicleandchassiscertificatestatusclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE electronicvehicleandchassiscertificatestatusclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4708 (class 0 OID 0)
-- Dependencies: 260
-- Name: electronicvehicleandchassiscertificatestatusclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE electronicvehicleandchassiscertificatestatusclassifier_id_seq OWNED BY electronicvehicleandchassiscertificatestatusclassifier.id;


--
-- TOC entry 261 (class 1259 OID 18927)
-- Name: exemptionsfromcustomsdutychapters; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE exemptionsfromcustomsdutychapters (
    id integer NOT NULL,
    chapter_code character varying(20),
    chapter_name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE exemptionsfromcustomsdutychapters OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 18933)
-- Name: exemptionsfromcustomsdutychapters_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE exemptionsfromcustomsdutychapters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE exemptionsfromcustomsdutychapters_id_seq OWNER TO postgres;

--
-- TOC entry 4709 (class 0 OID 0)
-- Dependencies: 262
-- Name: exemptionsfromcustomsdutychapters_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE exemptionsfromcustomsdutychapters_id_seq OWNED BY exemptionsfromcustomsdutychapters.id;


--
-- TOC entry 263 (class 1259 OID 18935)
-- Name: exemptionsfromcustomsdutyclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE exemptionsfromcustomsdutyclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    chapter_code character varying(20)
);


ALTER TABLE exemptionsfromcustomsdutyclassifier OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 18941)
-- Name: exemptionsfromcustomsdutyclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE exemptionsfromcustomsdutyclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE exemptionsfromcustomsdutyclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4710 (class 0 OID 0)
-- Dependencies: 264
-- Name: exemptionsfromcustomsdutyclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE exemptionsfromcustomsdutyclassifier_id_seq OWNED BY exemptionsfromcustomsdutyclassifier.id;


--
-- TOC entry 265 (class 1259 OID 18943)
-- Name: featureofmovementofgoodsclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE featureofmovementofgoodsclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE featureofmovementofgoodsclassifier OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 18949)
-- Name: featureofmovementofgoodsclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE featureofmovementofgoodsclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE featureofmovementofgoodsclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4711 (class 0 OID 0)
-- Dependencies: 266
-- Name: featureofmovementofgoodsclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE featureofmovementofgoodsclassifier_id_seq OWNED BY featureofmovementofgoodsclassifier.id;


--
-- TOC entry 267 (class 1259 OID 18951)
-- Name: govcontrolsystemandtechresourceskindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE govcontrolsystemandtechresourceskindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE govcontrolsystemandtechresourceskindclassifier OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 18957)
-- Name: govcontrolsystemandtechresourceskindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE govcontrolsystemandtechresourceskindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE govcontrolsystemandtechresourceskindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4712 (class 0 OID 0)
-- Dependencies: 268
-- Name: govcontrolsystemandtechresourceskindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE govcontrolsystemandtechresourceskindclassifier_id_seq OWNED BY govcontrolsystemandtechresourceskindclassifier.id;


--
-- TOC entry 269 (class 1259 OID 18959)
-- Name: govcontrolsystemkindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE govcontrolsystemkindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE govcontrolsystemkindclassifier OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 18965)
-- Name: govcontrolsystemkindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE govcontrolsystemkindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE govcontrolsystemkindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4713 (class 0 OID 0)
-- Dependencies: 270
-- Name: govcontrolsystemkindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE govcontrolsystemkindclassifier_id_seq OWNED BY govcontrolsystemkindclassifier.id;


--
-- TOC entry 271 (class 1259 OID 18967)
-- Name: govsupportsystemkindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE govsupportsystemkindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE govsupportsystemkindclassifier OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 18973)
-- Name: govsupportsystemkindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE govsupportsystemkindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE govsupportsystemkindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4714 (class 0 OID 0)
-- Dependencies: 272
-- Name: govsupportsystemkindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE govsupportsystemkindclassifier_id_seq OWNED BY govsupportsystemkindclassifier.id;


--
-- TOC entry 273 (class 1259 OID 18975)
-- Name: incidentassessmentcodeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE incidentassessmentcodeclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE incidentassessmentcodeclassifier OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 18981)
-- Name: incidentassessmentcodeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE incidentassessmentcodeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE incidentassessmentcodeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4715 (class 0 OID 0)
-- Dependencies: 274
-- Name: incidentassessmentcodeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE incidentassessmentcodeclassifier_id_seq OWNED BY incidentassessmentcodeclassifier.id;


--
-- TOC entry 275 (class 1259 OID 18983)
-- Name: institutionaleconomysectorclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE institutionaleconomysectorclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE institutionaleconomysectorclassifier OWNER TO postgres;

--
-- TOC entry 276 (class 1259 OID 18989)
-- Name: institutionaleconomysectorclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE institutionaleconomysectorclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE institutionaleconomysectorclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4716 (class 0 OID 0)
-- Dependencies: 276
-- Name: institutionaleconomysectorclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE institutionaleconomysectorclassifier_id_seq OWNED BY institutionaleconomysectorclassifier.id;


--
-- TOC entry 277 (class 1259 OID 18991)
-- Name: internatioanltransporttypesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE internatioanltransporttypesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE internatioanltransporttypesclassifier OWNER TO postgres;

--
-- TOC entry 278 (class 1259 OID 18997)
-- Name: internatioanltransporttypesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE internatioanltransporttypesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE internatioanltransporttypesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4717 (class 0 OID 0)
-- Dependencies: 278
-- Name: internatioanltransporttypesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE internatioanltransporttypesclassifier_id_seq OWNED BY internatioanltransporttypesclassifier.id;


--
-- TOC entry 279 (class 1259 OID 18999)
-- Name: issuersellerclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE issuersellerclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE issuersellerclassifier OWNER TO postgres;

--
-- TOC entry 280 (class 1259 OID 19005)
-- Name: issuersellerclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE issuersellerclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE issuersellerclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4718 (class 0 OID 0)
-- Dependencies: 280
-- Name: issuersellerclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE issuersellerclassifier_id_seq OWNED BY issuersellerclassifier.id;


--
-- TOC entry 281 (class 1259 OID 19007)
-- Name: kindidclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE kindidclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE kindidclassifier OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 19013)
-- Name: kindidclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE kindidclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kindidclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4719 (class 0 OID 0)
-- Dependencies: 282
-- Name: kindidclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE kindidclassifier_id_seq OWNED BY kindidclassifier.id;


--
-- TOC entry 283 (class 1259 OID 19015)
-- Name: kindofdocumentsforcustomsdeclarationchapters; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE kindofdocumentsforcustomsdeclarationchapters (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE kindofdocumentsforcustomsdeclarationchapters OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 19021)
-- Name: kindofdocumentsforcustomsdeclarationchapters_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE kindofdocumentsforcustomsdeclarationchapters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kindofdocumentsforcustomsdeclarationchapters_id_seq OWNER TO postgres;

--
-- TOC entry 4720 (class 0 OID 0)
-- Dependencies: 284
-- Name: kindofdocumentsforcustomsdeclarationchapters_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE kindofdocumentsforcustomsdeclarationchapters_id_seq OWNED BY kindofdocumentsforcustomsdeclarationchapters.id;


--
-- TOC entry 285 (class 1259 OID 19023)
-- Name: kindofdocumentsforcustomsdeclarationclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE kindofdocumentsforcustomsdeclarationclassifier (
    id integer NOT NULL,
    code character varying(20),
    chapter_code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    ts integer
);


ALTER TABLE kindofdocumentsforcustomsdeclarationclassifier OWNER TO postgres;

--
-- TOC entry 286 (class 1259 OID 19029)
-- Name: kindofdocumentsforcustomsdeclarationclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE kindofdocumentsforcustomsdeclarationclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kindofdocumentsforcustomsdeclarationclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4721 (class 0 OID 0)
-- Dependencies: 286
-- Name: kindofdocumentsforcustomsdeclarationclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE kindofdocumentsforcustomsdeclarationclassifier_id_seq OWNED BY kindofdocumentsforcustomsdeclarationclassifier.id;


--
-- TOC entry 287 (class 1259 OID 19031)
-- Name: kindoftransportandtransportationgoodsclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE kindoftransportandtransportationgoodsclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE kindoftransportandtransportationgoodsclassifier OWNER TO postgres;

--
-- TOC entry 288 (class 1259 OID 19037)
-- Name: kindoftransportandtransportationgoodsclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE kindoftransportandtransportationgoodsclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kindoftransportandtransportationgoodsclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4722 (class 0 OID 0)
-- Dependencies: 288
-- Name: kindoftransportandtransportationgoodsclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE kindoftransportandtransportationgoodsclassifier_id_seq OWNED BY kindoftransportandtransportationgoodsclassifier.id;


--
-- TOC entry 289 (class 1259 OID 19039)
-- Name: languagecodeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE languagecodeclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE languagecodeclassifier OWNER TO postgres;

--
-- TOC entry 290 (class 1259 OID 19045)
-- Name: languagecodeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE languagecodeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE languagecodeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4723 (class 0 OID 0)
-- Dependencies: 290
-- Name: languagecodeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE languagecodeclassifier_id_seq OWNED BY languagecodeclassifier.id;


--
-- TOC entry 291 (class 1259 OID 19047)
-- Name: measurementunitclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE measurementunitclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    reference character varying(20),
    contriesspecificlimits character varying(255)
);


ALTER TABLE measurementunitclassifier OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 19053)
-- Name: measurementunitclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE measurementunitclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE measurementunitclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4724 (class 0 OID 0)
-- Dependencies: 292
-- Name: measurementunitclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE measurementunitclassifier_id_seq OWNED BY measurementunitclassifier.id;


--
-- TOC entry 293 (class 1259 OID 19055)
-- Name: measurementunitcodeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE measurementunitcodeclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE measurementunitcodeclassifier OWNER TO postgres;

--
-- TOC entry 294 (class 1259 OID 19061)
-- Name: measurementunitcodeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE measurementunitcodeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE measurementunitcodeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4725 (class 0 OID 0)
-- Dependencies: 294
-- Name: measurementunitcodeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE measurementunitcodeclassifier_id_seq OWNED BY measurementunitcodeclassifier.id;


--
-- TOC entry 295 (class 1259 OID 19063)
-- Name: measuresensurecompliancecustomstransitprocedure; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE measuresensurecompliancecustomstransitprocedure (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255)
);


ALTER TABLE measuresensurecompliancecustomstransitprocedure OWNER TO postgres;

--
-- TOC entry 296 (class 1259 OID 19069)
-- Name: measuresensurecompliancecustomstransitprocedure_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE measuresensurecompliancecustomstransitprocedure_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE measuresensurecompliancecustomstransitprocedure_id_seq OWNER TO postgres;

--
-- TOC entry 4726 (class 0 OID 0)
-- Dependencies: 296
-- Name: measuresensurecompliancecustomstransitprocedure_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE measuresensurecompliancecustomstransitprocedure_id_seq OWNED BY measuresensurecompliancecustomstransitprocedure.id;


--
-- TOC entry 297 (class 1259 OID 19071)
-- Name: nsicountry; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE nsicountry (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE nsicountry OWNER TO postgres;

--
-- TOC entry 298 (class 1259 OID 19077)
-- Name: nsicountry_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE nsicountry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE nsicountry_id_seq OWNER TO postgres;

--
-- TOC entry 4727 (class 0 OID 0)
-- Dependencies: 298
-- Name: nsicountry_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE nsicountry_id_seq OWNED BY nsicountry.id;


--
-- TOC entry 299 (class 1259 OID 19079)
-- Name: objectpassedcustomcheckpointclssifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE objectpassedcustomcheckpointclssifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE objectpassedcustomcheckpointclssifier OWNER TO postgres;

--
-- TOC entry 300 (class 1259 OID 19085)
-- Name: objectpassedcustomcheckpointclssifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE objectpassedcustomcheckpointclssifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE objectpassedcustomcheckpointclssifier_id_seq OWNER TO postgres;

--
-- TOC entry 4728 (class 0 OID 0)
-- Dependencies: 300
-- Name: objectpassedcustomcheckpointclssifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE objectpassedcustomcheckpointclssifier_id_seq OWNED BY objectpassedcustomcheckpointclssifier.id;


--
-- TOC entry 301 (class 1259 OID 19087)
-- Name: pharmaprodconsignmentlimitkindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE pharmaprodconsignmentlimitkindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE pharmaprodconsignmentlimitkindclassifier OWNER TO postgres;

--
-- TOC entry 302 (class 1259 OID 19093)
-- Name: pharmaprodconsignmentlimitkindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE pharmaprodconsignmentlimitkindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pharmaprodconsignmentlimitkindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4729 (class 0 OID 0)
-- Dependencies: 302
-- Name: pharmaprodconsignmentlimitkindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE pharmaprodconsignmentlimitkindclassifier_id_seq OWNED BY pharmaprodconsignmentlimitkindclassifier.id;


--
-- TOC entry 303 (class 1259 OID 19095)
-- Name: pharmaproductregistrationdocelementkindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE pharmaproductregistrationdocelementkindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE pharmaproductregistrationdocelementkindclassifier OWNER TO postgres;

--
-- TOC entry 304 (class 1259 OID 19101)
-- Name: pharmaproductregistrationdocelementkindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE pharmaproductregistrationdocelementkindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pharmaproductregistrationdocelementkindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4730 (class 0 OID 0)
-- Dependencies: 304
-- Name: pharmaproductregistrationdocelementkindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE pharmaproductregistrationdocelementkindclassifier_id_seq OWNED BY pharmaproductregistrationdocelementkindclassifier.id;


--
-- TOC entry 305 (class 1259 OID 19103)
-- Name: registrationproductdoccodeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE registrationproductdoccodeclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE registrationproductdoccodeclassifier OWNER TO postgres;

--
-- TOC entry 306 (class 1259 OID 19109)
-- Name: registrationproductdoccodeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE registrationproductdoccodeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registrationproductdoccodeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4731 (class 0 OID 0)
-- Dependencies: 306
-- Name: registrationproductdoccodeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE registrationproductdoccodeclassifier_id_seq OWNED BY registrationproductdoccodeclassifier.id;


--
-- TOC entry 307 (class 1259 OID 19111)
-- Name: registrationproductfilecodeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE registrationproductfilecodeclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE registrationproductfilecodeclassifier OWNER TO postgres;

--
-- TOC entry 308 (class 1259 OID 19117)
-- Name: registrationproductfilecodeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE registrationproductfilecodeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registrationproductfilecodeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4732 (class 0 OID 0)
-- Dependencies: 308
-- Name: registrationproductfilecodeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE registrationproductfilecodeclassifier_id_seq OWNED BY registrationproductfilecodeclassifier.id;


--
-- TOC entry 309 (class 1259 OID 19119)
-- Name: specialsimplificationtypeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE specialsimplificationtypeclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE specialsimplificationtypeclassifier OWNER TO postgres;

--
-- TOC entry 310 (class 1259 OID 19125)
-- Name: specialsimplificationtypeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE specialsimplificationtypeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE specialsimplificationtypeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4733 (class 0 OID 0)
-- Dependencies: 310
-- Name: specialsimplificationtypeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE specialsimplificationtypeclassifier_id_seq OWNED BY specialsimplificationtypeclassifier.id;


--
-- TOC entry 311 (class 1259 OID 19127)
-- Name: steeringwheelpositionclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE steeringwheelpositionclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    vehicletechnicalcertificatetypescode character varying(512),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE steeringwheelpositionclassifier OWNER TO postgres;

--
-- TOC entry 312 (class 1259 OID 19133)
-- Name: steeringwheelpositionclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE steeringwheelpositionclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE steeringwheelpositionclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4734 (class 0 OID 0)
-- Dependencies: 312
-- Name: steeringwheelpositionclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE steeringwheelpositionclassifier_id_seq OWNED BY steeringwheelpositionclassifier.id;


--
-- TOC entry 313 (class 1259 OID 19135)
-- Name: subjectsoflawclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE subjectsoflawclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE subjectsoflawclassifier OWNER TO postgres;

--
-- TOC entry 314 (class 1259 OID 19141)
-- Name: subjectsoflawclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE subjectsoflawclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE subjectsoflawclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4735 (class 0 OID 0)
-- Dependencies: 314
-- Name: subjectsoflawclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE subjectsoflawclassifier_id_seq OWNED BY subjectsoflawclassifier.id;


--
-- TOC entry 315 (class 1259 OID 19143)
-- Name: technicalobjectkindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE technicalobjectkindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE technicalobjectkindclassifier OWNER TO postgres;

--
-- TOC entry 316 (class 1259 OID 19149)
-- Name: technicalobjectkindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE technicalobjectkindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE technicalobjectkindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4736 (class 0 OID 0)
-- Dependencies: 316
-- Name: technicalobjectkindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE technicalobjectkindclassifier_id_seq OWNED BY technicalobjectkindclassifier.id;


--
-- TOC entry 317 (class 1259 OID 19151)
-- Name: termsofdeliveryclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE termsofdeliveryclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    destinationtype character varying(255),
    contriesspecificlimits character varying(255)
);


ALTER TABLE termsofdeliveryclassifier OWNER TO postgres;

--
-- TOC entry 318 (class 1259 OID 19157)
-- Name: termsofdeliveryclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE termsofdeliveryclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE termsofdeliveryclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4737 (class 0 OID 0)
-- Dependencies: 318
-- Name: termsofdeliveryclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE termsofdeliveryclassifier_id_seq OWNED BY termsofdeliveryclassifier.id;


--
-- TOC entry 319 (class 1259 OID 19159)
-- Name: transactiontypeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE transactiontypeclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE transactiontypeclassifier OWNER TO postgres;

--
-- TOC entry 320 (class 1259 OID 19165)
-- Name: transactiontypeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE transactiontypeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transactiontypeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4738 (class 0 OID 0)
-- Dependencies: 320
-- Name: transactiontypeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE transactiontypeclassifier_id_seq OWNED BY transactiontypeclassifier.id;


--
-- TOC entry 321 (class 1259 OID 19167)
-- Name: transportandfreightmodesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE transportandfreightmodesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE transportandfreightmodesclassifier OWNER TO postgres;

--
-- TOC entry 322 (class 1259 OID 19173)
-- Name: transportandfreightmodesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE transportandfreightmodesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transportandfreightmodesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4739 (class 0 OID 0)
-- Dependencies: 322
-- Name: transportandfreightmodesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE transportandfreightmodesclassifier_id_seq OWNED BY transportandfreightmodesclassifier.id;


--
-- TOC entry 323 (class 1259 OID 19175)
-- Name: userkindtimeadvincidentclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE userkindtimeadvincidentclassifier (
    id integer NOT NULL,
    code character varying(20) NOT NULL,
    name character varying(2048) NOT NULL
);


ALTER TABLE userkindtimeadvincidentclassifier OWNER TO postgres;

--
-- TOC entry 324 (class 1259 OID 19181)
-- Name: userkindtimeadvincidentclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE userkindtimeadvincidentclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE userkindtimeadvincidentclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4740 (class 0 OID 0)
-- Dependencies: 324
-- Name: userkindtimeadvincidentclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE userkindtimeadvincidentclassifier_id_seq OWNED BY userkindtimeadvincidentclassifier.id;


--
-- TOC entry 325 (class 1259 OID 19183)
-- Name: vehiclebodycolorclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclebodycolorclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclebodycolorclassifier OWNER TO postgres;

--
-- TOC entry 326 (class 1259 OID 19189)
-- Name: vehiclebodycolorclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclebodycolorclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclebodycolorclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4741 (class 0 OID 0)
-- Dependencies: 326
-- Name: vehiclebodycolorclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclebodycolorclassifier_id_seq OWNED BY vehiclebodycolorclassifier.id;


--
-- TOC entry 327 (class 1259 OID 19191)
-- Name: vehiclebrandsclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclebrandsclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclebrandsclassifier OWNER TO postgres;

--
-- TOC entry 328 (class 1259 OID 19197)
-- Name: vehiclebrandsclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclebrandsclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclebrandsclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4742 (class 0 OID 0)
-- Dependencies: 328
-- Name: vehiclebrandsclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclebrandsclassifier_id_seq OWNED BY vehiclebrandsclassifier.id;


--
-- TOC entry 329 (class 1259 OID 19199)
-- Name: vehiclecategorypereaeutechnicalregulationsclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclecategorypereaeutechnicalregulationsclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    description character varying(1024),
    vehicletechnicalcertificatetypescode character varying(512),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclecategorypereaeutechnicalregulationsclassifier OWNER TO postgres;

--
-- TOC entry 330 (class 1259 OID 19205)
-- Name: vehiclecategorypereaeutechnicalregulationsclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclecategorypereaeutechnicalregulationsclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclecategorypereaeutechnicalregulationsclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4743 (class 0 OID 0)
-- Dependencies: 330
-- Name: vehiclecategorypereaeutechnicalregulationsclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclecategorypereaeutechnicalregulationsclassifier_id_seq OWNED BY vehiclecategorypereaeutechnicalregulationsclassifier.id;


--
-- TOC entry 331 (class 1259 OID 19207)
-- Name: vehiclecategoryperviennaconventiononroadtrafficclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclecategoryperviennaconventiononroadtrafficclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    description character varying(1024),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclecategoryperviennaconventiononroadtrafficclassifier OWNER TO postgres;

--
-- TOC entry 332 (class 1259 OID 19213)
-- Name: vehiclecategoryperviennaconventiononroadtrafficclassifie_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclecategoryperviennaconventiononroadtrafficclassifie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclecategoryperviennaconventiononroadtrafficclassifie_id_seq OWNER TO postgres;

--
-- TOC entry 4744 (class 0 OID 0)
-- Dependencies: 332
-- Name: vehiclecategoryperviennaconventiononroadtrafficclassifie_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclecategoryperviennaconventiononroadtrafficclassifie_id_seq OWNED BY vehiclecategoryperviennaconventiononroadtrafficclassifier.id;


--
-- TOC entry 333 (class 1259 OID 19215)
-- Name: vehiclecatperelectrontechcertificateregistrationrulesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclecatperelectrontechcertificateregistrationrulesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    description character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclecatperelectrontechcertificateregistrationrulesclassifier OWNER TO postgres;

--
-- TOC entry 334 (class 1259 OID 19221)
-- Name: vehiclecatperelectrontechcertificateregistrationrulescla_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclecatperelectrontechcertificateregistrationrulescla_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclecatperelectrontechcertificateregistrationrulescla_id_seq OWNER TO postgres;

--
-- TOC entry 4745 (class 0 OID 0)
-- Dependencies: 334
-- Name: vehiclecatperelectrontechcertificateregistrationrulescla_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclecatperelectrontechcertificateregistrationrulescla_id_seq OWNED BY vehiclecatperelectrontechcertificateregistrationrulesclassifier.id;


--
-- TOC entry 335 (class 1259 OID 19223)
-- Name: vehiclechassisclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclechassisclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclechassisclassifier OWNER TO postgres;

--
-- TOC entry 336 (class 1259 OID 19229)
-- Name: vehiclechassisclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclechassisclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclechassisclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4746 (class 0 OID 0)
-- Dependencies: 336
-- Name: vehiclechassisclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclechassisclassifier_id_seq OWNED BY vehiclechassisclassifier.id;


--
-- TOC entry 337 (class 1259 OID 19231)
-- Name: vehiclecomponentschassistypesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclecomponentschassistypesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    vehicletechnicalcertificatetypescode character varying(512),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclecomponentschassistypesclassifier OWNER TO postgres;

--
-- TOC entry 338 (class 1259 OID 19237)
-- Name: vehiclecomponentschassistypesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclecomponentschassistypesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclecomponentschassistypesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4747 (class 0 OID 0)
-- Dependencies: 338
-- Name: vehiclecomponentschassistypesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclecomponentschassistypesclassifier_id_seq OWNED BY vehiclecomponentschassistypesclassifier.id;


--
-- TOC entry 339 (class 1259 OID 19239)
-- Name: vehicleelectricmachinetypeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehicleelectricmachinetypeclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    vehicletechnicalcertificatetypescode character varying(512),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehicleelectricmachinetypeclassifier OWNER TO postgres;

--
-- TOC entry 340 (class 1259 OID 19245)
-- Name: vehicleelectricmachinetypeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehicleelectricmachinetypeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehicleelectricmachinetypeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4748 (class 0 OID 0)
-- Dependencies: 340
-- Name: vehicleelectricmachinetypeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehicleelectricmachinetypeclassifier_id_seq OWNED BY vehicleelectricmachinetypeclassifier.id;


--
-- TOC entry 341 (class 1259 OID 19247)
-- Name: vehicleelectroniccertificateissuecauseclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehicleelectroniccertificateissuecauseclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehicleelectroniccertificateissuecauseclassifier OWNER TO postgres;

--
-- TOC entry 342 (class 1259 OID 19253)
-- Name: vehicleelectroniccertificateissuecauseclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehicleelectroniccertificateissuecauseclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehicleelectroniccertificateissuecauseclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4749 (class 0 OID 0)
-- Dependencies: 342
-- Name: vehicleelectroniccertificateissuecauseclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehicleelectroniccertificateissuecauseclassifier_id_seq OWNED BY vehicleelectroniccertificateissuecauseclassifier.id;


--
-- TOC entry 343 (class 1259 OID 19255)
-- Name: vehicleelectroniccertificateissuecausewodocumentationsubstantia; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehicleelectroniccertificateissuecausewodocumentationsubstantia (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehicleelectroniccertificateissuecausewodocumentationsubstantia OWNER TO postgres;

--
-- TOC entry 344 (class 1259 OID 19261)
-- Name: vehicleelectroniccertificateissuecausewodocumentationsub_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehicleelectroniccertificateissuecausewodocumentationsub_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehicleelectroniccertificateissuecausewodocumentationsub_id_seq OWNER TO postgres;

--
-- TOC entry 4750 (class 0 OID 0)
-- Dependencies: 344
-- Name: vehicleelectroniccertificateissuecausewodocumentationsub_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehicleelectroniccertificateissuecausewodocumentationsub_id_seq OWNED BY vehicleelectroniccertificateissuecausewodocumentationsubstantia.id;


--
-- TOC entry 345 (class 1259 OID 19263)
-- Name: vehicleenvironmentalclassclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehicleenvironmentalclassclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehicleenvironmentalclassclassifier OWNER TO postgres;

--
-- TOC entry 346 (class 1259 OID 19269)
-- Name: vehicleenvironmentalclassclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehicleenvironmentalclassclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehicleenvironmentalclassclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4751 (class 0 OID 0)
-- Dependencies: 346
-- Name: vehicleenvironmentalclassclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehicleenvironmentalclassclassifier_id_seq OWNED BY vehicleenvironmentalclassclassifier.id;


--
-- TOC entry 347 (class 1259 OID 19271)
-- Name: vehiclefueltypesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclefueltypesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclefueltypesclassifier OWNER TO postgres;

--
-- TOC entry 348 (class 1259 OID 19277)
-- Name: vehiclefueltypesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclefueltypesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclefueltypesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4752 (class 0 OID 0)
-- Dependencies: 348
-- Name: vehiclefueltypesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclefueltypesclassifier_id_seq OWNED BY vehiclefueltypesclassifier.id;


--
-- TOC entry 349 (class 1259 OID 19279)
-- Name: vehiclemanufacturertypeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclemanufacturertypeclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    vehicletechnicalcertificatetypescode character varying(512),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclemanufacturertypeclassifier OWNER TO postgres;

--
-- TOC entry 350 (class 1259 OID 19285)
-- Name: vehiclemanufacturertypeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclemanufacturertypeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclemanufacturertypeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4753 (class 0 OID 0)
-- Dependencies: 350
-- Name: vehiclemanufacturertypeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclemanufacturertypeclassifier_id_seq OWNED BY vehiclemanufacturertypeclassifier.id;


--
-- TOC entry 351 (class 1259 OID 19287)
-- Name: vehiclepassportissuerkindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclepassportissuerkindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(4000),
    shortname character varying(255)
);


ALTER TABLE vehiclepassportissuerkindclassifier OWNER TO postgres;

--
-- TOC entry 352 (class 1259 OID 19293)
-- Name: vehiclepassportissuerkindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclepassportissuerkindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclepassportissuerkindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4754 (class 0 OID 0)
-- Dependencies: 352
-- Name: vehiclepassportissuerkindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclepassportissuerkindclassifier_id_seq OWNED BY vehiclepassportissuerkindclassifier.id;


--
-- TOC entry 353 (class 1259 OID 19295)
-- Name: vehiclepropellertypesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclepropellertypesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclepropellertypesclassifier OWNER TO postgres;

--
-- TOC entry 354 (class 1259 OID 19301)
-- Name: vehiclepropellertypesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclepropellertypesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclepropellertypesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4755 (class 0 OID 0)
-- Dependencies: 354
-- Name: vehiclepropellertypesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclepropellertypesclassifier_id_seq OWNED BY vehiclepropellertypesclassifier.id;


--
-- TOC entry 355 (class 1259 OID 19303)
-- Name: vehicleregistrationclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehicleregistrationclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehicleregistrationclassifier OWNER TO postgres;

--
-- TOC entry 356 (class 1259 OID 19309)
-- Name: vehicleregistrationclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehicleregistrationclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehicleregistrationclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4756 (class 0 OID 0)
-- Dependencies: 356
-- Name: vehicleregistrationclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehicleregistrationclassifier_id_seq OWNED BY vehicleregistrationclassifier.id;


--
-- TOC entry 357 (class 1259 OID 19311)
-- Name: vehiclesuspensiontypeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehiclesuspensiontypeclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehiclesuspensiontypeclassifier OWNER TO postgres;

--
-- TOC entry 358 (class 1259 OID 19317)
-- Name: vehiclesuspensiontypeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehiclesuspensiontypeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiclesuspensiontypeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4757 (class 0 OID 0)
-- Dependencies: 358
-- Name: vehiclesuspensiontypeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehiclesuspensiontypeclassifier_id_seq OWNED BY vehiclesuspensiontypeclassifier.id;


--
-- TOC entry 359 (class 1259 OID 19319)
-- Name: vehicletechnicalcertificatetypesclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehicletechnicalcertificatetypesclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    shortname character varying(512),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehicletechnicalcertificatetypesclassifier OWNER TO postgres;

--
-- TOC entry 360 (class 1259 OID 19325)
-- Name: vehicletechnicalcertificatetypesclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehicletechnicalcertificatetypesclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehicletechnicalcertificatetypesclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4758 (class 0 OID 0)
-- Dependencies: 360
-- Name: vehicletechnicalcertificatetypesclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehicletechnicalcertificatetypesclassifier_id_seq OWNED BY vehicletechnicalcertificatetypesclassifier.id;


--
-- TOC entry 361 (class 1259 OID 19327)
-- Name: vehicleweighttypeclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE vehicleweighttypeclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048),
    shortname character varying(512),
    description character varying(512),
    vehicletechnicalcertificatetypescode character varying(512),
    contriesspecificlimits character varying(255),
    reference character varying(1024)
);


ALTER TABLE vehicleweighttypeclassifier OWNER TO postgres;

--
-- TOC entry 362 (class 1259 OID 19333)
-- Name: vehicleweighttypeclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE vehicleweighttypeclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehicleweighttypeclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4759 (class 0 OID 0)
-- Dependencies: 362
-- Name: vehicleweighttypeclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE vehicleweighttypeclassifier_id_seq OWNED BY vehicleweighttypeclassifier.id;


--
-- TOC entry 363 (class 1259 OID 19335)
-- Name: waypointkindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE waypointkindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE waypointkindclassifier OWNER TO postgres;

--
-- TOC entry 364 (class 1259 OID 19341)
-- Name: waypointkindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE waypointkindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE waypointkindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4760 (class 0 OID 0)
-- Dependencies: 364
-- Name: waypointkindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE waypointkindclassifier_id_seq OWNED BY waypointkindclassifier.id;


--
-- TOC entry 365 (class 1259 OID 19343)
-- Name: workinghourskindclassifier; Type: TABLE; Schema: classifiers; Owner: postgres
--

CREATE TABLE workinghourskindclassifier (
    id integer NOT NULL,
    code character varying(20),
    name character varying(2048)
);


ALTER TABLE workinghourskindclassifier OWNER TO postgres;

--
-- TOC entry 366 (class 1259 OID 19349)
-- Name: workinghourskindclassifier_id_seq; Type: SEQUENCE; Schema: classifiers; Owner: postgres
--

CREATE SEQUENCE workinghourskindclassifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE workinghourskindclassifier_id_seq OWNER TO postgres;

--
-- TOC entry 4761 (class 0 OID 0)
-- Dependencies: 366
-- Name: workinghourskindclassifier_id_seq; Type: SEQUENCE OWNED BY; Schema: classifiers; Owner: postgres
--

ALTER SEQUENCE workinghourskindclassifier_id_seq OWNED BY workinghourskindclassifier.id;


--
-- TOC entry 4127 (class 2604 OID 19351)
-- Name: accreditationcertificatestatusclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY accreditationcertificatestatusclassifier ALTER COLUMN id SET DEFAULT nextval('accreditationcertificatestatusclassifier_id_seq'::regclass);


--
-- TOC entry 4128 (class 2604 OID 19352)
-- Name: additionalparamsforcustomsfeesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY additionalparamsforcustomsfeesclassifier ALTER COLUMN id SET DEFAULT nextval('additionalparamsforcustomsfeesclassifier_id_seq'::regclass);


--
-- TOC entry 4129 (class 2604 OID 19353)
-- Name: addresskindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY addresskindclassifier ALTER COLUMN id SET DEFAULT nextval('addresskindclassifier_id_seq'::regclass);


--
-- TOC entry 4130 (class 2604 OID 19354)
-- Name: bankidentitykindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY bankidentitykindclassifier ALTER COLUMN id SET DEFAULT nextval('bankidentitykindclassifier_id_seq'::regclass);


--
-- TOC entry 4131 (class 2604 OID 19355)
-- Name: biologicalsexclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY biologicalsexclassifier ALTER COLUMN id SET DEFAULT nextval('biologicalsexclassifier_id_seq'::regclass);


--
-- TOC entry 4132 (class 2604 OID 19356)
-- Name: brakingsystemtypeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY brakingsystemtypeclassifier ALTER COLUMN id SET DEFAULT nextval('brakingsystemtypeclassifier_id_seq'::regclass);


--
-- TOC entry 4133 (class 2604 OID 19357)
-- Name: businessentitytypeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY businessentitytypeclassifier ALTER COLUMN id SET DEFAULT nextval('businessentitytypeclassifier_id_seq'::regclass);


--
-- TOC entry 4134 (class 2604 OID 19358)
-- Name: businessentitytypecodeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY businessentitytypecodeclassifier ALTER COLUMN id SET DEFAULT nextval('businessentitytypecodeclassifier_id_seq'::regclass);


--
-- TOC entry 4135 (class 2604 OID 19359)
-- Name: cargolocationclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY cargolocationclassifier ALTER COLUMN id SET DEFAULT nextval('cargolocationclassifier_id_seq'::regclass);


--
-- TOC entry 4136 (class 2604 OID 19360)
-- Name: cargopackagekindsclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY cargopackagekindsclassifier ALTER COLUMN id SET DEFAULT nextval('cargopackagekindsclassifier_id_seq'::regclass);


--
-- TOC entry 4137 (class 2604 OID 19361)
-- Name: certificatioorganizationkindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY certificatioorganizationkindclassifier ALTER COLUMN id SET DEFAULT nextval('certificatioorganizationkindclassifier_id_seq'::regclass);


--
-- TOC entry 4138 (class 2604 OID 19362)
-- Name: communicationchannelclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY communicationchannelclassifier ALTER COLUMN id SET DEFAULT nextval('communicationchannelclassifier_id_seq'::regclass);


--
-- TOC entry 4139 (class 2604 OID 19363)
-- Name: conformityassessmentdocstypesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY conformityassessmentdocstypesclassifier ALTER COLUMN id SET DEFAULT nextval('conformityassessmentdocstypesclassifier_id_seq'::regclass);


--
-- TOC entry 4140 (class 2604 OID 19364)
-- Name: countriesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY countriesclassifier ALTER COLUMN id SET DEFAULT nextval('countriesclassifier_id_seq'::regclass);


--
-- TOC entry 4141 (class 2604 OID 19365)
-- Name: currencyclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY currencyclassifier ALTER COLUMN id SET DEFAULT nextval('currencyclassifier_id_seq'::regclass);


--
-- TOC entry 4142 (class 2604 OID 19366)
-- Name: customcheckpointcctvplacementclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customcheckpointcctvplacementclassifier ALTER COLUMN id SET DEFAULT nextval('customcheckpointcctvplacementclassifier_id_seq'::regclass);


--
-- TOC entry 4143 (class 2604 OID 19367)
-- Name: customcheckpointcommchannelclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customcheckpointcommchannelclassifier ALTER COLUMN id SET DEFAULT nextval('customcheckpointcommchannelclassifier_id_seq'::regclass);


--
-- TOC entry 4144 (class 2604 OID 19368)
-- Name: customprocesskindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customprocesskindclassifier ALTER COLUMN id SET DEFAULT nextval('customprocesskindclassifier_id_seq'::regclass);


--
-- TOC entry 4145 (class 2604 OID 19369)
-- Name: customsconclusionsclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsconclusionsclassifier ALTER COLUMN id SET DEFAULT nextval('customsconclusionsclassifier_id_seq'::regclass);


--
-- TOC entry 4146 (class 2604 OID 19370)
-- Name: customsfeesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsfeesclassifier ALTER COLUMN id SET DEFAULT nextval('customsfeesclassifier_id_seq'::regclass);


--
-- TOC entry 4147 (class 2604 OID 19371)
-- Name: customsfeesclassifierchapters id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsfeesclassifierchapters ALTER COLUMN id SET DEFAULT nextval('customsfeesclassifierchapters_id_seq'::regclass);


--
-- TOC entry 4148 (class 2604 OID 19372)
-- Name: customsfeesfeaturesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsfeesfeaturesclassifier ALTER COLUMN id SET DEFAULT nextval('customsfeesfeaturesclassifier_id_seq'::regclass);


--
-- TOC entry 4149 (class 2604 OID 19373)
-- Name: customsfeesguaranteemethodsclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsfeesguaranteemethodsclassifier ALTER COLUMN id SET DEFAULT nextval('customsfeesguaranteemethodsclassifier_id_seq'::regclass);


--
-- TOC entry 4150 (class 2604 OID 19374)
-- Name: customsfeesmethodsclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsfeesmethodsclassifier ALTER COLUMN id SET DEFAULT nextval('customsfeesmethodsclassifier_id_seq'::regclass);


--
-- TOC entry 4151 (class 2604 OID 19375)
-- Name: customstransitmovementofgoodsclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customstransitmovementofgoodsclassifier ALTER COLUMN id SET DEFAULT nextval('customstransitmovementofgoodsclassifier_id_seq'::regclass);


--
-- TOC entry 4152 (class 2604 OID 19376)
-- Name: customsvalueconclusionclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsvalueconclusionclassifier ALTER COLUMN id SET DEFAULT nextval('customsvalueconclusionclassifier_id_seq'::regclass);


--
-- TOC entry 4153 (class 2604 OID 19377)
-- Name: dataformatclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY dataformatclassifier ALTER COLUMN id SET DEFAULT nextval('dataformatclassifier_id_seq'::regclass);


--
-- TOC entry 4154 (class 2604 OID 19378)
-- Name: declarationofgoodsfeaturesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY declarationofgoodsfeaturesclassifier ALTER COLUMN id SET DEFAULT nextval('declarationofgoodsfeaturesclassifier_id_seq'::regclass);


--
-- TOC entry 4155 (class 2604 OID 19379)
-- Name: definingcustomsvaluemethodsclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY definingcustomsvaluemethodsclassifier ALTER COLUMN id SET DEFAULT nextval('definingcustomsvaluemethodsclassifier_id_seq'::regclass);


--
-- TOC entry 4156 (class 2604 OID 19380)
-- Name: docstatstatusclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY docstatstatusclassifier ALTER COLUMN id SET DEFAULT nextval('docstatstatusclassifier_id_seq'::regclass);


--
-- TOC entry 4157 (class 2604 OID 19381)
-- Name: documentprocessingresultcodeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY documentprocessingresultcodeclassifier ALTER COLUMN id SET DEFAULT nextval('documentprocessingresultcodeclassifier_id_seq'::regclass);


--
-- TOC entry 4158 (class 2604 OID 19382)
-- Name: electronicvehicleandchassiscertificatestatusclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY electronicvehicleandchassiscertificatestatusclassifier ALTER COLUMN id SET DEFAULT nextval('electronicvehicleandchassiscertificatestatusclassifier_id_seq'::regclass);


--
-- TOC entry 4159 (class 2604 OID 19383)
-- Name: exemptionsfromcustomsdutychapters id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY exemptionsfromcustomsdutychapters ALTER COLUMN id SET DEFAULT nextval('exemptionsfromcustomsdutychapters_id_seq'::regclass);


--
-- TOC entry 4160 (class 2604 OID 19384)
-- Name: exemptionsfromcustomsdutyclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY exemptionsfromcustomsdutyclassifier ALTER COLUMN id SET DEFAULT nextval('exemptionsfromcustomsdutyclassifier_id_seq'::regclass);


--
-- TOC entry 4161 (class 2604 OID 19385)
-- Name: featureofmovementofgoodsclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY featureofmovementofgoodsclassifier ALTER COLUMN id SET DEFAULT nextval('featureofmovementofgoodsclassifier_id_seq'::regclass);


--
-- TOC entry 4162 (class 2604 OID 19386)
-- Name: govcontrolsystemandtechresourceskindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY govcontrolsystemandtechresourceskindclassifier ALTER COLUMN id SET DEFAULT nextval('govcontrolsystemandtechresourceskindclassifier_id_seq'::regclass);


--
-- TOC entry 4163 (class 2604 OID 19387)
-- Name: govcontrolsystemkindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY govcontrolsystemkindclassifier ALTER COLUMN id SET DEFAULT nextval('govcontrolsystemkindclassifier_id_seq'::regclass);


--
-- TOC entry 4164 (class 2604 OID 19388)
-- Name: govsupportsystemkindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY govsupportsystemkindclassifier ALTER COLUMN id SET DEFAULT nextval('govsupportsystemkindclassifier_id_seq'::regclass);


--
-- TOC entry 4165 (class 2604 OID 19389)
-- Name: incidentassessmentcodeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY incidentassessmentcodeclassifier ALTER COLUMN id SET DEFAULT nextval('incidentassessmentcodeclassifier_id_seq'::regclass);


--
-- TOC entry 4166 (class 2604 OID 19390)
-- Name: institutionaleconomysectorclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY institutionaleconomysectorclassifier ALTER COLUMN id SET DEFAULT nextval('institutionaleconomysectorclassifier_id_seq'::regclass);


--
-- TOC entry 4167 (class 2604 OID 19391)
-- Name: internatioanltransporttypesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY internatioanltransporttypesclassifier ALTER COLUMN id SET DEFAULT nextval('internatioanltransporttypesclassifier_id_seq'::regclass);


--
-- TOC entry 4168 (class 2604 OID 19392)
-- Name: issuersellerclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY issuersellerclassifier ALTER COLUMN id SET DEFAULT nextval('issuersellerclassifier_id_seq'::regclass);


--
-- TOC entry 4169 (class 2604 OID 19393)
-- Name: kindidclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY kindidclassifier ALTER COLUMN id SET DEFAULT nextval('kindidclassifier_id_seq'::regclass);


--
-- TOC entry 4170 (class 2604 OID 19394)
-- Name: kindofdocumentsforcustomsdeclarationchapters id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY kindofdocumentsforcustomsdeclarationchapters ALTER COLUMN id SET DEFAULT nextval('kindofdocumentsforcustomsdeclarationchapters_id_seq'::regclass);


--
-- TOC entry 4171 (class 2604 OID 19395)
-- Name: kindofdocumentsforcustomsdeclarationclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY kindofdocumentsforcustomsdeclarationclassifier ALTER COLUMN id SET DEFAULT nextval('kindofdocumentsforcustomsdeclarationclassifier_id_seq'::regclass);


--
-- TOC entry 4172 (class 2604 OID 19396)
-- Name: kindoftransportandtransportationgoodsclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY kindoftransportandtransportationgoodsclassifier ALTER COLUMN id SET DEFAULT nextval('kindoftransportandtransportationgoodsclassifier_id_seq'::regclass);


--
-- TOC entry 4173 (class 2604 OID 19397)
-- Name: languagecodeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY languagecodeclassifier ALTER COLUMN id SET DEFAULT nextval('languagecodeclassifier_id_seq'::regclass);


--
-- TOC entry 4174 (class 2604 OID 19398)
-- Name: measurementunitclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY measurementunitclassifier ALTER COLUMN id SET DEFAULT nextval('measurementunitclassifier_id_seq'::regclass);


--
-- TOC entry 4175 (class 2604 OID 19399)
-- Name: measurementunitcodeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY measurementunitcodeclassifier ALTER COLUMN id SET DEFAULT nextval('measurementunitcodeclassifier_id_seq'::regclass);


--
-- TOC entry 4176 (class 2604 OID 19400)
-- Name: measuresensurecompliancecustomstransitprocedure id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY measuresensurecompliancecustomstransitprocedure ALTER COLUMN id SET DEFAULT nextval('measuresensurecompliancecustomstransitprocedure_id_seq'::regclass);


--
-- TOC entry 4177 (class 2604 OID 19401)
-- Name: nsicountry id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY nsicountry ALTER COLUMN id SET DEFAULT nextval('nsicountry_id_seq'::regclass);


--
-- TOC entry 4178 (class 2604 OID 19402)
-- Name: objectpassedcustomcheckpointclssifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY objectpassedcustomcheckpointclssifier ALTER COLUMN id SET DEFAULT nextval('objectpassedcustomcheckpointclssifier_id_seq'::regclass);


--
-- TOC entry 4179 (class 2604 OID 19403)
-- Name: pharmaprodconsignmentlimitkindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY pharmaprodconsignmentlimitkindclassifier ALTER COLUMN id SET DEFAULT nextval('pharmaprodconsignmentlimitkindclassifier_id_seq'::regclass);


--
-- TOC entry 4180 (class 2604 OID 19404)
-- Name: pharmaproductregistrationdocelementkindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY pharmaproductregistrationdocelementkindclassifier ALTER COLUMN id SET DEFAULT nextval('pharmaproductregistrationdocelementkindclassifier_id_seq'::regclass);


--
-- TOC entry 4181 (class 2604 OID 19405)
-- Name: registrationproductdoccodeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY registrationproductdoccodeclassifier ALTER COLUMN id SET DEFAULT nextval('registrationproductdoccodeclassifier_id_seq'::regclass);


--
-- TOC entry 4182 (class 2604 OID 19406)
-- Name: registrationproductfilecodeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY registrationproductfilecodeclassifier ALTER COLUMN id SET DEFAULT nextval('registrationproductfilecodeclassifier_id_seq'::regclass);


--
-- TOC entry 4183 (class 2604 OID 19407)
-- Name: specialsimplificationtypeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY specialsimplificationtypeclassifier ALTER COLUMN id SET DEFAULT nextval('specialsimplificationtypeclassifier_id_seq'::regclass);


--
-- TOC entry 4184 (class 2604 OID 19408)
-- Name: steeringwheelpositionclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY steeringwheelpositionclassifier ALTER COLUMN id SET DEFAULT nextval('steeringwheelpositionclassifier_id_seq'::regclass);


--
-- TOC entry 4185 (class 2604 OID 19409)
-- Name: subjectsoflawclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY subjectsoflawclassifier ALTER COLUMN id SET DEFAULT nextval('subjectsoflawclassifier_id_seq'::regclass);


--
-- TOC entry 4186 (class 2604 OID 19410)
-- Name: technicalobjectkindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY technicalobjectkindclassifier ALTER COLUMN id SET DEFAULT nextval('technicalobjectkindclassifier_id_seq'::regclass);


--
-- TOC entry 4187 (class 2604 OID 19411)
-- Name: termsofdeliveryclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY termsofdeliveryclassifier ALTER COLUMN id SET DEFAULT nextval('termsofdeliveryclassifier_id_seq'::regclass);


--
-- TOC entry 4188 (class 2604 OID 19412)
-- Name: transactiontypeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY transactiontypeclassifier ALTER COLUMN id SET DEFAULT nextval('transactiontypeclassifier_id_seq'::regclass);


--
-- TOC entry 4189 (class 2604 OID 19413)
-- Name: transportandfreightmodesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY transportandfreightmodesclassifier ALTER COLUMN id SET DEFAULT nextval('transportandfreightmodesclassifier_id_seq'::regclass);


--
-- TOC entry 4190 (class 2604 OID 19414)
-- Name: userkindtimeadvincidentclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY userkindtimeadvincidentclassifier ALTER COLUMN id SET DEFAULT nextval('userkindtimeadvincidentclassifier_id_seq'::regclass);


--
-- TOC entry 4191 (class 2604 OID 19415)
-- Name: vehiclebodycolorclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclebodycolorclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclebodycolorclassifier_id_seq'::regclass);


--
-- TOC entry 4192 (class 2604 OID 19416)
-- Name: vehiclebrandsclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclebrandsclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclebrandsclassifier_id_seq'::regclass);


--
-- TOC entry 4193 (class 2604 OID 19417)
-- Name: vehiclecategorypereaeutechnicalregulationsclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclecategorypereaeutechnicalregulationsclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclecategorypereaeutechnicalregulationsclassifier_id_seq'::regclass);


--
-- TOC entry 4194 (class 2604 OID 19418)
-- Name: vehiclecategoryperviennaconventiononroadtrafficclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclecategoryperviennaconventiononroadtrafficclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclecategoryperviennaconventiononroadtrafficclassifie_id_seq'::regclass);


--
-- TOC entry 4195 (class 2604 OID 19419)
-- Name: vehiclecatperelectrontechcertificateregistrationrulesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclecatperelectrontechcertificateregistrationrulesclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclecatperelectrontechcertificateregistrationrulescla_id_seq'::regclass);


--
-- TOC entry 4196 (class 2604 OID 19420)
-- Name: vehiclechassisclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclechassisclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclechassisclassifier_id_seq'::regclass);


--
-- TOC entry 4197 (class 2604 OID 19421)
-- Name: vehiclecomponentschassistypesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclecomponentschassistypesclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclecomponentschassistypesclassifier_id_seq'::regclass);


--
-- TOC entry 4198 (class 2604 OID 19422)
-- Name: vehicleelectricmachinetypeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleelectricmachinetypeclassifier ALTER COLUMN id SET DEFAULT nextval('vehicleelectricmachinetypeclassifier_id_seq'::regclass);


--
-- TOC entry 4199 (class 2604 OID 19423)
-- Name: vehicleelectroniccertificateissuecauseclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleelectroniccertificateissuecauseclassifier ALTER COLUMN id SET DEFAULT nextval('vehicleelectroniccertificateissuecauseclassifier_id_seq'::regclass);


--
-- TOC entry 4200 (class 2604 OID 19424)
-- Name: vehicleelectroniccertificateissuecausewodocumentationsubstantia id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleelectroniccertificateissuecausewodocumentationsubstantia ALTER COLUMN id SET DEFAULT nextval('vehicleelectroniccertificateissuecausewodocumentationsub_id_seq'::regclass);


--
-- TOC entry 4201 (class 2604 OID 19425)
-- Name: vehicleenvironmentalclassclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleenvironmentalclassclassifier ALTER COLUMN id SET DEFAULT nextval('vehicleenvironmentalclassclassifier_id_seq'::regclass);


--
-- TOC entry 4202 (class 2604 OID 19426)
-- Name: vehiclefueltypesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclefueltypesclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclefueltypesclassifier_id_seq'::regclass);


--
-- TOC entry 4203 (class 2604 OID 19427)
-- Name: vehiclemanufacturertypeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclemanufacturertypeclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclemanufacturertypeclassifier_id_seq'::regclass);


--
-- TOC entry 4204 (class 2604 OID 19428)
-- Name: vehiclepassportissuerkindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclepassportissuerkindclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclepassportissuerkindclassifier_id_seq'::regclass);


--
-- TOC entry 4205 (class 2604 OID 19429)
-- Name: vehiclepropellertypesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclepropellertypesclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclepropellertypesclassifier_id_seq'::regclass);


--
-- TOC entry 4206 (class 2604 OID 19430)
-- Name: vehicleregistrationclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleregistrationclassifier ALTER COLUMN id SET DEFAULT nextval('vehicleregistrationclassifier_id_seq'::regclass);


--
-- TOC entry 4207 (class 2604 OID 19431)
-- Name: vehiclesuspensiontypeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclesuspensiontypeclassifier ALTER COLUMN id SET DEFAULT nextval('vehiclesuspensiontypeclassifier_id_seq'::regclass);


--
-- TOC entry 4208 (class 2604 OID 19432)
-- Name: vehicletechnicalcertificatetypesclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicletechnicalcertificatetypesclassifier ALTER COLUMN id SET DEFAULT nextval('vehicletechnicalcertificatetypesclassifier_id_seq'::regclass);


--
-- TOC entry 4209 (class 2604 OID 19433)
-- Name: vehicleweighttypeclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleweighttypeclassifier ALTER COLUMN id SET DEFAULT nextval('vehicleweighttypeclassifier_id_seq'::regclass);


--
-- TOC entry 4210 (class 2604 OID 19434)
-- Name: waypointkindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY waypointkindclassifier ALTER COLUMN id SET DEFAULT nextval('waypointkindclassifier_id_seq'::regclass);


--
-- TOC entry 4211 (class 2604 OID 19435)
-- Name: workinghourskindclassifier id; Type: DEFAULT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY workinghourskindclassifier ALTER COLUMN id SET DEFAULT nextval('workinghourskindclassifier_id_seq'::regclass);


--
-- TOC entry 4503 (class 0 OID 18671)
-- Dependencies: 197
-- Data for Name: accreditationcertificatestatusclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO accreditationcertificatestatusclassifier VALUES (26, '01', 'РґРµР№СЃС‚РІСѓРµС‚');
INSERT INTO accreditationcertificatestatusclassifier VALUES (27, '02', 'РїСЂРёРѕСЃС‚Р°РЅРѕРІР»РµРЅ');
INSERT INTO accreditationcertificatestatusclassifier VALUES (28, '03', 'РїСЂРµРєСЂР°С‰РµРЅ');
INSERT INTO accreditationcertificatestatusclassifier VALUES (29, '04', 'РїСЂРѕРґР»РµРЅ');
INSERT INTO accreditationcertificatestatusclassifier VALUES (30, '05', 'РІРѕР·РѕР±РЅРѕРІР»РµРЅ');
INSERT INTO accreditationcertificatestatusclassifier VALUES (31, '06', 'РѕС‚РѕР·РІР°РЅ');
INSERT INTO accreditationcertificatestatusclassifier VALUES (32, '07', 'Р°РЅРЅСѓР»РёСЂРѕРІР°РЅ');
INSERT INTO accreditationcertificatestatusclassifier VALUES (33, '08', 'РїРѕРіР°С€РµРЅ');


--
-- TOC entry 4505 (class 0 OID 18679)
-- Dependencies: 199
-- Data for Name: additionalparamsforcustomsfeesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (15, '111', 'РљРЈР‘Р�Р§Р•РЎРљР�Р™ РЎРђРќРўР�РњР•РўР ', 'РЎРњ3', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (16, '117', 'РўРѕРЅРЅР° РїРѕР»РЅРѕР№ РјР°СЃСЃС‹', 'РўРџРњ', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (17, '118', 'РњРµС‚СЂ РєСѓР±РёС‡РµСЃРєРёР№ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ РѕР±СЉРµРјР° РєСѓР·РѕРІР°', 'Рњ3Р’РћРљ', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (18, '168', 'РўРћРќРќРђ, РњР•РўР Р�Р§Р•РЎРљРђРЇ РўРћРќРќРђ (1000 РљР“)', 'Рў', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (19, '214', 'РљР�Р›РћР’РђРўРў', 'РљР’Рў', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (20, '251', 'Р›РћРЁРђР”Р�РќРђРЇ РЎР�Р›Рђ', 'Р›.РЎ.', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (21, '111', 'РљРЈР‘Р�Р§Р•РЎРљР�Р™ РЎРђРќРўР�РњР•РўР ', 'РЎРњ3', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (22, '117', 'РўРѕРЅРЅР° РїРѕР»РЅРѕР№ РјР°СЃСЃС‹', 'РўРџРњ', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (23, '118', 'РњРµС‚СЂ РєСѓР±РёС‡РµСЃРєРёР№ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ РѕР±СЉРµРјР° РєСѓР·РѕРІР°', 'Рњ3Р’РћРљ', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (24, '168', 'РўРћРќРќРђ, РњР•РўР Р�Р§Р•РЎРљРђРЇ РўРћРќРќРђ (1000 РљР“)', 'Рў', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (25, '214', 'РљР�Р›РћР’РђРўРў', 'РљР’Рў', NULL, NULL);
INSERT INTO additionalparamsforcustomsfeesclassifier VALUES (26, '251', 'Р›РћРЁРђР”Р�РќРђРЇ РЎР�Р›Рђ', 'Р›.РЎ.', NULL, NULL);


--
-- TOC entry 4507 (class 0 OID 18687)
-- Dependencies: 201
-- Data for Name: addresskindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO addresskindclassifier VALUES (1, '1', 'РђРґСЂРµСЃ СЂРµРіРёСЃС‚СЂР°С†РёРё');
INSERT INTO addresskindclassifier VALUES (2, '2', 'Р¤Р°РєС‚РёС‡РµСЃРєРёР№ Р°РґСЂРµСЃ');
INSERT INTO addresskindclassifier VALUES (3, '3', 'РџРѕС‡С‚РѕРІС‹Р№ Р°РґСЂРµСЃ');


--
-- TOC entry 4509 (class 0 OID 18695)
-- Dependencies: 203
-- Data for Name: bankidentitykindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4511 (class 0 OID 18703)
-- Dependencies: 205
-- Data for Name: biologicalsexclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4513 (class 0 OID 18711)
-- Dependencies: 207
-- Data for Name: brakingsystemtypeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO brakingsystemtypeclassifier VALUES (1, '04', 'РІСЃРїРѕРјРѕРіР°С‚РµР»СЊРЅР°СЏ (РёР·РЅРѕСЃРѕСЃС‚РѕР№РєР°СЏ)', '3', NULL, NULL);
INSERT INTO brakingsystemtypeclassifier VALUES (2, '01', 'СЂР°Р±РѕС‡Р°СЏ', '2', NULL, NULL);
INSERT INTO brakingsystemtypeclassifier VALUES (3, '03', 'СЃС‚РѕСЏРЅРѕС‡РЅР°СЏ', '3', NULL, NULL);
INSERT INTO brakingsystemtypeclassifier VALUES (4, '01', 'СЂР°Р±РѕС‡Р°СЏ', '3', NULL, NULL);
INSERT INTO brakingsystemtypeclassifier VALUES (5, '01', 'СЂР°Р±РѕС‡Р°СЏ', '1', NULL, NULL);
INSERT INTO brakingsystemtypeclassifier VALUES (6, '03', 'СЃС‚РѕСЏРЅРѕС‡РЅР°СЏ', '2', NULL, NULL);
INSERT INTO brakingsystemtypeclassifier VALUES (7, '03', 'СЃС‚РѕСЏРЅРѕС‡РЅР°СЏ', '1', NULL, NULL);
INSERT INTO brakingsystemtypeclassifier VALUES (8, '02', 'Р·Р°РїР°СЃРЅР°СЏ', '3', NULL, NULL);
INSERT INTO brakingsystemtypeclassifier VALUES (9, '02', 'Р·Р°РїР°СЃРЅР°СЏ', '1', NULL, NULL);
INSERT INTO brakingsystemtypeclassifier VALUES (10, '02', 'Р·Р°РїР°СЃРЅР°СЏ', '2', NULL, NULL);


--
-- TOC entry 4515 (class 0 OID 18719)
-- Dependencies: 209
-- Data for Name: businessentitytypeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO businessentitytypeclassifier VALUES (1, '20610', 'РќРѕС‚Р°СЂРёР°Р»СЊРЅС‹Рµ РїР°Р»Р°С‚С‹');
INSERT INTO businessentitytypeclassifier VALUES (2, '65000', 'РЈРЅРёС‚Р°СЂРЅС‹Рµ РїСЂРµРґРїСЂРёСЏС‚РёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (3, '65242', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ СѓРЅРёС‚Р°СЂРЅС‹Рµ РїСЂРµРґРїСЂРёСЏС‚РёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (4, '65241', 'Р¤РµРґРµСЂР°Р»СЊРЅС‹Рµ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ СѓРЅРёС‚Р°СЂРЅС‹Рµ РїСЂРµРґРїСЂРёСЏС‚РёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (5, '20211', 'РћСЂРіР°РЅС‹ РѕР±С‰РµСЃС‚РІРµРЅРЅРѕР№ СЃР°РјРѕРґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё');
INSERT INTO businessentitytypeclassifier VALUES (6, '65243', 'РњСѓРЅРёС†РёРїР°Р»СЊРЅС‹Рµ СѓРЅРёС‚Р°СЂРЅС‹Рµ РїСЂРµРґРїСЂРёСЏС‚РёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (7, '15300', 'РљСЂРµСЃС‚СЊСЏРЅСЃРєРёРµ (С„РµСЂРјРµСЂСЃРєРёРµ) С…РѕР·СЏР№СЃС‚РІР°');
INSERT INTO businessentitytypeclassifier VALUES (8, '20210', 'РћР±С‰РµСЃС‚РІРµРЅРЅС‹Рµ РґРІРёР¶РµРЅРёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (9, '71400', 'РђРІС‚РѕРЅРѕРјРЅС‹Рµ РЅРµРєРѕРјРјРµСЂС‡РµСЃРєРёРµ РѕСЂРіР°РЅРёР·Р°С†РёРё');
INSERT INTO businessentitytypeclassifier VALUES (10, '75204', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РєР°Р·РµРЅРЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (11, '20618', 'РђСЃСЃРѕС†РёР°С†РёРё (СЃРѕСЋР·С‹) СЃР°РґРѕРІРѕРґС‡РµСЃРєРёС…, РѕРіРѕСЂРѕРґРЅРёС‡РµСЃРєРёС… Рё РґР°С‡РЅС‹С… РЅРµРєРѕРјРјРµСЂС‡РµСЃРєРёС… РѕР±СЉРµРґРёРЅРµРЅРёР№');
INSERT INTO businessentitytypeclassifier VALUES (12, '75203', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ Р±СЋРґР¶РµС‚РЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (13, '20617', 'РЎР°РґРѕРІРѕРґС‡РµСЃРєРёРµ, РѕРіРѕСЂРѕРґРЅРёС‡РµСЃРєРёРµ РёР»Рё РґР°С‡РЅС‹Рµ РЅРµРєРѕРјРјРµСЂС‡РµСЃРєРёРµ РїР°СЂС‚РЅРµСЂСЃС‚РІР°');
INSERT INTO businessentitytypeclassifier VALUES (14, '3000', 'РҐРѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РїР°СЂС‚РЅРµСЂСЃС‚РІР°');
INSERT INTO businessentitytypeclassifier VALUES (15, '20616', 'РљРѕР»Р»РµРіРёРё Р°РґРІРѕРєР°С‚РѕРІ');
INSERT INTO businessentitytypeclassifier VALUES (16, '75201', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ Р°РІС‚РѕРЅРѕРјРЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (17, '20615', 'РђРґРІРѕРєР°С‚СЃРєРёРµ Р±СЋСЂРѕ');
INSERT INTO businessentitytypeclassifier VALUES (18, '20614', 'РќРµРєРѕРјРјРµСЂС‡РµСЃРєРёРµ РїР°СЂС‚РЅРµСЂСЃС‚РІР°');
INSERT INTO businessentitytypeclassifier VALUES (19, '20217', 'РўРµСЂСЂРёС‚РѕСЂРёР°Р»СЊРЅС‹Рµ РѕР±С‰РµСЃС‚РІРµРЅРЅС‹Рµ СЃР°РјРѕСѓРїСЂР°РІР»РµРЅРёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (20, '20613', 'РћР±СЉРµРґРёРЅРµРЅРёСЏ С„РµСЂРјРµСЂСЃРєРёС… С…РѕР·СЏР№СЃС‚РІ');
INSERT INTO businessentitytypeclassifier VALUES (21, '20612', 'РћР±СЉРµРґРёРЅРµРЅРёСЏ СЂР°Р±РѕС‚РѕРґР°С‚РµР»РµР№');
INSERT INTO businessentitytypeclassifier VALUES (22, '20611', 'РўРѕСЂРіРѕРІРѕ-РїСЂРѕРјС‹С€Р»РµРЅРЅС‹Рµ РїР°Р»Р°С‚С‹');
INSERT INTO businessentitytypeclassifier VALUES (23, '20609', 'РђРґРІРѕРєР°С‚СЃРєРёРµ РїР°Р»Р°С‚С‹');
INSERT INTO businessentitytypeclassifier VALUES (24, '20608', 'РЎРѕСЋР·С‹ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёС… РѕР±С‰РµСЃС‚РІ');
INSERT INTO businessentitytypeclassifier VALUES (25, '20104', 'РљСЂРµРґРёС‚РЅС‹Рµ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypeclassifier VALUES (26, '20103', 'Р–РёР»РёС‰РЅС‹Рµ РЅР°РєРѕРїРёС‚РµР»СЊРЅС‹Рµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypeclassifier VALUES (27, '20620', 'РћР±СЉРµРґРёРЅРµРЅРёСЏ (Р°СЃСЃРѕС†РёР°С†РёРё Рё СЃРѕСЋР·С‹) Р±Р»Р°РіРѕС‚РІРѕСЂРёС‚РµР»СЊРЅС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№');
INSERT INTO businessentitytypeclassifier VALUES (28, '20102', 'Р–РёР»РёС‰РЅС‹Рµ РёР»Рё Р¶РёР»РёС‰РЅРѕ-СЃС‚СЂРѕРёС‚РµР»СЊРЅС‹Рµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypeclassifier VALUES (29, '20101', 'Р“Р°СЂР°Р¶РЅС‹Рµ Рё РіР°СЂР°Р¶РЅРѕ-СЃС‚СЂРѕРёС‚РµР»СЊРЅС‹Рµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypeclassifier VALUES (30, '14100', 'РЎРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РїСЂРѕРёР·РІРѕРґСЃС‚РІРµРЅРЅС‹Рµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypeclassifier VALUES (31, '20100', 'РџРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypeclassifier VALUES (32, '20109', 'РЎРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ РїРµСЂРµСЂР°Р±Р°С‚С‹РІР°СЋС‰РёРµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypeclassifier VALUES (33, '20108', 'РћР±С‰РµСЃС‚РІР° РІР·Р°РёРјРЅРѕРіРѕ СЃС‚СЂР°С…РѕРІР°РЅРёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (34, '20107', 'РџРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ РѕР±С‰РµСЃС‚РІР°');
INSERT INTO businessentitytypeclassifier VALUES (35, '20106', 'РљСЂРµРґРёС‚РЅС‹Рµ РєРѕРѕРїРµСЂР°С‚РёРІС‹ РІС‚РѕСЂРѕРіРѕ СѓСЂРѕРІРЅСЏ');
INSERT INTO businessentitytypeclassifier VALUES (36, '20105', 'РљСЂРµРґРёС‚РЅС‹Рµ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ РєРѕРѕРїРµСЂР°С‚РёРІС‹ РіСЂР°Р¶РґР°РЅ');
INSERT INTO businessentitytypeclassifier VALUES (37, '50200', 'РћСЂРіР°РЅРёР·Р°С†РёРѕРЅРЅРѕ-РїСЂР°РІРѕРІС‹Рµ С„РѕСЂРјС‹ РґР»СЏ РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё РіСЂР°Р¶РґР°РЅ, РЅРµ РѕС‚РЅРµСЃРµРЅРЅРѕР№ Рє РїСЂРµРґРїСЂРёРЅРёРјР°С‚РµР»СЊСЃС‚РІСѓ');
INSERT INTO businessentitytypeclassifier VALUES (38, '20619', 'РЎР°РјРѕСЂРµРіСѓР»РёСЂСѓРµРјС‹Рµ РѕСЂРіР°РЅРёР·Р°С†РёРё');
INSERT INTO businessentitytypeclassifier VALUES (39, '12200', 'РђРєС†РёРѕРЅРµСЂРЅС‹Рµ РѕР±С‰РµСЃС‚РІР°');
INSERT INTO businessentitytypeclassifier VALUES (40, '50202', 'РќРѕС‚Р°СЂРёСѓСЃС‹, Р·Р°РЅРёРјР°СЋС‰РёРµСЃСЏ С‡Р°СЃС‚РЅРѕР№ РїСЂР°РєС‚РёРєРѕР№');
INSERT INTO businessentitytypeclassifier VALUES (41, '50201', 'РђРґРІРѕРєР°С‚С‹, СѓС‡СЂРµРґРёРІС€РёРµ Р°РґРІРѕРєР°С‚СЃРєРёР№ РєР°Р±РёРЅРµС‚');
INSERT INTO businessentitytypeclassifier VALUES (42, '65143', 'РњСѓРЅРёС†РёРїР°Р»СЊРЅС‹Рµ РєР°Р·РµРЅРЅС‹Рµ РїСЂРµРґРїСЂРёСЏС‚РёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (43, '65142', 'РљР°Р·РµРЅРЅС‹Рµ РїСЂРµРґРїСЂРёСЏС‚РёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (44, '75505', 'РћР±С‰РµСЃС‚РІРµРЅРЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (45, '14155', 'РљРѕРѕРїРµСЂР°С‚РёРІРЅС‹Рµ С…РѕР·СЏР№СЃС‚РІР° (РєРѕРѕРїС…РѕР·С‹)');
INSERT INTO businessentitytypeclassifier VALUES (46, '14153', 'РЎРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ Р°СЂС‚РµР»Рё (РєРѕР»С…РѕР·С‹)');
INSERT INTO businessentitytypeclassifier VALUES (47, '75502', 'Р‘Р»Р°РіРѕС‚РІРѕСЂРёС‚РµР»СЊРЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (48, '14154', 'Р С‹Р±РѕР»РѕРІРµС†РєРёРµ Р°СЂС‚РµР»Рё (РєРѕР»С…РѕР·С‹)');
INSERT INTO businessentitytypeclassifier VALUES (49, '75104', 'Р¤РµРґРµСЂР°Р»СЊРЅС‹Рµ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РєР°Р·РµРЅРЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (50, '75500', 'Р§Р°СЃС‚РЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (51, '20716', 'РўРѕРІР°СЂРёС‰РµСЃС‚РІР° СЃРѕР±СЃС‚РІРµРЅРЅРёРєРѕРІ Р¶РёР»СЊСЏ');
INSERT INTO businessentitytypeclassifier VALUES (52, '75103', 'Р¤РµРґРµСЂР°Р»СЊРЅС‹Рµ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ Р±СЋРґР¶РµС‚РЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (53, '75101', 'Р¤РµРґРµСЂР°Р»СЊРЅС‹Рµ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ Р°РІС‚РѕРЅРѕРјРЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (54, '30002', 'Р¤РёР»РёР°Р»С‹ СЋСЂРёРґРёС‡РµСЃРєРёС… Р»РёС†');
INSERT INTO businessentitytypeclassifier VALUES (55, '30001', 'РџСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІР° СЋСЂРёРґРёС‡РµСЃРєРёС… Р»РёС†');
INSERT INTO businessentitytypeclassifier VALUES (56, '30004', 'РЎС‚СЂСѓРєС‚СѓСЂРЅС‹Рµ РїРѕРґСЂР°Р·РґРµР»РµРЅРёСЏ РѕР±РѕСЃРѕР±Р»РµРЅРЅС‹С… РїРѕРґСЂР°Р·РґРµР»РµРЅРёР№ СЋСЂРёРґРёС‡РµСЃРєРёС… Р»РёС†');
INSERT INTO businessentitytypeclassifier VALUES (57, '30003', 'РћР±РѕСЃРѕР±Р»РµРЅРЅС‹Рµ РїРѕРґСЂР°Р·РґРµР»РµРЅРёСЏ СЋСЂРёРґРёС‡РµСЃРєРёС… Р»РёС†');
INSERT INTO businessentitytypeclassifier VALUES (58, '30006', 'РџСЂРѕСЃС‚С‹Рµ С‚РѕРІР°СЂРёС‰РµСЃС‚РІР°');
INSERT INTO businessentitytypeclassifier VALUES (59, '30005', 'РџР°РµРІС‹Рµ РёРЅРІРµСЃС‚РёС†РёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹');
INSERT INTO businessentitytypeclassifier VALUES (60, '30008', 'Р Р°Р№РѕРЅРЅС‹Рµ СЃСѓРґС‹, РіРѕСЂРѕРґСЃРєРёРµ СЃСѓРґС‹, РјРµР¶СЂР°Р№РѕРЅРЅС‹Рµ СЃСѓРґС‹ (СЂР°Р№РѕРЅРЅС‹Рµ СЃСѓРґС‹)');
INSERT INTO businessentitytypeclassifier VALUES (61, '65141', 'Р¤РµРґРµСЂР°Р»СЊРЅС‹Рµ РєР°Р·РµРЅРЅС‹Рµ РїСЂРµРґРїСЂРёСЏС‚РёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (62, '20202', 'РџСЂРѕС„СЃРѕСЋР·РЅС‹Рµ РѕСЂРіР°РЅРёР·Р°С†РёРё');
INSERT INTO businessentitytypeclassifier VALUES (63, '20201', 'РџРѕР»РёС‚РёС‡РµСЃРєРёРµ РїР°СЂС‚РёРё');
INSERT INTO businessentitytypeclassifier VALUES (64, '20200', 'РћР±С‰РµСЃС‚РІРµРЅРЅС‹Рµ РѕСЂРіР°РЅРёР·Р°С†РёРё');
INSERT INTO businessentitytypeclassifier VALUES (65, '11051', 'РџРѕР»РЅС‹Рµ С‚РѕРІР°СЂРёС‰РµСЃС‚РІР°');
INSERT INTO businessentitytypeclassifier VALUES (66, '14200', 'РџСЂРѕРёР·РІРѕРґСЃС‚РІРµРЅРЅС‹Рµ РєРѕРѕРїРµСЂР°С‚РёРІС‹ (РєСЂРѕРјРµ СЃРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹С… РїСЂРѕРёР·РІРѕРґСЃС‚РІРµРЅРЅС‹С… РєРѕРѕРїРµСЂР°С‚РёРІРѕРІ)');
INSERT INTO businessentitytypeclassifier VALUES (67, '20607', 'РЎРѕСЋР·С‹ (Р°СЃСЃРѕС†РёР°С†РёРё) РѕР±С‰РёРЅ РјР°Р»РѕС‡РёСЃР»РµРЅРЅС‹С… РЅР°СЂРѕРґРѕРІ');
INSERT INTO businessentitytypeclassifier VALUES (68, '20606', 'РЎРѕСЋР·С‹ (Р°СЃСЃРѕС†РёР°С†РёРё) РѕР±С‰РµСЃС‚РІРµРЅРЅС‹С… РѕР±СЉРµРґРёРЅРµРЅРёР№');
INSERT INTO businessentitytypeclassifier VALUES (69, '20605', 'РЎРѕСЋР·С‹ (Р°СЃСЃРѕС†РёР°С†РёРё) РєРѕРѕРїРµСЂР°С‚РёРІРѕРІ');
INSERT INTO businessentitytypeclassifier VALUES (70, '20604', 'РЎРѕСЋР·С‹ (Р°СЃСЃРѕС†РёР°С†РёРё) РєСЂРµРґРёС‚РЅС‹С… РєРѕРѕРїРµСЂР°С‚РёРІРѕРІ');
INSERT INTO businessentitytypeclassifier VALUES (71, '20603', 'РЎРѕРІРµС‚С‹ РјСѓРЅРёС†РёРїР°Р»СЊРЅС‹С… РѕР±СЂР°Р·РѕРІР°РЅРёР№ СЃСѓР±СЉРµРєС‚РѕРІ');
INSERT INTO businessentitytypeclassifier VALUES (72, '20601', 'РђСЃСЃРѕС†РёР°С†РёРё (СЃРѕСЋР·С‹) СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ РІР·Р°РёРјРѕРґРµР№СЃС‚РІРёСЏ СЃСѓР±СЉРµРєС‚РѕРІ');
INSERT INTO businessentitytypeclassifier VALUES (73, '20600', 'РђСЃСЃРѕС†РёР°С†РёРё (СЃРѕСЋР·С‹)');
INSERT INTO businessentitytypeclassifier VALUES (74, '50101', 'Р“Р»Р°РІС‹ РєСЂРµСЃС‚СЊСЏРЅСЃРєРёС… (С„РµСЂРјРµСЂСЃРєРёС…) С…РѕР·СЏР№СЃС‚РІ');
INSERT INTO businessentitytypeclassifier VALUES (75, '50100', 'РћСЂРіР°РЅРёР·Р°С†РёРѕРЅРЅРѕ-РїСЂР°РІРѕРІС‹Рµ С„РѕСЂРјС‹ РґР»СЏ РєРѕРјРјРµСЂС‡РµСЃРєРѕР№ РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё РіСЂР°Р¶РґР°РЅ');
INSERT INTO businessentitytypeclassifier VALUES (76, '50102', 'Р�РЅРґРёРІРёРґСѓР°Р»СЊРЅС‹Рµ РїСЂРµРґРїСЂРёРЅРёРјР°С‚РµР»Рё');
INSERT INTO businessentitytypeclassifier VALUES (77, '12267', 'РќРµРїСѓР±Р»РёС‡РЅС‹Рµ Р°РєС†РёРѕРЅРµСЂРЅС‹Рµ РѕР±С‰РµСЃС‚РІР°');
INSERT INTO businessentitytypeclassifier VALUES (78, '12300', 'РћР±С‰РµСЃС‚РІР° СЃ РѕРіСЂР°РЅРёС‡РµРЅРЅРѕР№ РѕС‚РІРµС‚СЃС‚РІРµРЅРЅРѕСЃС‚СЊСЋ');
INSERT INTO businessentitytypeclassifier VALUES (79, '71602', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РєРѕРјРїР°РЅРёРё');
INSERT INTO businessentitytypeclassifier VALUES (80, '65200', 'РЈРЅРёС‚Р°СЂРЅС‹Рµ РїСЂРµРґРїСЂРёСЏС‚РёСЏ, РѕСЃРЅРѕРІР°РЅРЅС‹Рµ РЅР° РїСЂР°РІРµ С…РѕР·СЏР№СЃС‚РІРµРЅРЅРѕРіРѕ РІРµРґРµРЅРёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (81, '71600', 'РџСѓР±Р»РёС‡РЅРѕ-РїСЂР°РІРѕРІС‹Рµ РєРѕРјРїР°РЅРёРё');
INSERT INTO businessentitytypeclassifier VALUES (82, '71601', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё');
INSERT INTO businessentitytypeclassifier VALUES (83, '75404', 'РњСѓРЅРёС†РёРїР°Р»СЊРЅС‹Рµ РєР°Р·РµРЅРЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (84, '75403', 'РњСѓРЅРёС†РёРїР°Р»СЊРЅС‹Рµ Р±СЋРґР¶РµС‚РЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (85, '75401', 'РњСѓРЅРёС†РёРїР°Р»СЊРЅС‹Рµ Р°РІС‚РѕРЅРѕРјРЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (86, '75400', 'РЈС‡СЂРµР¶РґРµРЅРёСЏ, СЃРѕР·РґР°РЅРЅС‹Рµ РјСѓРЅРёС†РёРїР°Р»СЊРЅС‹Рј РѕР±СЂР°Р·РѕРІР°РЅРёРµРј (РјСѓРЅРёС†РёРїР°Р»СЊРЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ)');
INSERT INTO businessentitytypeclassifier VALUES (87, '75000', 'РЈС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypeclassifier VALUES (88, '70402', 'РќРµРіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РїРµРЅСЃРёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹');
INSERT INTO businessentitytypeclassifier VALUES (89, '70401', 'Р‘Р»Р°РіРѕС‚РІРѕСЂРёС‚РµР»СЊРЅС‹Рµ С„РѕРЅРґС‹');
INSERT INTO businessentitytypeclassifier VALUES (90, '70404', 'Р­РєРѕР»РѕРіРёС‡РµСЃРєРёРµ С„РѕРЅРґС‹');
INSERT INTO businessentitytypeclassifier VALUES (91, '70403', 'РћР±С‰РµСЃС‚РІРµРЅРЅС‹Рµ С„РѕРЅРґС‹');
INSERT INTO businessentitytypeclassifier VALUES (92, '71610', 'РћС‚РґРµР»РµРЅРёСЏ РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… РЅРµРєРѕРјРјРµСЂС‡РµСЃРєРёС… РЅРµРїСЂР°РІРёС‚РµР»СЊСЃС‚РІРµРЅРЅС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№');
INSERT INTO businessentitytypeclassifier VALUES (93, '12000', 'РҐРѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РѕР±С‰РµСЃС‚РІР°');
INSERT INTO businessentitytypeclassifier VALUES (94, '70400', 'Р¤РѕРЅРґС‹');
INSERT INTO businessentitytypeclassifier VALUES (95, '20701', 'РЎР°РґРѕРІРѕРґС‡РµСЃРєРёРµ, РѕРіРѕСЂРѕРґРЅРёС‡РµСЃРєРёРµ РёР»Рё РґР°С‡РЅС‹Рµ РЅРµРєРѕРјРјРµСЂС‡РµСЃРєРёРµ С‚РѕРІР°СЂРёС‰РµСЃС‚РІР°');
INSERT INTO businessentitytypeclassifier VALUES (96, '20700', 'РўРѕРІР°СЂРёС‰РµСЃС‚РІР° СЃРѕР±СЃС‚РІРµРЅРЅРёРєРѕРІ РЅРµРґРІРёР¶РёРјРѕСЃС‚Рё');
INSERT INTO businessentitytypeclassifier VALUES (97, '12247', 'РџСѓР±Р»РёС‡РЅС‹Рµ Р°РєС†РёРѕРЅРµСЂРЅС‹Рµ РѕР±С‰РµСЃС‚РІР°');
INSERT INTO businessentitytypeclassifier VALUES (98, '20115', 'РЎРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ Р¶РёРІРѕС‚РЅРѕРІРѕРґС‡РµСЃРєРёРµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypeclassifier VALUES (99, '20114', 'РЎРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ РѕРіРѕСЂРѕРґРЅРёС‡РµСЃРєРёРµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypeclassifier VALUES (100, '20113', 'РЎРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ СЃР°РґРѕРІРѕРґС‡РµСЃРєРёРµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypeclassifier VALUES (101, '20112', 'РЎРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ СЃРЅР°Р±Р¶РµРЅС‡РµСЃРєРёРµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypeclassifier VALUES (102, '65100', 'РЈРЅРёС‚Р°СЂРЅС‹Рµ РїСЂРµРґРїСЂРёСЏС‚РёСЏ, РѕСЃРЅРѕРІР°РЅРЅС‹Рµ РЅР° РїСЂР°РІРµ РѕРїРµСЂР°С‚РёРІРЅРѕРіРѕ СѓРїСЂР°РІР»РµРЅРёСЏ (РєР°Р·РµРЅРЅС‹Рµ РїСЂРµРґРїСЂРёСЏС‚РёСЏ)');
INSERT INTO businessentitytypeclassifier VALUES (103, '20111', 'РЎРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ РѕР±СЃР»СѓР¶РёРІР°СЋС‰РёРµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypeclassifier VALUES (104, '19000', 'РџСЂРѕС‡РёРµ СЋСЂРёРґРёС‡РµСЃРєРёРµ Р»РёС†Р°, СЏРІР»СЏСЋС‰РёРµСЃСЏ РєРѕРјРјРµСЂС‡РµСЃРєРёРјРё РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё');
INSERT INTO businessentitytypeclassifier VALUES (105, '20110', 'РЎРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ СЃР±С‹С‚РѕРІС‹Рµ (С‚РѕСЂРіРѕРІС‹Рµ) РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypeclassifier VALUES (106, '40002', 'РќРµРїСЂР°РІРёС‚РµР»СЊСЃС‚РІРµРЅРЅС‹Рµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹Рµ РѕСЂРіР°РЅРёР·Р°С†РёРё');
INSERT INTO businessentitytypeclassifier VALUES (107, '71500', 'Р РµР»РёРіРёРѕР·РЅС‹Рµ РѕСЂРіР°РЅРёР·Р°С†РёРё');
INSERT INTO businessentitytypeclassifier VALUES (108, '40001', 'РњРµР¶РїСЂР°РІРёС‚РµР»СЊСЃС‚РІРµРЅРЅС‹Рµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹Рµ РѕСЂРіР°РЅРёР·Р°С†РёРё');
INSERT INTO businessentitytypeclassifier VALUES (109, '75300', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ Р°РєР°РґРµРјРёРё РЅР°СѓРє');
INSERT INTO businessentitytypeclassifier VALUES (110, '11000', 'РҐРѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ С‚РѕРІР°СЂРёС‰РµСЃС‚РІР°');
INSERT INTO businessentitytypeclassifier VALUES (111, '20121', 'Р¤РѕРЅРґС‹ РїСЂРѕРєР°С‚Р°');
INSERT INTO businessentitytypeclassifier VALUES (112, '20120', 'РЎР°РґРѕРІРѕРґС‡РµСЃРєРёРµ, РѕРіРѕСЂРѕРґРЅРёС‡РµСЃРєРёРµ РёР»Рё РґР°С‡РЅС‹Рµ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypeclassifier VALUES (113, '14000', 'РџСЂРѕРёР·РІРѕРґСЃС‚РІРµРЅРЅС‹Рµ РєРѕРѕРїРµСЂР°С‚РёРІС‹ (Р°СЂС‚РµР»Рё) ');


--
-- TOC entry 4517 (class 0 OID 18727)
-- Dependencies: 211
-- Data for Name: businessentitytypecodeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO businessentitytypecodeclassifier VALUES (1, '11000', 'РҐРѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ С‚РѕРІР°СЂРёС‰РµСЃС‚РІР°');
INSERT INTO businessentitytypecodeclassifier VALUES (2, '11051', 'РџРѕР»РЅС‹Рµ С‚РѕРІР°СЂРёС‰РµСЃС‚РІ');
INSERT INTO businessentitytypecodeclassifier VALUES (3, '12000', 'РҐРѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РѕР±С‰РµСЃС‚РІР°');
INSERT INTO businessentitytypecodeclassifier VALUES (4, '12200', 'РђРєС†РёРѕРЅРµСЂРЅС‹Рµ РѕР±С‰РµСЃС‚РІР°');
INSERT INTO businessentitytypecodeclassifier VALUES (5, '12247', 'РџСѓР±Р»РёС‡РЅС‹Рµ Р°РєС†РёРѕРЅРµСЂРЅС‹Рµ РѕР±С‰РµСЃС‚РІР°');
INSERT INTO businessentitytypecodeclassifier VALUES (6, '12267', 'РќРµРїСѓР±Р»РёС‡РЅС‹Рµ Р°РєС†РёРѕРЅРµСЂРЅС‹Рµ РѕР±С‰РµСЃС‚РІР°');
INSERT INTO businessentitytypecodeclassifier VALUES (7, '12300', 'РћР±С‰РµСЃС‚РІР° СЃ РѕРіСЂР°РЅРёС‡РµРЅРЅРѕР№ РѕС‚РІРµС‚СЃС‚РІРµРЅРЅРѕСЃС‚СЊСЋ');
INSERT INTO businessentitytypecodeclassifier VALUES (8, '14000', 'РџСЂРѕРёР·РІРѕРґСЃС‚РІРµРЅРЅС‹Рµ РєРѕРѕРїРµСЂР°С‚РёРІС‹ (Р°СЂС‚РµР»Рё)');
INSERT INTO businessentitytypecodeclassifier VALUES (9, '14100', 'РЎРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РїСЂРѕРёР·РІРѕРґСЃС‚РІРµРЅРЅС‹Рµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypecodeclassifier VALUES (10, '14153', 'РЎРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ Р°СЂС‚РµР»Рё (РєРѕР»С…РѕР·С‹)');
INSERT INTO businessentitytypecodeclassifier VALUES (11, '14154', 'Р С‹Р±РѕР»РѕРІРµС†РєРёРµ Р°СЂС‚РµР»Рё (РєРѕР»С…РѕР·С‹)');
INSERT INTO businessentitytypecodeclassifier VALUES (12, '14155', 'РљРѕРѕРїРµСЂР°С‚РёРІРЅС‹Рµ С…РѕР·СЏР№СЃС‚РІР° (РєРѕРѕРїС…РѕР·С‹)');
INSERT INTO businessentitytypecodeclassifier VALUES (13, '14200', 'РџСЂРѕРёР·РІРѕРґСЃС‚РІРµРЅРЅС‹Рµ РєРѕРѕРїРµСЂР°С‚РёРІС‹ (РєСЂРѕРјРµ СЃРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹С… РїСЂРѕРёР·РІРѕРґСЃС‚РІРµРЅРЅС‹С… РєРѕРѕРїРµСЂР°С‚РёРІРѕРІ)');
INSERT INTO businessentitytypecodeclassifier VALUES (14, '15300', 'РљСЂРµСЃС‚СЊСЏРЅСЃРєРёРµ (С„РµСЂРјРµСЂСЃРєРёРµ) С…РѕР·СЏР№СЃС‚РІР°');
INSERT INTO businessentitytypecodeclassifier VALUES (15, '19000', 'РџСЂРѕС‡РёРµ СЋСЂРёРґРёС‡РµСЃРєРёРµ Р»РёС†Р°, СЏРІР»СЏСЋС‰РёРµСЃСЏ РєРѕРјРјРµСЂС‡РµСЃРєРёРјРё РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё');
INSERT INTO businessentitytypecodeclassifier VALUES (16, '20100', 'РџРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypecodeclassifier VALUES (17, '20101', 'Р“Р°СЂР°Р¶РЅС‹Рµ Рё РіР°СЂР°Р¶РЅРѕ-СЃС‚СЂРѕРёС‚РµР»СЊРЅС‹Рµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypecodeclassifier VALUES (18, '20102', 'Р–РёР»РёС‰РЅС‹Рµ РёР»Рё Р¶РёР»РёС‰РЅРѕ-СЃС‚СЂРѕРёС‚РµР»СЊРЅС‹Рµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypecodeclassifier VALUES (19, '20103', 'Р–РёР»РёС‰РЅС‹Рµ РЅР°РєРѕРїРёС‚РµР»СЊРЅС‹Рµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypecodeclassifier VALUES (20, '20104', 'РљСЂРµРґРёС‚РЅС‹Рµ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypecodeclassifier VALUES (21, '20105', 'РљСЂРµРґРёС‚РЅС‹Рµ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ РєРѕРѕРїРµСЂР°С‚РёРІС‹ РіСЂР°Р¶РґР°РЅ');
INSERT INTO businessentitytypecodeclassifier VALUES (22, '20106', 'РљСЂРµРґРёС‚РЅС‹Рµ РєРѕРѕРїРµСЂР°С‚РёРІС‹ РІС‚РѕСЂРѕРіРѕ СѓСЂРѕРІРЅСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (23, '20107', 'РџРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ РѕР±С‰РµСЃС‚РІР°');
INSERT INTO businessentitytypecodeclassifier VALUES (24, '20108', 'РћР±С‰РµСЃС‚РІР° РІР·Р°РёРјРЅРѕРіРѕ СЃС‚СЂР°С…РѕРІР°РЅРёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (25, '20109', 'РЎРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ РїРµСЂРµСЂР°Р±Р°С‚С‹РІР°СЋС‰РёРµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypecodeclassifier VALUES (26, '20110', 'РЎРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ СЃР±С‹С‚РѕРІС‹Рµ (С‚РѕСЂРіРѕРІС‹Рµ) РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypecodeclassifier VALUES (27, '20111', 'РЎРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ РѕР±СЃР»СѓР¶РёРІР°СЋС‰РёРµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypecodeclassifier VALUES (28, '20112', 'РЎРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ СЃРЅР°Р±Р¶РµРЅС‡РµСЃРєРёРµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypecodeclassifier VALUES (29, '20113', 'РЎРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ СЃР°РґРѕРІРѕРґС‡РµСЃРєРёРµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypecodeclassifier VALUES (30, '20114', 'РЎРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ РѕРіРѕСЂРѕРґРЅРёС‡РµСЃРєРёРµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypecodeclassifier VALUES (31, '20115', 'РЎРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ Р¶РёРІРѕС‚РЅРѕРІРѕРґС‡РµСЃРєРёРµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypecodeclassifier VALUES (32, '20120', 'РЎР°РґРѕРІРѕРґС‡РµСЃРєРёРµ, РѕРіРѕСЂРѕРґРЅРёС‡РµСЃРєРёРµ РёР»Рё РґР°С‡РЅС‹Рµ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёРµ РєРѕРѕРїРµСЂР°С‚РёРІС‹');
INSERT INTO businessentitytypecodeclassifier VALUES (33, '20121', 'Р¤РѕРЅРґС‹ РїСЂРѕРєР°С‚Р°');
INSERT INTO businessentitytypecodeclassifier VALUES (34, '20200', 'РћР±С‰РµСЃС‚РІРµРЅРЅС‹Рµ РѕСЂРіР°РЅРёР·Р°С†РёРё');
INSERT INTO businessentitytypecodeclassifier VALUES (35, '20201', 'РџРѕР»РёС‚РёС‡РµСЃРєРёРµ РїР°СЂС‚РёРё');
INSERT INTO businessentitytypecodeclassifier VALUES (36, '20202', 'РџСЂРѕС„СЃРѕСЋР·РЅС‹Рµ РѕСЂРіР°РЅРёР·Р°С†РёРё');
INSERT INTO businessentitytypecodeclassifier VALUES (37, '20210', 'РћР±С‰РµСЃС‚РІРµРЅРЅС‹Рµ РґРІРёР¶РµРЅРёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (38, '20211', 'РћСЂРіР°РЅС‹ РѕР±С‰РµСЃС‚РІРµРЅРЅРѕР№ СЃР°РјРѕРґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё');
INSERT INTO businessentitytypecodeclassifier VALUES (39, '20217', 'РўРµСЂСЂРёС‚РѕСЂРёР°Р»СЊРЅС‹Рµ РѕР±С‰РµСЃС‚РІРµРЅРЅС‹Рµ СЃР°РјРѕСѓРїСЂР°РІР»РµРЅРёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (40, '20600', 'РђСЃСЃРѕС†РёР°С†РёРё (СЃРѕСЋР·С‹)');
INSERT INTO businessentitytypecodeclassifier VALUES (41, '20601', 'РђСЃСЃРѕС†РёР°С†РёРё (СЃРѕСЋР·С‹) СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ РІР·Р°РёРјРѕРґРµР№СЃС‚РІРёСЏ СЃСѓР±СЉРµРєС‚РѕРІ');
INSERT INTO businessentitytypecodeclassifier VALUES (42, '20603', 'РЎРѕРІРµС‚С‹ РјСѓРЅРёС†РёРїР°Р»СЊРЅС‹С… РѕР±СЂР°Р·РѕРІР°РЅРёР№ СЃСѓР±СЉРµРєС‚РѕРІ');
INSERT INTO businessentitytypecodeclassifier VALUES (43, '20604', 'РЎРѕСЋР·С‹ (Р°СЃСЃРѕС†РёР°С†РёРё) РєСЂРµРґРёС‚РЅС‹С… РєРѕРѕРїРµСЂР°С‚РёРІРѕРІ');
INSERT INTO businessentitytypecodeclassifier VALUES (44, '20605', 'РЎРѕСЋР·С‹ (Р°СЃСЃРѕС†РёР°С†РёРё) РєРѕРѕРїРµСЂР°С‚РёРІРѕРІ');
INSERT INTO businessentitytypecodeclassifier VALUES (45, '20606', 'РЎРѕСЋР·С‹ (Р°СЃСЃРѕС†РёР°С†РёРё) РѕР±С‰РµСЃС‚РІРµРЅРЅС‹С… РѕР±СЉРµРґРёРЅРµРЅРёР№');
INSERT INTO businessentitytypecodeclassifier VALUES (46, '20607', 'РЎРѕСЋР·С‹ (Р°СЃСЃРѕС†РёР°С†РёРё) РѕР±С‰РёРЅ РјР°Р»РѕС‡РёСЃР»РµРЅРЅС‹С… РЅР°СЂРѕРґРѕРІ');
INSERT INTO businessentitytypecodeclassifier VALUES (47, '20608', 'РЎРѕСЋР·С‹ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєРёС… РѕР±С‰РµСЃС‚РІ');
INSERT INTO businessentitytypecodeclassifier VALUES (48, '20609', 'РђРґРІРѕРєР°С‚СЃРєРёРµ РїР°Р»Р°С‚С‹');
INSERT INTO businessentitytypecodeclassifier VALUES (49, '20610', 'РќРѕС‚Р°СЂРёР°Р»СЊРЅС‹Рµ РїР°Р»Р°С‚С‹');
INSERT INTO businessentitytypecodeclassifier VALUES (50, '20611', 'РўРѕСЂРіРѕРІРѕ-РїСЂРѕРјС‹С€Р»РµРЅРЅС‹Рµ РїР°Р»Р°С‚С‹');
INSERT INTO businessentitytypecodeclassifier VALUES (51, '20612', 'РћР±СЉРµРґРёРЅРµРЅРёСЏ СЂР°Р±РѕС‚РѕРґР°С‚РµР»РµР№');
INSERT INTO businessentitytypecodeclassifier VALUES (52, '20613', 'РћР±СЉРµРґРёРЅРµРЅРёСЏ С„РµСЂРјРµСЂСЃРєРёС… С…РѕР·СЏР№СЃС‚РІ');
INSERT INTO businessentitytypecodeclassifier VALUES (53, '20614', 'РќРµРєРѕРјРјРµСЂС‡РµСЃРєРёРµ РїР°СЂС‚РЅРµСЂСЃС‚РІР°');
INSERT INTO businessentitytypecodeclassifier VALUES (54, '20615', 'РђРґРІРѕРєР°С‚СЃРєРёРµ Р±СЋСЂРѕ');
INSERT INTO businessentitytypecodeclassifier VALUES (55, '20616', 'РљРѕР»Р»РµРіРёРё Р°РґРІРѕРєР°С‚РѕРІ');
INSERT INTO businessentitytypecodeclassifier VALUES (56, '20617', 'РЎР°РґРѕРІРѕРґС‡РµСЃРєРёРµ, РѕРіРѕСЂРѕРґРЅРёС‡РµСЃРєРёРµ РёР»Рё РґР°С‡РЅС‹Рµ РЅРµРєРѕРјРјРµСЂС‡РµСЃРєРёРµ РїР°СЂС‚РЅРµСЂСЃС‚РІР°');
INSERT INTO businessentitytypecodeclassifier VALUES (57, '20618', 'РђСЃСЃРѕС†РёР°С†РёРё (СЃРѕСЋР·С‹) СЃР°РґРѕРІРѕРґС‡РµСЃРєРёС…, РѕРіРѕСЂРѕРґРЅРёС‡РµСЃРєРёС… Рё РґР°С‡РЅС‹С… РЅРµРєРѕРјРјРµСЂС‡РµСЃРєРёС… РѕР±СЉРµРґРёРЅРµРЅРёР№');
INSERT INTO businessentitytypecodeclassifier VALUES (58, '20619', 'РЎР°РјРѕСЂРµРіСѓР»РёСЂСѓРµРјС‹Рµ РѕСЂРіР°РЅРёР·Р°С†РёРё');
INSERT INTO businessentitytypecodeclassifier VALUES (59, '20620', 'РћР±СЉРµРґРёРЅРµРЅРёСЏ (Р°СЃСЃРѕС†РёР°С†РёРё Рё СЃРѕСЋР·С‹) Р±Р»Р°РіРѕС‚РІРѕСЂРёС‚РµР»СЊРЅС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№');
INSERT INTO businessentitytypecodeclassifier VALUES (60, '20700', 'РўРѕРІР°СЂРёС‰РµСЃС‚РІР° СЃРѕР±СЃС‚РІРµРЅРЅРёРєРѕРІ РЅРµРґРІРёР¶РёРјРѕСЃС‚Рё');
INSERT INTO businessentitytypecodeclassifier VALUES (61, '20701', 'РЎР°РґРѕРІРѕРґС‡РµСЃРєРёРµ, РѕРіРѕСЂРѕРґРЅРёС‡РµСЃРєРёРµ РёР»Рё РґР°С‡РЅС‹Рµ РЅРµРєРѕРјРјРµСЂС‡РµСЃРєРёРµ С‚РѕРІР°СЂРёС‰РµСЃС‚РІР°');
INSERT INTO businessentitytypecodeclassifier VALUES (62, '20716', 'РўРѕРІР°СЂРёС‰РµСЃС‚РІР° СЃРѕР±СЃС‚РІРµРЅРЅРёРєРѕРІ Р¶РёР»СЊСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (63, '3000', 'РҐРѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РїР°СЂС‚РЅРµСЂСЃС‚РІР°');
INSERT INTO businessentitytypecodeclassifier VALUES (64, '30001', 'РџСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІР° СЋСЂРёРґРёС‡РµСЃРєРёС… Р»РёС†');
INSERT INTO businessentitytypecodeclassifier VALUES (65, '30002', 'Р¤РёР»РёР°Р»С‹ СЋСЂРёРґРёС‡РµСЃРєРёС… Р»РёС†');
INSERT INTO businessentitytypecodeclassifier VALUES (66, '30003', 'РћР±РѕСЃРѕР±Р»РµРЅРЅС‹Рµ РїРѕРґСЂР°Р·РґРµР»РµРЅРёСЏ СЋСЂРёРґРёС‡РµСЃРєРёС… Р»РёС†');
INSERT INTO businessentitytypecodeclassifier VALUES (67, '30004', 'РЎС‚СЂСѓРєС‚СѓСЂРЅС‹Рµ РїРѕРґСЂР°Р·РґРµР»РµРЅРёСЏ РѕР±РѕСЃРѕР±Р»РµРЅРЅС‹С… РїРѕРґСЂР°Р·РґРµР»РµРЅРёР№ СЋСЂРёРґРёС‡РµСЃРєРёС… Р»РёС†');
INSERT INTO businessentitytypecodeclassifier VALUES (68, '30005', 'РџР°РµРІС‹Рµ РёРЅРІРµСЃС‚РёС†РёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹');
INSERT INTO businessentitytypecodeclassifier VALUES (69, '30006', 'РџСЂРѕСЃС‚С‹Рµ С‚РѕРІР°СЂРёС‰РµСЃС‚РІР°');
INSERT INTO businessentitytypecodeclassifier VALUES (70, '30008', 'Р Р°Р№РѕРЅРЅС‹Рµ СЃСѓРґС‹, РіРѕСЂРѕРґСЃРєРёРµ СЃСѓРґС‹, РјРµР¶СЂР°Р№РѕРЅРЅС‹Рµ СЃСѓРґС‹ (СЂР°Р№РѕРЅРЅС‹Рµ СЃСѓРґС‹)');
INSERT INTO businessentitytypecodeclassifier VALUES (71, '40001', 'РњРµР¶РїСЂР°РІРёС‚РµР»СЊСЃС‚РІРµРЅРЅС‹Рµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹Рµ РѕСЂРіР°РЅРёР·Р°С†РёРё');
INSERT INTO businessentitytypecodeclassifier VALUES (72, '40002', 'РќРµРїСЂР°РІРёС‚РµР»СЊСЃС‚РІРµРЅРЅС‹Рµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹Рµ РѕСЂРіР°РЅРёР·Р°С†РёРё');
INSERT INTO businessentitytypecodeclassifier VALUES (73, '50100', 'РћСЂРіР°РЅРёР·Р°С†РёРѕРЅРЅРѕ-РїСЂР°РІРѕРІС‹Рµ С„РѕСЂРјС‹ РґР»СЏ РєРѕРјРјРµСЂС‡РµСЃРєРѕР№ РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё РіСЂР°Р¶РґР°РЅ');
INSERT INTO businessentitytypecodeclassifier VALUES (74, '50101', 'Р“Р»Р°РІС‹ РєСЂРµСЃС‚СЊСЏРЅСЃРєРёС… (С„РµСЂРјРµСЂСЃРєРёС…) С…РѕР·СЏР№СЃС‚РІ');
INSERT INTO businessentitytypecodeclassifier VALUES (75, '50102', 'Р�РЅРґРёРІРёРґСѓР°Р»СЊРЅС‹Рµ РїСЂРµРґРїСЂРёРЅРёРјР°С‚РµР»Рё');
INSERT INTO businessentitytypecodeclassifier VALUES (76, '50200', 'РћСЂРіР°РЅРёР·Р°С†РёРѕРЅРЅРѕ-РїСЂР°РІРѕРІС‹Рµ С„РѕСЂРјС‹ РґР»СЏ РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё РіСЂР°Р¶РґР°РЅ, РЅРµ РѕС‚РЅРµСЃРµРЅРЅРѕР№ Рє РїСЂРµРґРїСЂРёРЅРёРјР°С‚РµР»СЊСЃС‚РІСѓ');
INSERT INTO businessentitytypecodeclassifier VALUES (77, '50201', 'РђРґРІРѕРєР°С‚С‹, СѓС‡СЂРµРґРёРІС€РёРµ Р°РґРІРѕРєР°С‚СЃРєРёР№ РєР°Р±РёРЅРµС‚');
INSERT INTO businessentitytypecodeclassifier VALUES (78, '50202', 'РќРѕС‚Р°СЂРёСѓСЃС‹, Р·Р°РЅРёРјР°СЋС‰РёРµСЃСЏ С‡Р°СЃС‚РЅРѕР№ РїСЂР°РєС‚РёРєРѕР№');
INSERT INTO businessentitytypecodeclassifier VALUES (79, '65000', 'РЈРЅРёС‚Р°СЂРЅС‹Рµ РїСЂРµРґРїСЂРёСЏС‚РёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (80, '65100', 'РЈРЅРёС‚Р°СЂРЅС‹Рµ РїСЂРµРґРїСЂРёСЏС‚РёСЏ, РѕСЃРЅРѕРІР°РЅРЅС‹Рµ РЅР° РїСЂР°РІРµ РѕРїРµСЂР°С‚РёРІРЅРѕРіРѕ СѓРїСЂР°РІР»РµРЅРёСЏ (РєР°Р·РµРЅРЅС‹Рµ РїСЂРµРґРїСЂРёСЏС‚РёСЏ)');
INSERT INTO businessentitytypecodeclassifier VALUES (81, '65141', 'Р¤РµРґРµСЂР°Р»СЊРЅС‹Рµ РєР°Р·РµРЅРЅС‹Рµ РїСЂРµРґРїСЂРёСЏС‚РёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (82, '65142', 'РљР°Р·РµРЅРЅС‹Рµ РїСЂРµРґРїСЂРёСЏС‚РёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (83, '65143', 'РњСѓРЅРёС†РёРїР°Р»СЊРЅС‹Рµ РєР°Р·РµРЅРЅС‹Рµ РїСЂРµРґРїСЂРёСЏС‚РёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (84, '65200', 'РЈРЅРёС‚Р°СЂРЅС‹Рµ РїСЂРµРґРїСЂРёСЏС‚РёСЏ, РѕСЃРЅРѕРІР°РЅРЅС‹Рµ РЅР° РїСЂР°РІРµ С…РѕР·СЏР№СЃС‚РІРµРЅРЅРѕРіРѕ РІРµРґРµРЅРёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (85, '65241', 'Р¤РµРґРµСЂР°Р»СЊРЅС‹Рµ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ СѓРЅРёС‚Р°СЂРЅС‹Рµ РїСЂРµРґРїСЂРёСЏС‚РёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (86, '65242', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ СѓРЅРёС‚Р°СЂРЅС‹Рµ РїСЂРµРґРїСЂРёСЏС‚РёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (87, '65243', 'РњСѓРЅРёС†РёРїР°Р»СЊРЅС‹Рµ СѓРЅРёС‚Р°СЂРЅС‹Рµ РїСЂРµРґРїСЂРёСЏС‚РёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (88, '70400', 'Р¤РѕРЅРґС‹');
INSERT INTO businessentitytypecodeclassifier VALUES (89, '70401', 'Р‘Р»Р°РіРѕС‚РІРѕСЂРёС‚РµР»СЊРЅС‹Рµ С„РѕРЅРґС‹');
INSERT INTO businessentitytypecodeclassifier VALUES (90, '70402', 'РќРµРіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РїРµРЅСЃРёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹');
INSERT INTO businessentitytypecodeclassifier VALUES (91, '70403', 'РћР±С‰РµСЃС‚РІРµРЅРЅС‹Рµ С„РѕРЅРґС‹');
INSERT INTO businessentitytypecodeclassifier VALUES (92, '70404', 'Р­РєРѕР»РѕРіРёС‡РµСЃРєРёРµ С„РѕРЅРґС‹');
INSERT INTO businessentitytypecodeclassifier VALUES (93, '71400', 'РђРІС‚РѕРЅРѕРјРЅС‹Рµ РЅРµРєРѕРјРјРµСЂС‡РµСЃРєРёРµ РѕСЂРіР°РЅРёР·Р°С†РёРё');
INSERT INTO businessentitytypecodeclassifier VALUES (94, '71500', 'Р РµР»РёРіРёРѕР·РЅС‹Рµ РѕСЂРіР°РЅРёР·Р°С†РёРё');
INSERT INTO businessentitytypecodeclassifier VALUES (95, '71600', 'РџСѓР±Р»РёС‡РЅРѕ-РїСЂР°РІРѕРІС‹Рµ РєРѕРјРїР°РЅРёРё');
INSERT INTO businessentitytypecodeclassifier VALUES (96, '71601', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё');
INSERT INTO businessentitytypecodeclassifier VALUES (97, '71602', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РєРѕРјРїР°РЅРёРё');
INSERT INTO businessentitytypecodeclassifier VALUES (98, '71610', 'РћС‚РґРµР»РµРЅРёСЏ РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… РЅРµРєРѕРјРјРµСЂС‡РµСЃРєРёС… РЅРµРїСЂР°РІРёС‚РµР»СЊСЃС‚РІРµРЅРЅС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№');
INSERT INTO businessentitytypecodeclassifier VALUES (99, '75000', 'РЈС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (100, '75101', 'Р¤РµРґРµСЂР°Р»СЊРЅС‹Рµ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ Р°РІС‚РѕРЅРѕРјРЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (101, '75103', 'Р¤РµРґРµСЂР°Р»СЊРЅС‹Рµ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ Р±СЋРґР¶РµС‚РЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (102, '75104', 'Р¤РµРґРµСЂР°Р»СЊРЅС‹Рµ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РєР°Р·РµРЅРЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (103, '75201', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ Р°РІС‚РѕРЅРѕРјРЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (104, '75203', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ Р±СЋРґР¶РµС‚РЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (105, '75204', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РєР°Р·РµРЅРЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (106, '75300', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ Р°РєР°РґРµРјРёРё РЅР°СѓРє');
INSERT INTO businessentitytypecodeclassifier VALUES (107, '75400', 'РЈС‡СЂРµР¶РґРµРЅРёСЏ, СЃРѕР·РґР°РЅРЅС‹Рµ РјСѓРЅРёС†РёРїР°Р»СЊРЅС‹Рј РѕР±СЂР°Р·РѕРІР°РЅРёРµРј (РјСѓРЅРёС†РёРїР°Р»СЊРЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ)');
INSERT INTO businessentitytypecodeclassifier VALUES (108, '75401', 'РњСѓРЅРёС†РёРїР°Р»СЊРЅС‹Рµ Р°РІС‚РѕРЅРѕРјРЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (109, '75403', 'РњСѓРЅРёС†РёРїР°Р»СЊРЅС‹Рµ Р±СЋРґР¶РµС‚РЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (110, '75404', 'РњСѓРЅРёС†РёРїР°Р»СЊРЅС‹Рµ РєР°Р·РµРЅРЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (111, '75500', 'Р§Р°СЃС‚РЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (112, '75502', 'Р‘Р»Р°РіРѕС‚РІРѕСЂРёС‚РµР»СЊРЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO businessentitytypecodeclassifier VALUES (113, '75505', 'РћР±С‰РµСЃС‚РІРµРЅРЅС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');


--
-- TOC entry 4519 (class 0 OID 18735)
-- Dependencies: 213
-- Data for Name: cargolocationclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO cargolocationclassifier VALUES (1, '11', 'РЎРєР»Р°Рґ РІСЂРµРјРµРЅРЅРѕРіРѕ С…СЂР°РЅРµРЅРёСЏ', NULL, NULL);
INSERT INTO cargolocationclassifier VALUES (2, '21', 'РўР°РјРѕР¶РµРЅРЅС‹Р№ СЃРєР»Р°Рґ', NULL, NULL);
INSERT INTO cargolocationclassifier VALUES (3, '22', 'РњР°РіР°Р·РёРЅ Р±РµСЃРїРѕС€Р»РёРЅРЅРѕР№ С‚РѕСЂРіРѕРІР»Рё', NULL, NULL);
INSERT INTO cargolocationclassifier VALUES (4, '25', 'РЎРІРѕР±РѕРґРЅС‹Р№ СЃРєР»Р°Рґ', NULL, NULL);
INSERT INTO cargolocationclassifier VALUES (5, '31', 'РЎРєР»Р°Рґ РїРѕР»СѓС‡Р°С‚РµР»СЏ С‚РѕРІР°СЂРѕРІ', NULL, NULL);
INSERT INTO cargolocationclassifier VALUES (6, '60', 'РџРѕРјРµС‰РµРЅРёРµ, РѕС‚РєСЂС‹С‚Р°СЏ РїР»РѕС‰Р°РґРєР° Рё РёРЅР°СЏ С‚РµСЂСЂРёС‚РѕСЂРёСЏ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ РѕРїРµСЂР°С‚РѕСЂР°', NULL, NULL);
INSERT INTO cargolocationclassifier VALUES (7, '80', 'РЎРІРѕР±РѕРґРЅР°СЏ (СЃРїРµС†РёР°Р»СЊРЅР°СЏ, РѕСЃРѕР±Р°СЏ) СЌРєРѕРЅРѕРјРёС‡РµСЃРєР°СЏ Р·РѕРЅР°', NULL, NULL);
INSERT INTO cargolocationclassifier VALUES (8, '41', 'РЎРєР»Р°Рґ С…СЂР°РЅРµРЅРёСЏ СЃРѕР±СЃС‚РІРµРЅРЅС‹С… С‚РѕРІР°СЂРѕРІ', 'KZ', NULL);
INSERT INTO cargolocationclassifier VALUES (9, '52', 'РўСЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ', 'KZ', NULL);
INSERT INTO cargolocationclassifier VALUES (10, '92', 'РЎРєР»Р°Рґ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР°', 'RU', NULL);
INSERT INTO cargolocationclassifier VALUES (11, '93', 'РћС‚РґРµР»СЊРЅС‹Рµ РїРѕРјРµС‰РµРЅРёСЏ РІ РјРµСЃС‚Р°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕРіРѕ РїРѕС‡С‚РѕРІРѕРіРѕ РѕР±РјРµРЅР°', 'RU', NULL);
INSERT INTO cargolocationclassifier VALUES (12, '94', 'РњРµСЃС‚Рѕ С…СЂР°РЅРµРЅРёСЏ РЅРµРїРѕР»СѓС‡РµРЅРЅРѕРіРѕ РёР»Рё РЅРµРІРѕСЃС‚СЂРµР±РѕРІР°РЅРЅРѕРіРѕ Р±Р°РіР°Р¶Р°, РїРµСЂРµРјРµС‰Р°РµРјРѕРіРѕ РІ СЂР°РјРєР°С… РґРѕРіРѕРІРѕСЂР° Р°РІРёР°С†РёРѕРЅРЅРѕР№ РёР»Рё Р¶РµР»РµР·РЅРѕРґРѕСЂРѕР¶РЅРѕР№ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂР°', 'RU', NULL);
INSERT INTO cargolocationclassifier VALUES (13, '95', 'РњРµСЃС‚Рѕ СЂР°Р·РіСЂСѓР·РєРё Рё РїРµСЂРµРіСЂСѓР·РєРё (РїРµСЂРµРІР°Р»РєРё) С‚РѕРІР°СЂРѕРІ РІ РїСЂРµРґРµР»Р°С… С‚РµСЂСЂРёС‚РѕСЂРёРё РјРѕСЂСЃРєРѕРіРѕ (СЂРµС‡РЅРѕРіРѕ) РїРѕСЂС‚Р°', 'RU', NULL);
INSERT INTO cargolocationclassifier VALUES (14, '96', 'РЎРїРµС†РёР°Р»СЊРЅРѕ РѕР±РѕСЂСѓРґРѕРІР°РЅРЅРѕРµ РјРµСЃС‚Рѕ СЂР°Р·РіСЂСѓР·РєРё Рё РїРµСЂРµРіСЂСѓР·РєРё (РїРµСЂРµРІР°Р»РєРё) РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… С‚РѕРІР°СЂРѕРІ РІ РїСЂРµРґРµР»Р°С… СЂРµР¶РёРјРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё Р°СЌСЂРѕРїРѕСЂС‚Р° РїСЂРё СѓСЃР»РѕРІРёРё, С‡С‚Рѕ РјРµСЃС‚Рѕ РІРІРѕР·Р° С‚Р°РєРёС… С‚РѕРІР°СЂРѕРІ РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ Рё РјРµСЃС‚Рѕ РёС… РІС‹РІРѕР·Р° РёР· Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё СЃРѕРІРїР°РґР°СЋС‚', 'RU', NULL);
INSERT INTO cargolocationclassifier VALUES (15, '97', 'Р–РµР»РµР·РЅРѕРґРѕСЂРѕР¶РЅС‹Рµ РїСѓС‚Рё Рё РєРѕРЅС‚РµР№РЅРµСЂРЅС‹Рµ РїР»РѕС‰Р°РґРєРё, СЂР°СЃРїРѕР»РѕР¶РµРЅРЅС‹Рµ РІ СЃРѕРіР»Р°СЃРѕРІР°РЅРЅС‹С… СЃ С‚Р°РјРѕР¶РµРЅРЅС‹РјРё РѕСЂРіР°РЅР°РјРё РјРµСЃС‚Р°С… РІ РїСЂРµРґРµР»Р°С… Р¶РµР»РµР·РЅРѕРґРѕСЂРѕР¶РЅС‹С… СЃС‚Р°РЅС†РёР№ Рё РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РІСЂРµРјРµРЅРЅРѕРіРѕ С…СЂР°РЅРµРЅРёСЏ С‚РѕРІР°СЂРѕРІ Р±РµР· РёС… РІС‹РіСЂСѓР·РєРё РёР· С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ', 'RU', NULL);
INSERT INTO cargolocationclassifier VALUES (16, '99', 'Р�РЅРѕРµ РјРµСЃС‚Рѕ РЅР°С…РѕР¶РґРµРЅРёСЏ С‚РѕРІР°СЂРѕРІ', NULL, NULL);


--
-- TOC entry 4521 (class 0 OID 18743)
-- Dependencies: 215
-- Data for Name: cargopackagekindsclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO cargopackagekindsclassifier VALUES (1, '1A', 'Р‘Р°СЂР°Р±Р°РЅ СЃС‚Р°Р»СЊРЅРѕР№', 'Drum, steel', '');
INSERT INTO cargopackagekindsclassifier VALUES (2, '1B', 'Р‘Р°СЂР°Р±Р°РЅ, Р°Р»СЋРјРёРЅРёРµРІС‹Р№', 'Drum, aluminium', '');
INSERT INTO cargopackagekindsclassifier VALUES (3, '1D', 'Р‘Р°СЂР°Р±Р°РЅ С„Р°РЅРµСЂРЅС‹Р№', 'Drum, plywood', '');
INSERT INTO cargopackagekindsclassifier VALUES (4, '1F', 'РљРѕРЅС‚РµР№РЅРµСЂ, РіРёР±РєРёР№', 'Container, flexible', '');
INSERT INTO cargopackagekindsclassifier VALUES (5, '1G', 'Р‘Р°СЂР°Р±Р°РЅ С„РёР±СЂРѕРІС‹Р№', 'Drum, fibre', '');
INSERT INTO cargopackagekindsclassifier VALUES (6, '1W', 'Р‘Р°СЂР°Р±Р°РЅ, РґРµСЂРµРІСЏРЅРЅС‹Р№', 'Drum, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (7, '2C', 'Р‘РѕС‡РєР° (РµРјРєРѕСЃС‚СЊСЋ РѕРєРѕР»Рѕ 164 Р») РґРµСЂРµРІСЏРЅРЅР°СЏ', 'Barrel, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (8, '3A', 'РљР°РЅРёСЃС‚СЂР°, СЃС‚Р°Р»СЊРЅР°СЏ', 'Jerrycan, steel', '');
INSERT INTO cargopackagekindsclassifier VALUES (9, '3H', 'РљР°РЅРёСЃС‚СЂР°, РїР»Р°СЃС‚РјР°СЃСЃРѕРІР°СЏ', 'Jerrycan, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (10, '43', 'РњРµС€РѕРє Р±РѕР»СЊС€РѕР№ РґР»СЏ РєСЂСѓРїРЅРѕСЂР°Р·РјРµСЂРЅС‹С… РЅР°РІР°Р»РѕС‡РЅС‹С… РіСЂСѓР·РѕРІ', 'Bag, super bulk', '');
INSERT INTO cargopackagekindsclassifier VALUES (11, '44', 'РњРµС€РѕРє РїРѕР»РёСЌС‚РёР»РµРЅРѕРІС‹Р№', 'Bag, polybag', '');
INSERT INTO cargopackagekindsclassifier VALUES (12, '4A', 'РљРѕСЂРѕР±РєР°, СЃС‚Р°Р»СЊРЅР°СЏ', 'Box, steel', '');
INSERT INTO cargopackagekindsclassifier VALUES (13, '4B', 'РљРѕСЂРѕР±РєР°, Р°Р»СЋРјРёРЅРёРµРІР°СЏ', 'Box, aluminium', '');
INSERT INTO cargopackagekindsclassifier VALUES (14, '4C', 'РљРѕСЂРѕР±РєР° РёР· РµСЃС‚РµСЃС‚РІРµРЅРЅРѕР№ РґСЂРµРІРµСЃРёРЅС‹', 'Box, natural wood', '');
INSERT INTO cargopackagekindsclassifier VALUES (15, '4D', 'РљРѕСЂРѕР±РєР°, С„Р°РЅРµСЂРЅР°СЏ', 'Box, plywood', '');
INSERT INTO cargopackagekindsclassifier VALUES (16, '4F', 'РљРѕСЂРѕР±РєР° РёР· РґСЂРµРІРµСЃРЅРѕРіРѕ РјР°С‚РµСЂРёР°Р»Р°', 'Box, reconstituted wood', '');
INSERT INTO cargopackagekindsclassifier VALUES (17, '4G', 'РљРѕСЂРѕР±РєР° РёР· С„РёР±СЂРѕРІРѕРіРѕ РєР°СЂС‚РѕРЅР°', 'Box, fibreboard', '');
INSERT INTO cargopackagekindsclassifier VALUES (18, '4H', 'РљРѕСЂРѕР±РєР°, РїР»Р°СЃС‚РјР°СЃСЃРѕРІР°СЏ', 'Box, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (19, '5H', 'РњРµС€РѕРє РёР· РїРѕР»РёРјРµСЂРЅРѕР№ С‚РєР°РЅРё', 'Bag, woven plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (20, '5L', 'РњРµС€РѕРє С‚РµРєСЃС‚РёР»СЊРЅС‹Р№', 'Bag, textile', '');
INSERT INTO cargopackagekindsclassifier VALUES (21, '5M', 'РњРµС€РѕРє, Р±СѓРјР°Р¶РЅС‹Р№', 'Bag, paper', '');
INSERT INTO cargopackagekindsclassifier VALUES (22, '6H', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№ СЃРѕСЃСѓРґ', 'Composite packaging, plastic receptacle', '');
INSERT INTO cargopackagekindsclassifier VALUES (23, '6P', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: СЃС‚РµРєР»СЏРЅРЅС‹Р№ СЃРѕСЃСѓРґ', 'Composite packaging, glass receptacle', '');
INSERT INTO cargopackagekindsclassifier VALUES (24, '7A', 'РЇС‰РёРє Р°РІС‚РѕРјРѕР±РёР»СЊРЅС‹Р№', 'Case, car', '');
INSERT INTO cargopackagekindsclassifier VALUES (25, '7B', 'РЇС‰РёРє РґРµСЂРµРІСЏРЅРЅС‹Р№', 'Case, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (26, '8A', 'РџРѕРґРґРѕРЅ РґРµСЂРµРІСЏРЅРЅС‹Р№', 'Pallet, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (27, '8B', 'РЇС‰РёРє РґРµСЂРµРІСЏРЅРЅС‹Р№', 'Crate, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (28, '8C', 'РџР°С‡РєР° РґРµСЂРµРІСЏРЅРЅР°СЏ', 'Bundle, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (29, 'AA', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РёР· Р¶РµСЃС‚РєРѕР№ РїР»Р°СЃС‚РјР°СЃСЃС‹', 'Intermediate bulk container, rigid plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (30, 'AB', 'РЎРѕСЃСѓРґ, С„РёР±СЂРѕРІС‹Р№', 'Receptacle, fibre', '');
INSERT INTO cargopackagekindsclassifier VALUES (31, 'AC', 'РЎРѕСЃСѓРґ, Р±СѓРјР°Р¶РЅС‹Р№', 'Receptacle, paper', '');
INSERT INTO cargopackagekindsclassifier VALUES (32, 'AD', 'РЎРѕСЃСѓРґ, РґРµСЂРµРІСЏРЅРЅС‹Р№', 'Receptacle, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (33, 'AE', 'РђСЌСЂРѕР·РѕР»СЊРЅР°СЏ СѓРїР°РєРѕРІРєР°', 'Aerosol', '');
INSERT INTO cargopackagekindsclassifier VALUES (34, 'AF', 'РџРѕРґРґРѕРЅ РјРѕРґСѓР»СЊРЅС‹Р№ СЃ РѕР±РµС‡Р°Р№РєРѕР№ 80 x 60 СЃРј', 'Pallet, modular, collars 80 cm x 60 cm', '');
INSERT INTO cargopackagekindsclassifier VALUES (35, 'AG', 'РџРѕРґРґРѕРЅ РІ С‚РµСЂРјРѕСѓСЃР°РґРѕС‡РЅРѕР№ РїР»РµРЅРєРµ', 'Pallet, shrink-wrapped', '');
INSERT INTO cargopackagekindsclassifier VALUES (36, 'AH', 'РџРѕРґРґРѕРЅ 100 x 110 СЃРј', 'Pallet, 100 cm x 110 cm', '');
INSERT INTO cargopackagekindsclassifier VALUES (37, 'AI', 'Р“СЂРµР№С„РµСЂРЅС‹Р№ РєРѕРІС€', 'Clamshell', '');
INSERT INTO cargopackagekindsclassifier VALUES (38, 'AJ', 'РљСѓР»РµРє', 'Cone', '');
INSERT INTO cargopackagekindsclassifier VALUES (39, 'AL', 'РЁР°СЂ', 'Ball', '');
INSERT INTO cargopackagekindsclassifier VALUES (40, 'AM', 'РђРјРїСѓР»Р°, РЅРµР·Р°С‰РёС‰РµРЅРЅР°СЏ', 'Ampoule, non-protected', '');
INSERT INTO cargopackagekindsclassifier VALUES (41, 'AP', 'РђРјРїСѓР»Р°, Р·Р°С‰РёС‰РµРЅРЅР°СЏ', 'Ampoule, protected', '');
INSERT INTO cargopackagekindsclassifier VALUES (42, 'AT', 'РџСѓР»СЊРІРµСЂРёР·Р°С‚РѕСЂ', 'Atomizer', '');
INSERT INTO cargopackagekindsclassifier VALUES (43, 'AV', 'РљР°РїСЃСѓР»Р°', 'Capsule', '');
INSERT INTO cargopackagekindsclassifier VALUES (44, 'B4', 'Р›РµРЅС‚Р°', 'Belt', '');
INSERT INTO cargopackagekindsclassifier VALUES (45, 'BA', 'Р‘РѕС‡РєР° (РµРјРєРѕСЃС‚СЊСЋ РѕРєРѕР»Рѕ 164 Р»)', 'Barrel', '');
INSERT INTO cargopackagekindsclassifier VALUES (46, 'BB', 'Р‘РѕР±РёРЅР°', 'Bobbin', '');
INSERT INTO cargopackagekindsclassifier VALUES (47, 'BC', 'РЇС‰РёРє СЂРµС€РµС‚С‡Р°С‚С‹Р№ РґР»СЏ Р±СѓС‚С‹Р»РѕРє', 'Bottlecrate/bottlerack', '');
INSERT INTO cargopackagekindsclassifier VALUES (48, 'BD', 'Р”РѕСЃРєР°', 'Board', '');
INSERT INTO cargopackagekindsclassifier VALUES (49, 'BE', 'РџР°РєРµС‚ (РїР°С‡РєР°/СЃРІСЏР·РєР°)', 'Bundle', '');
INSERT INTO cargopackagekindsclassifier VALUES (50, 'BF', 'Р‘Р°Р»Р»РѕРЅ, РЅРµР·Р°С‰РёС‰РµРЅРЅС‹Р№', 'Balloon, non-protected', '');
INSERT INTO cargopackagekindsclassifier VALUES (51, 'BG', 'РњРµС€РѕРє', 'Bag', '');
INSERT INTO cargopackagekindsclassifier VALUES (52, 'BH', 'РџР°С‡РєР° (РїР°РєРµС‚/СЃРІСЏР·РєР°)', 'Bunch', '');
INSERT INTO cargopackagekindsclassifier VALUES (53, 'BI', 'Р‘СѓРЅРєРµСЂ', 'Bin', '');
INSERT INTO cargopackagekindsclassifier VALUES (54, 'BJ', 'Р‘Р°РґСЊСЏ', 'Bucket', '');
INSERT INTO cargopackagekindsclassifier VALUES (55, 'BK', 'РљРѕСЂР·РёРЅР°', 'Basket', '');
INSERT INTO cargopackagekindsclassifier VALUES (56, 'BL', 'РљРёРїР°, СЃРїСЂРµСЃСЃРѕРІР°РЅРЅР°СЏ', 'Bale, compressed', '');
INSERT INTO cargopackagekindsclassifier VALUES (57, 'BM', 'Р§Р°РЅ', 'Basin', '');
INSERT INTO cargopackagekindsclassifier VALUES (58, 'BN', 'РљРёРїР°, РЅРµСЃРїСЂРµСЃСЃРѕРІР°РЅРЅР°СЏ', 'Bale, non-compressed', '');
INSERT INTO cargopackagekindsclassifier VALUES (59, 'BO', 'Р‘СѓС‚С‹Р»РєР° С†РёР»РёРЅРґСЂРёС‡РµСЃРєР°СЏ РЅРµР·Р°С‰РёС‰РµРЅРЅР°СЏ', 'Bottle, non-protected, cylindrical', '');
INSERT INTO cargopackagekindsclassifier VALUES (60, 'BP', 'Р‘Р°Р»Р»РѕРЅ, Р·Р°С‰РёС‰РµРЅРЅС‹Р№', 'Balloon, protected', '');
INSERT INTO cargopackagekindsclassifier VALUES (61, 'BQ', 'Р‘СѓС‚С‹Р»РєР° С†РёР»РёРЅРґСЂРёС‡РµСЃРєР°СЏ Р·Р°С‰РёС‰РµРЅРЅР°СЏ', 'Bottle, protected cylindrical', '');
INSERT INTO cargopackagekindsclassifier VALUES (62, 'BR', 'Р‘СЂСѓСЃ (Р±СЂСѓСЃРѕРє)', 'Bar', '');
INSERT INTO cargopackagekindsclassifier VALUES (63, 'BS', 'Р‘СѓС‚С‹Р»РєР° СЃ РІС‹РїСѓРєР»С‹РјРё СЃС‚РµРЅРєР°РјРё РЅРµР·Р°С‰РёС‰РµРЅРЅР°СЏ', 'Bottle, non-protected, bulbous', '');
INSERT INTO cargopackagekindsclassifier VALUES (64, 'BT', 'Р СѓР»РѕРЅ (РѕР±РёРІРѕС‡РЅРѕРіРѕ РёР»Рё РЅР°СЃС‚РёР»РѕС‡РЅРѕРіРѕ РјР°С‚РµСЂРёР°Р»Р°)', 'Bolt', '');
INSERT INTO cargopackagekindsclassifier VALUES (65, 'BU', 'Р‘РѕС‡РєР° РґР»СЏ РІРёРЅР° РёР»Рё РїРёРІР°', 'Butt', '');
INSERT INTO cargopackagekindsclassifier VALUES (66, 'BV', 'Р‘СѓС‚С‹Р»РєР° СЃ РІС‹РїСѓРєР»С‹РјРё СЃС‚РµРЅРєР°РјРё Р·Р°С‰РёС‰РµРЅРЅР°СЏ', 'Bottle, protected bulbous', '');
INSERT INTO cargopackagekindsclassifier VALUES (67, 'BW', 'РљРѕСЂРѕР±РєР° РґР»СЏ Р¶РёРґРєРѕСЃС‚РµР№', 'Box, for liquids', '');
INSERT INTO cargopackagekindsclassifier VALUES (68, 'BX', 'РљРѕСЂРѕР±РєР°', 'Box', '');
INSERT INTO cargopackagekindsclassifier VALUES (69, 'BY', 'Р”РѕСЃРєР° РІ РїР°РєРµС‚Рµ/РїР°С‡РєРµ/СЃРІСЏР·РєРµ', 'Board, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (70, 'BZ', 'Р‘СЂСѓСЃ (Р±СЂСѓСЃРѕРє) РІ РїР°РєРµС‚Рµ/РїР°С‡РєРµ/СЃРІСЏР·РєРµ', 'Bars, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (71, 'CA', 'Р‘Р°РЅРєР° (РµРјРєРѕСЃС‚СЊСЋ РјРµРЅРµРµ 5 Р») Р¶РµСЃС‚СЏРЅР°СЏ РїСЂСЏРјРѕСѓРіРѕР»СЊРЅР°СЏ', 'Can, rectangular', '');
INSERT INTO cargopackagekindsclassifier VALUES (72, 'CB', 'РЇС‰РёРє СЂРµС€РµС‚С‡Р°С‚С‹Р№ РґР»СЏ РїРёРІР°', 'Crate, beer', '');
INSERT INTO cargopackagekindsclassifier VALUES (73, 'CC', 'Р‘РёРґРѕРЅ', 'Churn', '');
INSERT INTO cargopackagekindsclassifier VALUES (74, 'CD', 'Р‘Р°РЅРєР° (РµРјРєРѕСЃС‚СЊСЋ РјРµРЅРµРµ 5 Р») Р¶РµСЃС‚СЏРЅР°СЏ СЃ СЂСѓС‡РєРѕР№ Рё РІС‹РїСѓСЃРєРЅС‹Рј РѕС‚РІРµСЂСЃС‚РёРµРј', 'Can, with handle and spout', '');
INSERT INTO cargopackagekindsclassifier VALUES (75, 'CE', 'РљРѕСЂР·РёРЅР°, СЂС‹Р±Р°С†РєР°СЏ', 'Creel', '');
INSERT INTO cargopackagekindsclassifier VALUES (76, 'CF', 'РљРѕС„СЂ', 'Coffer', '');
INSERT INTO cargopackagekindsclassifier VALUES (77, 'CG', 'РљР»РµС‚СЊ', 'Cage', '');
INSERT INTO cargopackagekindsclassifier VALUES (78, 'CH', 'РЎСѓРЅРґСѓРє', 'Chest', '');
INSERT INTO cargopackagekindsclassifier VALUES (79, 'CI', 'Р‘Р°РЅРєР° Р¶РµСЃС‚СЏРЅР°СЏ РґР»СЏ СЃСѓС…РёС… РїСЂРѕРґСѓРєС‚РѕРІ (РјР°СЃСЃРѕР№ РґРѕ 2,2 РєРі)', 'Canister', '');
INSERT INTO cargopackagekindsclassifier VALUES (80, 'CJ', 'Р“СЂРѕР±', 'Coffin', '');
INSERT INTO cargopackagekindsclassifier VALUES (81, 'CK', 'Р‘РѕС‡РєР°', 'Cask', '');
INSERT INTO cargopackagekindsclassifier VALUES (82, 'CL', 'Р‘СѓС…С‚Р°', 'Coil', '');
INSERT INTO cargopackagekindsclassifier VALUES (83, 'CM', 'РљР°СЂРґРЅР°СЏ Р»РµРЅС‚Р°', 'Card', '');
INSERT INTO cargopackagekindsclassifier VALUES (84, 'CN', 'РљРѕРЅС‚РµР№РЅРµСЂ, РїСЂРѕС‡РµРµ С‚СЂР°РЅСЃРїРѕСЂС‚РёСЂРѕРІРѕС‡РЅРѕРµ РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµ, РєСЂРѕРјРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅРѕРіРѕ', 'Container, not otherwise specified as transport equipment', '');
INSERT INTO cargopackagekindsclassifier VALUES (234, 'RO', 'Р СѓР»РѕРЅ (РїРѕР»РѕСЃРѕРІРѕРіРѕ РјР°С‚РµСЂРёР°Р»Р°)', 'Roll', '');
INSERT INTO cargopackagekindsclassifier VALUES (85, 'CO', 'Р‘СѓС‚С‹Р»СЊ РѕРїР»РµС‚РµРЅРЅР°СЏ РЅРµР·Р°С‰РёС‰РµРЅРЅР°СЏ', 'Carboy, non-protected', '');
INSERT INTO cargopackagekindsclassifier VALUES (86, 'CP', 'Р‘СѓС‚С‹Р»СЊ РѕРїР»РµС‚РµРЅРЅР°СЏ Р·Р°С‰РёС‰РµРЅРЅР°СЏ', 'Carboy, protected', '');
INSERT INTO cargopackagekindsclassifier VALUES (87, 'CQ', 'РљР°СЃСЃРµС‚Р°', 'Cartridge', '');
INSERT INTO cargopackagekindsclassifier VALUES (88, 'CR', 'РЇС‰РёРє, СЂРµС€РµС‚С‡Р°С‚С‹Р№ (РёР»Рё РѕР±СЂРµС€РµС‚РєР°)', 'Crate', '');
INSERT INTO cargopackagekindsclassifier VALUES (89, 'CS', 'РЇС‰РёРє', 'Case', '');
INSERT INTO cargopackagekindsclassifier VALUES (90, 'CT', 'РљРѕСЂРѕР±РєР°, РєР°СЂС‚РѕРЅРЅР°СЏ', 'Carton', '');
INSERT INTO cargopackagekindsclassifier VALUES (91, 'CU', 'Р§Р°С€Р°', 'Cup', '');
INSERT INTO cargopackagekindsclassifier VALUES (92, 'CV', 'Р§РµС…РѕР»', 'Cover', '');
INSERT INTO cargopackagekindsclassifier VALUES (93, 'CW', 'РљР»РµС‚СЊ, СЂРѕР»РёРєРѕРІР°СЏ', 'Cage, roll', '');
INSERT INTO cargopackagekindsclassifier VALUES (94, 'CX', 'Р‘Р°РЅРєР° (РµРјРєРѕСЃС‚СЊСЋ РјРµРЅРµРµ 5 Р») Р¶РµСЃС‚СЏРЅР°СЏ С†РёР»РёРЅРґСЂРёС‡РµСЃРєР°СЏ', 'Can, cylindrical', '');
INSERT INTO cargopackagekindsclassifier VALUES (95, 'CY', 'Р¦РёР»РёРЅРґСЂ', 'Cylinder', '');
INSERT INTO cargopackagekindsclassifier VALUES (96, 'CZ', 'Р‘СЂРµР·РµРЅС‚', 'Canvas', '');
INSERT INTO cargopackagekindsclassifier VALUES (97, 'DA', 'РЇС‰РёРє СЂРµС€РµС‚С‡Р°С‚С‹Р№ (РёР»Рё РѕР±СЂРµС€РµС‚РєР°) РјРЅРѕРіРѕСЃР»РѕР№РЅС‹Р№ РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№', 'Crate, multiple layer, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (98, 'DB', 'РЇС‰РёРє СЂРµС€РµС‚С‡Р°С‚С‹Р№ (РёР»Рё РѕР±СЂРµС€РµС‚РєР°) РјРЅРѕРіРѕСЃР»РѕР№РЅС‹Р№ РґРµСЂРµРІСЏРЅРЅС‹Р№', 'Crate, multiple layer, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (99, 'DC', 'РЇС‰РёРє СЂРµС€РµС‚С‡Р°С‚С‹Р№ (РёР»Рё РѕР±СЂРµС€РµС‚РєР°) РјРЅРѕРіРѕСЃР»РѕР№РЅС‹Р№ РєР°СЂС‚РѕРЅРЅС‹Р№', 'Crate, multiple layer, cardboard', '');
INSERT INTO cargopackagekindsclassifier VALUES (100, 'DG', 'РљР»РµС‚СЊ (РјРЅРѕРіРѕРѕР±РѕСЂРѕС‚РЅР°СЏ) РћР±С‰РµРіРѕ С„РѕРЅРґР° С‚СЂР°РЅСЃРїРѕСЂС‚РёСЂРѕРІРѕС‡РЅРѕРіРѕ РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ EC', 'Cage, Commonwealth Handling Equipment Pool (CHEP)', '');
INSERT INTO cargopackagekindsclassifier VALUES (101, 'DH', 'РљРѕСЂРѕР±РєР° (РјРЅРѕРіРѕРѕР±РѕСЂРѕС‚РЅР°СЏ) РёР· РћР±С‰РµРіРѕ С„РѕРЅРґР° С‚СЂР°РЅСЃРїРѕСЂС‚РёСЂРѕРІРѕС‡РЅРѕРіРѕ РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ Р•РЎ, Р•РІСЂРѕРєРѕСЂРѕР±РєР°', 'Box, Commonwealth Handling Equipment Pool (CHEP), Eurobox', '');
INSERT INTO cargopackagekindsclassifier VALUES (102, 'DI', 'Р‘Р°СЂР°Р±Р°РЅ, Р¶РµР»РµР·РЅС‹Р№', 'Drum, iron', '');
INSERT INTO cargopackagekindsclassifier VALUES (103, 'DJ', 'Р‘СѓС‚С‹Р»СЊ РѕРїР»РµС‚РµРЅРЅР°СЏ Р±РѕР»СЊС€Р°СЏ (РµРјРєРѕСЃС‚СЊСЋ РѕС‚ 9 РґРѕ 54 Р») РЅРµР·Р°С‰РёС‰РµРЅРЅР°СЏ', 'Demijohn, non-protected', '');
INSERT INTO cargopackagekindsclassifier VALUES (104, 'DK', 'РЇС‰РёРє СЂРµС€РµС‚С‡Р°С‚С‹Р№ РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РєР°СЂС‚РѕРЅРЅС‹Р№', 'Crate, bulk, cardboard', '');
INSERT INTO cargopackagekindsclassifier VALUES (105, 'DL', 'РЇС‰РёРє СЂРµС€РµС‚С‡Р°С‚С‹Р№ РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№', 'Crate, bulk, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (106, 'DM', 'РЇС‰РёРє СЂРµС€РµС‚С‡Р°С‚С‹Р№ РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РґРµСЂРµРІСЏРЅРЅС‹Р№', 'Crate, bulk, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (107, 'DN', 'Р”РѕР·Р°С‚РѕСЂ', 'Dispenser', '');
INSERT INTO cargopackagekindsclassifier VALUES (108, 'DP', 'Р‘СѓС‚С‹Р»СЊ РѕРїР»РµС‚РµРЅРЅР°СЏ Р±РѕР»СЊС€Р°СЏ (РµРјРєРѕСЃС‚СЊСЋ РѕС‚ 9 РґРѕ 54 Р») Р·Р°С‰РёС‰РµРЅРЅР°СЏ', 'Demijohn, protected', '');
INSERT INTO cargopackagekindsclassifier VALUES (109, 'DR', 'Р‘Р°СЂР°Р±Р°РЅ', 'Drum', '');
INSERT INTO cargopackagekindsclassifier VALUES (110, 'DS', 'Р›РѕС‚РѕРє СЃ РѕРґРЅРёРј РЅР°СЃС‚РёР»РѕРј Р±РµР· РїРѕРєСЂС‹С‚РёСЏ РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№', 'Tray, one layer no cover, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (111, 'DT', 'Р›РѕС‚РѕРє СЃ РѕРґРЅРёРј РЅР°СЃС‚РёР»РѕРј Р±РµР· РїРѕРєСЂС‹С‚РёСЏ РґРµСЂРµРІСЏРЅРЅС‹Р№', 'Tray, one layer no cover, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (112, 'DU', 'Р›РѕС‚РѕРє СЃ РѕРґРЅРёРј РЅР°СЃС‚РёР»РѕРј Р±РµР· РїРѕРєСЂС‹С‚РёСЏ РїРѕР»РёСЃС‚РёСЂРѕР»РѕРІС‹Р№', 'Tray, one layer no cover, polystyrene', '');
INSERT INTO cargopackagekindsclassifier VALUES (113, 'DV', 'Р›РѕС‚РѕРє СЃ РѕРґРЅРёРј РЅР°СЃС‚РёР»РѕРј Р±РµР· РїРѕРєСЂС‹С‚РёСЏ РєР°СЂС‚РѕРЅРЅС‹Р№', 'Tray, one layer no cover, cardboard', '');
INSERT INTO cargopackagekindsclassifier VALUES (114, 'DW', 'Р›РѕС‚РѕРє СЃ РґРІСѓРјСЏ РЅР°СЃС‚РёР»Р°РјРё Р±РµР· РїРѕРєСЂС‹С‚РёСЏ РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№', 'Tray, two layers no cover, plastic tray', '');
INSERT INTO cargopackagekindsclassifier VALUES (115, 'DX', 'Р›РѕС‚РѕРє СЃ РґРІСѓРјСЏ РЅР°СЃС‚РёР»Р°РјРё Р±РµР· РїРѕРєСЂС‹С‚РёСЏ РґРµСЂРµРІСЏРЅРЅС‹Р№', 'Tray, two layers no cover, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (116, 'DY', 'Р›РѕС‚РѕРє СЃ РґРІСѓРјСЏ РЅР°СЃС‚РёР»Р°РјРё Р±РµР· РїРѕРєСЂС‹С‚РёСЏ РєР°СЂС‚РѕРЅРЅС‹Р№', 'Tray, two layers no cover, cardboard', '');
INSERT INTO cargopackagekindsclassifier VALUES (117, 'EC', 'РњРµС€РѕРє, РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№', 'Bag, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (118, 'ED', 'РЇС‰РёРє СЃ РїРѕРґРґРѕРЅРѕРј', 'Case, with pallet base', '');
INSERT INTO cargopackagekindsclassifier VALUES (119, 'EE', 'РЇС‰РёРє СЃ РїРѕРґРґРѕРЅРѕРј РґРµСЂРµРІСЏРЅРЅС‹Р№', 'Case, with pallet base, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (120, 'EF', 'РЇС‰РёРє СЃ РїРѕРґРґРѕРЅРѕРј РєР°СЂС‚РѕРЅРЅС‹Р№', 'Case, with pallet base, cardboard', '');
INSERT INTO cargopackagekindsclassifier VALUES (121, 'EG', 'РЇС‰РёРє СЃ РїРѕРґРґРѕРЅРѕРј РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№', 'Case, with pallet base, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (122, 'EH', 'РЇС‰РёРє СЃ РїРѕРґРґРѕРЅРѕРј РјРµС‚Р°Р»Р»РёС‡РµСЃРєРёР№', 'Case, with pallet base, metal', '');
INSERT INTO cargopackagekindsclassifier VALUES (123, 'EI', 'РЇС‰РёРє, РёР·РѕС‚РµСЂРјРёС‡РµСЃРєРёР№', 'Case, isothermic', '');
INSERT INTO cargopackagekindsclassifier VALUES (124, 'EN', 'РљРѕРЅРІРµСЂС‚', 'Envelope', '');
INSERT INTO cargopackagekindsclassifier VALUES (125, 'FC', 'РЇС‰РёРє СЂРµС€РµС‚С‡Р°С‚С‹Р№ РґР»СЏ С„СЂСѓРєС‚РѕРІ', 'Crate, fruit', '');
INSERT INTO cargopackagekindsclassifier VALUES (126, 'FD', 'РЇС‰РёРє СЂРµС€РµС‚С‡Р°С‚С‹Р№ (РёР»Рё РѕР±СЂРµС€РµС‚РєР°) СЂР°РјРЅС‹Р№', 'Crate, framed', '');
INSERT INTO cargopackagekindsclassifier VALUES (127, 'FE', 'РњСЏРіРєРёР№ РјРµС€РѕРє, Р“РёР±РєР°СЏ С†РёСЃС‚РµСЂРЅР°', 'Flexitank, Flexibag', '');
INSERT INTO cargopackagekindsclassifier VALUES (128, 'FI', 'Р‘РѕС‡РѕРЅРѕРє (РµРјРєРѕСЃС‚СЊСЋ РѕРєРѕР»Рѕ 41 Р»)', 'Firkin', '');
INSERT INTO cargopackagekindsclassifier VALUES (129, 'FL', 'Р¤Р»СЏРіР°', 'Flask', '');
INSERT INTO cargopackagekindsclassifier VALUES (130, 'FO', 'РЎСѓРЅРґСѓС‡РѕРє', 'Footlocker', '');
INSERT INTO cargopackagekindsclassifier VALUES (131, 'FP', 'РљР°СЃСЃРµС‚Р° СЃ РїР»РµРЅРєРѕР№ (С„РёР»СЊРјРїР°Рє)', 'Filmpack', '');
INSERT INTO cargopackagekindsclassifier VALUES (132, 'FR', 'Р Р°РјР°', 'Frame', '');
INSERT INTO cargopackagekindsclassifier VALUES (133, 'FT', 'РљРѕРЅС‚РµР№РЅРµСЂ РґР»СЏ РїРёС‰РµРІС‹С… РїСЂРѕРґСѓРєС‚РѕРІ', 'Foodtainer', '');
INSERT INTO cargopackagekindsclassifier VALUES (134, 'FX', 'РњРµС€РѕРє, РіРёР±РєРёР№ РєРѕРЅС‚РµР№РЅРµСЂ', 'Bag, flexible container', '');
INSERT INTO cargopackagekindsclassifier VALUES (135, 'GB', 'Р‘Р°Р»Р»РѕРЅ, РіР°Р·РѕРІС‹Р№', 'Bottle, gas', '');
INSERT INTO cargopackagekindsclassifier VALUES (136, 'GI', 'Р‘Р°Р»РєР°', 'Girder', '');
INSERT INTO cargopackagekindsclassifier VALUES (137, 'GL', 'РљРѕРЅС‚РµР№РЅРµСЂ, РіР°Р»Р»РѕРЅ', 'Container, gallon', '');
INSERT INTO cargopackagekindsclassifier VALUES (138, 'GR', 'РЎРѕСЃСѓРґ, СЃС‚РµРєР»СЏРЅРЅС‹Р№', 'Receptacle, glass', '');
INSERT INTO cargopackagekindsclassifier VALUES (139, 'GY', 'РњРµС€РѕРє РёР· РјРµС€РєРѕРІРёРЅС‹', 'Bag, gunny', '');
INSERT INTO cargopackagekindsclassifier VALUES (140, 'GZ', 'Р‘Р°Р»РєР° РІ РїР°РєРµС‚Рµ/РїР°С‡РєРµ/СЃРІСЏР·РєРµ', 'Girders, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (141, 'HA', 'РљРѕСЂР·РёРЅР° СЃ СЂСѓС‡РєРѕР№, РїР»Р°СЃС‚РјР°СЃСЃРѕРІР°СЏ', 'Basket, with handle, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (142, 'HB', 'РљРѕСЂР·РёРЅР° СЃ СЂСѓС‡РєРѕР№ РёР· РґСЂРµРІРµСЃРёРЅС‹', 'Basket, with handle, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (143, 'HC', 'РљРѕСЂР·РёРЅР° СЃ СЂСѓС‡РєРѕР№, РєР°СЂС‚РѕРЅРЅР°СЏ', 'Basket, with handle, cardboard', '');
INSERT INTO cargopackagekindsclassifier VALUES (144, 'HG', 'Р‘РѕС‡РєР° РµРјРєРѕСЃС‚СЊСЋ 238 Р» (С…РѕРіСЃС…РµРґ)', 'Hogshead', '');
INSERT INTO cargopackagekindsclassifier VALUES (145, 'HN', 'РљСЂСЋРє', 'Hanger', '');
INSERT INTO cargopackagekindsclassifier VALUES (146, 'HR', 'РљРѕСЂР·РёРЅР° СЃ РєСЂС‹С€РєРѕР№', 'Hamper', '');
INSERT INTO cargopackagekindsclassifier VALUES (147, 'IA', 'РЈРїР°РєРѕРІРєР° РґРµРјРѕРЅСЃС‚СЂР°С†РёРѕРЅРЅР°СЏ РґРµСЂРµРІСЏРЅРЅР°СЏ', 'Package, display, wooden', '');
INSERT INTO cargopackagekindsclassifier VALUES (148, 'IB', 'РЈРїР°РєРѕРІРєР° РґРµРјРѕРЅСЃС‚СЂР°С†РёРѕРЅРЅР°СЏ РєР°СЂС‚РѕРЅРЅР°СЏ', 'Package, display, cardboard', '');
INSERT INTO cargopackagekindsclassifier VALUES (149, 'IC', 'РЈРїР°РєРѕРІРєР° РґРµРјРѕРЅСЃС‚СЂР°С†РёРѕРЅРЅР°СЏ РїР»Р°СЃС‚РјР°СЃСЃРѕРІР°СЏ', 'Package, display, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (150, 'ID', 'РЈРїР°РєРѕРІРєР° РґРµРјРѕРЅСЃС‚СЂР°С†РёРѕРЅРЅР°СЏ РјРµС‚Р°Р»Р»РёС‡РµСЃРєР°СЏ', 'Package, display, metal', '');
INSERT INTO cargopackagekindsclassifier VALUES (151, 'IE', 'РЈРїР°РєРѕРІРєР°, РІС‹СЃС‚Р°РІРѕС‡РЅР°СЏ', 'Package, show', '');
INSERT INTO cargopackagekindsclassifier VALUES (152, 'IF', 'РЈРїР°РєРѕРІРєР°, РІС‹РїСЂРµСЃСЃРѕРІР°РЅРЅР°СЏ', 'Package, flow', '');
INSERT INTO cargopackagekindsclassifier VALUES (153, 'IG', 'РЈРїР°РєРѕРІРєР° РІ РѕР±РµСЂС‚РѕС‡РЅРѕР№ Р±СѓРјР°РіРµ', 'Package, paper wrapped', '');
INSERT INTO cargopackagekindsclassifier VALUES (154, 'IH', 'Р‘Р°СЂР°Р±Р°РЅ, РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№', 'Drum, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (155, 'IK', 'РЈРїР°РєРѕРІРєР° РєР°СЂС‚РѕРЅРЅР°СЏ СЃ РѕС‚РІРµСЂСЃС‚РёСЏРјРё РґР»СЏ Р±СѓС‚С‹Р»РѕРє', 'Package, cardboard, with bottle grip-holes', '');
INSERT INTO cargopackagekindsclassifier VALUES (156, 'IN', 'РЎР»РёС‚РѕРє', 'Ingot', '');
INSERT INTO cargopackagekindsclassifier VALUES (157, 'IZ', 'РЎР»РёС‚РєРё РІ РїР°РєРµС‚Рµ/РїР°С‡РєРµ/СЃРІСЏР·РєРµ', 'Ingots, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (158, 'JB', 'РњРµС€РѕРє Р±РѕР»СЊС€РѕР№,', 'Bag, jumbo', '');
INSERT INTO cargopackagekindsclassifier VALUES (159, 'JC', 'РљР°РЅРёСЃС‚СЂР°, РїСЂСЏРјРѕСѓРіРѕР»СЊРЅР°СЏ', 'Jerrican, rectangular', '');
INSERT INTO cargopackagekindsclassifier VALUES (160, 'JG', 'РљСѓРІС€РёРЅ, РјР°Р»РµРЅСЊРєРёР№', 'Jug', '');
INSERT INTO cargopackagekindsclassifier VALUES (161, 'JR', 'Р‘Р°РЅРєР° С€РёСЂРѕРєРѕРіРѕСЂР»Р°СЏ (РµРјРєРѕСЃС‚СЊСЋ РѕРєРѕР»Рѕ 4,5 Р»РёС‚СЂРѕРІ)', 'Jar', '');
INSERT INTO cargopackagekindsclassifier VALUES (162, 'JT', 'РњРµС€РѕРє, РґР¶СѓС‚РѕРІС‹Р№', 'Jute bag', '');
INSERT INTO cargopackagekindsclassifier VALUES (163, 'JY', 'РљР°РЅРёСЃС‚СЂР°, С†РёР»РёРЅРґСЂРёС‡РµСЃРєР°СЏ', 'Jerrican, cylindrical', '');
INSERT INTO cargopackagekindsclassifier VALUES (164, 'KG', 'Р‘РѕС‡РѕРЅРѕРє (РµРјРєРѕСЃС‚СЊСЋ РѕРєРѕР»Рѕ 46 Р»)', 'Keg', '');
INSERT INTO cargopackagekindsclassifier VALUES (165, 'KI', 'РќР°Р±РѕСЂ', 'Kit', '');
INSERT INTO cargopackagekindsclassifier VALUES (166, 'LE', 'Р‘Р°РіР°Р¶', 'Luggage', '');
INSERT INTO cargopackagekindsclassifier VALUES (167, 'LG', 'Р‘СЂРµРІРЅРѕ', 'Log', '');
INSERT INTO cargopackagekindsclassifier VALUES (168, 'LT', 'Р“СЂСѓР·РѕРІР°СЏ РїР°СЂС‚РёСЏ (Р»РѕС‚)', 'Lot', '');
INSERT INTO cargopackagekindsclassifier VALUES (169, 'LU', 'РЇС‰РёРє', 'Lug', '');
INSERT INTO cargopackagekindsclassifier VALUES (170, 'LV', 'РљРѕСЂРѕР± РґРµСЂРµРІСЏРЅРЅС‹Р№ (Р»РёС„С‚РІР°РЅ) СЂР°Р·РјРµСЂРѕРј РѕРєРѕР»Рѕ 220 СЃРј (РґР»РёРЅР°) x 115 СЃРј (С€РёСЂРёРЅР°) x 220 СЃРј (РІС‹СЃРѕС‚Р°)', 'Liftvan', '');
INSERT INTO cargopackagekindsclassifier VALUES (171, 'LZ', 'Р‘СЂРµРІРЅРѕ РІ РїР°РєРµС‚Рµ/РїР°С‡РєРµ/СЃРІСЏР·РєРµ', 'Logs, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (172, 'MA', 'РЇС‰РёРє РјРµС‚Р°Р»Р»РёС‡РµСЃРєРёР№', 'Crate, metal', '');
INSERT INTO cargopackagekindsclassifier VALUES (173, 'MB', 'РџР°РєРµС‚ Р±СѓРјР°Р¶РЅС‹Р№ РјРЅРѕРіРѕСЃР»РѕР№РЅС‹Р№', 'Bag, multiply', '');
INSERT INTO cargopackagekindsclassifier VALUES (174, 'MC', 'РЇС‰РёРє СЂРµС€РµС‚С‡Р°С‚С‹Р№ РґР»СЏ РјРѕР»РѕРєР°', 'Crate, milk', '');
INSERT INTO cargopackagekindsclassifier VALUES (175, 'ME', 'РљРѕРЅС‚РµР№РЅРµСЂ РјРµС‚Р°Р»Р»РёС‡РµСЃРєРёР№', 'Container, metal', '');
INSERT INTO cargopackagekindsclassifier VALUES (176, 'MR', 'РЎРѕСЃСѓРґ, РјРµС‚Р°Р»Р»РёС‡РµСЃРєРёР№', 'Receptacle, metal', '');
INSERT INTO cargopackagekindsclassifier VALUES (177, 'MS', 'РњРµС€РѕРє (РєСѓР»СЊ) РјРЅРѕРіРѕСЃР»РѕР№РЅС‹Р№', 'Sack, multi-wall', '');
INSERT INTO cargopackagekindsclassifier VALUES (178, 'MT', 'РњРµС€РѕРє, СЂРѕРіРѕР¶РЅС‹Р№', 'Mat', '');
INSERT INTO cargopackagekindsclassifier VALUES (179, 'MW', 'РЎРѕСЃСѓРґ СЃ РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Рј РїРѕРєСЂС‹С‚РёРµРј', 'Receptacle, plastic wrapped', '');
INSERT INTO cargopackagekindsclassifier VALUES (180, 'MX', 'РЎРїРёС‡РµС‡РЅС‹Р№ РєРѕСЂРѕР±РѕРє', 'Matchbox', '');
INSERT INTO cargopackagekindsclassifier VALUES (181, 'NE', 'РќРµСѓРїР°РєРѕРІР°РЅРЅС‹Р№ РёР»Рё РЅРµСЂР°СЃС„Р°СЃРѕРІР°РЅРЅС‹Р№', 'Unpacked or unpackaged', '');
INSERT INTO cargopackagekindsclassifier VALUES (182, 'NF', 'РќРµСѓРїР°РєРѕРІР°РЅРЅС‹Р№ РёР»Рё РЅРµСЂР°СЃС„Р°СЃРѕРІР°РЅРЅС‹Р№ РѕРґРЅРѕРјРµСЃС‚РЅС‹Р№ РіСЂСѓР·', 'Unpacked or unpackaged, single unit', '');
INSERT INTO cargopackagekindsclassifier VALUES (183, 'NG', 'РќРµСѓРїР°РєРѕРІР°РЅРЅС‹Р№ РёР»Рё РЅРµСЂР°СЃС„Р°СЃРѕРІР°РЅРЅС‹Р№ РјРЅРѕРіРѕРјРµСЃС‚РЅС‹Р№ РіСЂСѓР·', 'Unpacked or unpackaged, multiple units', '');
INSERT INTO cargopackagekindsclassifier VALUES (184, 'NS', 'Р“РЅРµР·РґРѕ (СЏС‡РµР№РєР°)', 'Nest', '');
INSERT INTO cargopackagekindsclassifier VALUES (185, 'NT', 'РЎРµС‚РєР°', 'Net', '');
INSERT INTO cargopackagekindsclassifier VALUES (186, 'NU', 'РЎРµС‚РєР° С‚СЂСѓР±С‡Р°С‚Р°СЏ РїР»Р°СЃС‚РјР°СЃСЃРѕРІР°СЏ', 'Net, tube, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (187, 'NV', 'РЎРµС‚РєР° С‚СЂСѓР±С‡Р°С‚Р°СЏ С‚РµРєСЃС‚РёР»СЊРЅР°СЏ', 'Net, tube, textile', '');
INSERT INTO cargopackagekindsclassifier VALUES (188, 'OT', 'РћРєС‚Р°Р±РёРЅ', 'Octabin', '');
INSERT INTO cargopackagekindsclassifier VALUES (189, 'OU', 'РљРѕРЅС‚РµР№РЅРµСЂ РЅР°СЂСѓР¶РЅС‹Р№', 'Container, outer', '');
INSERT INTO cargopackagekindsclassifier VALUES (190, 'P2', 'Р›РѕС‚РѕРє', 'Pan', '');
INSERT INTO cargopackagekindsclassifier VALUES (191, 'PA', 'РџР°РєРµС‚', 'Packet', '');
INSERT INTO cargopackagekindsclassifier VALUES (192, 'PB', 'РџРѕРґРґРѕРЅ, СЏС‰РёС‡РЅС‹Р№', 'Pallet, box', '');
INSERT INTO cargopackagekindsclassifier VALUES (193, 'PC', 'Р‘Р°РЅРґРµСЂРѕР»СЊ', 'Parcel', '');
INSERT INTO cargopackagekindsclassifier VALUES (194, 'PD', 'РџРѕРґРґРѕРЅ РјРѕРґСѓР»СЊРЅС‹Р№ СЃ РѕР±РµС‡Р°Р№РєРѕР№ 80 x 100 СЃРј', 'Pallet, modular, collars 80 cm x 100 cm', '');
INSERT INTO cargopackagekindsclassifier VALUES (195, 'PE', 'РџРѕРґРґРѕРЅ РјРѕРґСѓР»СЊРЅС‹Р№ СЃ РѕР±РµС‡Р°Р№РєРѕР№ 80 С… 120 СЃРј', 'Pallet, modular, collars 80 cm x 120 cm', '');
INSERT INTO cargopackagekindsclassifier VALUES (196, 'PF', 'РЁС‚Р°Р±РµР»СЊ', 'Pen', '');
INSERT INTO cargopackagekindsclassifier VALUES (197, 'PG', 'РџР»РёС‚Р°', 'Plate', '');
INSERT INTO cargopackagekindsclassifier VALUES (198, 'PH', 'РљСѓРІС€РёРЅ, Р±РѕР»СЊС€РѕР№', 'Pitcher', '');
INSERT INTO cargopackagekindsclassifier VALUES (199, 'PI', 'РўСЂСѓР±Р°', 'Pipe', '');
INSERT INTO cargopackagekindsclassifier VALUES (200, 'PJ', 'РљРѕСЂР·РёРЅР° РёР· С€РїРѕРЅР° РґР»СЏ СЏРіРѕРґ Рё С„СЂСѓРєС‚РѕРІ', 'Punnet', '');
INSERT INTO cargopackagekindsclassifier VALUES (201, 'PK', 'РЈРїР°РєРѕРІРєР°', 'Package', '');
INSERT INTO cargopackagekindsclassifier VALUES (202, 'PL', 'Р’РµРґСЂРѕ', 'Pail', '');
INSERT INTO cargopackagekindsclassifier VALUES (203, 'PN', 'Р”РѕСЃРєР°, С‚РѕР»СЃС‚Р°СЏ', 'Plank', '');
INSERT INTO cargopackagekindsclassifier VALUES (204, 'PO', 'РџР°РєРµС‚ (РјРµС€РѕС‡РµРє)', 'Pouch', '');
INSERT INTO cargopackagekindsclassifier VALUES (205, 'PP', 'РЁС‚СѓРєР°', 'Piece', '');
INSERT INTO cargopackagekindsclassifier VALUES (206, 'PR', 'РЎРѕСЃСѓРґ, РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№', 'Receptacle, plastic', '');
INSERT INTO cargopackagekindsclassifier VALUES (207, 'PT', 'Р“РѕСЂС€РѕРє', 'Pot', '');
INSERT INTO cargopackagekindsclassifier VALUES (208, 'PU', 'Р›РѕС‚РѕРє', 'Tray', '');
INSERT INTO cargopackagekindsclassifier VALUES (209, 'PV', 'РўСЂСѓР±Р° РІ РїР°РєРµС‚Рµ/РїР°С‡РєРµ/СЃРІСЏР·РєРµ', 'Pipes, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (210, 'PX', 'РџРѕРґРґРѕРЅ', 'Pallet', '');
INSERT INTO cargopackagekindsclassifier VALUES (211, 'PY', 'РџР»РёС‚С‹ РІ РїР°РєРµС‚Рµ/РїР°С‡РєРµ/СЃРІСЏР·РєРµ', 'Plates, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (212, 'PZ', 'Р”РѕСЃРєР° С‚РѕР»СЃС‚Р°СЏ РІ РїР°РєРµС‚Рµ/РїР°С‡РєРµ/СЃРІСЏР·РєРµ', 'Planks, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (213, 'QA', 'Р‘Р°СЂР°Р±Р°РЅ СЃС‚Р°Р»СЊРЅРѕР№ СЃ РЅРµСЃСЉРµРјРЅС‹Рј РґРЅРёС‰РµРј', 'Drum, steel, non - removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (214, 'QB', 'Р‘Р°СЂР°Р±Р°РЅ СЃС‚Р°Р»СЊРЅРѕР№ СЃРѕ СЃСЉРµРјРЅС‹Рј РґРЅРёС‰РµРј', 'Drum, steel, removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (215, 'QC', 'Р‘Р°СЂР°Р±Р°РЅ Р°Р»СЋРјРёРЅРёРµРІС‹Р№ СЃ РЅРµСЃСЉРµРјРЅС‹Рј РґРЅРёС‰РµРј', 'Drum, aluminium, non-removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (216, 'QD', 'Р‘Р°СЂР°Р±Р°РЅ Р°Р»СЋРјРёРЅРёРµРІС‹Р№ СЃРѕ СЃСЉРµРјРЅС‹Рј РґРЅРёС‰РµРј', 'Drum, aluminium, removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (217, 'QF', 'Р‘Р°СЂР°Р±Р°РЅ РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№ СЃ РЅРµСЃСЉРµРјРЅС‹Рј РґРЅРёС‰РµРј', 'Drum, plastic, non-removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (218, 'QG', 'Р‘Р°СЂР°Р±Р°РЅ РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№ СЃРѕ СЃСЉРµРјРЅС‹Рј РґРЅРёС‰РµРј', 'Drum, plastic, removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (219, 'QH', 'Р‘РѕС‡РєР° (РµРјРєРѕСЃС‚СЊСЋ РѕРєРѕР»Рѕ 164 Р») РґРµСЂРµРІСЏРЅРЅР°СЏ С€РїСѓРЅС‚РѕРІР°РЅРЅР°СЏ', 'Barrel, wooden, bung type', '');
INSERT INTO cargopackagekindsclassifier VALUES (220, 'QJ', 'Р‘РѕС‡РєР° (РµРјРєРѕСЃС‚СЊСЋ РѕРєРѕР»Рѕ 164 Р») РґРµСЂРµРІСЏРЅРЅР°СЏ СЃРѕ СЃСЉРµРјРЅС‹Рј РґРЅРёС‰РµРј', 'Barrel, wooden, removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (221, 'QK', 'РљР°РЅРёСЃС‚СЂР° СЃС‚Р°Р»СЊРЅР°СЏ СЃ РЅРµСЃСЉРµРјРЅС‹Рј РґРЅРёС‰РµРј', 'Jerrican, steel, non-removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (222, 'QL', 'РљР°РЅРёСЃС‚СЂР° СЃС‚Р°Р»СЊРЅР°СЏ СЃРѕ СЃСЉРµРјРЅС‹Рј РґРЅРёС‰РµРј', 'Jerrican, steel, removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (223, 'QM', 'РљР°РЅРёСЃС‚СЂР° РїР»Р°СЃС‚РјР°СЃСЃРѕРІР°СЏ СЃ РЅРµСЃСЉРµРјРЅС‹Рј РґРЅРёС‰РµРј', 'Jerrican, plastic, non-removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (224, 'QN', 'РљР°РЅРёСЃС‚СЂР° РїР»Р°СЃС‚РјР°СЃСЃРѕРІР°СЏ СЃРѕ СЃСЉРµРјРЅС‹Рј РґРЅРёС‰РµРј', 'Jerrican, plastic, removable head', '');
INSERT INTO cargopackagekindsclassifier VALUES (225, 'QP', 'РљРѕСЂРѕР±РєР° РґРµСЂРµРІСЏРЅРЅР°СЏ РёР· РµСЃС‚РµСЃС‚РІРµРЅРЅРѕР№ РґСЂРµРІРµСЃРёРЅС‹ РѕР±С‹РєРЅРѕРІРµРЅРЅР°СЏ', 'Box, wooden, natural wood, ordinary', '');
INSERT INTO cargopackagekindsclassifier VALUES (226, 'QQ', 'РљРѕСЂРѕР±РєР° РґРµСЂРµРІСЏРЅРЅР°СЏ РёР· РµСЃС‚РµСЃС‚РІРµРЅРЅРѕР№ РґСЂРµРІРµСЃРёРЅС‹ СЃ РїР»РѕС‚РЅРѕ РїСЂРёРіРЅР°РЅРЅС‹РјРё СЃС‚РµРЅРєР°РјРё', 'Box, wooden, natural wood, with sift proof walls', '');
INSERT INTO cargopackagekindsclassifier VALUES (227, 'QR', 'РљРѕСЂРѕР±РєР°, РїРµРЅРѕРїР»Р°СЃС‚РѕРІР°СЏ', 'Box, plastic, expanded', '');
INSERT INTO cargopackagekindsclassifier VALUES (228, 'QS', 'РљРѕСЂРѕР±РєР° РёР· С‚РІРµСЂРґРѕР№ РїР»Р°СЃС‚РјР°СЃСЃС‹', 'Box, plastic, solid', '');
INSERT INTO cargopackagekindsclassifier VALUES (229, 'RD', 'РџСЂСѓС‚', 'Rod', '');
INSERT INTO cargopackagekindsclassifier VALUES (230, 'RG', 'РљРѕР»СЊС†Рѕ', 'Ring', '');
INSERT INTO cargopackagekindsclassifier VALUES (231, 'RJ', 'РЎС‚РѕР№РєР°, РІРµС€Р°Р»РєР° РґР»СЏ РѕРґРµР¶РґС‹', 'Rack, clothing hanger', '');
INSERT INTO cargopackagekindsclassifier VALUES (232, 'RK', 'РЎС‚РѕР№РєР°', 'Rack', '');
INSERT INTO cargopackagekindsclassifier VALUES (233, 'RL', 'РљР°С‚СѓС€РєР°', 'Reel', '');
INSERT INTO cargopackagekindsclassifier VALUES (235, 'RT', 'РЎРµС‚РєР° С‚РёРїР° РёСЃРїРѕР»СЊР·СѓРµРјРѕР№ РґР»СЏ РѕРІРѕС‰РµР№ РёР»Рё С„СЂСѓРєС‚РѕРІ', 'Rednet', '');
INSERT INTO cargopackagekindsclassifier VALUES (236, 'RZ', 'РџСЂСѓС‚ РІ РїР°РєРµС‚Рµ/РїР°С‡РєРµ/СЃРІСЏР·РєРµ', 'Rods, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (237, 'SA', 'РњРµС€РѕРє (РєСѓР»СЊ)', 'Sack', '');
INSERT INTO cargopackagekindsclassifier VALUES (238, 'SB', 'РЎР»СЏР±', 'Slab', '');
INSERT INTO cargopackagekindsclassifier VALUES (239, 'SC', 'РЇС‰РёРє СЂРµС€РµС‚С‡Р°С‚С‹Р№ (РёР»Рё РѕР±СЂРµС€РµС‚РєР°) РјРµР»РєРёР№', 'Crate, shallow', '');
INSERT INTO cargopackagekindsclassifier VALUES (240, 'SD', 'РЁРїРёРЅРґРµР»СЊ', 'Spindle', '');
INSERT INTO cargopackagekindsclassifier VALUES (241, 'SE', 'РЎСѓРЅРґСѓРє, РјРѕСЂСЃРєРѕР№', 'Sea-chest', '');
INSERT INTO cargopackagekindsclassifier VALUES (242, 'SH', 'РџР°РєРµС‚РёРє', 'Sachet', '');
INSERT INTO cargopackagekindsclassifier VALUES (243, 'SI', 'РЎС‚РµР»Р»Р°Р¶', 'Skid', '');
INSERT INTO cargopackagekindsclassifier VALUES (244, 'SK', 'РЇС‰РёРє, РєР°СЂРєР°СЃРЅС‹Р№', 'Case, skeleton', '');
INSERT INTO cargopackagekindsclassifier VALUES (245, 'SL', 'Р›РёСЃС‚, РїСЂРѕРєР»Р°РґРЅРѕР№', 'Slipsheet', '');
INSERT INTO cargopackagekindsclassifier VALUES (246, 'SM', 'Р›РёСЃС‚, РјРµС‚Р°Р»Р»РёС‡РµСЃРєРёР№', 'Sheet metal', '');
INSERT INTO cargopackagekindsclassifier VALUES (247, 'SO', 'РЁРїСѓР»СЊРєР°', 'Spool', '');
INSERT INTO cargopackagekindsclassifier VALUES (248, 'SP', 'Р›РёСЃС‚ СЃ РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Рј РїРѕРєСЂС‹С‚РёРµРј', 'Sheet, plastic wrapping', '');
INSERT INTO cargopackagekindsclassifier VALUES (249, 'SS', 'РЇС‰РёРє, СЃС‚Р°Р»СЊРЅРѕР№', 'Case, steel', '');
INSERT INTO cargopackagekindsclassifier VALUES (250, 'ST', 'Р›РёСЃС‚', 'Sheet', '');
INSERT INTO cargopackagekindsclassifier VALUES (251, 'SU', 'Р§РµРјРѕРґР°РЅ', 'Suitcase', '');
INSERT INTO cargopackagekindsclassifier VALUES (252, 'SV', 'РљРѕРЅРІРµСЂС‚, СЃС‚Р°Р»СЊРЅРѕР№', 'Envelope, steel', '');
INSERT INTO cargopackagekindsclassifier VALUES (253, 'SW', 'Р’ С‚РµСЂРјРѕСѓСЃР°РґРѕС‡РЅРѕР№ РїР»РµРЅРєРµ', 'Shrink-wrapped', '');
INSERT INTO cargopackagekindsclassifier VALUES (254, 'SX', 'РљРѕРјРїР»РµРєС‚', 'Set', '');
INSERT INTO cargopackagekindsclassifier VALUES (255, 'SY', 'Р“РёР»СЊР·Р°', 'Sleeve', '');
INSERT INTO cargopackagekindsclassifier VALUES (256, 'SZ', 'Р›РёСЃС‚ РІ РїР°РєРµС‚Рµ/РїР°С‡РєРµ/СЃРІСЏР·РєРµ', 'Sheets, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (257, 'T1', 'РўР°Р±Р»РµС‚РєР°', 'Tablet', '');
INSERT INTO cargopackagekindsclassifier VALUES (258, 'TB', 'РљР°РґРєР°', 'Tub', '');
INSERT INTO cargopackagekindsclassifier VALUES (259, 'TC', 'Р§Р°Р№РЅР°СЏ РєРѕСЂРѕР±РєР°', 'Tea-chest', '');
INSERT INTO cargopackagekindsclassifier VALUES (260, 'TD', 'РўСЂСѓР±РєР° РёР»Рё С‚СѓР±Р°, СЃРєР»Р°РґС‹РІР°СЋС‰Р°СЏСЃСЏ', 'Tube, collapsible', '');
INSERT INTO cargopackagekindsclassifier VALUES (261, 'TE', 'РЁРёРЅР°', 'Tyre', '');
INSERT INTO cargopackagekindsclassifier VALUES (262, 'TG', 'Р¦РёСЃС‚РµСЂРЅР° РєРѕРЅС‚РµР№РЅРµСЂ СѓРЅРёРІРµСЂСЃР°Р»СЊРЅС‹Р№', 'Tank container, generic', '');
INSERT INTO cargopackagekindsclassifier VALUES (263, 'TI', 'Р‘РѕС‡РєР° РґРµСЂРµРІСЏРЅРЅР°СЏ (РµРјРєРѕСЃС‚СЊСЋ РѕРєРѕР»Рѕ 200 Р»)', 'Tierce', '');
INSERT INTO cargopackagekindsclassifier VALUES (264, 'TK', 'Р¦РёСЃС‚РµСЂРЅР°, РїСЂСЏРјРѕСѓРіРѕР»СЊРЅР°СЏ', 'Tank, rectangular', '');
INSERT INTO cargopackagekindsclassifier VALUES (265, 'TL', 'РљР°РґРєР° СЃ РєСЂС‹С€РєРѕР№', 'Tub, with lid', '');
INSERT INTO cargopackagekindsclassifier VALUES (266, 'TN', 'Р‘Р°РЅРєР°, Р¶РµСЃС‚СЏРЅР°СЏ (РєРѕРЅСЃРµСЂРІРЅР°СЏ)', 'Tin', '');
INSERT INTO cargopackagekindsclassifier VALUES (267, 'TO', 'Р‘РѕС‡РєР° РґР»СЏ РІРёРЅР° РёР»Рё РїРёРІР° Р±РѕР»СЊС€Р°СЏ (РµРјРєРѕСЃС‚СЊСЋ РѕРєРѕР»Рѕ 1146 Р») (С‚Р°РЅ)', 'Tun', '');
INSERT INTO cargopackagekindsclassifier VALUES (268, 'TR', 'РЎСѓРЅРґСѓРє, РґРѕСЂРѕР¶РЅС‹Р№', 'Trunk', '');
INSERT INTO cargopackagekindsclassifier VALUES (269, 'TS', 'РЎРІСЏР·РєР°', 'Truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (270, 'TT', 'РњРµС€РѕРє', 'Bag, tote', '');
INSERT INTO cargopackagekindsclassifier VALUES (271, 'TU', 'РўСЂСѓР±РєР° РёР»Рё С‚СѓР±Р°', 'Tube', '');
INSERT INTO cargopackagekindsclassifier VALUES (272, 'TV', 'РўСЂСѓР±РєР° РёР»Рё С‚СѓР±Р° СЃ РЅР°СЃР°РґРєРѕР№', 'Tube, with nozzle', '');
INSERT INTO cargopackagekindsclassifier VALUES (273, 'TW', 'РџРѕРґРґРѕРЅ', 'Pallet, triwall', '');
INSERT INTO cargopackagekindsclassifier VALUES (274, 'TY', 'Р¦РёСЃС‚РµСЂРЅР°, С†РёР»РёРЅРґСЂРёС‡РµСЃРєР°СЏ', 'Tank, cylindrical', '');
INSERT INTO cargopackagekindsclassifier VALUES (275, 'TZ', 'РўСЂСѓР±РєР° РёР»Рё С‚СѓР±Р° РІ РїР°РєРµС‚Рµ/РїР°С‡РєРµ/СЃРІСЏР·РєРµ', 'Tubes, in bundle/bunch/truss', '');
INSERT INTO cargopackagekindsclassifier VALUES (276, 'UC', 'Р‘РµР· РєР»РµС‚Рё', 'Uncaged', '');
INSERT INTO cargopackagekindsclassifier VALUES (277, 'UN', 'Р•РґРёРЅРёС†Р°', 'Unit', '');
INSERT INTO cargopackagekindsclassifier VALUES (278, 'VA', 'Р‘Р°Рє', 'Vat', '');
INSERT INTO cargopackagekindsclassifier VALUES (279, 'VG', 'РќР°Р»РёРІРѕРј РіР°Р· (РїСЂРё 1031 РјР‘Р°СЂ Рё 15В°C)', 'Bulk, gas (at 1 031 mbar and 15В° C)', '');
INSERT INTO cargopackagekindsclassifier VALUES (280, 'VI', 'Р¤Р»Р°РєРѕРЅ', 'Vial', '');
INSERT INTO cargopackagekindsclassifier VALUES (281, 'VK', 'РљРѕРЅСЃРѕР»СЊ РґР»СЏ РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ, РїРѕРјРµС‰Р°СЋС‰Р°СЏСЃСЏ РІ РјРёРЅРёС„СѓСЂРіРѕРЅ', 'Vanpack', '');
INSERT INTO cargopackagekindsclassifier VALUES (282, 'VL', 'РќР°Р»РёРІРѕРј Р¶РёРґРєРѕСЃС‚СЊ', 'Bulk, liquid', '');
INSERT INTO cargopackagekindsclassifier VALUES (283, 'VO', 'РќР°СЃС‹РїСЊСЋ С‚РІРµСЂРґС‹Рµ РєСЂСѓРїРЅС‹Рµ С‡Р°СЃС‚РёС†С‹ (РјРµР»РєРёРµ РєСѓСЃРєРё)', 'Bulk, solid, large particles (nodules)', '');
INSERT INTO cargopackagekindsclassifier VALUES (284, 'VP', 'Р’ РІР°РєСѓСѓРјРЅРѕР№ СѓРїР°РєРѕРІРєРµ', 'Vacuum-packed', '');
INSERT INTO cargopackagekindsclassifier VALUES (285, 'VQ', 'РќР°Р»РёРІРѕРј РіР°Р· СЃР¶РёР¶РµРЅРЅС‹Р№ (РїСЂРё С‚РµРјРїРµСЂР°С‚СѓСЂРµ/РґР°РІР»РµРЅРёРё, РѕС‚Р»РёС‡Р°СЋС‰РёС…СЃСЏ РѕС‚ РЅРѕСЂРјР°Р»СЊРЅС‹С…)', 'Bulk, liquefied gas (at abnormal temperature/pressure)', '');
INSERT INTO cargopackagekindsclassifier VALUES (286, 'VR', 'РќР°СЃС‹РїСЊСЋ С‚РІРµСЂРґС‹Рµ РіСЂР°РЅСѓР»РёСЂРѕРІР°РЅРЅС‹Рµ С‡Р°СЃС‚РёС†С‹ (РіСЂР°РЅСѓР»С‹)', 'Bulk, solid, granular particles (grains)', '');
INSERT INTO cargopackagekindsclassifier VALUES (287, 'VS', 'РќР°РІР°Р»РѕРј РјРµС‚Р°Р»Р»РѕР»РѕРј', 'Bulk, scrap metal', '');
INSERT INTO cargopackagekindsclassifier VALUES (288, 'VY', 'РќР°СЃС‹РїСЊСЋ С‚РІРµСЂРґС‹Рµ РјРµР»РєРёРµ С‡Р°СЃС‚РёС†С‹ (РїРѕСЂРѕС€РєРё)', 'Bulk, solid, fine particles (powders)', '');
INSERT INTO cargopackagekindsclassifier VALUES (289, 'WA', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ', 'Intermediate bulk container', '');
INSERT INTO cargopackagekindsclassifier VALUES (290, 'WB', 'Р‘СѓС‚С‹Р»РєР° РѕРїР»РµС‚РµРЅРЅР°СЏ', 'Wicker bottle', '');
INSERT INTO cargopackagekindsclassifier VALUES (291, 'WC', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ СЃС‚Р°Р»СЊРЅРѕР№', 'Intermediate bulk container, steel', '');
INSERT INTO cargopackagekindsclassifier VALUES (292, 'WD', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ Р°Р»СЋРјРёРЅРёРµРІС‹Р№', 'Intermediate bulk container, aluminium', '');
INSERT INTO cargopackagekindsclassifier VALUES (293, 'WF', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РјРµС‚Р°Р»Р»РёС‡РµСЃРєРёР№', 'Intermediate bulk container, metal', '');
INSERT INTO cargopackagekindsclassifier VALUES (294, 'WG', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РіРµСЂРјРµС‚РёР·РёСЂРѕРІР°РЅРЅС‹Р№ СЃРІС‹С€Рµ 10 РљРџР°', 'Intermediate bulk container, steel, pressurised  10 kpa', '');
INSERT INTO cargopackagekindsclassifier VALUES (295, 'WH', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ Р°Р»СЋРјРёРЅРёРµРІС‹Р№ РіРµСЂРјРµС‚РёР·РёСЂРѕРІР°РЅРЅС‹Р№ СЃРІС‹С€Рµ 10 РљРџР°', 'Intermediate bulk container, aluminium, pressurised  10 kpa', '');
INSERT INTO cargopackagekindsclassifier VALUES (296, 'WJ', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РіРµСЂРјРµС‚РёР·РёСЂРѕРІР°РЅРЅС‹Р№ 10 РљРїР°', 'Intermediate bulk container, metal, pressure 10 kpa', '');
INSERT INTO cargopackagekindsclassifier VALUES (297, 'WK', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РЅР°Р»РёРІРЅС‹С… РіСЂСѓР·РѕРІ СЃС‚Р°Р»СЊРЅРѕР№', 'Intermediate bulk container, steel, liquid', '');
INSERT INTO cargopackagekindsclassifier VALUES (298, 'WL', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РЅР°Р»РёРІРЅС‹С… РіСЂСѓР·РѕРІ Р°Р»СЋРјРёРЅРёРµРІС‹Р№', 'Intermediate bulk container, aluminium, liquid', '');
INSERT INTO cargopackagekindsclassifier VALUES (299, 'WM', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РЅР°Р»РёРІРЅС‹С… РіСЂСѓР·РѕРІ РјРµС‚Р°Р»Р»РёС‡РµСЃРєРёР№', 'Intermediate bulk container, metal, liquid', '');
INSERT INTO cargopackagekindsclassifier VALUES (300, 'WN', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РёР· РїРѕР»РёРјРµСЂРЅРѕР№ С‚РєР°РЅРё Р±РµР· РїРѕРєСЂС‹С‚РёСЏ/РІРєР»Р°РґС‹С€Р°', 'Intermediate bulk container, woven plastic, without coat/liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (301, 'WP', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РёР· РїРѕР»РёРјРµСЂРЅРѕР№ С‚РєР°РЅРё СЃ РїРѕРєСЂС‹С‚РёРµРј', 'Intermediate bulk container, woven plastic, coated', '');
INSERT INTO cargopackagekindsclassifier VALUES (302, 'WQ', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РёР· РїРѕР»РёРјРµСЂРЅРѕР№ С‚РєР°РЅРё СЃ РІРєР»Р°РґС‹С€РµРј', 'Intermediate bulk container, woven plastic, with liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (303, 'WR', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РёР· РїР»Р°СЃС‚РёРєРѕРІРѕРіРѕ РІРѕР»РѕРєРЅР° СЃ РїРѕРєСЂС‹С‚РёРµРј Рё РІРєР»Р°РґС‹С€РµРј', 'Intermediate bulk container, woven plastic, coated and liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (304, 'WS', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РёР· РїРѕР»РёРјРµСЂРЅРѕР№ РїР»РµРЅРєРё', 'Intermediate bulk container, plastic film', '');
INSERT INTO cargopackagekindsclassifier VALUES (305, 'WT', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ С‚РµРєСЃС‚РёР»СЊРЅС‹Р№ Р±РµР· РїРѕРєСЂС‹С‚РёСЏ/РІРєР»Р°РґС‹С€Р°', 'Intermediate bulk container, textile without coat/liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (306, 'WU', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РёР· РµСЃС‚РµСЃС‚РІРµРЅРЅРѕР№ РґСЂРµРІРµСЃРёРЅС‹ СЃ РІРЅСѓС‚СЂРµРЅРЅРёРј РІРєР»Р°РґС‹С€РµРј', 'Intermediate bulk container, natural wood, with inner liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (307, 'WV', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ С‚РµРєСЃС‚РёР»СЊРЅС‹Р№ СЃ РїРѕРєСЂС‹С‚РёРµРј', 'Intermediate bulk container, textile, coated', '');
INSERT INTO cargopackagekindsclassifier VALUES (308, 'WW', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ С‚РµРєСЃС‚РёР»СЊРЅС‹Р№ СЃ РІРєР»Р°РґС‹С€РµРј', 'Intermediate bulk container, textile, with liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (309, 'WX', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ С‚РµРєСЃС‚РёР»СЊРЅС‹Р№ СЃ РїРѕРєСЂС‹С‚РёРµРј Рё РІРєР»Р°РґС‹С€РµРј', 'Intermediate bulk container, textile, coated and liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (310, 'WY', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ С„Р°РЅРµСЂРЅС‹Р№ СЃ РІРЅСѓС‚СЂРµРЅРЅРёРј РІРєР»Р°РґС‹С€РµРј', 'Intermediate bulk container, plywood, with inner liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (311, 'WZ', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РёР· РґСЂРµРІРµСЃРЅРѕРіРѕ РјР°С‚РµСЂРёР°Р»Р° СЃ РІРЅСѓС‚СЂРµРЅРЅРёРј РІРєР»Р°РґС‹С€РµРј', 'Intermediate bulk container, reconstituted wood, with inner liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (312, 'XA', 'РњРµС€РѕРє РёР· РїРѕР»РёРјРµСЂРЅРѕР№ С‚РєР°РЅРё Р±РµР· РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ РїРѕРєСЂС‹С‚РёСЏ/РІРєР»Р°РґС‹С€Р°', 'Bag, woven plastic, without inner coat/liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (313, 'XB', 'РњРµС€РѕРє РёР· РїРѕР»РёРјРµСЂРЅРѕР№ С‚РєР°РЅРё, РїР»РѕС‚РЅС‹Р№', 'Bag, woven plastic, sift proof', '');
INSERT INTO cargopackagekindsclassifier VALUES (314, 'XC', 'РњРµС€РѕРє РёР· РїРѕР»РёРјРµСЂРЅРѕР№ С‚РєР°РЅРё РІР»Р°РіРѕРЅРµРїСЂРѕРЅРёС†Р°РµРјС‹Р№', 'Bag, woven plastic, water resistant', '');
INSERT INTO cargopackagekindsclassifier VALUES (315, 'XD', 'РњРµС€РѕРє РёР· РїРѕР»РёРјРµСЂРЅРѕР№ РїР»РµРЅРєРё', 'Bag, plastics film', '');
INSERT INTO cargopackagekindsclassifier VALUES (316, 'XF', 'РњРµС€РѕРє С‚РµРєСЃС‚РёР»СЊРЅС‹Р№ Р±РµР· РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ РїРѕРєСЂС‹С‚РёСЏ/РІРєР»Р°РґС‹С€Р°', 'Bag, textile, without inner coat/liner', '');
INSERT INTO cargopackagekindsclassifier VALUES (317, 'XG', 'РњРµС€РѕРє С‚РµРєСЃС‚РёР»СЊРЅС‹Р№ РїР»РѕС‚РЅС‹Р№', 'Bag, textile, sift proof', '');
INSERT INTO cargopackagekindsclassifier VALUES (318, 'XH', 'РњРµС€РѕРє С‚РµРєСЃС‚РёР»СЊРЅС‹Р№ РІР»Р°РіРѕРЅРµРїСЂРѕРЅРёС†Р°РµРјС‹Р№', 'Bag, textile, water resistant', '');
INSERT INTO cargopackagekindsclassifier VALUES (319, 'XJ', 'РњРµС€РѕРє Р±СѓРјР°Р¶РЅС‹Р№ РјРЅРѕРіРѕСЃР»РѕР№РЅС‹Р№', 'Bag, paper, multi-wall', '');
INSERT INTO cargopackagekindsclassifier VALUES (320, 'XK', 'РњРµС€РѕРє Р±СѓРјР°Р¶РЅС‹Р№ РјРЅРѕРіРѕСЃР»РѕР№РЅС‹Р№ РІР»Р°РіРѕРЅРµРїСЂРѕРЅРёС†Р°РµРјС‹Р№', 'Bag, paper, multi-wall, water resistant', '');
INSERT INTO cargopackagekindsclassifier VALUES (321, 'YA', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№ СЃРѕСЃСѓРґ РІ Р±Р°СЂР°Р±Р°РЅРµ СЃС‚Р°Р»СЊРЅРѕРј', 'Composite packaging, plastic receptacle in steel drum', '');
INSERT INTO cargopackagekindsclassifier VALUES (322, 'YB', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№ СЃРѕСЃСѓРґ РІ СЏС‰РёРєРµ СЂРµС€РµС‚С‡Р°С‚РѕРј (РёР»Рё РѕР±СЂРµС€РµС‚РєРµ) РёР· СЃС‚Р°Р»Рё', 'Composite packaging, plastic receptacle in steel crate box', '');
INSERT INTO cargopackagekindsclassifier VALUES (323, 'YC', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№ СЃРѕСЃСѓРґ РІ Р±Р°СЂР°Р±Р°РЅРµ Р°Р»СЋРјРёРЅРёРµРІРѕРј', 'Composite packaging, plastic receptacle in aluminium drum', '');
INSERT INTO cargopackagekindsclassifier VALUES (324, 'YD', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№ СЃРѕСЃСѓРґ РІ СЏС‰РёРєРµ СЂРµС€РµС‚С‡Р°С‚РѕРј (РёР»Рё РѕР±СЂРµС€РµС‚РєРµ) РёР· Р°Р»СЋРјРёРЅРёСЏ', 'Composite packaging, plastic receptacle in aluminium crate', '');
INSERT INTO cargopackagekindsclassifier VALUES (325, 'YF', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№ СЃРѕСЃСѓРґ РІ РґРµСЂРµРІСЏРЅРЅРѕР№ РєРѕСЂРѕР±РєРµ', 'Composite packaging, plastic receptacle in wooden box', '');
INSERT INTO cargopackagekindsclassifier VALUES (326, 'YH', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№ СЃРѕСЃСѓРґ РІ РєРѕСЂРѕР±РєРµ С„Р°РЅРµСЂРЅРѕР№', 'Composite packaging, plastic receptacle in plywood box', '');
INSERT INTO cargopackagekindsclassifier VALUES (327, 'YJ', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№ СЃРѕСЃСѓРґ РІ Р±Р°СЂР°Р±Р°РЅРµ С„РёР±СЂРѕРІРѕРј', 'Composite packaging, plastic receptacle in fibre drum', '');
INSERT INTO cargopackagekindsclassifier VALUES (328, 'YK', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№ СЃРѕСЃСѓРґ РІ РєРѕСЂРѕР±РєРµ РёР· С„РёР±СЂРѕРІРѕРіРѕ РєР°СЂС‚РѕРЅР°', 'Composite packaging, plastic receptacle in fibreboard box', '');
INSERT INTO cargopackagekindsclassifier VALUES (329, 'YL', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№ СЃРѕСЃСѓРґ РІ Р±Р°СЂР°Р±Р°РЅРµ РїР»Р°СЃС‚РјР°СЃСЃРѕРІРѕРј', 'Composite packaging, plastic receptacle in plastic drum', '');
INSERT INTO cargopackagekindsclassifier VALUES (330, 'YM', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: РїР»Р°СЃС‚РјР°СЃСЃРѕРІС‹Р№ СЃРѕСЃСѓРґ РІ РєРѕСЂРѕР±РєРµ РёР· С‚РІРµСЂРґРѕР№ РїР»Р°СЃС‚РјР°СЃСЃС‹', 'Composite packaging, plastic receptacle in solid plastic box', '');
INSERT INTO cargopackagekindsclassifier VALUES (331, 'YN', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: СЃС‚РµРєР»СЏРЅРЅС‹Р№ СЃРѕСЃСѓРґ РІ СЃС‚Р°Р»СЊРЅРѕРј Р±Р°СЂР°Р±Р°РЅРµ', 'Composite packaging, glass receptacle in steel drum', '');
INSERT INTO cargopackagekindsclassifier VALUES (332, 'YP', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: СЃС‚РµРєР»СЏРЅРЅС‹Р№ СЃРѕСЃСѓРґ РІ СЏС‰РёРєРµ СЂРµС€РµС‚С‡Р°С‚РѕРј (РёР»Рё РѕР±СЂРµС€РµС‚РєРµ) РёР· СЃС‚Р°Р»Рё', 'Composite packaging, glass receptacle in steel crate box', '');
INSERT INTO cargopackagekindsclassifier VALUES (333, 'YQ', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: СЃС‚РµРєР»СЏРЅРЅС‹Р№ СЃРѕСЃСѓРґ РІ Р±Р°СЂР°Р±Р°РЅРµ Р°Р»СЋРјРёРЅРёРµРІРѕРј', 'Composite packaging, glass receptacle in aluminium drum', '');
INSERT INTO cargopackagekindsclassifier VALUES (334, 'YR', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: СЃС‚РµРєР»СЏРЅРЅС‹Р№ СЃРѕСЃСѓРґ РІ СЏС‰РёРєРµ СЂРµС€РµС‚С‡Р°С‚РѕРј (РёР»Рё РѕР±СЂРµС€РµС‚РєРµ) РёР· Р°Р»СЋРјРёРЅРёСЏ', 'Composite packaging, glass receptacle in aluminium crate', '');
INSERT INTO cargopackagekindsclassifier VALUES (335, 'YS', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: СЃС‚РµРєР»СЏРЅРЅС‹Р№ СЃРѕСЃСѓРґ РІ РєРѕСЂРѕР±РєРµ РґРµСЂРµРІСЏРЅРЅРѕР№', 'Composite packaging, glass receptacle in wooden box', '');
INSERT INTO cargopackagekindsclassifier VALUES (336, 'YT', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: СЃС‚РµРєР»СЏРЅРЅС‹Р№ СЃРѕСЃСѓРґ РІ Р±Р°СЂР°Р±Р°РЅРµ С„Р°РЅРµСЂРЅРѕРј', 'Composite packaging, glass receptacle in plywood drum', '');
INSERT INTO cargopackagekindsclassifier VALUES (337, 'YV', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: СЃС‚РµРєР»СЏРЅРЅС‹Р№ СЃРѕСЃСѓРґ РІ РєРѕСЂР·РёРЅРµ РїР»РµС‚РµРЅРѕР№ СЃ РєСЂС‹С€РєРѕР№', 'Composite packaging, glass receptacle in wickerwork hamper', '');
INSERT INTO cargopackagekindsclassifier VALUES (338, 'YW', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: СЃС‚РµРєР»СЏРЅРЅС‹Р№ СЃРѕСЃСѓРґ РІ Р±Р°СЂР°Р±Р°РЅРµ С„РёР±СЂРѕРІРѕРј', 'Composite packaging, glass receptacle in fibre drum', '');
INSERT INTO cargopackagekindsclassifier VALUES (339, 'YX', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: СЃС‚РµРєР»СЏРЅРЅС‹Р№ СЃРѕСЃСѓРґ РІ РєРѕСЂРѕР±РєРµ РёР· С„РёР±СЂРѕРІРѕРіРѕ РєР°СЂС‚РѕРЅР°', 'Composite packaging, glass receptacle in fibreboard box', '');
INSERT INTO cargopackagekindsclassifier VALUES (340, 'YY', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: СЃС‚РµРєР»СЏРЅРЅС‹Р№ СЃРѕСЃСѓРґ РІ РїР°РєРµС‚Рµ РїРµРЅРѕРїР»Р°СЃС‚РѕРІРѕРј', 'Composite packaging, glass receptacle in expandable plastic pack', '');
INSERT INTO cargopackagekindsclassifier VALUES (341, 'YZ', 'РљРѕРјР±РёРЅРёСЂРѕРІР°РЅРЅР°СЏ СѓРїР°РєРѕРІРєР°: СЃС‚РµРєР»СЏРЅРЅС‹Р№ СЃРѕСЃСѓРґ РІ РїР°РєРµС‚Рµ РёР· С‚РІРµСЂРґРѕР№ РїР»Р°СЃС‚РјР°СЃСЃС‹', 'Composite packaging, glass receptacle in solid plastic pack', '');
INSERT INTO cargopackagekindsclassifier VALUES (342, 'ZA', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ Р±СѓРјР°Р¶РЅС‹Р№ РјРЅРѕРіРѕСЃР»РѕР№РЅС‹Р№', 'Intermediate bulk container, paper, multi-wall', '');
INSERT INTO cargopackagekindsclassifier VALUES (343, 'ZB', 'РњРµС€РѕРє, Р±РѕР»СЊС€РѕР№', 'Bag, large', '');
INSERT INTO cargopackagekindsclassifier VALUES (344, 'ZC', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ Р±СѓРјР°Р¶РЅС‹Р№ РјРЅРѕРіРѕСЃР»РѕР№РЅС‹Р№ РІР»Р°РіРѕРЅРµРїСЂРѕРЅРёС†Р°РµРјС‹Р№', 'Intermediate bulk container, paper, multi-wall, water resistant', '');
INSERT INTO cargopackagekindsclassifier VALUES (345, 'ZD', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ С‚РІРµСЂРґС‹С… РЅР°РІР°Р»РѕС‡РЅС‹С…/РЅР°СЃС‹РїРЅС‹С… РіСЂСѓР·РѕРІ РёР· Р¶РµСЃС‚РєРѕР№ РїР»Р°СЃС‚РјР°СЃСЃС‹ СЃ РєРѕРЅСЃС‚СЂСѓРєС†РёРѕРЅРЅС‹Рј РѕСЃРЅР°С‰РµРЅРёРµРј', 'Intermediate bulk container, rigid plastic, with structural equipment, solids', '');
INSERT INTO cargopackagekindsclassifier VALUES (346, 'ZF', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ С‚РІРµСЂРґС‹С… РЅР°РІР°Р»РѕС‡РЅС‹С…/РЅР°СЃС‹РїРЅС‹С… РіСЂСѓР·РѕРІ РёР· Р¶РµСЃС‚РєРѕР№ РїР»Р°СЃС‚РјР°СЃСЃС‹ Р°РІС‚РѕРЅРѕРјРЅС‹Р№', 'Intermediate bulk container, rigid plastic, freestanding, solids', '');
INSERT INTO cargopackagekindsclassifier VALUES (347, 'ZG', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РёР· Р¶РµСЃС‚РєРѕР№ РїР»Р°СЃС‚РјР°СЃСЃС‹ СЃ РєРѕРЅСЃС‚СЂСѓРєС†РёРѕРЅРЅС‹Рј РѕСЃРЅР°С‰РµРЅРёРµРј РіРµСЂРјРµС‚РёР·РёСЂРѕРІР°РЅРЅС‹Р№', 'Intermediate bulk container, rigid plastic, with structural equipment, pressurised', '');
INSERT INTO cargopackagekindsclassifier VALUES (348, 'ZH', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РёР· Р¶РµСЃС‚РєРѕР№ РїР»Р°СЃС‚РјР°СЃСЃС‹ Р°РІС‚РѕРЅРѕРјРЅС‹Р№ РіРµСЂРјРµС‚РёР·РёСЂРѕРІР°РЅРЅС‹Р№', 'Intermediate bulk container, rigid plastic, freestanding, pressurised', '');
INSERT INTO cargopackagekindsclassifier VALUES (349, 'ZJ', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РЅР°Р»РёРІРЅС‹С… РіСЂСѓР·РѕРІ РёР· Р¶РµСЃС‚РєРѕР№ РїР»Р°СЃС‚РјР°СЃСЃС‹ СЃ РєРѕРЅСЃС‚СЂСѓРєС†РёРѕРЅРЅС‹Рј РѕСЃРЅР°С‰РµРЅРёРµРј', 'Intermediate bulk container, rigid plastic, with structural equipment, liquids', '');
INSERT INTO cargopackagekindsclassifier VALUES (350, 'ZK', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РЅР°Р»РёРІРЅС‹С… РіСЂСѓР·РѕРІ РёР· Р¶РµСЃС‚РєРѕР№ РїР»Р°СЃС‚РјР°СЃСЃС‹ Р°РІС‚РѕРЅРѕРјРЅС‹Р№', 'Intermediate bulk container, rigid plastic, freestanding, liquids', '');
INSERT INTO cargopackagekindsclassifier VALUES (351, 'ZL', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ С‚РІРµСЂРґС‹С… РЅР°РІР°Р»РѕС‡РЅС‹С…/РЅР°СЃС‹РїРЅС‹С… РіСЂСѓР·РѕРІ СЃРѕСЃС‚Р°РІРЅРѕР№ РёР· Р¶РµСЃС‚РєРѕР№ РїР»Р°СЃС‚РјР°СЃСЃС‹', 'Intermediate bulk container, composite, rigid plastic, solids', '');
INSERT INTO cargopackagekindsclassifier VALUES (352, 'ZM', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ С‚РІРµСЂРґС‹С… РЅР°РІР°Р»РѕС‡РЅС‹С…/РЅР°СЃС‹РїРЅС‹С… РіСЂСѓР·РѕРІ СЃРѕСЃС‚Р°РІРЅРѕР№ РёР· РіРёР±РєРѕР№ РїР»Р°СЃС‚РјР°СЃСЃС‹', 'Intermediate bulk container, composite, flexible plastic, solids', '');
INSERT INTO cargopackagekindsclassifier VALUES (353, 'ZN', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ СЃРѕСЃС‚Р°РІРЅРѕР№ РёР· Р¶РµСЃС‚РєРѕР№ РїР»Р°СЃС‚РјР°СЃСЃС‹ РіРµСЂРјРµС‚РёР·РёСЂРѕРІР°РЅРЅС‹Р№', 'Intermediate bulk container, composite, rigid plastic, pressurised', '');
INSERT INTO cargopackagekindsclassifier VALUES (354, 'ZP', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ СЃРѕСЃС‚Р°РІРЅРѕР№ РёР· РіРёР±РєРѕР№ РїР»Р°СЃС‚РјР°СЃСЃС‹ РіРµСЂРјРµС‚РёР·РёСЂРѕРІР°РЅРЅС‹Р№', 'Intermediate bulk container, composite, flexible plastic, pressurised', '');
INSERT INTO cargopackagekindsclassifier VALUES (355, 'ZQ', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РЅР°Р»РёРІРЅС‹С… РіСЂСѓР·РѕРІ СЃРѕСЃС‚Р°РІРЅРѕР№ РёР· Р¶РµСЃС‚РєРѕР№ РїР»Р°СЃС‚РјР°СЃСЃС‹', 'Intermediate bulk container, composite, rigid plastic, liquids', '');
INSERT INTO cargopackagekindsclassifier VALUES (356, 'ZR', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РЅР°Р»РёРІРЅС‹С… РіСЂСѓР·РѕРІ СЃРѕСЃС‚Р°РІРЅРѕР№ РёР· РіРёР±РєРѕР№ РїР»Р°СЃС‚РјР°СЃСЃС‹', 'Intermediate bulk container, composite, flexible plastic, liquids', '');
INSERT INTO cargopackagekindsclassifier VALUES (357, 'ZS', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ СЃРѕСЃС‚Р°РІРЅРѕР№', 'Intermediate bulk container, composite', '');
INSERT INTO cargopackagekindsclassifier VALUES (358, 'ZT', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РёР· С„РёР±СЂРѕРІРѕРіРѕ РєР°СЂС‚РѕРЅР°', 'Intermediate bulk container, fibreboard', '');
INSERT INTO cargopackagekindsclassifier VALUES (359, 'ZU', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РіРёР±РєРёР№', 'Intermediate bulk container, flexible', '');
INSERT INTO cargopackagekindsclassifier VALUES (360, 'ZV', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РёР· РїСЂРѕС‡РµРіРѕ РјРµС‚Р°Р»Р»Р°, РєСЂРѕРјРµ СЃС‚Р°Р»Рё', 'Intermediate bulk container, metal, other than steel', '');
INSERT INTO cargopackagekindsclassifier VALUES (361, 'ZW', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РёР· РµСЃС‚РµСЃС‚РІРµРЅРЅРѕР№ РґСЂРµРІРµСЃРёРЅС‹', 'Intermediate bulk container, natural wood', '');
INSERT INTO cargopackagekindsclassifier VALUES (362, 'ZX', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ С„Р°РЅРµСЂРЅС‹Р№', 'Intermediate bulk container, plywood', '');
INSERT INTO cargopackagekindsclassifier VALUES (363, 'ZY', 'РљРѕРЅС‚РµР№РЅРµСЂ СЃСЂРµРґРЅРµР№ РіСЂСѓР·РѕРїРѕРґСЉРµРјРЅРѕСЃС‚Рё РґР»СЏ РјР°СЃСЃРѕРІС‹С… РіСЂСѓР·РѕРІ РёР· РґСЂРµРІРµСЃРЅРѕРіРѕ РјР°С‚РµСЂРёР°Р»Р°', 'Intermediate bulk container, reconstituted wood', '');
INSERT INTO cargopackagekindsclassifier VALUES (364, 'ZZ', 'РџРѕ РІР·Р°РёРјРЅРѕРјСѓ РѕРїСЂРµРґРµР»РµРЅРёСЋ', 'Mutually defined', '');


--
-- TOC entry 4523 (class 0 OID 18751)
-- Dependencies: 217
-- Data for Name: certificatioorganizationkindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4525 (class 0 OID 18759)
-- Dependencies: 219
-- Data for Name: communicationchannelclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO communicationchannelclassifier VALUES (1, 'TE', 'С‚РµР»РµС„РѕРЅ');
INSERT INTO communicationchannelclassifier VALUES (2, 'FX', 'С‚РµР»РµС„Р°РєСЃ');
INSERT INTO communicationchannelclassifier VALUES (3, 'TG', 'С‚РµР»РµРіСЂР°С„');
INSERT INTO communicationchannelclassifier VALUES (4, 'EM', 'СЌР»РµРєС‚СЂРѕРЅРЅР°СЏ РїРѕС‡С‚Р°');
INSERT INTO communicationchannelclassifier VALUES (5, 'TL', 'С‚РµР»РµРєСЃ');
INSERT INTO communicationchannelclassifier VALUES (6, 'AO', 'Р°РґСЂРµСЃ СЃР°Р№С‚Р° РІ СЃРµС‚Рё Р�РЅС‚РµСЂРЅРµС‚');


--
-- TOC entry 4527 (class 0 OID 18767)
-- Dependencies: 221
-- Data for Name: conformityassessmentdocstypesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO conformityassessmentdocstypesclassifier VALUES (1, '05', 'СЃРµСЂС‚РёС„РёРєР°С‚ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёСЏ С‚СЂРµР±РѕРІР°РЅРёСЏРј С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЂРµРіР»Р°РјРµРЅС‚Р° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° (С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЂРµРіР»Р°РјРµРЅС‚Р° РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р°)', 'СЃРµСЂС‚РёС„РёРєР°С‚ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёСЏ РўР  Р•РђР­РЎ', NULL, 'РµРґРёРЅР°СЏ С„РѕСЂРјР° СЃРµСЂС‚РёС„РёРєР°С‚Р° СЃРѕРѕС‚РІРµС‚СЃС‚РІРёСЏ С‚СЂРµР±РѕРІР°РЅРёСЏРј С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЂРµРіР»Р°РјРµРЅС‚Р° РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р°, СѓС‚РІРµСЂР¶РґРµРЅРЅР°СЏ Р РµС€РµРЅРёРµРј РљРѕР»Р»РµРіРёРё Р•РІСЂР°Р·РёР№СЃРєРѕР№ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ РєРѕРјРёСЃСЃРёРё РѕС‚ 25 РґРµРєР°Р±СЂСЏ 2012 Рі. в„– 293');
INSERT INTO conformityassessmentdocstypesclassifier VALUES (2, '10', 'РґРµРєР»Р°СЂР°С†РёСЏ Рѕ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё С‚СЂРµР±РѕРІР°РЅРёСЏРј С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЂРµРіР»Р°РјРµРЅС‚Р° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° (С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЂРµРіР»Р°РјРµРЅС‚Р° РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р°)', 'РґРµРєР»Р°СЂР°С†РёСЏ Рѕ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё РўР  Р•РђР­РЎ', NULL, 'РµРґРёРЅР°СЏ С„РѕСЂРјР° РґРµРєР»Р°СЂР°С†РёРё Рѕ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё С‚СЂРµР±РѕРІР°РЅРёСЏРј С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЂРµРіР»Р°РјРµРЅС‚Р° РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р°, СѓС‚РІРµСЂР¶РґРµРЅРЅР°СЏ Р РµС€РµРЅРёРµРј РљРѕР»Р»РµРіРёРё Р•РІСЂР°Р·РёР№СЃРєРѕР№ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ РєРѕРјРёСЃСЃРёРё РѕС‚ 25 РґРµРєР°Р±СЂСЏ 2012 Рі. в„– 293');
INSERT INTO conformityassessmentdocstypesclassifier VALUES (3, '15', 'СЃРµСЂС‚РёС„РёРєР°С‚ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёСЏ, РѕС„РѕСЂРјР»РµРЅРЅС‹Р№ РїРѕ РµРґРёРЅРѕР№ С„РѕСЂРјРµ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'СЃРµСЂС‚РёС„РёРєР°С‚ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёСЏ РїРѕ РµРґРёРЅРѕР№ С„РѕСЂРјРµ Р•РђР­РЎ', NULL, 'Р•РґРёРЅР°СЏ С„РѕСЂРјР° СЃРµСЂС‚РёС„РёРєР°С‚Р° СЃРѕРѕС‚РІРµС‚СЃС‚РІРёСЏ, СѓС‚РІРµСЂР¶РґРµРЅРЅР°СЏ Р РµС€РµРЅРёРµРј РљРѕРјРёСЃСЃРёРё РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° РѕС‚ 18 РёСЋРЅСЏ 2010 Рі. в„– 319');
INSERT INTO conformityassessmentdocstypesclassifier VALUES (4, '20', 'РґРµРєР»Р°СЂР°С†РёСЏ Рѕ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё, РѕС„РѕСЂРјР»РµРЅРЅР°СЏ РїРѕ РµРґРёРЅРѕР№ С„РѕСЂРјРµ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'РґРµРєР»Р°СЂР°С†РёСЏ Рѕ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё РїРѕ РµРґРёРЅРѕР№ С„РѕСЂРјРµ Р•РђР­РЎ', NULL, 'Р•РґРёРЅР°СЏ С„РѕСЂРјР° РґРµРєР»Р°СЂР°С†РёРё Рѕ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё, СѓС‚РІРµСЂР¶РґРµРЅРЅР°СЏ Р РµС€РµРЅРёРµРј РљРѕРјРёСЃСЃРёРё РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° РѕС‚ 18 РёСЋРЅСЏ 2010 Рі. в„– 319');
INSERT INTO conformityassessmentdocstypesclassifier VALUES (5, '25', 'СЃРІРёРґРµС‚РµР»СЊСЃС‚РІРѕ Рѕ СЂРµРіРёСЃС‚СЂР°С†РёРё (РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕР№ СЂРµРіРёСЃС‚СЂР°С†РёРё), РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РµРµ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРµ С‚СЂРµР±РѕРІР°РЅРёСЏРј С‚РµС…РЅРёС‡РµСЃРєРёС… СЂРµРіР»Р°РјРµРЅС‚РѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° (С‚РµС…РЅРёС‡РµСЃРєРёС… СЂРµРіР»Р°РјРµРЅС‚РѕРІ РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р°)', 'СЃРІРёРґРµС‚РµР»СЊСЃС‚РІРѕ Рѕ СЂРµРіРёСЃС‚СЂР°С†РёРё Р•РђР­РЎ', NULL, 'РџСЂРѕС‚РѕРєРѕР» Рѕ С‚РµС…РЅРёС‡РµСЃРєРѕРј СЂРµРіСѓР»РёСЂРѕРІР°РЅРёРё РІ СЂР°РјРєР°С… Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° (РїСЂРёР»РѕР¶РµРЅРёРµ в„– 9 Рє Р”РѕРіРѕРІРѕСЂСѓ Рѕ Р•РІСЂР°Р·РёР№СЃРєРѕРј СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРј СЃРѕСЋР·Рµ РѕС‚ 29 РјР°СЏ 2014 РіРѕРґР°)');
INSERT INTO conformityassessmentdocstypesclassifier VALUES (6, '30', 'РѕРґРѕР±СЂРµРЅРёРµ С‚РёРїР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РµРµ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРµ С‚СЂРµР±РѕРІР°РЅРёСЏРј С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЂРµРіР»Р°РјРµРЅС‚Р° РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° В«Рћ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё РєРѕР»РµСЃРЅС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІВ» (РўР  РўРЎ 018/2011)', 'РѕРґРѕР±СЂРµРЅРёРµ С‚РёРїР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° Р•РђР­РЎ', NULL, 'РѕРґРѕР±СЂРµРЅРёРµ С‚РёРїР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° (С„РѕСЂРјР°) (РїСЂРёР»РѕР¶РµРЅРёРµ в„– 14 Рє С‚РµС…РЅРёС‡РµСЃРєРѕРјСѓ СЂРµРіР»Р°РјРµРЅС‚Сѓ РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° В«Рћ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё РєРѕР»РµСЃРЅС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІВ» (РўР  РўРЎ 018/2011), РїСЂРёРЅСЏС‚РѕРјСѓ Р РµС€РµРЅРёРµРј РљРѕРјРёСЃСЃРёРё РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° РѕС‚ 9 РґРµРєР°Р±СЂСЏ 2011 Рі. в„– 877)');
INSERT INTO conformityassessmentdocstypesclassifier VALUES (7, '35', 'РѕРґРѕР±СЂРµРЅРёРµ С‚РёРїР° С€Р°СЃСЃРё, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РµРµ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРµ С‚СЂРµР±РѕРІР°РЅРёСЏРј С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЂРµРіР»Р°РјРµРЅС‚Р° РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° В«Рћ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё РєРѕР»РµСЃРЅС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІВ» (РўР  РўРЎ 018/2011)', 'РѕРґРѕР±СЂРµРЅРёРµ С‚РёРїР° С€Р°СЃСЃРё Р•РђР­РЎ', NULL, 'РѕРґРѕР±СЂРµРЅРёРµ С‚РёРїР° С€Р°СЃСЃРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° (С„РѕСЂРјР°) (РїСЂРёР»РѕР¶РµРЅРёРµ в„– 15 Рє С‚РµС…РЅРёС‡РµСЃРєРѕРјСѓ СЂРµРіР»Р°РјРµРЅС‚Сѓ РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° В«Рћ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё РєРѕР»РµСЃРЅС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІВ» (РўР  РўРЎ 018/2011), РїСЂРёРЅСЏС‚РѕРјСѓ Р РµС€РµРЅРёРµРј РљРѕРјРёСЃСЃРёРё РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° РѕС‚ 9 РґРµРєР°Р±СЂСЏ 2011 Рі. в„– 877)');
INSERT INTO conformityassessmentdocstypesclassifier VALUES (8, '40', 'СЃРІРёРґРµС‚РµР»СЊСЃС‚РІРѕ Рѕ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё РєРѕРЅСЃС‚СЂСѓРєС†РёРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РµРµ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРµ С‚СЂРµР±РѕРІР°РЅРёСЏРј С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЂРµРіР»Р°РјРµРЅС‚Р° РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° В«Рћ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё РєРѕР»РµСЃРЅС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІВ» (РўР  РўРЎ 018/2011)', 'СЃРІРёРґРµС‚РµР»СЊСЃС‚РІРѕ Рѕ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё РєРѕРЅСЃС‚СЂСѓРєС†РёРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° Р•РђР­РЎ', NULL, 'СЃРІРёРґРµС‚РµР»СЊСЃС‚РІРѕ Рѕ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё РєРѕРЅСЃС‚СЂСѓРєС†РёРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° (С„РѕСЂРјР°) (РїСЂРёР»РѕР¶РµРЅРёРµ в„– 17 Рє С‚РµС…РЅРёС‡РµСЃРєРѕРјСѓ СЂРµРіР»Р°РјРµРЅС‚Сѓ РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° В«Рћ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё РєРѕР»РµСЃРЅС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІВ» (РўР  РўРЎ 018/2011), РїСЂРёРЅСЏС‚РѕРјСѓ Р РµС€РµРЅРёРµРј РљРѕРјРёСЃСЃРёРё РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° РѕС‚ 9 РґРµРєР°Р±СЂСЏ 2011 Рі. в„– 877)');
INSERT INTO conformityassessmentdocstypesclassifier VALUES (9, '45', 'СЃРІРёРґРµС‚РµР»СЊСЃС‚РІРѕ Рѕ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° СЃ РІРЅРµСЃРµРЅРЅС‹РјРё РІ РµРіРѕ РєРѕРЅСЃС‚СЂСѓРєС†РёСЋ РёР·РјРµРЅРµРЅРёСЏРјРё С‚СЂРµР±РѕРІР°РЅРёСЏРј Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РµРµ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРµ С‚СЂРµР±РѕРІР°РЅРёСЏРј С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЂРµРіР»Р°РјРµРЅС‚Р° РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° В«Рћ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё РєРѕР»РµСЃРЅС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІВ» (РўР  РўРЎ 018/2011)', 'СЃРІРёРґРµС‚РµР»СЊСЃС‚РІРѕ Рѕ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РІРЅРµСЃРµРЅРЅС‹РјРё РёР·РјРµРЅРµРЅРёСЏРјРё Р•РђР­РЎ', NULL, 'СЃРІРёРґРµС‚РµР»СЊСЃС‚РІРѕ Рѕ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° СЃ РІРЅРµСЃРµРЅРЅС‹РјРё РІ РµРіРѕ РєРѕРЅСЃС‚СЂСѓРєС†РёСЋ РёР·РјРµРЅРµРЅРёСЏРјРё С‚СЂРµР±РѕРІР°РЅРёСЏРј Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё (С„РѕСЂРјР°) (РїСЂРёР»РѕР¶РµРЅРёРµ в„– 18 Рє С‚РµС…РЅРёС‡РµСЃРєРѕРјСѓ СЂРµРіР»Р°РјРµРЅС‚Сѓ РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° В«Рћ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё РєРѕР»РµСЃРЅС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІВ» (РўР  РўРЎ 018/2011), РїСЂРёРЅСЏС‚РѕРјСѓ Р РµС€РµРЅРёРµРј РљРѕРјРёСЃСЃРёРё РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° РѕС‚ 9 РґРµРєР°Р±СЂСЏ 2011 Рі. в„– 877)');
INSERT INTO conformityassessmentdocstypesclassifier VALUES (10, '50', 'РґРѕРєСѓРјРµРЅС‚ РѕР± РѕС†РµРЅРєРµ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёСЏ РѕР±СЏР·Р°С‚РµР»СЊРЅС‹Рј С‚СЂРµР±РѕРІР°РЅРёСЏРј, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅС‹Рј Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІС‹РґР°РЅРЅС‹Р№ РІ РѕС‚РЅРѕС€РµРЅРёРё РѕР±СЉРµРєС‚Р° С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЂРµРіСѓР»РёСЂРѕРІР°РЅРёСЏ С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЂРµРіР»Р°РјРµРЅС‚Р° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° (С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЂРµРіР»Р°РјРµРЅС‚Р° РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р°) РґРѕ РґРЅСЏ РІСЃС‚СѓРїР»РµРЅРёСЏ РІ СЃРёР»Сѓ СЌС‚РѕРіРѕ С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЂРµРіР»Р°РјРµРЅС‚Р°', 'РґРѕРєСѓРјРµРЅС‚ РѕР± РѕС†РµРЅРєРµ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёСЏ РЅР°С†РёРѕРЅР°Р»СЊРЅС‹Рј С‚СЂРµР±РѕРІР°РЅРёСЏРј', NULL, NULL);


--
-- TOC entry 4529 (class 0 OID 18775)
-- Dependencies: 223
-- Data for Name: countriesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO countriesclassifier VALUES (1, 'RS', 'РЎР•Р Р‘Р�РЇ', 'РЎР•Р Р‘Р�РЇ', '192000000', 'RS', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (2, 'MD', 'РњРћР›Р”РћР’Рђ, Р Р•РЎРџРЈР‘Р›Р�РљРђ', 'РњРћР›Р”РћР’Рђ, Р Р•РЎРџРЈР‘Р›Р�РљРђ', '140000000', 'MD', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (3, 'GS', 'Р®Р–Рќ.Р”Р–РћР Р”Р–Р�РЇ Р� Р®Р–Рќ.РЎРђРќР”Р’Р�Р§.РћРЎРўР РћР’Рђ', 'Р®Р–Рќ.Р”Р–РћР Р”Р–Р�РЇ Р� Р®Р–Рќ.РЎРђРќР”Р’Р�Р§.РћРЎРўР РћР’Рђ', '91000000', 'GS', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (4, 'CF', 'Р¦Р•РќРўР РђР›Р¬РќРћ-РђР¤Р Р�РљРђРќРЎРљРђРЇ Р Р•РЎРџРЈР‘Р›Р�РљРђ', 'Р¦Р•РќРўР РђР›Р¬РќРћ-РђР¤Р Р�РљРђРќРЎРљРђРЇ Р Р•РЎРџРЈР‘Р›Р�РљРђ', '42000000', 'CF', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (5, 'VN', 'Р’Р¬Р•РўРќРђРњ', 'Р’Р¬Р•РўРќРђРњ', '243000000', 'VN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (6, 'RU', 'Р РћРЎРЎР�РЇ', 'Р РћРЎРЎР�РЇ', '193000000', 'RU', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (7, 'ME', 'Р§Р•Р РќРћР“РћР Р�РЇ', 'Р§Р•Р РќРћР“РћР Р�РЇ', '141000000', 'ME', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (8, 'GT', 'Р“Р’РђРўР•РњРђР›Рђ', 'Р“Р’РђРўР•РњРђР›Рђ', '92000000', 'GT', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (9, 'CG', 'РљРћРќР“Рћ', 'РљРћРќР“Рћ', '43000000', 'CG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (10, 'VU', 'Р’РђРќРЈРђРўРЈ', 'Р’РђРќРЈРђРўРЈ', '244000000', 'VU', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (11, 'RW', 'Р РЈРђРќР”Рђ', 'Р РЈРђРќР”Рђ', '194000000', 'RW', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (12, 'MF', 'РЎР•Рќ-РњРђР РўР•Рќ', 'РЎР•Рќ-РњРђР РўР•Рќ', '142000000', 'MF', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (13, 'GU', 'Р“РЈРђРњ', 'Р“РЈРђРњ', '93000000', 'GU', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (14, 'CH', 'РЁР’Р•Р™Р¦РђР Р�РЇ', 'РЁР’Р•Р™Р¦РђР Р�РЇ', '44000000', 'CH', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (15, 'WF', 'РЈРћР›Р›Р�РЎ Р� Р¤РЈРўРЈРќРђ', 'РЈРћР›Р›Р�РЎ Р� Р¤РЈРўРЈРќРђ', '245000000', 'WF', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (16, 'SA', 'РЎРђРЈР”РћР’РЎРљРђРЇ РђР РђР’Р�РЇ', 'РЎРђРЈР”РћР’РЎРљРђРЇ РђР РђР’Р�РЇ', '195000000', 'SA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (17, 'MG', 'РњРђР”РђР“РђРЎРљРђР ', 'РњРђР”РђР“РђРЎРљРђР ', '143000000', 'MG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (18, 'GW', 'Р“Р’Р�РќР•РЇ-Р‘Р�РЎРђРЈ', 'Р“Р’Р�РќР•РЇ-Р‘Р�РЎРђРЈ', '94000000', 'GW', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (19, 'CI', 'РљРћРў Р”''Р�Р’РЈРђР ', 'РљРћРў Р”&', '45000000', 'CI', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (20, 'WS', 'РЎРђРњРћРђ', 'РЎРђРњРћРђ', '246000000', 'WS', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (21, 'SB', 'РЎРћР›РћРњРћРќРћР’Р« РћРЎРўР РћР’Рђ', 'РЎРћР›РћРњРћРќРћР’Р« РћРЎРўР РћР’Рђ', '196000000', 'SB', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (22, 'MH', 'РњРђР РЁРђР›Р›РћР’Р« РћРЎРўР РћР’Рђ', 'РњРђР РЁРђР›Р›РћР’Р« РћРЎРўР РћР’Рђ', '144000000', 'MH', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (23, 'GY', 'Р“РђР™РђРќРђ', 'Р“РђР™РђРќРђ', '95000000', 'GY', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (24, 'CK', 'РћРЎРўР РћР’Рђ РљРЈРљРђ', 'РћРЎРўР РћР’Рђ РљРЈРљРђ', '46000000', 'CK', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (25, 'YE', 'Р™Р•РњР•Рќ', 'Р™Р•РњР•Рќ', '247000000', 'YE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (26, 'SC', 'РЎР•Р™РЁР•Р›Р«', 'РЎР•Р™РЁР•Р›Р«', '197000000', 'SC', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (27, 'MK', 'Р Р•РЎРџРЈР‘Р›Р�РљРђ РњРђРљР•Р”РћРќР�РЇ', 'Р Р•РЎРџРЈР‘Р›Р�РљРђ РњРђРљР•Р”РћРќР�РЇ', '145000000', 'MK', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (28, 'HK', 'Р“РћРќРљРћРќР“', 'Р“РћРќРљРћРќР“', '96000000', 'HK', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (29, 'CL', 'Р§Р�Р›Р�', 'Р§Р�Р›Р�', '47000000', 'CL', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (30, 'YT', 'РњРђР™РћРўРўРђ', 'РњРђР™РћРўРўРђ', '248000000', 'YT', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (31, 'SD', 'РЎРЈР”РђРќ', 'РЎРЈР”РђРќ', '198000000', 'SD', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (32, 'ML', 'РњРђР›Р�', 'РњРђР›Р�', '146000000', 'ML', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (33, 'HM', 'РћРЎРўР РћР’ РҐР•Р Р” Р� РћРЎРўР РћР’Рђ РњРђРљР”РћРќРђР›Р¬Р”', 'РћРЎРўР РћР’ РҐР•Р Р” Р� РћРЎРўР РћР’Рђ РњРђРљР”РћРќРђР›Р¬Р”', '97000000', 'HM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (34, 'CM', 'РљРђРњР•Р РЈРќ', 'РљРђРњР•Р РЈРќ', '48000000', 'CM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (35, 'ZA', 'Р®Р–РќРђРЇ РђР¤Р Р�РљРђ', 'Р®Р–РќРђРЇ РђР¤Р Р�РљРђ', '249000000', 'ZA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (36, 'SE', 'РЁР’Р•Р¦Р�РЇ', 'РЁР’Р•Р¦Р�РЇ', '199000000', 'SE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (37, 'MM', 'РњР¬РЇРќРњРђ', 'РњР¬РЇРќРњРђ', '147000000', 'MM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (38, 'HN', 'Р“РћРќР”РЈР РђРЎ', 'Р“РћРќР”РЈР РђРЎ', '98000000', 'HN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (39, 'CN', 'РљР�РўРђР™', 'РљР�РўРђР™', '49000000', 'CN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (40, 'ZM', 'Р—РђРњР‘Р�РЇ', 'Р—РђРњР‘Р�РЇ', '250000000', 'ZM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (41, 'SG', 'РЎР�РќР“РђРџРЈР ', 'РЎР�РќР“РђРџРЈР ', '200000000', 'SG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (42, 'MN', 'РњРћРќР“РћР›Р�РЇ', 'РњРћРќР“РћР›Р�РЇ', '148000000', 'MN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (43, 'HR', 'РҐРћР Р’РђРўР�РЇ', 'РҐРћР Р’РђРўР�РЇ', '99000000', 'HR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (44, 'CO', 'РљРћР›РЈРњР‘Р�РЇ', 'РљРћР›РЈРњР‘Р�РЇ', '50000000', 'CO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (45, 'ZW', 'Р—Р�РњР‘РђР‘Р’Р•', 'Р—Р�РњР‘РђР‘Р’Р•', '251000000', 'ZW', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (46, 'SH', 'РЎР’. Р•Р›Р•РќРђ, Рћ. Р’РћР—РќР•РЎР•РќР�РЇ, РўР .-Р”Рђ-РљРЈРќР¬РЇ', 'РЎР’. Р•Р›Р•РќРђ, Рћ. Р’РћР—РќР•РЎР•РќР�РЇ, РўР .-Р”Рђ-РљРЈРќР¬РЇ', '201000000', 'SH', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (47, 'MO', 'РњРђРљРђРћ', 'РњРђРљРђРћ', '149000000', 'MO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (48, 'HT', 'Р“РђР�РўР�', 'Р“РђР�РўР�', '100000000', 'HT', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (49, 'MP', 'РЎР•Р’Р•Р РќР«Р• РњРђР Р�РђРќРЎРљР�Р• РћРЎРўР РћР’Рђ', 'РЎР•Р’Р•Р РќР«Р• РњРђР Р�РђРќРЎРљР�Р• РћРЎРўР РћР’Рђ', '150000000', 'MP', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (50, 'PM', 'РЎР•РќРў-РџР¬Р•Р  Р� РњР�РљР•Р›РћРќ', 'РЎР•РќРў-РџР¬Р•Р  Р� РњР�РљР•Р›РћРќ', '181000000', 'PM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (51, 'LI', 'Р›Р�РҐРўР•РќРЁРўР•Р™Рќ', 'Р›Р�РҐРўР•РќРЁРўР•Р™Рќ', '130000000', 'LI', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (52, 'GF', 'Р¤Р РђРќР¦РЈР—РЎРљРђРЇ Р“Р’Р�РђРќРђ', 'Р¤Р РђРќР¦РЈР—РЎРљРђРЇ Р“Р’Р�РђРќРђ', '81000000', 'GF', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (53, 'BR', 'Р‘Р РђР—Р�Р›Р�РЇ', 'Р‘Р РђР—Р�Р›Р�РЇ', '32000000', 'BR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (54, 'UG', 'РЈР“РђРќР”Рђ', 'РЈР“РђРќР”Рђ', '233000000', 'UG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (55, 'PN', 'РџР�РўРљР­Р Рќ', 'РџР�РўРљР­Р Рќ', '182000000', 'PN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (56, 'LK', 'РЁР Р�-Р›РђРќРљРђ', 'РЁР Р�-Р›РђРќРљРђ', '131000000', 'LK', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (57, 'GG', 'Р“Р•Р РќРЎР�', 'Р“Р•Р РќРЎР�', '82000000', 'GG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (58, 'BS', 'Р‘РђР“РђРњР«', 'Р‘РђР“РђРњР«', '33000000', 'BS', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (59, 'UM', 'РњРђР›Р«Р• РўР�РҐРћРћРљР•РђРќ.РћРўР”РђР›Р•Рќ.РћРЎРў-Р’Рђ РЎ.РЁ.', 'РњРђР›Р«Р• РўР�РҐРћРћРљР•РђРќ.РћРўР”РђР›Р•Рќ.РћРЎРў-Р’Рђ РЎ.РЁ.', '234000000', 'UM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (60, 'PR', 'РџРЈР­Р РўРћ-Р Р�РљРћ', 'РџРЈР­Р РўРћ-Р Р�РљРћ', '184000000', 'PR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (61, 'LR', 'Р›Р�Р‘Р•Р Р�РЇ', 'Р›Р�Р‘Р•Р Р�РЇ', '132000000', 'LR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (62, 'GH', 'Р“РђРќРђ', 'Р“РђРќРђ', '83000000', 'GH', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (63, 'BT', 'Р‘РЈРўРђРќ', 'Р‘РЈРўРђРќ', '34000000', 'BT', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (64, 'US', 'РЎРћР•Р”Р�РќР•РќРќР«Р• РЁРўРђРўР«', 'РЎРћР•Р”Р�РќР•РќРќР«Р• РЁРўРђРўР«', '235000000', 'US', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (65, 'PS', 'РџРђР›Р•РЎРўР�РќРђ, Р“РћРЎРЈР”РђР РЎРўР’Рћ', 'РџРђР›Р•РЎРўР�РќРђ, Р“РћРЎРЈР”РђР РЎРўР’Рћ', '185000000', 'PS', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (66, 'LS', 'Р›Р•РЎРћРўРћ', 'Р›Р•РЎРћРўРћ', '133000000', 'LS', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (67, 'GI', 'Р“Р�Р‘Р РђР›РўРђР ', 'Р“Р�Р‘Р РђР›РўРђР ', '84000000', 'GI', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (68, 'BV', 'РћРЎРўР РћР’ Р‘РЈР’Р•', 'РћРЎРўР РћР’ Р‘РЈР’Р•', '35000000', 'BV', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (69, 'UY', 'РЈР РЈР“Р’РђР™', 'РЈР РЈР“Р’РђР™', '236000000', 'UY', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (70, 'PT', 'РџРћР РўРЈР“РђР›Р�РЇ', 'РџРћР РўРЈР“РђР›Р�РЇ', '186000000', 'PT', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (71, 'LT', 'Р›Р�РўР’Рђ', 'Р›Р�РўР’Рђ', '134000000', 'LT', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (72, 'GL', 'Р“Р Р•РќР›РђРќР”Р�РЇ', 'Р“Р Р•РќР›РђРќР”Р�РЇ', '85000000', 'GL', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (73, 'BW', 'Р‘РћРўРЎР’РђРќРђ', 'Р‘РћРўРЎР’РђРќРђ', '36000000', 'BW', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (74, 'UZ', 'РЈР—Р‘Р•РљР�РЎРўРђРќ', 'РЈР—Р‘Р•РљР�РЎРўРђРќ', '237000000', 'UZ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (75, 'PW', 'РџРђР›РђРЈ', 'РџРђР›РђРЈ', '187000000', 'PW', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (76, 'LU', 'Р›Р®РљРЎР•РњР‘РЈР Р“', 'Р›Р®РљРЎР•РњР‘РЈР Р“', '135000000', 'LU', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (77, 'GM', 'Р“РђРњР‘Р�РЇ', 'Р“РђРњР‘Р�РЇ', '86000000', 'GM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (78, 'BY', 'Р‘Р•Р›РђР РЈРЎР¬', 'Р‘Р•Р›РђР РЈРЎР¬', '37000000', 'BY', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (151, 'NA', 'РќРђРњР�Р‘Р�РЇ', 'РќРђРњР�Р‘Р�РЇ', '161000000', 'NA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (79, 'VA', 'РџРђРџРЎРљР�Р™ РџР Р•РЎРўРћР›(Р“РћРЎ.-Р“РћР РћР” Р’РђРўР�РљРђРќ)', 'РџРђРџРЎРљР�Р™ РџР Р•РЎРўРћР›(Р“РћРЎ.-Р“РћР РћР” Р’РђРўР�РљРђРќ)', '238000000', 'VA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (80, 'PY', 'РџРђР РђР“Р’РђР™', 'РџРђР РђР“Р’РђР™', '188000000', 'PY', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (81, 'LV', 'Р›РђРўР’Р�РЇ', 'Р›РђРўР’Р�РЇ', '136000000', 'LV', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (82, 'GN', 'Р“Р’Р�РќР•РЇ', 'Р“Р’Р�РќР•РЇ', '87000000', 'GN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (83, 'BZ', 'Р‘Р•Р›Р�Р—', 'Р‘Р•Р›Р�Р—', '38000000', 'BZ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (84, 'VC', 'РЎР•РќРў-Р’Р�РќРЎР•РќРў Р� Р“Р Р•РќРђР”Р�РќР«', 'РЎР•РќРў-Р’Р�РќРЎР•РќРў Р� Р“Р Р•РќРђР”Р�РќР«', '239000000', 'VC', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (85, 'QA', 'РљРђРўРђР ', 'РљРђРўРђР ', '189000000', 'QA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (86, 'LY', 'Р›Р�Р’Р�РЇ', 'Р›Р�Р’Р�РЇ', '137000000', 'LY', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (87, 'GP', 'Р“Р’РђР”Р•Р›РЈРџРђ', 'Р“Р’РђР”Р•Р›РЈРџРђ', '88000000', 'GP', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (88, 'CA', 'РљРђРќРђР”Рђ', 'РљРђРќРђР”Рђ', '39000000', 'CA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (89, 'VE', 'Р’Р•РќР•РЎРЈР­Р›Рђ,Р‘РћР›Р�Р’РђР Р�РђРќРЎРљРђРЇ Р Р•РЎРџРЈР‘Р›Р�РљРђ', 'Р’Р•РќР•РЎРЈР­Р›Рђ,Р‘РћР›Р�Р’РђР Р�РђРќРЎРљРђРЇ Р Р•РЎРџРЈР‘Р›Р�РљРђ', '240000000', 'VE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (90, 'RE', 'Р Р•Р®РќР¬РћРќ', 'Р Р•Р®РќР¬РћРќ', '190000000', 'RE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (91, 'MA', 'РњРђР РћРљРљРћ', 'РњРђР РћРљРљРћ', '138000000', 'MA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (92, 'GQ', 'Р­РљР’РђРўРћР Р�РђР›Р¬РќРђРЇ Р“Р’Р�РќР•РЇ', 'Р­РљР’РђРўРћР Р�РђР›Р¬РќРђРЇ Р“Р’Р�РќР•РЇ', '89000000', 'GQ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (93, 'CC', 'РљРћРљРћРЎРћР’Р«Р• (РљР�Р›Р�РќР“) РћРЎРўР РћР’Рђ', 'РљРћРљРћРЎРћР’Р«Р• (РљР�Р›Р�РќР“) РћРЎРўР РћР’Рђ', '40000000', 'CC', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (94, 'VG', 'Р’Р�Р Р“Р�РќРЎРљР�Р• РћРЎРўР РћР’Рђ, Р‘Р Р�РўРђРќРЎРљР�Р•', 'Р’Р�Р Р“Р�РќРЎРљР�Р• РћРЎРўР РћР’Рђ, Р‘Р Р�РўРђРќРЎРљР�Р•', '241000000', 'VG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (95, 'RO', 'Р РЈРњР«РќР�РЇ', 'Р РЈРњР«РќР�РЇ', '191000000', 'RO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (96, 'MC', 'РњРћРќРђРљРћ', 'РњРћРќРђРљРћ', '139000000', 'MC', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (97, 'GR', 'Р“Р Р•Р¦Р�РЇ', 'Р“Р Р•Р¦Р�РЇ', '90000000', 'GR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (98, 'CD', 'РљРћРќР“Рћ, Р”Р•РњРћРљР РђРўР�Р§Р•РЎРљРђРЇ Р Р•РЎРџРЈР‘Р›Р�РљРђ', 'РљРћРќР“Рћ, Р”Р•РњРћРљР РђРўР�Р§Р•РЎРљРђРЇ Р Р•РЎРџРЈР‘Р›Р�РљРђ', '41000000', 'CD', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (99, 'VI', 'Р’Р�Р Р“Р�РќРЎРљР�Р• РћРЎРўР РћР’Рђ, РЎРЁРђ', 'Р’Р�Р Р“Р�РќРЎРљР�Р• РћРЎРўР РћР’Рђ, РЎРЁРђ', '242000000', 'VI', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (100, 'NU', 'РќР�РЈР­', 'РќР�РЈР­', '171000000', 'NU', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (101, 'KM', 'РљРћРњРћР Р«', 'РљРћРњРћР Р«', '120000000', 'KM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (102, 'FI', 'Р¤Р�РќР›РЇРќР”Р�РЇ', 'Р¤Р�РќР›РЇРќР”Р�РЇ', '71000000', 'FI', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (103, 'BF', 'Р‘РЈР РљР�РќРђ-Р¤РђРЎРћ', 'Р‘РЈР РљР�РќРђ-Р¤РђРЎРћ', '22000000', 'BF', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (104, 'TL', 'РўР�РњРћР -Р›Р•РЎРўР•', 'РўР�РњРћР -Р›Р•РЎРўР•', '223000000', 'TL', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (105, 'NZ', 'РќРћР’РђРЇ Р—Р•Р›РђРќР”Р�РЇ', 'РќРћР’РђРЇ Р—Р•Р›РђРќР”Р�РЇ', '172000000', 'NZ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (106, 'KN', 'РЎР•РќРў-РљР�РўРЎ Р� РќР•Р’Р�РЎ', 'РЎР•РќРў-РљР�РўРЎ Р� РќР•Р’Р�РЎ', '121000000', 'KN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (107, 'FJ', 'Р¤Р�Р”Р–Р�', 'Р¤Р�Р”Р–Р�', '72000000', 'FJ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (108, 'BG', 'Р‘РћР›Р“РђР Р�РЇ', 'Р‘РћР›Р“РђР Р�РЇ', '23000000', 'BG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (109, 'TM', 'РўРЈР РљРњР•РќР�РЇ', 'РўРЈР РљРњР•РќР�РЇ', '224000000', 'TM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (110, 'OM', 'РћРњРђРќ', 'РћРњРђРќ', '173000000', 'OM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (111, 'KP', 'РљРћР Р•РЇ, РќРђР РћР”РќРћ-Р”Р•РњРћРљР РђРўР�Р§. Р Р•РЎРџРЈР‘Р›Р�РљРђ', 'РљРћР Р•РЇ, РќРђР РћР”РќРћ-Р”Р•РњРћРљР РђРўР�Р§. Р Р•РЎРџРЈР‘Р›Р�РљРђ', '122000000', 'KP', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (112, 'FK', 'Р¤РћР›РљР›Р•РќР”РЎРљР�Р• РћРЎРўР РћР’Рђ (РњРђР›Р¬Р’Р�РќРЎРљР�Р•)', 'Р¤РћР›РљР›Р•РќР”РЎРљР�Р• РћРЎРўР РћР’Рђ (РњРђР›Р¬Р’Р�РќРЎРљР�Р•)', '73000000', 'FK', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (113, 'BH', 'Р‘РђРҐР Р•Р™Рќ', 'Р‘РђРҐР Р•Р™Рќ', '24000000', 'BH', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (114, 'TN', 'РўРЈРќР�РЎ', 'РўРЈРќР�РЎ', '225000000', 'TN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (115, 'PA', 'РџРђРќРђРњРђ', 'РџРђРќРђРњРђ', '174000000', 'PA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (116, 'KR', 'РљРћР Р•РЇ, Р Р•РЎРџРЈР‘Р›Р�РљРђ', 'РљРћР Р•РЇ, Р Р•РЎРџРЈР‘Р›Р�РљРђ', '123000000', 'KR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (117, 'FM', 'РњР�РљР РћРќР•Р—Р�РЇ, Р¤Р•Р”Р•Р РђРўР�Р’РќР«Р• РЁРўРђРўР«', 'РњР�РљР РћРќР•Р—Р�РЇ, Р¤Р•Р”Р•Р РђРўР�Р’РќР«Р• РЁРўРђРўР«', '74000000', 'FM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (118, 'BI', 'Р‘РЈР РЈРќР”Р�', 'Р‘РЈР РЈРќР”Р�', '25000000', 'BI', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (119, 'TO', 'РўРћРќР“Рђ', 'РўРћРќР“Рђ', '226000000', 'TO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (120, 'PE', 'РџР•Р РЈ', 'РџР•Р РЈ', '175000000', 'PE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (121, 'KW', 'РљРЈР’Р•Р™Рў', 'РљРЈР’Р•Р™Рў', '124000000', 'KW', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (122, 'FO', 'Р¤РђР Р•Р РЎРљР�Р• РћРЎРўР РћР’Рђ', 'Р¤РђР Р•Р РЎРљР�Р• РћРЎРўР РћР’Рђ', '75000000', 'FO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (123, 'BJ', 'Р‘Р•РќР�Рќ', 'Р‘Р•РќР�Рќ', '26000000', 'BJ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (124, 'TR', 'РўРЈР Р¦Р�РЇ', 'РўРЈР Р¦Р�РЇ', '227000000', 'TR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (125, 'PF', 'Р¤Р РђРќР¦РЈР—РЎРљРђРЇ РџРћР›Р�РќР•Р—Р�РЇ', 'Р¤Р РђРќР¦РЈР—РЎРљРђРЇ РџРћР›Р�РќР•Р—Р�РЇ', '176000000', 'PF', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (126, 'KY', 'РћРЎРўР РћР’Рђ РљРђР™РњРђРќ', 'РћРЎРўР РћР’Рђ РљРђР™РњРђРќ', '125000000', 'KY', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (127, 'FR', 'Р¤Р РђРќР¦Р�РЇ', 'Р¤Р РђРќР¦Р�РЇ', '76000000', 'FR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (128, 'BL', 'РЎР•Рќ-Р‘РђР РўР•Р›Р•РњР�', 'РЎР•Рќ-Р‘РђР РўР•Р›Р•РњР�', '27000000', 'BL', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (129, 'TT', 'РўР Р�РќР�Р”РђР” Р� РўРћР‘РђР“Рћ', 'РўР Р�РќР�Р”РђР” Р� РўРћР‘РђР“Рћ', '228000000', 'TT', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (130, 'PG', 'РџРђРџРЈРђ РќРћР’РђРЇ Р“Р’Р�РќР•РЇ', 'РџРђРџРЈРђ РќРћР’РђРЇ Р“Р’Р�РќР•РЇ', '177000000', 'PG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (131, 'KZ', 'РљРђР—РђРҐРЎРўРђРќ', 'РљРђР—РђРҐРЎРўРђРќ', '126000000', 'KZ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (132, 'GA', 'Р“РђР‘РћРќ', 'Р“РђР‘РћРќ', '77000000', 'GA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (133, 'BM', 'Р‘Р•Р РњРЈР”Р«', 'Р‘Р•Р РњРЈР”Р«', '28000000', 'BM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (134, 'TV', 'РўРЈР’РђР›РЈ', 'РўРЈР’РђР›РЈ', '229000000', 'TV', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (135, 'PH', 'Р¤Р�Р›Р�РџРџР�РќР«', 'Р¤Р�Р›Р�РџРџР�РќР«', '178000000', 'PH', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (136, 'LA', 'Р›РђРћРЎРЎРљРђРЇ РќРђР РћР”РќРћ-Р”Р•РњРћРљР РђРўР�Р§. Р Р•РЎРџРЈР‘Р›Р�РљРђ', 'Р›РђРћРЎРЎРљРђРЇ РќРђР РћР”РќРћ-Р”Р•РњРћРљР РђРўР�Р§. Р Р•РЎРџРЈР‘Р›Р�РљРђ', '127000000', 'LA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (137, 'GB', 'РЎРћР•Р”Р�РќР•РќРќРћР• РљРћР РћР›Р•Р’РЎРўР’Рћ', 'РЎРћР•Р”Р�РќР•РќРќРћР• РљРћР РћР›Р•Р’РЎРўР’Рћ', '78000000', 'GB', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (138, 'BN', 'Р‘Р РЈРќР•Р™-Р”РђР РЈРЎРЎРђР›РђРњ', 'Р‘Р РЈРќР•Р™-Р”РђР РЈРЎРЎРђР›РђРњ', '29000000', 'BN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (139, 'TW', 'РўРђР™Р’РђРќР¬ (РљР�РўРђР™)', 'РўРђР™Р’РђРќР¬ (РљР�РўРђР™)', '230000000', 'TW', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (140, 'PK', 'РџРђРљР�РЎРўРђРќ', 'РџРђРљР�РЎРўРђРќ', '179000000', 'PK', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (141, 'LB', 'Р›Р�Р’РђРќ', 'Р›Р�Р’РђРќ', '128000000', 'LB', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (142, 'GD', 'Р“Р Р•РќРђР”Рђ', 'Р“Р Р•РќРђР”Рђ', '79000000', 'GD', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (143, 'BO', 'Р‘РћР›Р�Р’Р�РЇ, РњРќРћР“РћРќРђР¦Р�РћРќРђР›Р¬РќРћР• Р“РћРЎРЈР”РђР РЎРўР’Рћ', 'Р‘РћР›Р�Р’Р�РЇ, РњРќРћР“РћРќРђР¦Р�РћРќРђР›Р¬РќРћР• Р“РћРЎРЈР”РђР РЎРўР’Рћ', '30000000', 'BO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (144, 'TZ', 'РўРђРќР—РђРќР�РЇ, РћР‘РЄР•Р”Р�РќР•РќРќРђРЇ Р Р•РЎРџРЈР‘Р›Р�РљРђ', 'РўРђРќР—РђРќР�РЇ, РћР‘РЄР•Р”Р�РќР•РќРќРђРЇ Р Р•РЎРџРЈР‘Р›Р�РљРђ', '231000000', 'TZ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (145, 'PL', 'РџРћР›Р¬РЁРђ', 'РџРћР›Р¬РЁРђ', '180000000', 'PL', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (146, 'LC', 'РЎР•РќРў-Р›Р®РЎР�РЇ', 'РЎР•РќРў-Р›Р®РЎР�РЇ', '129000000', 'LC', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (147, 'GE', 'Р“Р РЈР—Р�РЇ', 'Р“Р РЈР—Р�РЇ', '80000000', 'GE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (148, 'BQ', 'Р‘РћРќР­Р™Р , РЎР�РќРў-Р­РЎРўРђРўР�РЈРЎ Р� РЎРђР‘Рђ', 'Р‘РћРќР­Р™Р , РЎР�РќРў-Р­РЎРўРђРўР�РЈРЎ Р� РЎРђР‘Рђ', '31000000', 'BQ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (149, 'UA', 'РЈРљР РђР�РќРђ', 'РЈРљР РђР�РќРђ', '232000000', 'UA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (150, 'IS', 'Р�РЎР›РђРќР”Р�РЇ', 'Р�РЎР›РђРќР”Р�РЇ', '110000000', 'IS', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (152, 'DM', 'Р”РћРњР�РќР�РљРђ', 'Р”РћРњР�РќР�РљРђ', '61000000', 'DM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (153, 'AS', 'РђРњР•Р Р�РљРђРќРЎРљРћР• РЎРђРњРћРђ', 'РђРњР•Р Р�РљРђРќРЎРљРћР• РЎРђРњРћРђ', '12000000', 'AS', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (154, 'SX', 'РЎР•Рќ-РњРђР РўР•Рќ (РЅРёРґРµСЂР»Р°РЅРґСЃРєР°СЏ С‡Р°СЃС‚СЊ)', 'РЎР•Рќ-РњРђР РўР•Рќ (РЅРёРґРµСЂР»Р°РЅРґСЃРєР°СЏ С‡Р°СЃС‚СЊ)', '213000000', 'SX', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (155, 'IT', 'Р�РўРђР›Р�РЇ', 'Р�РўРђР›Р�РЇ', '111000000', 'IT', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (156, 'NC', 'РќРћР’РђРЇ РљРђР›Р•Р”РћРќР�РЇ', 'РќРћР’РђРЇ РљРђР›Р•Р”РћРќР�РЇ', '162000000', 'NC', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (157, 'DO', 'Р”РћРњР�РќР�РљРђРќРЎРљРђРЇ Р Р•РЎРџРЈР‘Р›Р�РљРђ', 'Р”РћРњР�РќР�РљРђРќРЎРљРђРЇ Р Р•РЎРџРЈР‘Р›Р�РљРђ', '62000000', 'DO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (158, 'AT', 'РђР’РЎРўР Р�РЇ', 'РђР’РЎРўР Р�РЇ', '13000000', 'AT', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (159, 'SY', 'РЎР�Р Р�Р™РЎРљРђРЇ РђР РђР‘РЎРљРђРЇ Р Р•РЎРџРЈР‘Р›Р�РљРђ', 'РЎР�Р Р�Р™РЎРљРђРЇ РђР РђР‘РЎРљРђРЇ Р Р•РЎРџРЈР‘Р›Р�РљРђ', '214000000', 'SY', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (160, 'JE', 'Р”Р–Р•Р РЎР�', 'Р”Р–Р•Р РЎР�', '112000000', 'JE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (161, 'NE', 'РќР�Р“Р•Р ', 'РќР�Р“Р•Р ', '163000000', 'NE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (162, 'DZ', 'РђР›Р–Р�Р ', 'РђР›Р–Р�Р ', '63000000', 'DZ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (163, 'AU', 'РђР’РЎРўР РђР›Р�РЇ', 'РђР’РЎРўР РђР›Р�РЇ', '14000000', 'AU', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (164, 'SZ', 'РЎР’РђР—Р�Р›Р•РќР”', 'РЎР’РђР—Р�Р›Р•РќР”', '215000000', 'SZ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (165, 'NF', 'РћРЎРўР РћР’ РќРћР Р¤РћР›Рљ', 'РћРЎРўР РћР’ РќРћР Р¤РћР›Рљ', '164000000', 'NF', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (166, 'JM', 'РЇРњРђР™РљРђ', 'РЇРњРђР™РљРђ', '113000000', 'JM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (167, 'EC', 'Р­РљР’РђР”РћР ', 'Р­РљР’РђР”РћР ', '64000000', 'EC', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (168, 'AW', 'РђР РЈР‘Рђ', 'РђР РЈР‘Рђ', '15000000', 'AW', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (169, 'TC', 'РћРЎРўР РћР’Рђ РўР•Р РљРЎ Р� РљРђР™РљРћРЎ', 'РћРЎРўР РћР’Рђ РўР•Р РљРЎ Р� РљРђР™РљРћРЎ', '216000000', 'TC', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (170, 'NG', 'РќР�Р“Р•Р Р�РЇ', 'РќР�Р“Р•Р Р�РЇ', '165000000', 'NG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (171, 'JO', 'Р�РћР Р”РђРќР�РЇ', 'Р�РћР Р”РђРќР�РЇ', '114000000', 'JO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (172, 'EE', 'Р­РЎРўРћРќР�РЇ', 'Р­РЎРўРћРќР�РЇ', '65000000', 'EE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (173, 'AX', 'Р­Р›РђРќР”РЎРљР�Р• РћРЎРўР РћР’Рђ', 'Р­Р›РђРќР”РЎРљР�Р• РћРЎРўР РћР’Рђ', '16000000', 'AX', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (174, 'TD', 'Р§РђР”', 'Р§РђР”', '217000000', 'TD', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (175, 'NI', 'РќР�РљРђР РђР“РЈРђ', 'РќР�РљРђР РђР“РЈРђ', '166000000', 'NI', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (176, 'JP', 'РЇРџРћРќР�РЇ', 'РЇРџРћРќР�РЇ', '115000000', 'JP', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (177, 'EG', 'Р•Р“Р�РџР•Рў', 'Р•Р“Р�РџР•Рў', '66000000', 'EG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (178, 'AZ', 'РђР—Р•Р Р‘РђР™Р”Р–РђРќ', 'РђР—Р•Р Р‘РђР™Р”Р–РђРќ', '17000000', 'AZ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (179, 'TF', 'Р¤Р РђРќР¦РЈР—РЎРљР�Р• Р®Р–РќР«Р• РўР•Р Р Р�РўРћР Р�Р�', 'Р¤Р РђРќР¦РЈР—РЎРљР�Р• Р®Р–РќР«Р• РўР•Р Р Р�РўРћР Р�Р�', '218000000', 'TF', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (180, 'NL', 'РќР�Р”Р•Р Р›РђРќР”Р«', 'РќР�Р”Р•Р Р›РђРќР”Р«', '167000000', 'NL', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (181, 'KE', 'РљР•РќР�РЇ', 'РљР•РќР�РЇ', '116000000', 'KE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (182, 'EH', 'Р—РђРџРђР”РќРђРЇ РЎРђРҐРђР Рђ', 'Р—РђРџРђР”РќРђРЇ РЎРђРҐРђР Рђ', '67000000', 'EH', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (183, 'BA', 'Р‘РћРЎРќР�РЇ Р� Р“Р•Р Р¦Р•Р“РћР’Р�РќРђ', 'Р‘РћРЎРќР�РЇ Р� Р“Р•Р Р¦Р•Р“РћР’Р�РќРђ', '18000000', 'BA', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (184, 'TG', 'РўРћР“Рћ', 'РўРћР“Рћ', '219000000', 'TG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (185, 'NO', 'РќРћР Р’Р•Р“Р�РЇ', 'РќРћР Р’Р•Р“Р�РЇ', '168000000', 'NO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (186, 'KG', 'РљР�Р Р“Р�Р—Р�РЇ', 'РљС‹СЂРіС‹Р·СЃРєР°СЏ СЂРµСЃРїСѓР±Р»РёРєР°', '117000000', 'KG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (187, 'ER', 'Р­Р Р�РўР Р•РЇ', 'Р­Р Р�РўР Р•РЇ', '68000000', 'ER', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (188, 'BB', 'Р‘РђР Р‘РђР”РћРЎ', 'Р‘РђР Р‘РђР”РћРЎ', '19000000', 'BB', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (189, 'TH', 'РўРђР�Р›РђРќР”', 'РўРђР�Р›РђРќР”', '220000000', 'TH', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (190, 'NP', 'РќР•РџРђР›', 'РќР•РџРђР›', '169000000', 'NP', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (191, 'KH', 'РљРђРњР‘РћР”Р–Рђ', 'РљРђРњР‘РћР”Р–Рђ', '118000000', 'KH', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (192, 'ES', 'Р�РЎРџРђРќР�РЇ', 'Р�РЎРџРђРќР�РЇ', '69000000', 'ES', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (193, 'BD', 'Р‘РђРќР“Р›РђР”Р•РЁ', 'Р‘РђРќР“Р›РђР”Р•РЁ', '20000000', 'BD', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (194, 'TJ', 'РўРђР”Р–Р�РљР�РЎРўРђРќ', 'РўРђР”Р–Р�РљР�РЎРўРђРќ', '221000000', 'TJ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (195, 'NR', 'РќРђРЈР РЈ', 'РќРђРЈР РЈ', '170000000', 'NR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (196, 'KI', 'РљР�Р Р�Р‘РђРўР�', 'РљР�Р Р�Р‘РђРўР�', '119000000', 'KI', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (197, 'ET', 'Р­Р¤Р�РћРџР�РЇ', 'Р­Р¤Р�РћРџР�РЇ', '70000000', 'ET', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (198, 'BE', 'Р‘Р•Р›Р¬Р“Р�РЇ', 'Р‘Р•Р›Р¬Р“Р�РЇ', '21000000', 'BE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (199, 'TK', 'РўРћРљР•Р›РђРЈ', 'РўРћРљР•Р›РђРЈ', '222000000', 'TK', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (200, 'AD', 'РђРќР”РћР Р Рђ', 'РђРќР”РћР Р Рђ', '1000000', 'AD', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (201, 'MQ', 'РњРђР РўР�РќР�РљРђ', 'РњРђР РўР�РќР�РљРђ', '151000000', 'MQ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (202, 'SI', 'РЎР›РћР’Р•РќР�РЇ', 'РЎР›РћР’Р•РќР�РЇ', '202000000', 'SI', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (203, 'CR', 'РљРћРЎРўРђ-Р Р�РљРђ', 'РљРћРЎРўРђ-Р Р�РљРђ', '51000000', 'CR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (204, 'HU', 'Р’Р•РќР“Р Р�РЇ', 'Р’Р•РќР“Р Р�РЇ', '101000000', 'HU', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (205, 'SJ', 'РЁРџР�Р¦Р‘Р•Р Р“Р•Рќ Р� РЇРќ РњРђР™Р•Рќ', 'РЁРџР�Р¦Р‘Р•Р Р“Р•Рќ Р� РЇРќ РњРђР™Р•Рќ', '203000000', 'SJ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (206, 'AE', 'РћР‘РЄР•Р”Р�РќР•РќРќР«Р• РђР РђР‘РЎРљР�Р• Р­РњР�Р РђРўР«', 'РћР‘РЄР•Р”Р�РќР•РќРќР«Р• РђР РђР‘РЎРљР�Р• Р­РњР�Р РђРўР«', '2000000', 'AE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (207, 'MR', 'РњРђР’Р Р�РўРђРќР�РЇ', 'РњРђР’Р Р�РўРђРќР�РЇ', '152000000', 'MR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (208, 'CU', 'РљРЈР‘Рђ', 'РљРЈР‘Рђ', '52000000', 'CU', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (209, 'SK', 'РЎР›РћР’РђРљР�РЇ', 'РЎР›РћР’РђРљР�РЇ', '204000000', 'SK', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (210, 'AF', 'РђР¤Р“РђРќР�РЎРўРђРќ', 'РђР¤Р“РђРќР�РЎРўРђРќ', '3000000', 'AF', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (211, 'ID', 'Р�РќР”РћРќР•Р—Р�РЇ', 'Р�РќР”РћРќР•Р—Р�РЇ', '102000000', 'ID', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (212, 'MS', 'РњРћРќРўРЎР•Р Р РђРў', 'РњРћРќРўРЎР•Р Р РђРў', '153000000', 'MS', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (213, 'CV', 'РљРђР‘Рћ-Р’Р•Р Р”Р•', 'РљРђР‘Рћ-Р’Р•Р Р”Р•', '53000000', 'CV', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (214, 'SL', 'РЎР¬Р•Р Р Рђ-Р›Р•РћРќР•', 'РЎР¬Р•Р Р Рђ-Р›Р•РћРќР•', '205000000', 'SL', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (215, 'AG', 'РђРќРўР�Р“РЈРђ Р� Р‘РђР Р‘РЈР”Рђ', 'РђРќРўР�Р“РЈРђ Р� Р‘РђР Р‘РЈР”Рђ', '4000000', 'AG', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (216, 'IE', 'Р�Р Р›РђРќР”Р�РЇ', 'Р�Р Р›РђРќР”Р�РЇ', '103000000', 'IE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (217, 'MT', 'РњРђР›Р¬РўРђ', 'РњРђР›Р¬РўРђ', '154000000', 'MT', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (218, 'CW', 'РљР®Р РђРЎРђРћ', 'РљР®Р РђРЎРђРћ', '54000000', 'CW', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (219, 'SM', 'РЎРђРќ-РњРђР Р�РќРћ', 'РЎРђРќ-РњРђР Р�РќРћ', '206000000', 'SM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (220, 'AI', 'РђРќР“Р�Р›Р¬РЇ', 'РђРќР“Р�Р›Р¬РЇ', '5000000', 'AI', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (221, 'IL', 'Р�Р—Р РђР�Р›Р¬', 'Р�Р—Р РђР�Р›Р¬', '104000000', 'IL', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (222, 'MU', 'РњРђР’Р Р�РљР�Р™', 'РњРђР’Р Р�РљР�Р™', '155000000', 'MU', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (223, 'CX', 'РћРЎРўР РћР’ Р РћР–Р”Р•РЎРўР’Рђ', 'РћРЎРўР РћР’ Р РћР–Р”Р•РЎРўР’Рђ', '55000000', 'CX', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (224, 'AL', 'РђР›Р‘РђРќР�РЇ', 'РђР›Р‘РђРќР�РЇ', '6000000', 'AL', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (225, 'SN', 'РЎР•РќР•Р“РђР›', 'РЎР•РќР•Р“РђР›', '207000000', 'SN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (226, 'IM', 'РћРЎРўР РћР’ РњР­Рќ', 'РћРЎРўР РћР’ РњР­Рќ', '105000000', 'IM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (227, 'MV', 'РњРђР›Р¬Р”Р�Р’Р«', 'РњРђР›Р¬Р”Р�Р’Р«', '156000000', 'MV', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (228, 'CY', 'РљР�РџР ', 'РљР�РџР ', '56000000', 'CY', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (229, 'AM', 'РђР РњР•РќР�РЇ', 'РђР РњР•РќР�РЇ', '7000000', 'AM', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (230, 'SO', 'РЎРћРњРђР›Р�', 'РЎРћРњРђР›Р�', '208000000', 'SO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (231, 'IN', 'Р�РќР”Р�РЇ', 'Р�РќР”Р�РЇ', '106000000', 'IN', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (232, 'MW', 'РњРђР›РђР’Р�', 'РњРђР›РђР’Р�', '157000000', 'MW', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (233, 'CZ', 'Р§Р•РЁРЎРљРђРЇ Р Р•РЎРџРЈР‘Р›Р�РљРђ', 'Р§Р•РЁРЎРљРђРЇ Р Р•РЎРџРЈР‘Р›Р�РљРђ', '57000000', 'CZ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (234, 'SR', 'РЎРЈР Р�РќРђРњ', 'РЎРЈР Р�РќРђРњ', '209000000', 'SR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (235, 'IO', 'Р‘Р Р�РўРђРќРЎРљРђРЇ РўР•Р Р Р�РўРћР Р�РЇ Р’ Р�РќР”Р�Р™РЎРљРћРњ РћРљР•РђРќР•', 'Р‘Р Р�РўРђРќРЎРљРђРЇ РўР•Р Р Р�РўРћР Р�РЇ Р’ Р�РќР”Р�Р™РЎРљРћРњ РћРљР•РђРќР•', '107000000', 'IO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (236, 'MX', 'РњР•РљРЎР�РљРђ', 'РњР•РљРЎР�РљРђ', '158000000', 'MX', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (237, 'DE', 'Р“Р•Р РњРђРќР�РЇ', 'Р“Р•Р РњРђРќР�РЇ', '58000000', 'DE', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (238, 'AO', 'РђРќР“РћР›Рђ', 'РђРќР“РћР›Рђ', '9000000', 'AO', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (239, 'SS', 'Р®Р–РќР«Р™ РЎРЈР”РђРќ', 'Р®Р–РќР«Р™ РЎРЈР”РђРќ', '210000000', 'SS', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (240, 'IQ', 'Р�Р РђРљ', 'Р�Р РђРљ', '108000000', 'IQ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (241, 'MY', 'РњРђР›РђР™Р—Р�РЇ', 'РњРђР›РђР™Р—Р�РЇ', '159000000', 'MY', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (242, 'DJ', 'Р”Р–Р�Р‘РЈРўР�', 'Р”Р–Р�Р‘РЈРўР�', '59000000', 'DJ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (243, 'AQ', 'РђРќРўРђР РљРўР�Р”Рђ', 'РђРќРўРђР РљРўР�Р”Рђ', '10000000', 'AQ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (244, 'ST', 'РЎРђРќ-РўРћРњР• Р� РџР Р�РќРЎР�РџР�', 'РЎРђРќ-РўРћРњР• Р� РџР Р�РќРЎР�РџР�', '211000000', 'ST', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (245, 'IR', 'Р�Р РђРќ, Р�РЎР›РђРњРЎРљРђРЇ Р Р•РЎРџРЈР‘Р›Р�РљРђ', 'Р�Р РђРќ, Р�РЎР›РђРњРЎРљРђРЇ Р Р•РЎРџРЈР‘Р›Р�РљРђ', '109000000', 'IR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (246, 'MZ', 'РњРћР—РђРњР‘Р�Рљ', 'РњРћР—РђРњР‘Р�Рљ', '160000000', 'MZ', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (247, 'DK', 'Р”РђРќР�РЇ', 'Р”РђРќР�РЇ', '60000000', 'DK', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (248, 'AR', 'РђР Р“Р•РќРўР�РќРђ', 'РђР Р“Р•РќРўР�РќРђ', '11000000', 'AR', NULL, NULL, NULL, NULL);
INSERT INTO countriesclassifier VALUES (249, 'SV', 'Р­Р›Р¬-РЎРђР›Р¬Р’РђР”РћР ', 'Р­Р›Р¬-РЎРђР›Р¬Р’РђР”РћР ', '212000000', 'SV', NULL, NULL, NULL, NULL);


--
-- TOC entry 4531 (class 0 OID 18783)
-- Dependencies: 225
-- Data for Name: currencyclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO currencyclassifier VALUES (1, 784, 'AED', 'Р”РёСЂС…Р°Рј (РћРђР­)', NULL, NULL);
INSERT INTO currencyclassifier VALUES (2, 971, 'AFN', 'РђС„РіР°РЅРё', NULL, NULL);
INSERT INTO currencyclassifier VALUES (3, 8, 'ALL', 'Р›РµРє', NULL, NULL);
INSERT INTO currencyclassifier VALUES (4, 51, 'AMD', 'РђСЂРјСЏРЅСЃРєРёР№ РґСЂР°Рј', NULL, NULL);
INSERT INTO currencyclassifier VALUES (5, 532, 'ANG', 'РќРёРґРµСЂР»Р°РЅРґСЃРєРёР№ Р°РЅС‚РёР»СЊСЃРєРёР№ РіСѓР»СЊРґРµРЅ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (6, 973, 'AOA', 'РљРІР°РЅР·Р°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (7, 32, 'ARS', 'РђСЂРіРµРЅС‚РёРЅСЃРєРѕРµ РїРµСЃРѕ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (8, 36, 'AUD', 'РђРІСЃС‚СЂР°Р»РёР№СЃРєРёР№ РґРѕР»Р»Р°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (9, 533, 'AWG', 'РђСЂСѓР±Р°РЅСЃРєРёР№ С„Р»РѕСЂРёРЅ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (10, 944, 'AZN', 'РђР·РµСЂР±Р°Р№РґР¶Р°РЅСЃРєРёР№ РјР°РЅР°С‚', NULL, NULL);
INSERT INTO currencyclassifier VALUES (11, 977, 'BAM', 'РљРѕРЅРІРµСЂС‚РёСЂСѓРµРјР°СЏ РјР°СЂРєР°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (12, 52, 'BBD', 'Р‘Р°СЂР±Р°РґРѕСЃСЃРєРёР№ РґРѕР»Р»Р°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (13, 50, 'BDT', 'РўР°РєР°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (14, 975, 'BGN', 'Р‘РѕР»РіР°СЂСЃРєРёР№ Р»РµРІ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (15, 48, 'BHD', 'Р‘Р°С…СЂРµР№РЅСЃРєРёР№ РґРёРЅР°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (16, 108, 'BIF', 'Р‘СѓСЂСѓРЅРґРёР№СЃРєРёР№ С„СЂР°РЅРє', NULL, NULL);
INSERT INTO currencyclassifier VALUES (17, 60, 'BMD', 'Р‘РµСЂРјСѓРґСЃРєРёР№ РґРѕР»Р»Р°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (18, 96, 'BND', 'Р‘СЂСѓРЅРµР№СЃРєРёР№ РґРѕР»Р»Р°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (19, 68, 'BOB', 'Р‘РѕР»РёРІРёР°РЅРѕ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (20, 986, 'BRL', 'Р‘СЂР°Р·РёР»СЊСЃРєРёР№ СЂРµР°Р»', NULL, NULL);
INSERT INTO currencyclassifier VALUES (21, 44, 'BSD', 'Р‘Р°РіР°РјСЃРєРёР№ РґРѕР»Р»Р°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (22, 64, 'BTN', 'РќРіСѓР»С‚СЂСѓРј', NULL, NULL);
INSERT INTO currencyclassifier VALUES (23, 72, 'BWP', 'РџСѓР»Р°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (24, 933, 'BYN', 'Р‘РµР»РѕСЂСѓСЃСЃРєРёР№ СЂСѓР±Р»СЊ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (25, 974, 'BYR', 'Р‘РµР»РѕСЂСѓСЃСЃРєРёР№ СЂСѓР±Р»СЊ', NULL, '1В РџСЂРёРјРµРЅСЏРµС‚СЃСЏ РґР»СЏ РґРµРЅРµР¶РЅС‹С… СЃСЂРµРґСЃС‚РІ, СѓРїР»Р°С‡РµРЅРЅС‹С… РґРѕ 30 РёСЋРЅСЏ 2016 Рі. РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ.');
INSERT INTO currencyclassifier VALUES (26, 84, 'BZD', 'Р‘РµР»РёР·СЃРєРёР№ РґРѕР»Р»Р°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (27, 124, 'CAD', 'РљР°РЅР°РґСЃРєРёР№ РґРѕР»Р»Р°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (28, 976, 'CDF', 'РљРѕРЅРіРѕР»РµР·СЃРєРёР№ С„СЂР°РЅРє', NULL, NULL);
INSERT INTO currencyclassifier VALUES (29, 756, 'CHF', 'РЁРІРµР№С†Р°СЂСЃРєРёР№ С„СЂР°РЅРє', NULL, NULL);
INSERT INTO currencyclassifier VALUES (30, 152, 'CLP', 'Р§РёР»РёР№СЃРєРѕРµ РїРµСЃРѕ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (31, 156, 'CNY', 'Р®Р°РЅСЊ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (32, 170, 'COP', 'РљРѕР»СѓРјР±РёР№СЃРєРѕРµ РїРµСЃРѕ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (33, 970, 'COU', 'Р•РґРёРЅРёС†Р° СЂРµР°Р»СЊРЅРѕР№ СЃС‚РѕРёРјРѕСЃС‚Рё', NULL, NULL);
INSERT INTO currencyclassifier VALUES (34, 188, 'CRC', 'РљРѕСЃС‚Р°СЂРёРєР°РЅСЃРєРёР№ РєРѕР»РѕРЅ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (35, 931, 'CUC', 'РљРѕРЅРІРµСЂС‚РёСЂСѓРµРјРѕРµ РїРµСЃРѕ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (36, 192, 'CUP', 'РљСѓР±РёРЅСЃРєРѕРµ РїРµСЃРѕ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (37, 132, 'CVE', 'Р­СЃРєСѓРґРѕ РљР°Р±Рѕ-Р’РµСЂРґРµ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (38, 203, 'CZK', 'Р§РµС€СЃРєР°СЏ РєСЂРѕРЅР°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (39, 262, 'DJF', 'Р¤СЂР°РЅРє Р”Р¶РёР±СѓС‚Рё', NULL, NULL);
INSERT INTO currencyclassifier VALUES (40, 208, 'DKK', 'Р”Р°С‚СЃРєР°СЏ РєСЂРѕРЅР°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (41, 214, 'DOP', 'Р”РѕРјРёРЅРёРєР°РЅСЃРєРѕРµ РїРµСЃРѕ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (42, 12, 'DZD', 'РђР»Р¶РёСЂСЃРєРёР№ РґРёРЅР°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (43, 818, 'EGP', 'Р•РіРёРїРµС‚СЃРєРёР№ С„СѓРЅС‚', NULL, NULL);
INSERT INTO currencyclassifier VALUES (44, 232, 'ERN', 'РќР°РєС„Р°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (45, 230, 'ETB', 'Р­С„РёРѕРїСЃРєРёР№ Р±С‹СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (46, 978, 'EUR', 'Р•РІСЂРѕ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (47, 242, 'FJD', 'Р”РѕР»Р»Р°СЂ Р¤РёРґР¶Рё', NULL, NULL);
INSERT INTO currencyclassifier VALUES (48, 238, 'FKP', 'Р¤СѓРЅС‚ Р¤РѕР»РєР»РµРЅРґСЃРєРёС… РѕСЃС‚СЂРѕРІРѕРІ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (49, 826, 'GBP', 'Р¤СѓРЅС‚ СЃС‚РµСЂР»РёРЅРіРѕРІ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (50, 981, 'GEL', 'Р›Р°СЂРё', NULL, NULL);
INSERT INTO currencyclassifier VALUES (51, 936, 'GHS', 'Р“Р°РЅСЃРєРёР№ СЃРµРґРё', NULL, NULL);
INSERT INTO currencyclassifier VALUES (52, 292, 'GIP', 'Р“РёР±СЂР°Р»С‚Р°СЂСЃРєРёР№ С„СѓРЅС‚', NULL, NULL);
INSERT INTO currencyclassifier VALUES (53, 270, 'GMD', 'Р”Р°Р»Р°СЃРё', NULL, NULL);
INSERT INTO currencyclassifier VALUES (54, 324, 'GNF', 'Р“РІРёРЅРµР№СЃРєРёР№ С„СЂР°РЅРє', NULL, NULL);
INSERT INTO currencyclassifier VALUES (55, 320, 'GTQ', 'РљРµС‚СЃР°Р»СЊ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (56, 328, 'GYD', 'Р“Р°Р№Р°РЅСЃРєРёР№ РґРѕР»Р»Р°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (57, 344, 'HKD', 'Р“РѕРЅРєРѕРЅРіСЃРєРёР№ РґРѕР»Р»Р°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (58, 340, 'HNL', 'Р›РµРјРїРёСЂР°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (59, 191, 'HRK', 'РљСѓРЅР°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (60, 332, 'HTG', 'Р“СѓСЂРґ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (61, 348, 'HUF', 'Р¤РѕСЂРёРЅС‚', NULL, NULL);
INSERT INTO currencyclassifier VALUES (62, 360, 'IDR', 'Р СѓРїРёСЏ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (63, 376, 'ILS', 'РќРѕРІС‹Р№ РёР·СЂР°РёР»СЊСЃРєРёР№ С€РµРєРµР»СЊ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (64, 356, 'INR', 'Р�РЅРґРёР№СЃРєР°СЏ СЂСѓРїРёСЏ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (65, 368, 'IQD', 'Р�СЂР°РєСЃРєРёР№ РґРёРЅР°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (66, 364, 'IRR', 'Р�СЂР°РЅСЃРєРёР№ СЂРёР°Р»', NULL, NULL);
INSERT INTO currencyclassifier VALUES (67, 352, 'ISK', 'Р�СЃР»Р°РЅРґСЃРєР°СЏ РєСЂРѕРЅР°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (68, 388, 'JMD', 'РЇРјР°Р№СЃРєРёР№ РґРѕР»Р»Р°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (69, 400, 'JOD', 'Р�РѕСЂРґР°РЅСЃРєРёР№ РґРёРЅР°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (70, 392, 'JPY', 'Р�РµРЅР°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (71, 404, 'KES', 'РљРµРЅРёР№СЃРєРёР№ С€РёР»Р»РёРЅРі', NULL, NULL);
INSERT INTO currencyclassifier VALUES (72, 417, 'KGS', 'РЎРѕРј', NULL, NULL);
INSERT INTO currencyclassifier VALUES (73, 116, 'KHR', 'Р РёРµР»СЊ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (74, 408, 'KPW', 'РЎРµРІРµСЂРѕРєРѕСЂРµР№СЃРєР°СЏ РІРѕРЅР°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (75, 410, 'KRW', 'Р’РѕРЅР°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (76, 414, 'KWD', 'РљСѓРІРµР№С‚СЃРєРёР№ РґРёРЅР°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (77, 136, 'KYD', 'Р”РѕР»Р»Р°СЂ РћСЃС‚СЂРѕРІРѕРІ РљР°Р№РјР°РЅ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (78, 398, 'KZT', 'РўРµРЅРіРµ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (79, 418, 'LAK', 'РљРёРї', NULL, NULL);
INSERT INTO currencyclassifier VALUES (80, 422, 'LBP', 'Р›РёРІР°РЅСЃРєРёР№ С„СѓРЅС‚', NULL, NULL);
INSERT INTO currencyclassifier VALUES (81, 144, 'LKR', 'РЁСЂРё-Р›Р°РЅРєРёР№СЃРєР°СЏ СЂСѓРїРёСЏ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (82, 430, 'LRD', 'Р›РёР±РµСЂРёР№СЃРєРёР№ РґРѕР»Р»Р°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (83, 426, 'LSL', 'Р›РѕС‚Рё', NULL, NULL);
INSERT INTO currencyclassifier VALUES (84, 440, 'LTL', 'Р›РёС‚РѕРІСЃРєРёР№ Р»РёС‚', NULL, NULL);
INSERT INTO currencyclassifier VALUES (85, 428, 'LVL', 'Р›Р°С‚РІРёР№СЃРєРёР№ Р»Р°С‚', NULL, '2 РќРµ РїСЂРёРјРµРЅСЏРµС‚СЃСЏ СЃ 15 СЏРЅРІР°СЂСЏ 2014 Рі.');
INSERT INTO currencyclassifier VALUES (86, 434, 'LYD', 'Р›РёРІРёР№СЃРєРёР№ РґРёРЅР°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (87, 504, 'MAD', 'РњР°СЂРѕРєРєР°РЅСЃРєРёР№ РґРёСЂС…Р°Рј', NULL, NULL);
INSERT INTO currencyclassifier VALUES (88, 498, 'MDL', 'РњРѕР»РґР°РІСЃРєРёР№ Р»РµР№', NULL, NULL);
INSERT INTO currencyclassifier VALUES (89, 969, 'MGA', 'РњР°Р»Р°РіР°СЃРёР№СЃРєРёР№ Р°СЂРёР°СЂРё', NULL, NULL);
INSERT INTO currencyclassifier VALUES (90, 807, 'MKD', 'Р”РµРЅР°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (91, 104, 'MMK', 'РљСЊСЏС‚', NULL, NULL);
INSERT INTO currencyclassifier VALUES (92, 496, 'MNT', 'РўСѓРіСЂРёРє', NULL, NULL);
INSERT INTO currencyclassifier VALUES (93, 446, 'MOP', 'РџР°С‚Р°РєР°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (94, 478, 'MRO', 'РЈРіРёСЏ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (95, 480, 'MUR', 'РњР°РІСЂРёРєРёР№СЃРєР°СЏ СЂСѓРїРёСЏ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (96, 462, 'MVR', 'Р СѓС„РёСЏ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (97, 454, 'MWK', 'РњР°Р»Р°РІРёР№СЃРєР°СЏ РєРІР°С‡Р°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (98, 484, 'MXN', 'РњРµРєСЃРёРєР°РЅСЃРєРѕРµ РїРµСЃРѕ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (99, 458, 'MYR', 'РњР°Р»Р°Р№Р·РёР№СЃРєРёР№ СЂРёРЅРіРіРёС‚', NULL, NULL);
INSERT INTO currencyclassifier VALUES (100, 943, 'MZN', 'РњРѕР·Р°РјР±РёРєСЃРєРёР№ РјРµС‚РёРєР°Р»', NULL, NULL);
INSERT INTO currencyclassifier VALUES (101, 516, 'NAD', 'Р”РѕР»Р»Р°СЂ РќР°РјРёР±РёРё', NULL, NULL);
INSERT INTO currencyclassifier VALUES (102, 566, 'NGN', 'РќР°Р№СЂР°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (103, 558, 'NIO', 'Р—РѕР»РѕС‚Р°СЏ РєРѕСЂРґРѕР±Р°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (104, 578, 'NOK', 'РќРѕСЂРІРµР¶СЃРєР°СЏ РєСЂРѕРЅР°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (105, 524, 'NPR', 'РќРµРїР°Р»СЊСЃРєР°СЏ СЂСѓРїРёСЏ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (106, 554, 'NZD', 'РќРѕРІРѕР·РµР»Р°РЅРґСЃРєРёР№ РґРѕР»Р»Р°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (107, 512, 'OMR', 'РћРјР°РЅСЃРєРёР№ СЂРёР°Р»', NULL, NULL);
INSERT INTO currencyclassifier VALUES (108, 590, 'PAB', 'Р‘Р°Р»СЊР±РѕР°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (109, 604, 'PEN', 'РЎРѕР»СЊ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (110, 598, 'PGK', 'РљРёРЅР°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (111, 608, 'PHP', 'Р¤РёР»РёРїРїРёРЅСЃРєРѕРµ РїРµСЃРѕ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (112, 586, 'PKR', 'РџР°РєРёСЃС‚Р°РЅСЃРєР°СЏ СЂСѓРїРёСЏ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (113, 985, 'PLN', 'Р—Р»РѕС‚С‹Р№', NULL, NULL);
INSERT INTO currencyclassifier VALUES (114, 600, 'PYG', 'Р“СѓР°СЂР°РЅРё', NULL, NULL);
INSERT INTO currencyclassifier VALUES (115, 634, 'QAR', 'РљР°С‚Р°СЂСЃРєРёР№ СЂРёР°Р»', NULL, NULL);
INSERT INTO currencyclassifier VALUES (116, 946, 'RON', 'Р СѓРјС‹РЅСЃРєРёР№ Р»РµР№', NULL, NULL);
INSERT INTO currencyclassifier VALUES (117, 941, 'RSD', 'РЎРµСЂР±СЃРєРёР№ РґРёРЅР°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (118, 643, 'RUB', 'Р РѕСЃСЃРёР№СЃРєРёР№ СЂСѓР±Р»СЊ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (119, 646, 'RWF', 'Р¤СЂР°РЅРє Р СѓР°РЅРґС‹', NULL, NULL);
INSERT INTO currencyclassifier VALUES (120, 682, 'SAR', 'РЎР°СѓРґРѕРІСЃРєРёР№ СЂРёСЏР»', NULL, NULL);
INSERT INTO currencyclassifier VALUES (121, 90, 'SBD', 'Р”РѕР»Р»Р°СЂ РЎРѕР»РѕРјРѕРЅРѕРІС‹С… РћСЃС‚СЂРѕРІРѕРІ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (122, 690, 'SCR', 'РЎРµР№С€РµР»СЊСЃРєР°СЏ СЂСѓРїРёСЏ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (123, 938, 'SDG', 'РЎСѓРґР°РЅСЃРєРёР№ С„СѓРЅС‚', NULL, NULL);
INSERT INTO currencyclassifier VALUES (124, 752, 'SEK', 'РЁРІРµРґСЃРєР°СЏ РєСЂРѕРЅР°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (125, 702, 'SGD', 'РЎРёРЅРіР°РїСѓСЂСЃРєРёР№ РґРѕР»Р»Р°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (126, 654, 'SHP', 'Р¤СѓРЅС‚ РЎРІСЏС‚РѕР№ Р•Р»РµРЅС‹', NULL, NULL);
INSERT INTO currencyclassifier VALUES (127, 694, 'SLL', 'Р›РµРѕРЅРµ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (128, 706, 'SOS', 'РЎРѕРјР°Р»РёР№СЃРєРёР№ С€РёР»Р»РёРЅРі', NULL, NULL);
INSERT INTO currencyclassifier VALUES (129, 968, 'SRD', 'РЎСѓСЂРёРЅР°РјСЃРєРёР№ РґРѕР»Р»Р°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (130, 728, 'SSP', 'Р®Р¶РЅРѕСЃСѓРґР°РЅСЃРєРёР№ С„СѓРЅС‚', NULL, NULL);
INSERT INTO currencyclassifier VALUES (131, 678, 'STD', 'Р”РѕР±СЂР°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (132, 222, 'SVC', 'РЎР°Р»СЊРІР°РґРѕСЂСЃРєРёР№ РєРѕР»РѕРЅ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (133, 760, 'SYP', 'РЎРёСЂРёР№СЃРєРёР№ С„СѓРЅС‚', NULL, NULL);
INSERT INTO currencyclassifier VALUES (134, 748, 'SZL', 'Р›РёР»Р°РЅРіРµРЅРё', NULL, NULL);
INSERT INTO currencyclassifier VALUES (135, 764, 'THB', 'Р‘Р°С‚', NULL, NULL);
INSERT INTO currencyclassifier VALUES (136, 972, 'TJS', 'РЎРѕРјРѕРЅРё', NULL, NULL);
INSERT INTO currencyclassifier VALUES (137, 934, 'TMT', 'РќРѕРІС‹Р№ С‚СѓСЂРєРјРµРЅСЃРєРёР№ РјР°РЅР°С‚', NULL, NULL);
INSERT INTO currencyclassifier VALUES (138, 788, 'TND', 'РўСѓРЅРёСЃСЃРєРёР№ РґРёРЅР°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (139, 776, 'TOP', 'РџР°Р°РЅРіР°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (140, 949, 'TRY', 'РўСѓСЂРµС†РєР°СЏ Р»РёСЂР°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (141, 780, 'TTD', 'Р”РѕР»Р»Р°СЂ РўСЂРёРЅРёРґР°РґР° Рё РўРѕР±Р°РіРѕ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (142, 901, 'TWD', 'РќРѕРІС‹Р№ С‚Р°Р№РІР°РЅСЊСЃРєРёР№ РґРѕР»Р»Р°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (143, 834, 'TZS', 'РўР°РЅР·Р°РЅРёР№СЃРєРёР№ С€РёР»Р»РёРЅРі', NULL, NULL);
INSERT INTO currencyclassifier VALUES (144, 980, 'UAH', 'Р“СЂРёРІРЅР°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (145, 800, 'UGX', 'РЈРіР°РЅРґРёР№СЃРєРёР№ С€РёР»Р»РёРЅРі', NULL, NULL);
INSERT INTO currencyclassifier VALUES (146, 840, 'USD', 'Р”РѕР»Р»Р°СЂ РЎРЁРђ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (147, 940, 'UYI', 'РЈСЂСѓРіРІР°Р№СЃРєРѕРµ РїРµСЃРѕ РІ РёРЅРґРµРєСЃРёСЂРѕРІР°РЅРЅС‹С… РµРґРёРЅРёС†Р°С…', NULL, NULL);
INSERT INTO currencyclassifier VALUES (148, 858, 'UYU', 'РЈСЂСѓРіРІР°Р№СЃРєРѕРµ РїРµСЃРѕ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (149, 860, 'UZS', 'РЈР·Р±РµРєСЃРєРёР№ СЃСѓРј', NULL, NULL);
INSERT INTO currencyclassifier VALUES (150, 937, 'VEF', 'Р‘РѕР»РёРІР°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (151, 704, 'VND', 'Р”РѕРЅРі', NULL, NULL);
INSERT INTO currencyclassifier VALUES (152, 548, 'VUV', 'Р’Р°С‚Сѓ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (153, 882, 'WST', 'РўР°Р»Р°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (154, 950, 'XAF', 'Р¤СЂР°РЅРє РљР¤Рђ Р’Р•РђРЎ', NULL, '3 Р¤СЂР°РЅРє РљР¤Рђ Р’Р•РђРЎ вЂ“ РґРµРЅРµР¶РЅР°СЏ РµРґРёРЅРёС†Р° Р‘Р°РЅРєР° РіРѕСЃСѓРґР°СЂСЃС‚РІ Р¦РµРЅС‚СЂР°Р»СЊРЅРѕР№ РђС„СЂРёРєРё.');
INSERT INTO currencyclassifier VALUES (155, 951, 'XCD', 'Р’РѕСЃС‚РѕС‡РЅРѕ-РєР°СЂРёР±СЃРєРёР№ РґРѕР»Р»Р°СЂ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (156, 960, 'XDR', 'РЎР”Р  (СЃРїРµС†РёР°Р»СЊРЅС‹Рµ РїСЂР°РІР° Р·Р°РёРјСЃС‚РІРѕРІР°РЅРёСЏ)', NULL, NULL);
INSERT INTO currencyclassifier VALUES (157, 952, 'XOF', 'Р¤СЂР°РЅРє РљР¤Рђ Р’РЎР•РђРћ', NULL, '4 Р¤СЂР°РЅРє РљР¤Рђ Р’РЎР•РђРћ вЂ“ РґРµРЅРµР¶РЅР°СЏ РµРґРёРЅРёС†Р° Р¦РµРЅС‚СЂР°Р»СЊРЅРѕРіРѕ Р‘Р°РЅРєР° РіРѕСЃСѓРґР°СЂСЃС‚РІ Р—Р°РїР°РґРЅРѕР№ РђС„СЂРёРєРё');
INSERT INTO currencyclassifier VALUES (158, 953, 'XPF', 'Р¤СЂР°РЅРє РљР¤Рџ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (159, 886, 'YER', 'Р™РµРјРµРЅСЃРєРёР№ СЂРёР°Р»', NULL, NULL);
INSERT INTO currencyclassifier VALUES (160, 710, 'ZAR', 'Р СЌРЅРґ', NULL, NULL);
INSERT INTO currencyclassifier VALUES (161, 967, 'ZMW', 'Р—Р°РјР±РёР№СЃРєР°СЏ РєРІР°С‡Р°', NULL, NULL);
INSERT INTO currencyclassifier VALUES (162, 932, 'ZWL', 'Р”РѕР»Р»Р°СЂ Р—РёРјР±Р°Р±РІРµ', NULL, NULL);


--
-- TOC entry 4533 (class 0 OID 18791)
-- Dependencies: 227
-- Data for Name: customcheckpointcctvplacementclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4535 (class 0 OID 18799)
-- Dependencies: 229
-- Data for Name: customcheckpointcommchannelclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO customcheckpointcommchannelclassifier VALUES (1, '1', 'СЃРїРµС†РёР°Р»СЊРЅР°СЏ');
INSERT INTO customcheckpointcommchannelclassifier VALUES (2, '2', 'С‚РµР»РµС„РѕРЅРЅР°СЏ');
INSERT INTO customcheckpointcommchannelclassifier VALUES (3, '3', 'СЂР°РґРёРѕСЃРІСЏР·СЊ');
INSERT INTO customcheckpointcommchannelclassifier VALUES (4, '4', 'РёРЅРѕРµ');


--
-- TOC entry 4537 (class 0 OID 18807)
-- Dependencies: 231
-- Data for Name: customprocesskindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO customprocesskindclassifier VALUES (1, '0', 'РћС‚СЃСѓС‚СЃС‚РІРёРµ РїСЂРµРґС€РµСЃС‚РІСѓСЋС‰РµР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїСЂРѕС†РµРґСѓСЂС‹', NULL);
INSERT INTO customprocesskindclassifier VALUES (2, '10', 'Р­РєСЃРїРѕСЂС‚', NULL);
INSERT INTO customprocesskindclassifier VALUES (3, '21', 'РџРµСЂРµСЂР°Р±РѕС‚РєР° РІРЅРµ С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё', NULL);
INSERT INTO customprocesskindclassifier VALUES (4, '23', 'Р’СЂРµРјРµРЅРЅС‹Р№ РІС‹РІРѕР·', NULL);
INSERT INTO customprocesskindclassifier VALUES (5, '31', 'Р РµСЌРєСЃРїРѕСЂС‚', NULL);
INSERT INTO customprocesskindclassifier VALUES (6, '40', 'Р’С‹РїСѓСЃРє РґР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ РїРѕС‚СЂРµР±Р»РµРЅРёСЏ', NULL);
INSERT INTO customprocesskindclassifier VALUES (7, '51', 'РџРµСЂРµСЂР°Р±РѕС‚РєР° РЅР° С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё', NULL);
INSERT INTO customprocesskindclassifier VALUES (8, '53', 'Р’СЂРµРјРµРЅРЅС‹Р№ РІРІРѕР· (РґРѕРїСѓСЃРє)', NULL);
INSERT INTO customprocesskindclassifier VALUES (9, '60', 'Р РµРёРјРїРѕСЂС‚', NULL);
INSERT INTO customprocesskindclassifier VALUES (10, '70', 'РўР°РјРѕР¶РµРЅРЅС‹Р№ СЃРєР»Р°Рґ', NULL);
INSERT INTO customprocesskindclassifier VALUES (11, '77', 'РЎРІРѕР±РѕРґРЅС‹Р№ СЃРєР»Р°Рґ', NULL);
INSERT INTO customprocesskindclassifier VALUES (12, '78', 'РЎРІРѕР±РѕРґРЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ Р·РѕРЅР°', NULL);
INSERT INTO customprocesskindclassifier VALUES (13, '80', 'РўР°РјРѕР¶РµРЅРЅС‹Р№ С‚СЂР°РЅР·РёС‚', NULL);
INSERT INTO customprocesskindclassifier VALUES (14, '90', 'РЎРїРµС†РёР°Р»СЊРЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїСЂРѕС†РµРґСѓСЂР°', NULL);
INSERT INTO customprocesskindclassifier VALUES (15, '91', 'РџРµСЂРµСЂР°Р±РѕС‚РєР° РґР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ РїРѕС‚СЂРµР±Р»РµРЅРёСЏ', NULL);
INSERT INTO customprocesskindclassifier VALUES (16, '93', 'РЈРЅРёС‡С‚РѕР¶РµРЅРёРµ', NULL);
INSERT INTO customprocesskindclassifier VALUES (17, '94', 'РћС‚РєР°Р· РІ РїРѕР»СЊР·Сѓ РіРѕСЃСѓРґР°СЂСЃС‚РІР°', NULL);
INSERT INTO customprocesskindclassifier VALUES (18, '96', 'Р‘РµСЃРїРѕС€Р»РёРЅРЅР°СЏ С‚РѕСЂРіРѕРІР»СЏ', NULL);


--
-- TOC entry 4539 (class 0 OID 18815)
-- Dependencies: 233
-- Data for Name: customsconclusionsclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO customsconclusionsclassifier VALUES (1, '10', 'Р’С‹РїСѓСЃРє СЂР°Р·СЂРµС€РµРЅ', '');
INSERT INTO customsconclusionsclassifier VALUES (2, '11', 'Р’С‹РїСѓСЃРє РїСЂРё СѓСЃР»РѕРІРёРё РѕР±РµСЃРїРµС‡РµРЅРёСЏ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїР»Р°С‚РµР¶РµР№', '');
INSERT INTO customsconclusionsclassifier VALUES (3, '20', 'РЈСЃР»РѕРІРЅС‹Р№ РІС‹РїСѓСЃРє', '');
INSERT INTO customsconclusionsclassifier VALUES (4, '81', 'РўР°РјРѕР¶РµРЅРЅР°СЏ РґРµРєР»Р°СЂР°С†РёСЏ РѕС‚РѕР·РІР°РЅР°', '');
INSERT INTO customsconclusionsclassifier VALUES (5, '82', 'РўР°РјРѕР¶РµРЅРЅР°СЏ РґРµРєР»Р°СЂР°С†РёСЏ СЃС‡РёС‚Р°РµС‚СЃСЏ РЅРµ РїРѕРґР°РЅРЅРѕР№', '');
INSERT INTO customsconclusionsclassifier VALUES (6, '90', 'РћС‚РєР°Р·Р°РЅРѕ РІ РІС‹РїСѓСЃРєРµ', '');
INSERT INTO customsconclusionsclassifier VALUES (7, '91', 'Р’С‹РїСѓСЃРє РїСЂРёРѕСЃС‚Р°РЅРѕРІР»РµРЅ', '');
INSERT INTO customsconclusionsclassifier VALUES (8, '92', 'Р�РЅРѕРµ СЂРµС€РµРЅРёРµ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅРѕРµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІ- С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '');


--
-- TOC entry 4541 (class 0 OID 18823)
-- Dependencies: 235
-- Data for Name: customsfeesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO customsfeesclassifier VALUES (1, '1010', 'РўР°РјРѕР¶РµРЅРЅС‹Рµ СЃР±РѕСЂС‹ Р·Р° СЃРѕРІРµСЂС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕРїРµСЂР°С†РёР№ (Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РѕС„РѕСЂРјР»РµРЅРёРµ С‚РѕРІР°СЂРѕРІ, Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ С‚РѕРІР°СЂРѕРІ, Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё)', '', '1');
INSERT INTO customsfeesclassifier VALUES (2, '1020', 'РўР°РјРѕР¶РµРЅРЅС‹Рµ СЃР±РѕСЂС‹ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ СЃРѕРїСЂРѕРІРѕР¶РґРµРЅРёРµ', '', '1');
INSERT INTO customsfeesclassifier VALUES (3, '2010', 'Р’РІРѕР·РЅС‹Рµ С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РїРѕС€Р»РёРЅС‹ (РёРЅС‹Рµ РїРѕС€Р»РёРЅС‹, РЅР°Р»РѕРіРё Рё СЃР±РѕСЂС‹, РёРјРµСЋС‰РёРµ СЌРєРІРёРІР°Р»РµРЅС‚РЅРѕРµ РґРµР№СЃС‚РІРёРµ), СѓРїР»Р°С‡РµРЅРЅС‹Рµ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РџСЂРѕС‚РѕРєРѕР»РѕРј Рѕ РїРѕСЂСЏРґРєРµ Р·Р°С‡РёСЃР»РµРЅРёСЏ Рё СЂР°СЃРїСЂРµРґРµР»РµРЅРёСЏ СЃСѓРјРј РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ (РёРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ Рё СЃР±РѕСЂРѕРІ, РёРјРµСЋС‰РёС… СЌРєРІРёРІР°Р»РµРЅС‚РЅРѕРµ РґРµР№СЃС‚РІРёРµ), РёС… РїРµСЂРµС‡РёСЃР»РµРЅРёСЏ РІ РґРѕС…РѕРґ Р±СЋРґР¶РµС‚РѕРІ РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ (РїСЂРёР»РѕР¶РµРЅРёРµ в„– 5 Рє Р”РѕРіРѕРІРѕСЂСѓ Рѕ Р•РІСЂР°Р·РёР№СЃРєРѕРј СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРј СЃРѕСЋР·Рµ РѕС‚ 29 РјР°СЏ 2014 РіРѕРґР°)', '', '1');
INSERT INTO customsfeesclassifier VALUES (4, '2020', 'Р’РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР°, РѕР±СЏР·Р°РЅРЅРѕСЃС‚СЊ РїРѕ СѓРїР»Р°С‚Рµ РєРѕС‚РѕСЂРѕР№ РІРѕР·РЅРёРєР»Р° РґРѕ РІСЃС‚СѓРїР»РµРЅРёСЏ РІ СЃРёР»Сѓ РЎРѕРіР»Р°С€РµРЅРёСЏ РѕР± СѓСЃС‚Р°РЅРѕРІР»РµРЅРёРё Рё РїСЂРёРјРµРЅРµРЅРёРё РІ С‚Р°РјРѕР¶РµРЅРЅРѕРј СЃРѕСЋР·Рµ РїРѕСЂСЏРґРєР° Р·Р°С‡РёСЃР»РµРЅРёСЏ Рё СЂР°СЃРїСЂРµРґРµР»РµРЅРёСЏ РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ (РёРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ Рё СЃР±РѕСЂРѕРІ, РёРјРµСЋС‰РёС… СЌРєРІРёРІР°Р»РµРЅС‚РЅРѕРµ РґРµР№СЃС‚РІРёРµ) РѕС‚ 20.05.2010', '', '1');
INSERT INTO customsfeesclassifier VALUES (5, '2040', 'РЎРїРµС†РёР°Р»СЊРЅР°СЏ РїРѕС€Р»РёРЅР°, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅР°СЏ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РџСЂРѕС‚РѕРєРѕР»РѕРј Рѕ РїСЂРёРјРµРЅРµРЅРёРё СЃРїРµС†РёР°Р»СЊРЅС‹С… Р·Р°С‰РёС‚РЅС‹С…, Р°РЅС‚РёРґРµРјРїРёРЅРіРѕРІС‹С… Рё РєРѕРјРїРµРЅСЃР°С†РёРѕРЅРЅС‹С… РјРµСЂ РїРѕ РѕС‚РЅРѕС€РµРЅРёСЋ Рє С‚СЂРµС‚СЊРёРј СЃС‚СЂР°РЅР°Рј (РїСЂРёР»РѕР¶РµРЅРёРµ в„– 8 Рє Р”РѕРіРѕРІРѕСЂСѓ Рѕ Р•РІСЂР°Р·РёР№СЃРєРѕРј СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРј СЃРѕСЋР·Рµ РѕС‚ 29 РјР°СЏ 2014 РіРѕРґР°)', '', '1');
INSERT INTO customsfeesclassifier VALUES (6, '2050', 'РђРЅС‚РёРґРµРјРїРёРЅРіРѕРІР°СЏ РїРѕС€Р»РёРЅР°, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅР°СЏ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РџСЂРѕС‚РѕРєРѕР»РѕРј Рѕ РїСЂРёРјРµРЅРµРЅРёРё СЃРїРµС†РёР°Р»СЊРЅС‹С… Р·Р°С‰РёС‚РЅС‹С…, Р°РЅС‚РёРґРµРјРїРёРЅРіРѕРІС‹С… Рё РєРѕРјРїРµРЅСЃР°С†РёРѕРЅРЅС‹С… РјРµСЂ РїРѕ РѕС‚РЅРѕС€РµРЅРёСЋ Рє С‚СЂРµС‚СЊРёРј СЃС‚СЂР°РЅР°Рј (РїСЂРёР»РѕР¶РµРЅРёРµ в„– 8 Рє Р”РѕРіРѕРІРѕСЂСѓ Рѕ Р•РІСЂР°Р·РёР№СЃРєРѕРј СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРј СЃРѕСЋР·Рµ РѕС‚ 29 РјР°СЏ 2014 РіРѕРґР°)', '', '1');
INSERT INTO customsfeesclassifier VALUES (7, '2060', 'РљРѕРјРїРµРЅСЃР°С†РёРѕРЅРЅР°СЏ РїРѕС€Р»РёРЅР°, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅР°СЏ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РџСЂРѕС‚РѕРєРѕР»РѕРј Рѕ РїСЂРёРјРµРЅРµРЅРёРё СЃРїРµС†РёР°Р»СЊРЅС‹С… Р·Р°С‰РёС‚РЅС‹С…, Р°РЅС‚РёРґРµРјРїРёРЅРіРѕРІС‹С… Рё РєРѕРјРїРµРЅСЃР°С†РёРѕРЅРЅС‹С… РјРµСЂ РїРѕ РѕС‚РЅРѕС€РµРЅРёСЋ Рє С‚СЂРµС‚СЊРёРј СЃС‚СЂР°РЅР°Рј (РїСЂРёР»РѕР¶РµРЅРёРµ в„– 8 Рє Р”РѕРіРѕРІРѕСЂСѓ Рѕ Р•РІСЂР°Р·РёР№СЃРєРѕРј СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРј СЃРѕСЋР·Рµ РѕС‚ 29 РјР°СЏ 2014 РіРѕРґР°)', '', '1');
INSERT INTO customsfeesclassifier VALUES (8, '2140', 'РџСЂРµРґРІР°СЂРёС‚РµР»СЊРЅР°СЏ СЃРїРµС†РёР°Р»СЊРЅР°СЏ РїРѕС€Р»РёРЅР°', '', '1');
INSERT INTO customsfeesclassifier VALUES (9, '2150', 'РџСЂРµРґРІР°СЂРёС‚РµР»СЊРЅР°СЏ Р°РЅС‚РёРґРµРјРїРёРЅРіРѕРІР°СЏ РїРѕС€Р»РёРЅР°', '', '1');
INSERT INTO customsfeesclassifier VALUES (10, '2160', 'РџСЂРµРґРІР°СЂРёС‚РµР»СЊРЅР°СЏ РєРѕРјРїРµРЅСЃР°С†РёРѕРЅРЅР°СЏ РїРѕС€Р»РёРЅР°', '', '1');
INSERT INTO customsfeesclassifier VALUES (11, '2240', 'РЎРїРµС†РёР°Р»СЊРЅР°СЏ РїРѕС€Р»РёРЅР°, СѓРїР»Р°С‡РёРІР°РµРјР°СЏ РІ РїРѕСЂСЏРґРєРµ, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅРѕРј РґР»СЏ РІР·РёРјР°РЅРёСЏ СЃРѕРѕС‚РІРµС‚СЃС‚РІСѓСЋС‰РёС… РїСЂРµРґРІР°СЂРёС‚РµР»СЊРЅС‹С… РІРёРґРѕРІ РїРѕС€Р»РёРЅ', '', '1');
INSERT INTO customsfeesclassifier VALUES (12, '2250', 'РђРЅС‚РёРґРµРјРїРёРЅРіРѕРІР°СЏ РїРѕС€Р»РёРЅР°, СѓРїР»Р°С‡РёРІР°РµРјР°СЏ РІ РїРѕСЂСЏРґРєРµ, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅРѕРј РґР»СЏ РІР·РёРјР°РЅРёСЏ СЃРѕРѕС‚РІРµС‚СЃС‚РІСѓСЋС‰РёС… РїСЂРµРґРІР°СЂРёС‚РµР»СЊРЅС‹С… РІРёРґРѕРІ РїРѕС€Р»РёРЅ', '', '1');
INSERT INTO customsfeesclassifier VALUES (13, '2260', 'РљРѕРјРїРµРЅСЃР°С†РёРѕРЅРЅР°СЏ РїРѕС€Р»РёРЅР°, СѓРїР»Р°С‡РёРІР°РµРјР°СЏ РІ РїРѕСЂСЏРґРєРµ, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅРѕРј РґР»СЏ РІР·РёРјР°РЅРёСЏ СЃРѕРѕС‚РІРµС‚СЃС‚РІСѓСЋС‰РёС… РїСЂРµРґРІР°СЂРёС‚РµР»СЊРЅС‹С… РІРёРґРѕРІ РїРѕС€Р»РёРЅ', '', '1');
INSERT INTO customsfeesclassifier VALUES (14, '5010', 'РќР°Р»РѕРі РЅР° РґРѕР±Р°РІР»РµРЅРЅСѓСЋ СЃС‚РѕРёРјРѕСЃС‚СЊ', '', '1');
INSERT INTO customsfeesclassifier VALUES (15, '6010', 'РўР°РјРѕР¶РµРЅРЅС‹Рµ РїРѕС€Р»РёРЅС‹, РЅР°Р»РѕРіРё РїРѕ РµРґРёРЅС‹Рј СЃС‚Р°РІРєР°Рј РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ РґР»СЏ Р»РёС‡РЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ', '', '1');
INSERT INTO customsfeesclassifier VALUES (16, '6020', 'РЎРѕРІРѕРєСѓРїРЅС‹Р№ С‚Р°РјРѕР¶РµРЅРЅС‹Р№ РїР»Р°С‚РµР¶ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ РґР»СЏ Р»РёС‡РЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ', '', '1');
INSERT INTO customsfeesclassifier VALUES (17, 'РҐРҐРҐ1', 'РџРµРЅРё', '', '1');
INSERT INTO customsfeesclassifier VALUES (18, '1030', 'РўР°РјРѕР¶РµРЅРЅС‹Рµ СЃР±РѕСЂС‹ Р·Р° С…СЂР°РЅРµРЅРёРµ', 'RU', '2.1');
INSERT INTO customsfeesclassifier VALUES (19, '17РҐ0', 'РџСЂРѕС‡РёРµ С‚Р°РјРѕР¶РµРЅРЅС‹Рµ СЃР±РѕСЂС‹', 'RU', '2.1');
INSERT INTO customsfeesclassifier VALUES (20, '2030', 'Р’РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР°, РІР·РёРјР°РµРјР°СЏ РїСЂРё СЂРµРёРјРїРѕСЂС‚Рµ', 'RU', '2.2');
INSERT INTO customsfeesclassifier VALUES (21, '2070', 'РЎРїРµС†РёР°Р»СЊРЅР°СЏ РїРѕС€Р»РёРЅР°, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅР°СЏ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU', '2.2');
INSERT INTO customsfeesclassifier VALUES (22, '2080', 'РђРЅС‚РёРґРµРјРїРёРЅРіРѕРІР°СЏ РїРѕС€Р»РёРЅР°, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅР°СЏ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU', '2.2');
INSERT INTO customsfeesclassifier VALUES (23, '2090', 'РљРѕРјРїРµРЅСЃР°С†РёРѕРЅРЅР°СЏ РїРѕС€Р»РёРЅР°, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅР°СЏ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU', '2.2');
INSERT INTO customsfeesclassifier VALUES (24, '27РҐ0', 'РџСЂРѕС‡РёРµ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… С‚РѕРІР°СЂРѕРІ', 'RU', '2.2');
INSERT INTO customsfeesclassifier VALUES (25, '3010', 'Р’С‹РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР° РЅР° РЅРµС„С‚СЊ СЃС‹СЂСѓСЋ, РІС‹РІРѕР·РёРјСѓСЋ Р·Р° РїСЂРµРґРµР»С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'RU', '2.3');
INSERT INTO customsfeesclassifier VALUES (26, '3020', 'Р’С‹РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР° РЅР° РЅРµС„С‚СЊ СЃС‹СЂСѓСЋ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РЅРµС„С‚Рё, РІС‹РІРѕР·РёРјРѕР№ Р·Р° РїСЂРµРґРµР»С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'RU', '2.3');
INSERT INTO customsfeesclassifier VALUES (27, '3030', 'Р’С‹РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР° РЅР° РіР°Р· РїСЂРёСЂРѕРґРЅС‹Р№', 'RU', '2.3');
INSERT INTO customsfeesclassifier VALUES (28, '3040', 'Р’С‹РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР° РЅР° С‚РѕРІР°СЂС‹, РІС‹СЂР°Р±РѕС‚Р°РЅРЅС‹Рµ РёР· РЅРµС„С‚Рё', 'RU', '2.3');
INSERT INTO customsfeesclassifier VALUES (29, '3050', 'Р’С‹РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР° РЅР° С‚РѕРІР°СЂС‹, РІ РѕС‚РЅРѕС€РµРЅРёРё РєРѕС‚РѕСЂС‹С… РЅРµ СѓСЃС‚Р°РЅРѕРІР»РµРЅ РѕС‚РґРµР»СЊРЅС‹Р№ РєРѕРґ РІРёРґР° РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹', 'RU', '2.3');
INSERT INTO customsfeesclassifier VALUES (30, '37РҐ0', 'РџСЂРѕС‡РёРµ РІС‹РІРѕР·РЅС‹Рµ С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РїРѕС€Р»РёРЅС‹', 'RU', '2.3');
INSERT INTO customsfeesclassifier VALUES (31, '4010', '2.4.1.В РђРєС†РёР· РЅР° СЌС‚РёР»РѕРІС‹Р№ СЃРїРёСЂС‚ РёР· РїРёС‰РµРІРѕРіРѕ СЃС‹СЂСЊСЏ (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РґРёСЃС‚РёР»Р»СЏС‚РѕРІ РІРёРЅРЅРѕРіРѕ, РІРёРЅРѕРіСЂР°РґРЅРѕРіРѕ, РїР»РѕРґРѕРІРѕРіРѕ, РєРѕРЅСЊСЏС‡РЅРѕРіРѕ, РєР°Р»СЊРІР°РґРѕСЃРЅРѕРіРѕ, РІРёСЃРєРѕРІРѕРіРѕ)', 'RU', '2.4.1');
INSERT INTO customsfeesclassifier VALUES (32, '4140', '2.4.2.В РђРєС†РёР· РЅР° РґРёСЃС‚РёР»Р»СЏС‚С‹ РІРёРЅРЅС‹Р№, РІРёРЅРѕРіСЂР°РґРЅС‹Р№, РїР»РѕРґРѕРІС‹Р№, РєРѕРЅСЊСЏС‡РЅС‹Р№, РєР°Р»СЊРІР°РґРѕСЃРЅС‹Р№, РІРёСЃРєРѕРІС‹Р№', 'RU', '2.4.2');
INSERT INTO customsfeesclassifier VALUES (33, '4150', '2.4.3.В РђРєС†РёР· РЅР° СЌС‚РёР»РѕРІС‹Р№ СЃРїРёСЂС‚ РёР· РЅРµРїРёС‰РµРІРѕРіРѕ СЃС‹СЂСЊСЏ', 'RU', '2.4.3');
INSERT INTO customsfeesclassifier VALUES (34, '4020', '2.4.4.В РђРєС†РёР· РЅР° СЃРїРёСЂС‚РѕСЃРѕРґРµСЂР¶Р°С‰СѓСЋ РїСЂРѕРґСѓРєС†РёСЋ', 'RU', '2.4.4');
INSERT INTO customsfeesclassifier VALUES (35, '4120', '2.4.5.В РђРєС†РёР· РЅР° Р°Р»РєРѕРіРѕР»СЊРЅСѓСЋ РїСЂРѕРґСѓРєС†РёСЋ СЃ РѕР±СЉРµРјРЅРѕР№ РґРѕР»РµР№ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р° СЃРІС‹С€Рµ 9 % (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїРёРІР°, РІРёРЅ, С„СЂСѓРєС‚РѕРІС‹С… РІРёРЅ, РёРіСЂРёСЃС‚С‹С… РІРёРЅ (С€Р°РјРїР°РЅСЃРєРёС…), РІРёРЅРЅС‹С… РЅР°РїРёС‚РєРѕРІ, РёР·РіРѕС‚Р°РІР»РёРІР°РµРјС‹С… Р±РµР· РґРѕР±Р°РІР»РµРЅРёСЏ СЂРµРєС‚РёС„РёРєРѕРІР°РЅРЅРѕРіРѕ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р°, РїСЂРѕРёР·РІРµРґРµРЅРЅРѕРіРѕ РёР· РїРёС‰РµРІРѕРіРѕ СЃС‹СЂСЊСЏ, Рё (РёР»Рё) СЃРїРёСЂС‚РѕРІР°РЅРЅС‹С… РІРёРЅРѕРіСЂР°РґРЅРѕРіРѕ РёР»Рё РёРЅРѕРіРѕ С„СЂСѓРєС‚РѕРІРѕРіРѕ СЃСѓСЃР»Р°, Рё (РёР»Рё) РІРёРЅРЅРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°, Рё (РёР»Рё) С„СЂСѓРєС‚РѕРІРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°)', 'RU', '2.4.5');
INSERT INTO customsfeesclassifier VALUES (36, '4130', '2.4.6.В РђРєС†РёР· РЅР° Р°Р»РєРѕРіРѕР»СЊРЅСѓСЋ РїСЂРѕРґСѓРєС†РёСЋ СЃ РѕР±СЉРµРјРЅРѕР№ РґРѕР»РµР№ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р° РґРѕ 9 % РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїРёРІР°, РЅР°РїРёС‚РєРѕРІ, РёР·РіРѕС‚Р°РІР»РёРІР°РµРјС‹С… РЅР° РѕСЃРЅРѕРІРµ РїРёРІР°, РІРёРЅ, С„СЂСѓРєС‚РѕРІС‹С… РІРёРЅ, РёРіСЂРёСЃС‚С‹С… РІРёРЅ (С€Р°РјРїР°РЅСЃРєРёС…), СЃРёРґСЂР°, РїСѓР°СЂРµ, РјРµРґРѕРІСѓС…Рё, РІРёРЅРЅС‹С… РЅР°РїРёС‚РєРѕРІ, РёР·РіРѕС‚Р°РІР»РёРІР°РµРјС‹С… Р±РµР· РґРѕР±Р°РІР»РµРЅРёСЏ СЂРµРєС‚РёС„РёРєРѕРІР°РЅРЅРѕРіРѕ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р°, РїСЂРѕРёР·РІРµРґРµРЅРЅРѕРіРѕ РёР· РїРёС‰РµРІРѕРіРѕ СЃС‹СЂСЊСЏ, Рё (РёР»Рё) СЃРїРёСЂС‚РѕРІР°РЅРЅС‹С… РІРёРЅРѕРіСЂР°РґРЅРѕРіРѕ РёР»Рё РёРЅРѕРіРѕ С„СЂСѓРєС‚РѕРІРѕРіРѕ СЃСѓСЃР»Р°, Рё (РёР»Рё) РІРёРЅРЅРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°, Рё (РёР»Рё) С„СЂСѓРєС‚РѕРІРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°)', 'RU', '2.4.6');
INSERT INTO customsfeesclassifier VALUES (37, '4090', 'РђРєС†РёР· РЅР° РІРёРЅР°, С„СЂСѓРєС‚РѕРІС‹Рµ РІРёРЅР° (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РёРіСЂРёСЃС‚С‹С… РІРёРЅ (С€Р°РјРїР°РЅСЃРєРёС…)), РІРёРЅРЅС‹Рµ РЅР°РїРёС‚РєРё, РёР·РіРѕС‚Р°РІР»РёРІР°РµРјС‹Рµ Р±РµР· РґРѕР±Р°РІР»РµРЅРёСЏ СЂРµРєС‚РёС„РёРєРѕРІР°РЅРЅРѕРіРѕ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р°, РїСЂРѕРёР·РІРµРґРµРЅРЅРѕРіРѕ РёР· РїРёС‰РµРІРѕРіРѕ СЃС‹СЂСЊСЏ, Рё (РёР»Рё) СЃРїРёСЂС‚РѕРІР°РЅРЅС‹С… РІРёРЅРѕРіСЂР°РґРЅРѕРіРѕ РёР»Рё РёРЅРѕРіРѕ С„СЂСѓРєС‚РѕРІРѕРіРѕ СЃСѓСЃР»Р°, Рё (РёР»Рё) РІРёРЅРЅРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°, Рё (РёР»Рё) С„СЂСѓРєС‚РѕРІРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°', 'RU', '2.4.7');
INSERT INTO customsfeesclassifier VALUES (38, '4200', 'РђРєС†РёР· РЅР° РёРіСЂРёСЃС‚С‹Рµ РІРёРЅР° (С€Р°РјРїР°РЅСЃРєРёРµ)', 'RU', '2.4.7');
INSERT INTO customsfeesclassifier VALUES (39, '4160', '2.4.8.В РђРєС†РёР· РЅР° СЃРёРґСЂ, РїСѓР°СЂРµ, РјРµРґРѕРІСѓС…Сѓ', 'RU', '2.4.8');
INSERT INTO customsfeesclassifier VALUES (40, '4100', 'РђРєС†РёР· РЅР° РїРёРІРѕ СЃ РЅРѕСЂРјР°С‚РёРІРЅС‹Рј (СЃС‚Р°РЅРґР°СЂС‚РёР·РёСЂРѕРІР°РЅРЅС‹Рј) СЃРѕРґРµСЂР¶Р°РЅРёРµРј РѕР±СЉРµРјРЅРѕР№ РґРѕР»Рё СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р° РґРѕ 0,5 % РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ', 'RU', '2.4.9');
INSERT INTO customsfeesclassifier VALUES (41, '4210', 'РђРєС†РёР· РЅР° РїРёРІРѕ СЃ РЅРѕСЂРјР°С‚РёРІРЅС‹Рј (СЃС‚Р°РЅРґР°СЂС‚РёР·РёСЂРѕРІР°РЅРЅС‹Рј) СЃРѕРґРµСЂР¶Р°РЅРёРµРј РѕР±СЉРµРјРЅРѕР№ РґРѕР»Рё СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р° СЃРІС‹С€Рµ 0,5 % Рё РґРѕ 8,6 % РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ, РЅР°РїРёС‚РєРё, РёР·РіРѕС‚Р°РІР»РёРІР°РµРјС‹Рµ РЅР° РѕСЃРЅРѕРІРµ РїРёРІР°', 'RU', '2.4.9');
INSERT INTO customsfeesclassifier VALUES (42, '4220', 'РђРєС†РёР· РЅР° РїРёРІРѕ СЃ РЅРѕСЂРјР°С‚РёРІРЅС‹Рј (СЃС‚Р°РЅРґР°СЂС‚РёР·РёСЂРѕРІР°РЅРЅС‹Рј) СЃРѕРґРµСЂР¶Р°РЅРёРµРј РѕР±СЉРµРјРЅРѕР№ РґРѕР»Рё СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р° СЃРІС‹С€Рµ 8,6 %', 'RU', '2.4.9');
INSERT INTO customsfeesclassifier VALUES (43, '4030', 'РђРєС†РёР· РЅР° С‚Р°Р±Р°Рє С‚СЂСѓР±РѕС‡РЅС‹Р№, РєСѓСЂРёС‚РµР»СЊРЅС‹Р№, Р¶РµРІР°С‚РµР»СЊРЅС‹Р№, СЃРѕСЃР°С‚РµР»СЊРЅС‹Р№, РЅСЋС…Р°С‚РµР»СЊРЅС‹Р№, РєР°Р»СЊСЏРЅРЅС‹Р№ (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј С‚Р°Р±Р°РєР°, РёСЃРїРѕР»СЊР·СѓРµРјРѕРіРѕ РІ РєР°С‡РµСЃС‚РІРµ СЃС‹СЂСЊСЏ РґР»СЏ РїСЂРѕРёР·РІРѕРґСЃС‚РІР° С‚Р°Р±Р°С‡РЅРѕР№ РїСЂРѕРґСѓРєС†РёРё)', 'RU', '2.4.10');
INSERT INTO customsfeesclassifier VALUES (44, '4230', 'РђРєС†РёР· РЅР° СЃРёРіР°СЂС‹', 'RU', '2.4.10');
INSERT INTO customsfeesclassifier VALUES (45, '4240', 'РђРєС†РёР· РЅР° СЃРёРіР°СЂРёР»Р»С‹ (СЃРёРіР°СЂРёС‚С‹), Р±РёРґРё, РєСЂРµС‚РµРє', 'RU', '2.4.10');
INSERT INTO customsfeesclassifier VALUES (46, '4250', 'РђРєС†РёР· РЅР° СЃРёРіР°СЂРµС‚С‹, РїР°РїРёСЂРѕСЃС‹', 'RU', '2.4.10');
INSERT INTO customsfeesclassifier VALUES (47, '4060', 'РђРєС†РёР· РЅР° Р°РІС‚РѕРјРѕР±РёР»Рё Р»РµРіРєРѕРІС‹Рµ СЃ РјРѕС‰РЅРѕСЃС‚СЊСЋ РґРІРёРіР°С‚РµР»СЏ РґРѕ 67,5 РєР’С‚ (90 Р».В СЃ.) РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ', 'RU', '2.4.11');
INSERT INTO customsfeesclassifier VALUES (48, '4180', 'РђРєС†РёР· РЅР° Р°РІС‚РѕРјРѕР±РёР»Рё Р»РµРіРєРѕРІС‹Рµ СЃ РјРѕС‰РЅРѕСЃС‚СЊСЋ РґРІРёРіР°С‚РµР»СЏ СЃРІС‹С€Рµ 67,5 РєР’С‚ (90 Р».В СЃ.) Рё РґРѕ 112,5 РєР’С‚ (150 Р».В СЃ.) РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ', 'RU', '2.4.11');
INSERT INTO customsfeesclassifier VALUES (49, '4190', 'РђРєС†РёР· РЅР° Р°РІС‚РѕРјРѕР±РёР»Рё Р»РµРіРєРѕРІС‹Рµ СЃ РјРѕС‰РЅРѕСЃС‚СЊСЋ РґРІРёРіР°С‚РµР»СЏ СЃРІС‹С€Рµ 112,5 РєР’С‚ (150 Р».В СЃ.), РјРѕС‚РѕС†РёРєР»С‹ СЃ РјРѕС‰РЅРѕСЃС‚СЊСЋ РґРІРёРіР°С‚РµР»СЏ СЃРІС‹С€Рµ 112,5 РєР’С‚ (150 Р».В СЃ.)', 'RU', '2.4.11');
INSERT INTO customsfeesclassifier VALUES (50, '4040', '2.4.12.В РђРєС†РёР· РЅР° Р±РµРЅР·РёРЅ Р°РІС‚РѕРјРѕР±РёР»СЊРЅС‹Р№', 'RU', '2.4.12');
INSERT INTO customsfeesclassifier VALUES (51, '4070', '2.4.13.В РђРєС†РёР· РЅР° РґРёР·РµР»СЊРЅРѕРµ С‚РѕРїР»РёРІРѕ', 'RU', '2.4.13');
INSERT INTO customsfeesclassifier VALUES (52, '4080', '2.4.14.В РђРєС†РёР· РЅР° РјРѕС‚РѕСЂРЅС‹Рµ РјР°СЃР»Р° РґР»СЏ РґРёР·РµР»СЊРЅС‹С… Рё (РёР»Рё) РєР°СЂР±СЋСЂР°С‚РѕСЂРЅС‹С… (РёРЅР¶РµРєС‚РѕСЂРЅС‹С…) РґРІРёРіР°С‚РµР»РµР№', 'RU', '2.4.14');
INSERT INTO customsfeesclassifier VALUES (53, '4050', '2.4.15.В РђРєС†РёР· РЅР° РїСЂСЏРјРѕРіРѕРЅРЅС‹Р№ Р±РµРЅР·РёРЅ', 'RU', '2.4.15');
INSERT INTO customsfeesclassifier VALUES (54, '4260', '2.4.17.В РђРєС†РёР· РЅР° СЃСЂРµРґРЅРёРµ РґРёСЃС‚РёР»Р»СЏС‚С‹', 'RU', '2.4.17');
INSERT INTO customsfeesclassifier VALUES (55, '4270', 'РђРєС†РёР· РЅР° СЌР»РµРєС‚СЂРѕРЅРЅС‹Рµ СЃРёСЃС‚РµРјС‹ РґРѕСЃС‚Р°РІРєРё РЅРёРєРѕС‚РёРЅР°', '', '2.4.18');
INSERT INTO customsfeesclassifier VALUES (56, '4280', 'РђРєС†РёР· РЅР° Р¶РёРґРєРѕСЃС‚Рё РґР»СЏ СЌР»РµРєС‚СЂРѕРЅРЅС‹С… СЃРёСЃС‚РµРј РґРѕСЃС‚Р°РІРєРё РЅРёРєРѕС‚РёРЅР°', '', '2.4.19');
INSERT INTO customsfeesclassifier VALUES (57, '4290', 'РђРєС†РёР· РЅР° С‚Р°Р±Р°Рє (С‚Р°Р±Р°С‡РЅС‹Рµ РёР·РґРµР»РёСЏ), РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Р№ РґР»СЏ РїРѕС‚СЂРµР±Р»РµРЅРёСЏ РїСѓС‚РµРј РЅР°РіСЂРµРІР°РЅРёСЏ', '', '2.4.20');
INSERT INTO customsfeesclassifier VALUES (58, '2012', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ (РёРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ Рё СЃР±РѕСЂРѕРІ, РёРјРµСЋС‰РёС… СЌРєРІРёРІР°Р»РµРЅС‚РЅРѕРµ РґРµР№СЃС‚РІРёРµ), СѓРїР»Р°С‡РµРЅРЅС‹С… РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РџСЂРѕС‚РѕРєРѕР»РѕРј Рѕ РїРѕСЂСЏРґРєРµ Р·Р°С‡РёСЃР»РµРЅРёСЏ Рё СЂР°СЃРїСЂРµРґРµР»РµРЅРёСЏ СЃСѓРјРј РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ (РёРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ Рё СЃР±РѕСЂРѕРІ, РёРјРµСЋС‰РёС… СЌРєРІРёРІР°Р»РµРЅС‚РЅРѕРµ РґРµР№СЃС‚РІРёРµ), РёС… РїРµСЂРµС‡РёСЃР»РµРЅРёСЏ РІ РґРѕС…РѕРґ Р±СЋРґР¶РµС‚РѕРІ РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ (РїСЂРёР»РѕР¶РµРЅРёРµ в„– 5 Рє Р”РѕРіРѕРІРѕСЂСѓ Рѕ Р•РІСЂР°Р·РёР№СЃРєРѕРј СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРј СЃРѕСЋР·Рµ РѕС‚ 29 РјР°СЏ 2014 РіРѕРґР°)', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (59, '2022', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹, РѕР±СЏР·Р°РЅРЅРѕСЃС‚СЊ РїРѕ СѓРїР»Р°С‚Рµ РєРѕС‚РѕСЂРѕР№ РІРѕР·РЅРёРєР»Р° РґРѕ РІСЃС‚СѓРїР»РµРЅРёСЏ РІ СЃРёР»Сѓ РЎРѕРіР»Р°С€РµРЅРёСЏ РѕР± СѓСЃС‚Р°РЅРѕРІР»РµРЅРёРё Рё РїСЂРёРјРµРЅРµРЅРёРё РІ РўР°РјРѕР¶РµРЅРЅРѕРј СЃРѕСЋР·Рµ РїРѕСЂСЏРґРєР° Р·Р°С‡РёСЃР»РµРЅРёСЏ Рё СЂР°СЃРїСЂРµРґРµР»РµРЅРёСЏ РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ (РёРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ Рё СЃР±РѕСЂРѕРІ, РёРјРµСЋС‰РёС… СЌРєРІРёРІР°Р»РµРЅС‚РЅРѕРµ РґРµР№СЃС‚РІРёРµ) РѕС‚ 20.05.2010', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (60, '2032', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹, РІР·РёРјР°РµРјРѕР№ РїСЂРё СЂРµРёРјРїРѕСЂС‚Рµ', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (251, '9320', 'Р­РєРѕР»РѕРіРёС‡РµСЃРєРёР№ СЃР±РѕСЂ Р·Р° РІС‹Р±СЂРѕСЃ РІСЂРµРґРЅС‹С… РІРµС‰РµСЃС‚РІ', 'AM', '5.4');
INSERT INTO customsfeesclassifier VALUES (61, '2072', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ СЃРїРµС†РёР°Р»СЊРЅРѕР№ РїРѕС€Р»РёРЅС‹, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅРѕР№ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (62, '2082', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РЅС‚РёРґРµРјРїРёРЅРіРѕРІРѕР№ РїРѕС€Р»РёРЅС‹, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅРѕР№ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (63, '2092', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РєРѕРјРїРµРЅСЃР°С†РёРѕРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅРѕР№ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (64, '27РҐ2', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РїСЂРѕС‡РёС… РїРѕС€Р»РёРЅ РІ РѕС‚РЅРѕС€РµРЅРёРё РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… С‚РѕРІР°СЂРѕРІ', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (65, '3012', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅ РЅР° РЅРµС„С‚СЊ СЃС‹СЂСѓСЋ, РІС‹РІРѕР·РёРјСѓСЋ Р·Р° РїСЂРµРґРµР»С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (66, '3022', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РЅР° РЅРµС„С‚СЊ СЃС‹СЂСѓСЋ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РЅРµС„С‚Рё, РІС‹РІРѕР·РёРјРѕР№ Р·Р° РїСЂРµРґРµР»С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (67, '3032', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РЅР° РіР°Р· РїСЂРёСЂРѕРґРЅС‹Р№', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (68, '3042', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РЅР° С‚РѕРІР°СЂС‹, РІС‹СЂР°Р±РѕС‚Р°РЅРЅС‹Рµ РёР· РЅРµС„С‚Рё', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (69, '3052', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РЅР° С‚РѕРІР°СЂС‹, РІ РѕС‚РЅРѕС€РµРЅРёРё РєРѕС‚РѕСЂС‹С… РЅРµ СѓСЃС‚Р°РЅРѕРІР»РµРЅ РѕС‚РґРµР»СЊРЅС‹Р№ РєРѕРґ РІРёРґР° РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (70, '37РҐ2', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РїСЂРѕС‡РёС… РІС‹РІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (71, '4012', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° СЌС‚РёР»РѕРІС‹Р№ СЃРїРёСЂС‚ РёР· РїРёС‰РµРІРѕРіРѕ СЃС‹СЂСЊСЏ (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РґРёСЃС‚РёР»Р»СЏС‚РѕРІ РІРёРЅРЅРѕРіРѕ, РІРёРЅРѕРіСЂР°РґРЅРѕРіРѕ, РїР»РѕРґРѕРІРѕРіРѕ, РєРѕРЅСЊСЏС‡РЅРѕРіРѕ, РєР°Р»СЊРІР°РґРѕСЃРЅРѕРіРѕ, РІРёСЃРєРѕРІРѕРіРѕ)', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (72, '4022', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° СЃРїРёСЂС‚РѕСЃРѕРґРµСЂР¶Р°С‰СѓСЋ РїСЂРѕРґСѓРєС†РёСЋ', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (73, '4032', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° С‚Р°Р±Р°Рє С‚СЂСѓР±РѕС‡РЅС‹Р№, РєСѓСЂРёС‚РµР»СЊРЅС‹Р№, Р¶РµРІР°С‚РµР»СЊРЅС‹Р№, СЃРѕСЃР°С‚РµР»СЊРЅС‹Р№, РЅСЋС…Р°С‚РµР»СЊРЅС‹Р№, РєР°Р»СЊСЏРЅРЅС‹Р№ (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј С‚Р°Р±Р°РєР°, РёСЃРїРѕР»СЊР·СѓРµРјРѕРіРѕ РІ РєР°С‡РµСЃС‚РІРµ СЃС‹СЂСЊСЏ РґР»СЏ РїСЂРѕРёР·РІРѕРґСЃС‚РІР° С‚Р°Р±Р°С‡РЅРѕР№ РїСЂРѕРґСѓРєС†РёРё)', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (74, '4232', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° СЃРёРіР°СЂС‹', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (75, '4242', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° СЃРёРіР°СЂРёР»Р»С‹ (СЃРёРіР°СЂРёС‚С‹), Р±РёРґРё, РєСЂРµС‚РµРє', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (76, '4252', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° СЃРёРіР°СЂРµС‚С‹, РїР°РїРёСЂРѕСЃС‹', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (77, '4042', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° Р±РµРЅР·РёРЅ Р°РІС‚РѕРјРѕР±РёР»СЊРЅС‹Р№', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (78, '4052', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° РїСЂСЏРјРѕРіРѕРЅРЅС‹Р№ Р±РµРЅР·РёРЅ', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (79, '4062', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° Р°РІС‚РѕРјРѕР±РёР»Рё Р»РµРіРєРѕРІС‹Рµ СЃ РјРѕС‰РЅРѕСЃС‚СЊСЋ РґРІРёРіР°С‚РµР»СЏ РґРѕ 67,5 РєР’С‚ (90 Р».В СЃ.) РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (80, '4182', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° Р°РІС‚РѕРјРѕР±РёР»Рё Р»РµРіРєРѕРІС‹Рµ СЃ РјРѕС‰РЅРѕСЃС‚СЊСЋ РґРІРёРіР°С‚РµР»СЏ СЃРІС‹С€Рµ 67,5 РєР’С‚ (90 Р».В СЃ.) Рё РґРѕ 112,5 РєР’С‚ (150 Р».В СЃ.) РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (81, '4192', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° Р°РІС‚РѕРјРѕР±РёР»Рё Р»РµРіРєРѕРІС‹Рµ СЃ РјРѕС‰РЅРѕСЃС‚СЊСЋ РґРІРёРіР°С‚РµР»СЏ СЃРІС‹С€Рµ 112,5 РєР’С‚ (150 Р».В СЃ.), РјРѕС‚РѕС†РёРєР»С‹ СЃ РјРѕС‰РЅРѕСЃС‚СЊСЋ РґРІРёРіР°С‚РµР»СЏ СЃРІС‹С€Рµ 112,5 РєР’С‚ (150 Р».В СЃ.)', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (82, '4072', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° РґРёР·РµР»СЊРЅРѕРµ С‚РѕРїР»РёРІРѕ', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (83, '4082', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° РјРѕС‚РѕСЂРЅС‹Рµ РјР°СЃР»Р° РґР»СЏ РґРёР·РµР»СЊРЅС‹С… Рё (РёР»Рё) РєР°СЂР±СЋСЂР°С‚РѕСЂРЅС‹С… (РёРЅР¶РµРєС‚РѕСЂРЅС‹С… РґРІРёРіР°С‚РµР»РµР№)', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (84, '2083', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РЅС‚РёРґРµРјРїРёРЅРіРѕРІРѕР№ РїРѕС€Р»РёРЅС‹, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅРѕР№ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (85, '4092', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° РІРёРЅР°, С„СЂСѓРєС‚РѕРІС‹Рµ РІРёРЅР° (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РёРіСЂРёСЃС‚С‹С… РІРёРЅ (С€Р°РјРїР°РЅСЃРєРёС…)), РІРёРЅРЅС‹Рµ РЅР°РїРёС‚РєРё, РёР·РіРѕС‚Р°РІР»РёРІР°РµРјС‹Рµ Р±РµР· РґРѕР±Р°РІР»РµРЅРёСЏ СЂРµРєС‚РёС„РёРєРѕРІР°РЅРЅРѕРіРѕ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р°, РїСЂРѕРёР·РІРµРґРµРЅРЅРѕРіРѕ РёР· РїРёС‰РµРІРѕРіРѕ СЃС‹СЂСЊСЏ, Рё (РёР»Рё) СЃРїРёСЂС‚РѕРІР°РЅРЅС‹С… РІРёРЅРѕРіСЂР°РґРЅРѕРіРѕ РёР»Рё РёРЅРѕРіРѕ С„СЂСѓРєС‚РѕРІРѕРіРѕ СЃСѓСЃР»Р°, Рё (РёР»Рё) РІРёРЅРЅРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°, Рё (РёР»Рё) С„СЂСѓРєС‚РѕРІРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (86, '4202', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° РёРіСЂРёСЃС‚С‹Рµ РІРёРЅР° (С€Р°РјРїР°РЅСЃРєРёРµ)', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (87, '4102', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° РїРёРІРѕ СЃ РЅРѕСЂРјР°С‚РёРІРЅС‹Рј (СЃС‚Р°РЅРґР°СЂС‚РёР·РёСЂРѕРІР°РЅРЅС‹Рј) СЃРѕРґРµСЂР¶Р°РЅРёРµРј РѕР±СЉРµРјРЅРѕР№ РґРѕР»Рё СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р° РґРѕ 0,5 % РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (252, '9330', 'Р”РѕСЂРѕР¶РЅС‹Рµ РїР»Р°С‚РµР¶Рё', 'AM', '5.4');
INSERT INTO customsfeesclassifier VALUES (88, '4212', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° РїРёРІРѕ СЃ РЅРѕСЂРјР°С‚РёРІРЅС‹Рј (СЃС‚Р°РЅРґР°СЂС‚РёР·РёСЂРѕРІР°РЅРЅС‹Рј) СЃРѕРґРµСЂР¶Р°РЅРёРµРј РѕР±СЉРµРјРЅРѕР№ РґРѕР»Рё СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р° СЃРІС‹С€Рµ 0,5 % Рё РґРѕ 8,6 % РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ, РЅР°РїРёС‚РєРё, РёР·РіРѕС‚Р°РІР»РёРІР°РµРјС‹Рµ РЅР° РѕСЃРЅРѕРІРµ РїРёРІР°', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (89, '4222', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° РїРёРІРѕ СЃ РЅРѕСЂРјР°С‚РёРІРЅС‹Рј (СЃС‚Р°РЅРґР°СЂС‚РёР·РёСЂРѕРІР°РЅРЅС‹Рј) СЃРѕРґРµСЂР¶Р°РЅРёРµРј РѕР±СЉРµРјРЅРѕР№ РґРѕР»Рё СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р° СЃРІС‹С€Рµ 8,6 %', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (90, '4122', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° Р°Р»РєРѕРіРѕР»СЊРЅСѓСЋ РїСЂРѕРґСѓРєС†РёСЋ СЃ РѕР±СЉРµРјРЅРѕР№ РґРѕР»РµР№ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р° СЃРІС‹С€Рµ 9 % (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїРёРІР°, РІРёРЅ, С„СЂСѓРєС‚РѕРІС‹С… РІРёРЅ, РёРіСЂРёСЃС‚С‹С… РІРёРЅ (С€Р°РјРїР°РЅСЃРєРёС…), РІРёРЅРЅС‹С… РЅР°РїРёС‚РєРѕРІ, РёР·РіРѕС‚Р°РІР»РёРІР°РµРјС‹С… Р±РµР· РґРѕР±Р°РІР»РµРЅРёСЏ СЂРµРєС‚РёС„РёРєРѕРІР°РЅРЅРѕРіРѕ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р°, РїСЂРѕРёР·РІРµРґРµРЅРЅРѕРіРѕ РёР· РїРёС‰РµРІРѕРіРѕ СЃС‹СЂСЊСЏ, Рё (РёР»Рё) СЃРїРёСЂС‚РѕРІР°РЅРЅС‹С… РІРёРЅРѕРіСЂР°РґРЅРѕРіРѕ РёР»Рё РёРЅРѕРіРѕ С„СЂСѓРєС‚РѕРІРѕРіРѕ СЃСѓСЃР»Р°, Рё (РёР»Рё) РІРёРЅРЅРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°, Рё (РёР»Рё) С„СЂСѓРєС‚РѕРІРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°)', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (91, '4132', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° Р°Р»РєРѕРіРѕР»СЊРЅСѓСЋ РїСЂРѕРґСѓРєС†РёСЋ СЃ РѕР±СЉРµРјРЅРѕР№ РґРѕР»РµР№ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р° РґРѕ 9 % РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїРёРІР°, РЅР°РїРёС‚РєРѕРІ, РёР·РіРѕС‚Р°РІР»РёРІР°РµРјС‹С… РЅР° РѕСЃРЅРѕРІРµ РїРёРІР°, РІРёРЅ, С„СЂСѓРєС‚РѕРІС‹С… РІРёРЅ, РёРіСЂРёСЃС‚С‹С… РІРёРЅ (С€Р°РјРїР°РЅСЃРєРёС…), СЃРёРґСЂР°, РїСѓР°СЂРµ, РјРµРґРѕРІСѓС…Рё, РІРёРЅРЅС‹С… РЅР°РїРёС‚РєРѕРІ, РёР·РіРѕС‚Р°РІР»РёРІР°РµРјС‹С… Р±РµР· РґРѕР±Р°РІР»РµРЅРёСЏ СЂРµРєС‚РёС„РёРєРѕРІР°РЅРЅРѕРіРѕ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р°, РїСЂРѕРёР·РІРµРґРµРЅРЅРѕРіРѕ РёР· РїРёС‰РµРІРѕРіРѕ СЃС‹СЂСЊСЏ, Рё (РёР»Рё) СЃРїРёСЂС‚РѕРІР°РЅРЅС‹С… РІРёРЅРѕРіСЂР°РґРЅРѕРіРѕ РёР»Рё РёРЅРѕРіРѕ С„СЂСѓРєС‚РѕРІРѕРіРѕ СЃСѓСЃР»Р°, Рё (РёР»Рё) РІРёРЅРЅРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°, Рё (РёР»Рё) С„СЂСѓРєС‚РѕРІРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°)', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (92, '4142', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° РґРёСЃС‚РёР»Р»СЏС‚С‹ РІРёРЅРЅС‹Р№, РІРёРЅРѕРіСЂР°РґРЅС‹Р№, РїР»РѕРґРѕРІС‹Р№, РєРѕРЅСЊСЏС‡РЅС‹Р№, РєР°Р»СЊРІР°РґРѕСЃРЅС‹Р№, РІРёСЃРєРѕРІС‹Р№', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (93, '4152', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° СЌС‚РёР»РѕРІС‹Р№ СЃРїРёСЂС‚ РёР· РЅРµРїРёС‰РµРІРѕРіРѕ СЃС‹СЂСЊСЏ', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (94, '4162', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° СЃРёРґСЂ, РїСѓР°СЂРµ, РјРµРґРѕРІСѓС…Сѓ', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (95, '4262', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° СЃСЂРµРґРЅРёРµ РґРёСЃС‚РёР»Р»СЏС‚С‹', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (96, '4272', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° СЌР»РµРєС‚СЂРѕРЅРЅС‹Рµ СЃРёСЃС‚РµРјС‹ РґРѕСЃС‚Р°РІРєРё РЅРёРєРѕС‚РёРЅР°', '', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (97, '4282', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° Р¶РёРґРєРѕСЃС‚Рё РґР»СЏ СЌР»РµРєС‚СЂРѕРЅРЅС‹С… СЃРёСЃС‚РµРј РґРѕСЃС‚Р°РІРєРё РЅРёРєРѕС‚РёРЅР°', '', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (98, '4292', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° С‚Р°Р±Р°Рє (С‚Р°Р±Р°С‡РЅС‹Рµ РёР·РґРµР»РёСЏ), РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Р№ РґР»СЏ РїРѕС‚СЂРµР±Р»РµРЅРёСЏ РїСѓС‚РµРј РЅР°РіСЂРµРІР°РЅРёСЏ', '', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (99, '5012', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РЅР°Р»РѕРіР° РЅР° РґРѕР±Р°РІР»РµРЅРЅСѓСЋ СЃС‚РѕРёРјРѕСЃС‚СЊ', 'RU', '2.5.1');
INSERT INTO customsfeesclassifier VALUES (100, '4293', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° С‚Р°Р±Р°Рє (С‚Р°Р±Р°С‡РЅС‹Рµ РёР·РґРµР»РёСЏ), РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Р№ РґР»СЏ РїРѕС‚СЂРµР±Р»РµРЅРёСЏ РїСѓС‚РµРј РЅР°РіСЂРµРІР°РЅРёСЏ', '', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (101, '2013', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ (РёРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ Рё СЃР±РѕСЂРѕРІ, РёРјРµСЋС‰РёС… СЌРєРІРёРІР°Р»РµРЅС‚РЅРѕРµ РґРµР№СЃС‚РІРёРµ), СѓРїР»Р°С‡РµРЅРЅС‹С… РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РџСЂРѕС‚РѕРєРѕР»РѕРј Рѕ РїРѕСЂСЏРґРєРµ Р·Р°С‡РёСЃР»РµРЅРёСЏ Рё СЂР°СЃРїСЂРµРґРµР»РµРЅРёСЏ СЃСѓРјРј РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ (РёРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ Рё СЃР±РѕСЂРѕРІ, РёРјРµСЋС‰РёС… СЌРєРІРёРІР°Р»РµРЅС‚РЅРѕРµ РґРµР№СЃС‚РІРёРµ), РёС… РїРµСЂРµС‡РёСЃР»РµРЅРёСЏ РІ РґРѕС…РѕРґ Р±СЋРґР¶РµС‚РѕРІ РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ (РїСЂРёР»РѕР¶РµРЅРёРµ в„– 5 Рє Р”РѕРіРѕРІРѕСЂСѓ Рѕ Р•РІСЂР°Р·РёР№СЃРєРѕРј СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРј СЃРѕСЋР·Рµ РѕС‚ 29 РјР°СЏ 2014 РіРѕРґР°)', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (102, '2023', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹, РѕР±СЏР·Р°РЅРЅРѕСЃС‚СЊ РїРѕ СѓРїР»Р°С‚Рµ РєРѕС‚РѕСЂРѕР№ РІРѕР·РЅРёРєР»Р° РґРѕ РІСЃС‚СѓРїР»РµРЅРёСЏ РІ СЃРёР»Сѓ РЎРѕРіР»Р°С€РµРЅРёСЏ РѕР± СѓСЃС‚Р°РЅРѕРІР»РµРЅРёРё Рё РїСЂРёРјРµРЅРµРЅРёРё РІ РўР°РјРѕР¶РµРЅРЅРѕРј СЃРѕСЋР·Рµ РїРѕСЂСЏРґРєР° Р·Р°С‡РёСЃР»РµРЅРёСЏ Рё СЂР°СЃРїСЂРµРґРµР»РµРЅРёСЏ РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ (РёРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ Рё СЃР±РѕСЂРѕРІ, РёРјРµСЋС‰РёС… СЌРєРІРёРІР°Р»РµРЅС‚РЅРѕРµ РґРµР№СЃС‚РІРёРµ) РѕС‚ 20.05.2010', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (103, '2073', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ СЃРїРµС†РёР°Р»СЊРЅРѕР№ РїРѕС€Р»РёРЅС‹, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅРѕР№ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (104, '9460', 'Р”РѕС…РѕРґС‹, РѕР±СЂР°С‰РµРЅРЅС‹Рµ РІ РїРѕР»СЊР·Сѓ РіРѕСЃСѓРґР°СЂСЃС‚РІР°', 'KG', '6.5');
INSERT INTO customsfeesclassifier VALUES (105, '2093', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РєРѕРјРїРµРЅСЃР°С†РёРѕРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅРѕР№ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (106, '27РҐ3', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РїСЂРѕС‡РёС… РїРѕС€Р»РёРЅ РІ РѕС‚РЅРѕС€РµРЅРёРё РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… С‚РѕРІР°СЂРѕРІ', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (107, '3013', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РЅР° РЅРµС„С‚СЊ СЃС‹СЂСѓСЋ, РІС‹РІРѕР·РёРјСѓСЋ Р·Р° РїСЂРµРґРµР»С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (108, '3023', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РЅР° РЅРµС„С‚СЊ СЃС‹СЂСѓСЋ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РЅРµС„С‚Рё, РІС‹РІРѕР·РёРјРѕР№ Р·Р° РїСЂРµРґРµР»С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (253, '9410', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅР°СЏ РїРѕС€Р»РёРЅР° Р·Р° СЌРєСЃРїРѕСЂС‚', 'AM', '5.4');
INSERT INTO customsfeesclassifier VALUES (109, '3033', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РЅР° РіР°Р· РїСЂРёСЂРѕРґРЅС‹Р№', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (110, '3043', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РЅР° С‚РѕРІР°СЂС‹, РІС‹СЂР°Р±РѕС‚Р°РЅРЅС‹Рµ РёР· РЅРµС„С‚Рё', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (111, '3053', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РЅР° С‚РѕРІР°СЂС‹, РІ РѕС‚РЅРѕС€РµРЅРёРё РєРѕС‚РѕСЂС‹С… РЅРµ СѓСЃС‚Р°РЅРѕРІР»РµРЅ РѕС‚РґРµР»СЊРЅС‹Р№ РєРѕРґ РІРёРґР° РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (112, '37РҐ3', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РїСЂРѕС‡РёС… РІС‹РІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (113, '4013', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° СЌС‚РёР»РѕРІС‹Р№ СЃРїРёСЂС‚ РёР· РїРёС‰РµРІРѕРіРѕ СЃС‹СЂСЊСЏ (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РґРёСЃС‚РёР»Р»СЏС‚РѕРІ РІРёРЅРЅРѕРіРѕ, РІРёРЅРѕРіСЂР°РґРЅРѕРіРѕ, РїР»РѕРґРѕРІРѕРіРѕ, РєРѕРЅСЊСЏС‡РЅРѕРіРѕ, РєР°Р»СЊРІР°РґРѕСЃРЅРѕРіРѕ, РІРёСЃРєРѕРІРѕРіРѕ)', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (114, '4023', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° СЃРїРёСЂС‚РѕСЃРѕРґРµСЂР¶Р°С‰СѓСЋ РїСЂРѕРґСѓРєС†РёСЋ', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (115, '4033', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° С‚Р°Р±Р°Рє С‚СЂСѓР±РѕС‡РЅС‹Р№, РєСѓСЂРёС‚РµР»СЊРЅС‹Р№, Р¶РµРІР°С‚РµР»СЊРЅС‹Р№, СЃРѕСЃР°С‚РµР»СЊРЅС‹Р№, РЅСЋС…Р°С‚РµР»СЊРЅС‹Р№, РєР°Р»СЊСЏРЅРЅС‹Р№ (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј С‚Р°Р±Р°РєР°, РёСЃРїРѕР»СЊР·СѓРµРјРѕРіРѕ РІ РєР°С‡РµСЃС‚РІРµ СЃС‹СЂСЊСЏ РґР»СЏ РїСЂРѕРёР·РІРѕРґСЃС‚РІР° С‚Р°Р±Р°С‡РЅРѕР№ РїСЂРѕРґСѓРєС†РёРё)', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (116, '4233', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° СЃРёРіР°СЂС‹', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (117, '4243', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° СЃРёРіР°СЂРёР»Р»С‹ (СЃРёРіР°СЂРёС‚С‹), Р±РёРґРё, РєСЂРµС‚РµРє', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (118, '4253', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° СЃРёРіР°СЂРµС‚С‹, РїР°РїРёСЂРѕСЃС‹', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (119, '4043', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° Р±РµРЅР·РёРЅ Р°РІС‚РѕРјРѕР±РёР»СЊРЅС‹Р№', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (120, '4053', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° РїСЂСЏРјРѕРіРѕРЅРЅС‹Р№ Р±РµРЅР·РёРЅ', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (121, '4063', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° Р°РІС‚РѕРјРѕР±РёР»Рё Р»РµРіРєРѕРІС‹Рµ СЃ РјРѕС‰РЅРѕСЃС‚СЊСЋ РґРІРёРіР°С‚РµР»СЏ РґРѕ 67,5 РєР’С‚ (90 Р». СЃ.) РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (122, '4183', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° Р°РІС‚РѕРјРѕР±РёР»Рё Р»РµРіРєРѕРІС‹Рµ СЃ РјРѕС‰РЅРѕСЃС‚СЊСЋ РґРІРёРіР°С‚РµР»СЏ СЃРІС‹С€Рµ 67,5 РєР’С‚ (90 Р».В СЃ.) Рё РґРѕ 112,5 РєР’С‚ (150 Р».В СЃ.) РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (123, '4193', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° Р°РІС‚РѕРјРѕР±РёР»Рё Р»РµРіРєРѕРІС‹Рµ СЃ РјРѕС‰РЅРѕСЃС‚СЊСЋ РґРІРёРіР°С‚РµР»СЏ СЃРІС‹С€Рµ 112,5 РєР’С‚ (150 Р».В СЃ.), РјРѕС‚РѕС†РёРєР»С‹ СЃ РјРѕС‰РЅРѕСЃС‚СЊСЋ РґРІРёРіР°С‚РµР»СЏ СЃРІС‹С€Рµ 112,5 РєР’С‚ (150 Р».В СЃ.)', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (124, '4073', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° РґРёР·РµР»СЊРЅРѕРµ С‚РѕРїР»РёРІРѕ', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (125, '4083', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° РјРѕС‚РѕСЂРЅС‹Рµ РјР°СЃР»Р° РґР»СЏ РґРёР·РµР»СЊРЅС‹С… Рё (РёР»Рё) РєР°СЂР±СЋСЂР°С‚РѕСЂРЅС‹С… (РёРЅР¶РµРєС‚РѕСЂРЅС‹С… РґРІРёРіР°С‚РµР»РµР№)', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (126, '4093', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° РІРёРЅР°, С„СЂСѓРєС‚РѕРІС‹Рµ РІРёРЅР° (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РёРіСЂРёСЃС‚С‹С… РІРёРЅ (С€Р°РјРїР°РЅСЃРєРёС…)), РІРёРЅРЅС‹Рµ РЅР°РїРёС‚РєРё, РёР·РіРѕС‚Р°РІР»РёРІР°РµРјС‹Рµ Р±РµР· РґРѕР±Р°РІР»РµРЅРёСЏ СЂРµРєС‚РёС„РёРєРѕРІР°РЅРЅРѕРіРѕ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р°, РїСЂРѕРёР·РІРµРґРµРЅРЅРѕРіРѕ РёР· РїРёС‰РµРІРѕРіРѕ СЃС‹СЂСЊСЏ, Рё (РёР»Рё) СЃРїРёСЂС‚РѕРІР°РЅРЅС‹С… РІРёРЅРѕРіСЂР°РґРЅРѕРіРѕ РёР»Рё РёРЅРѕРіРѕ С„СЂСѓРєС‚РѕРІРѕРіРѕ СЃСѓСЃР»Р°, Рё (РёР»Рё) РІРёРЅРЅРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°, Рё (РёР»Рё) С„СЂСѓРєС‚РѕРІРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (127, '4203', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° РёРіСЂРёСЃС‚С‹Рµ РІРёРЅР° (С€Р°РјРїР°РЅСЃРєРёРµ)', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (128, '4103', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° РїРёРІРѕ СЃ РЅРѕСЂРјР°С‚РёРІРЅС‹Рј (СЃС‚Р°РЅРґР°СЂС‚РёР·РёСЂРѕРІР°РЅРЅС‹Рј) СЃРѕРґРµСЂР¶Р°РЅРёРµРј РѕР±СЉРµРјРЅРѕР№ РґРѕР»Рё СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р° РґРѕ 0,5 % РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (129, '4213', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° РїРёРІРѕ СЃ РЅРѕСЂРјР°С‚РёРІРЅС‹Рј (СЃС‚Р°РЅРґР°СЂС‚РёР·РёСЂРѕРІР°РЅРЅС‹Рј) СЃРѕРґРµСЂР¶Р°РЅРёРµРј РѕР±СЉРµРјРЅРѕР№ РґРѕР»Рё СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р° СЃРІС‹С€Рµ 0,5 % Рё РґРѕ 8,6 % РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ, РЅР°РїРёС‚РєРё, РёР·РіРѕС‚Р°РІР»РёРІР°РµРјС‹Рµ РЅР° РѕСЃРЅРѕРІРµ РїРёРІР°', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (130, '9470', 'РџСЂРѕС‡РёРµ РЅРµРЅР°Р»РѕРіРѕРІС‹Рµ РґРѕС…РѕРґС‹', 'KG', '6.5');
INSERT INTO customsfeesclassifier VALUES (131, '4223', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° РїРёРІРѕ СЃ РЅРѕСЂРјР°С‚РёРІРЅС‹Рј (СЃС‚Р°РЅРґР°СЂС‚РёР·РёСЂРѕРІР°РЅРЅС‹Рј) СЃРѕРґРµСЂР¶Р°РЅРёРµРј РѕР±СЉРµРјРЅРѕР№ РґРѕР»Рё СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р° СЃРІС‹С€Рµ 8,6 %', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (132, '4123', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° Р°Р»РєРѕРіРѕР»СЊРЅСѓСЋ РїСЂРѕРґСѓРєС†РёСЋ СЃ РѕР±СЉРµРјРЅРѕР№ РґРѕР»РµР№ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р° СЃРІС‹С€Рµ 9 % (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїРёРІР°, РІРёРЅ, С„СЂСѓРєС‚РѕРІС‹С… РІРёРЅ, РёРіСЂРёСЃС‚С‹С… РІРёРЅ (С€Р°РјРїР°РЅСЃРєРёС…), РІРёРЅРЅС‹С… РЅР°РїРёС‚РєРѕРІ, РёР·РіРѕС‚Р°РІР»РёРІР°РµРјС‹С… Р±РµР· РґРѕР±Р°РІР»РµРЅРёСЏ СЂРµРєС‚РёС„РёРєРѕРІР°РЅРЅРѕРіРѕ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р°, РїСЂРѕРёР·РІРµРґРµРЅРЅРѕРіРѕ РёР· РїРёС‰РµРІРѕРіРѕ СЃС‹СЂСЊСЏ, Рё (РёР»Рё) СЃРїРёСЂС‚РѕРІР°РЅРЅС‹С… РІРёРЅРѕРіСЂР°РґРЅРѕРіРѕ РёР»Рё РёРЅРѕРіРѕ С„СЂСѓРєС‚РѕРІРѕРіРѕ СЃСѓСЃР»Р°, Рё (РёР»Рё) РІРёРЅРЅРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°, Рё (РёР»Рё) С„СЂСѓРєС‚РѕРІРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°)', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (157, '9930', 'РћР±РµСЃРїРµС‡РµРЅРёРµ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ, РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРЅРѕРµ РІ СЃРІСЏР·Рё СЃ РѕСЃСѓС‰РµСЃС‚РІР»РµРЅРёРµРј РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё РІ РєР°С‡РµСЃС‚РІРµ РІР»Р°РґРµР»СЊС†Р° СЃРєР»Р°РґР° РІСЂРµРјРµРЅРЅРѕРіРѕ С…СЂР°РЅРµРЅРёСЏ', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (250, '9310', 'Р­РєРѕР»РѕРіРёС‡РµСЃРєРёР№ СЃР±РѕСЂ Р·Р° РёРјРїРѕСЂС‚ С‚РѕРІР°СЂРѕРІ, РЅР°РЅРѕСЃСЏС‰РёС… РІСЂРµРґ РѕРєСЂСѓР¶Р°СЋС‰РµР№ СЃСЂРµРґРµ', 'AM', '5.4');
INSERT INTO customsfeesclassifier VALUES (133, '4133', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° Р°Р»РєРѕРіРѕР»СЊРЅСѓСЋ РїСЂРѕРґСѓРєС†РёСЋ СЃ РѕР±СЉРµРјРЅРѕР№ РґРѕР»РµР№ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р° РґРѕ 9 % РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїРёРІР°, РЅР°РїРёС‚РєРѕРІ, РёР·РіРѕС‚Р°РІР»РёРІР°РµРјС‹С… РЅР° РѕСЃРЅРѕРІРµ РїРёРІР°, РІРёРЅ, С„СЂСѓРєС‚РѕРІС‹С… РІРёРЅ, РёРіСЂРёСЃС‚С‹С… РІРёРЅ (С€Р°РјРїР°РЅСЃРєРёС…), СЃРёРґСЂР°, РїСѓР°СЂРµ, РјРµРґРѕРІСѓС…Рё, РІРёРЅРЅС‹С… РЅР°РїРёС‚РєРѕРІ, РёР·РіРѕС‚Р°РІР»РёРІР°РµРјС‹С… Р±РµР· РґРѕР±Р°РІР»РµРЅРёСЏ СЂРµРєС‚РёС„РёРєРѕРІР°РЅРЅРѕРіРѕ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р°, РїСЂРѕРёР·РІРµРґРµРЅРЅРѕРіРѕ РёР· РїРёС‰РµРІРѕРіРѕ СЃС‹СЂСЊСЏ, Рё (РёР»Рё) СЃРїРёСЂС‚РѕРІР°РЅРЅС‹С… РІРёРЅРѕРіСЂР°РґРЅРѕРіРѕ РёР»Рё РёРЅРѕРіРѕ С„СЂСѓРєС‚РѕРІРѕРіРѕ СЃСѓСЃР»Р°, Рё (РёР»Рё) РІРёРЅРЅРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°, Рё (РёР»Рё) С„СЂСѓРєС‚РѕРІРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°)', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (134, '4143', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° РґРёСЃС‚РёР»Р»СЏС‚С‹ РІРёРЅРЅС‹Р№, РІРёРЅРѕРіСЂР°РґРЅС‹Р№, РїР»РѕРґРѕРІС‹Р№, РєРѕРЅСЊСЏС‡РЅС‹Р№, РєР°Р»СЊРІР°РґРѕСЃРЅС‹Р№, РІРёСЃРєРѕРІС‹Р№', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (135, '4153', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° СЌС‚РёР»РѕРІС‹Р№ СЃРїРёСЂС‚ РёР· РЅРµРїРёС‰РµРІРѕРіРѕ СЃС‹СЂСЊСЏ', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (136, '4163', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° СЃРёРґСЂ, РїСѓР°СЂРµ, РјРµРґРѕРІСѓС…Сѓ', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (137, '4263', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° СЃСЂРµРґРЅРёРµ РґРёСЃС‚РёР»Р»СЏС‚С‹', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (138, '4273', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° СЌР»РµРєС‚СЂРѕРЅРЅС‹Рµ СЃРёСЃС‚РµРјС‹ РґРѕСЃС‚Р°РІРєРё РЅРёРєРѕС‚РёРЅР°', '', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (139, '4283', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РЅР° Р¶РёРґРєРѕСЃС‚Рё РґР»СЏ СЌР»РµРєС‚СЂРѕРЅРЅС‹С… СЃРёСЃС‚РµРј РґРѕСЃС‚Р°РІРєРё РЅРёРєРѕС‚РёРЅР°', '', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (140, '5013', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РЅР°Р»РѕРіР° РЅР° РґРѕР±Р°РІР»РµРЅРЅСѓСЋ СЃС‚РѕРёРјРѕСЃС‚СЊ', 'RU', '2.5.2');
INSERT INTO customsfeesclassifier VALUES (141, '7015', 'РЎСЂРµРґСЃС‚РІР° РѕС‚ СЂРµР°Р»РёР·Р°С†РёРё РєРѕРЅС„РёСЃРєР°С‚РѕРІ РІ С‡Р°СЃС‚Рё СЂРµР°Р»РёР·Р°С†РёРё РјР°С‚РµСЂРёР°Р»СЊРЅС‹С… Р·Р°РїР°СЃРѕРІ РїРѕ СѓРєР°Р·Р°РЅРЅРѕРјСѓ РёРјСѓС‰РµСЃС‚РІСѓ', 'RU', '2.6');
INSERT INTO customsfeesclassifier VALUES (142, '7030', 'РЎСЂРµРґСЃС‚РІР°, РїРѕР»СѓС‡РµРЅРЅС‹Рµ РІ СЂРµР·СѓР»СЊС‚Р°С‚Рµ РїСЂРёРјРµРЅРµРЅРёСЏ РјРµСЂ РіСЂР°Р¶РґР°РЅСЃРєРѕ-РїСЂР°РІРѕРІРѕР№ Рё Р°РґРјРёРЅРёСЃС‚СЂР°С‚РёРІРЅРѕР№ РѕС‚РІРµС‚СЃС‚РІРµРЅРЅРѕСЃС‚Рё', 'RU', '2.6');
INSERT INTO customsfeesclassifier VALUES (143, '7040', 'РЎСЂРµРґСЃС‚РІР°, РїРѕР»СѓС‡РµРЅРЅС‹Рµ РІ СЂРµР·СѓР»СЊС‚Р°С‚Рµ РїСЂРёРјРµРЅРµРЅРёСЏ РјРµСЂ СѓРіРѕР»РѕРІРЅРѕР№ РѕС‚РІРµС‚СЃС‚РІРµРЅРЅРѕСЃС‚Рё РїРѕ РґРµР»Р°Рј, РІРѕР·Р±СѓР¶РґРµРЅРЅС‹Рј С‚Р°РјРѕР¶РµРЅРЅС‹РјРё РѕСЂРіР°РЅР°РјРё', 'RU', '2.6');
INSERT INTO customsfeesclassifier VALUES (144, '7024', 'РЁС‚СЂР°С„С‹, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј С€С‚СЂР°С„РѕРІ Р·Р° РЅР°СЂСѓС€РµРЅРёРµ РІР°Р»СЋС‚РЅРѕРіРѕ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІР° Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё Р°РєС‚РѕРІ РѕСЂРіР°РЅРѕРІ РІР°Р»СЋС‚РЅРѕРіРѕ СЂРµРіСѓР»РёСЂРѕРІР°РЅРёСЏ, РЅР°Р·РЅР°С‡Р°РµРјС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹РјРё РѕСЂРіР°РЅР°РјРё, Рё С€С‚СЂР°С„РѕРІ Р·Р° РЅР°СЂСѓС€РµРЅРёРµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІР° Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РѕР± РѕСЃРЅРѕРІР°С… РєРѕРЅСЃС‚РёС‚СѓС†РёРѕРЅРЅРѕРіРѕ СЃС‚СЂРѕСЏ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё, Рѕ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕР№ РІР»Р°СЃС‚Рё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё, Рѕ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕР№ СЃР»СѓР¶Р±Рµ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё, Рѕ РІС‹Р±РѕСЂР°С… Рё СЂРµС„РµСЂРµРЅРґСѓРјР°С… Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё, РѕР± РЈРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРј РїРѕ РїСЂР°РІР°Рј С‡РµР»РѕРІРµРєР° РІ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU', '2.6');
INSERT INTO customsfeesclassifier VALUES (145, '7025', 'РЁС‚СЂР°С„С‹ Р·Р° РЅР°СЂСѓС€РµРЅРёРµ РІР°Р»СЋС‚РЅРѕРіРѕ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІР° Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё Р°РєС‚РѕРІ РѕСЂРіР°РЅРѕРІ РІР°Р»СЋС‚РЅРѕРіРѕ СЂРµРіСѓР»РёСЂРѕРІР°РЅРёСЏ, РЅР°Р·РЅР°С‡Р°РµРјС‹Рµ С‚Р°РјРѕР¶РµРЅРЅС‹РјРё РѕСЂРіР°РЅР°РјРё', '', '2.6');
INSERT INTO customsfeesclassifier VALUES (146, '7026', 'РЁС‚СЂР°С„С‹ Р·Р° РЅР°СЂСѓС€РµРЅРёРµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІР° Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РѕР± РѕСЃРЅРѕРІР°С… РєРѕРЅСЃС‚РёС‚СѓС†РёРѕРЅРЅРѕРіРѕ СЃС‚СЂРѕСЏ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё, Рѕ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕР№ РІР»Р°СЃС‚Рё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё, Рѕ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕР№ СЃР»СѓР¶Р±Рµ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё, Рѕ РІС‹Р±РѕСЂР°С… Рё СЂРµС„РµСЂРµРЅРґСѓРјР°С… Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё, РѕР± РЈРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРј РїРѕ РїСЂР°РІР°Рј С‡РµР»РѕРІРµРєР° РІ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', '', '2.6');
INSERT INTO customsfeesclassifier VALUES (147, '9010', 'РЎСѓР±СЃРёРґРёРё Рё РёРЅС‹Рµ СЃСѓРјРјС‹, РЅРµ СѓРїР»Р°С‡РµРЅРЅС‹Рµ Р»РёР±Рѕ РїРѕР»СѓС‡РµРЅРЅС‹Рµ РїСЂСЏРјРѕ РёР»Рё РєРѕСЃРІРµРЅРЅРѕ РІ РєР°С‡РµСЃС‚РІРµ РІС‹РїР»Р°С‚, Р»СЊРіРѕС‚ Р»РёР±Рѕ РІРѕР·РјРµС‰РµРЅРёР№ РІ СЃРІСЏР·Рё СЃ РІС‹РІРѕР·РѕРј С‚РѕРІР°СЂРѕРІ СЃ С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (148, '9020', 'Р�РЅС‹Рµ РІРёРґС‹ РїР»Р°С‚РµР¶РµР№, РІР·РёРјР°РЅРёРµ РєРѕС‚РѕСЂС‹С… РІРѕР·Р»РѕР¶РµРЅРѕ РЅР° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕСЂРіР°РЅС‹', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (149, '9030', 'РџСЂРѕС‡РёРµ РґРѕС…РѕРґС‹ РѕС‚ РѕРєР°Р·Р°РЅРёСЏ РїР»Р°С‚РЅС‹С… СѓСЃР»СѓРі РїРѕР»СѓС‡Р°С‚РµР»СЏРјРё СЃСЂРµРґСЃС‚РІ Рё РєРѕРјРїРµРЅСЃР°С†РёРё Р·Р°С‚СЂР°С‚', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (150, '9040', 'РџСЂРѕС‡РёРµ РЅРµРЅР°Р»РѕРіРѕРІС‹Рµ РґРѕС…РѕРґС‹', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (151, '9050', 'РџСЂРѕС‡РёРµ РїРѕСЃС‚СѓРїР»РµРЅРёСЏ РѕС‚ РІРЅРµС€РЅРµСЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (152, '9070', 'РђРІР°РЅСЃРѕРІС‹Рµ РїР»Р°С‚РµР¶Рё РІ СЃС‡РµС‚ Р±СѓРґСѓС‰РёС… С‚Р°РјРѕР¶РµРЅРЅС‹С… Рё РёРЅС‹С… РїР»Р°С‚РµР¶РµР№', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (153, '9080', 'РћР±РµСЃРїРµС‡РµРЅРёРµ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РѕР±РµСЃРїРµС‡РµРЅРёСЏ, РІРЅРѕСЃРёРјРѕРіРѕ РґРµРЅРµР¶РЅС‹РјРё СЃСЂРµРґСЃС‚РІР°РјРё (РґРµРЅСЊРіР°РјРё) Р»РёР±Рѕ РІ СЃРІСЏР·Рё СЃ РѕСЃСѓС‰РµСЃС‚РІР»РµРЅРёРµРј РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё РІ СЃС„РµСЂРµ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РґРµР»Р°', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (154, '9090', 'Р”РµРЅРµР¶РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° (РґРµРЅСЊРіРё), РІРЅРµСЃРµРЅРЅС‹Рµ РІ РєР°С‡РµСЃС‚РІРµ РѕР±РµСЃРїРµС‡РµРЅРёСЏ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РґРµРЅРµР¶РЅС‹С… СЃСЂРµРґСЃС‚РІ (РґРµРЅРµРі), РІРЅРѕСЃРёРјС‹С… РІ СЃРІСЏР·Рё СЃ РѕСЃСѓС‰РµСЃС‚РІР»РµРЅРёРµРј РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё РІ СЃС„РµСЂРµ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РґРµР»Р°', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (155, '9910', 'РћР±РµСЃРїРµС‡РµРЅРёРµ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ, РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРЅРѕРµ РІ СЃРІСЏР·Рё СЃ РѕСЃСѓС‰РµСЃС‚РІР»РµРЅРёРµРј РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё РІ РєР°С‡РµСЃС‚РІРµ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЏ', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (156, '9920', 'РћР±РµСЃРїРµС‡РµРЅРёРµ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ, РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРЅРѕРµ РІ СЃРІСЏР·Рё СЃ РѕСЃСѓС‰РµСЃС‚РІР»РµРЅРёРµРј РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё РІ РєР°С‡РµСЃС‚РІРµ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РїРµСЂРµРІРѕР·С‡РёРєР°', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (190, '9130', 'РЈС‚РёР»РёР·Р°С†РёРѕРЅРЅС‹Р№ СЃР±РѕСЂ, РїР»Р°С‚РµР»СЊС‰РёРєРѕРј РєРѕС‚РѕСЂРѕРіРѕ РІС‹СЃС‚СѓРїР°РµС‚ СЋСЂРёРґРёС‡РµСЃРєРѕРµ Р»РёС†Рѕ РёР»Рё РёРЅРґРёРІРёРґСѓР°Р»СЊРЅС‹Р№ РїСЂРµРґРїСЂРёРЅРёРјР°С‚РµР»СЊ', 'BY', '3.6');
INSERT INTO customsfeesclassifier VALUES (158, '9940', 'РћР±РµСЃРїРµС‡РµРЅРёРµ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ, РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРЅРѕРµ РІ СЃРІСЏР·Рё СЃ РѕСЃСѓС‰РµСЃС‚РІР»РµРЅРёРµРј РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё РІ РєР°С‡РµСЃС‚РІРµ РІР»Р°РґРµР»СЊС†Р° С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРєР»Р°РґР°', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (159, '9950', 'РћР±РµСЃРїРµС‡РµРЅРёРµ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ, РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРЅРѕРµ РІ СЃРІСЏР·Рё СЃ РѕСЃСѓС‰РµСЃС‚РІР»РµРЅРёРµРј РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё РІ РєР°С‡РµСЃС‚РІРµ РІР»Р°РґРµР»СЊС†Р° РјР°РіР°Р·РёРЅР° Р±РµСЃРїРѕС€Р»РёРЅРЅРѕР№ С‚РѕСЂРіРѕРІР»Рё', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (160, '9960', 'РћР±РµСЃРїРµС‡РµРЅРёРµ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ, РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРЅРѕРµ РІ СЃРІСЏР·Рё СЃ РѕСЃСѓС‰РµСЃС‚РІР»РµРЅРёРµРј РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё РІ РєР°С‡РµСЃС‚РІРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ РѕРїРµСЂР°С‚РѕСЂР°', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (161, '9100', 'Р”РµРЅРµР¶РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, РІРЅРµСЃРµРЅРЅС‹Рµ РІ РєР°С‡РµСЃС‚РІРµ РѕР±РµСЃРїРµС‡РµРЅРёСЏ РёСЃРїРѕР»РЅРµРЅРёСЏ РѕР±СЏР·Р°С‚РµР»СЊСЃС‚РІ РѕСЂРіР°РЅРёР·Р°С†РёРё РѕР± РёСЃРїРѕР»СЊР·РѕРІР°РЅРёРё РїСЂРёРѕР±СЂРµС‚РµРЅРЅС‹С… Р°РєС†РёР·РЅС‹С… РјР°СЂРѕРє, РїРѕ РєРѕС‚РѕСЂС‹Рј РѕР±СЏР·Р°С‚РµР»СЊСЃС‚РІРѕ РѕСЂРіР°РЅРёР·Р°С†РёРё РЅРµ РёСЃРїРѕР»РЅРµРЅРѕ', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (162, '9110', 'РЎСЂРµРґСЃС‚РІР°, СѓРїР»Р°С‡РёРІР°РµРјС‹Рµ РёРјРїРѕСЂС‚РµСЂР°РјРё С‚Р°РјРѕР¶РµРЅРЅС‹Рј РѕСЂРіР°РЅР°Рј Р·Р° РІС‹РґР°С‡Сѓ Р°РєС†РёР·РЅС‹С… РјР°СЂРѕРє', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (163, '9120', 'РЈС‚РёР»РёР·Р°С†РёРѕРЅРЅС‹Р№ СЃР±РѕСЂ, СѓРїР»Р°С‡РёРІР°РµРјС‹Р№ Р·Р° РєРѕР»РµСЃРЅС‹Рµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° (С€Р°СЃСЃРё) Рё РїСЂРёС†РµРїС‹ Рє РЅРёРј, РІРІРѕР·РёРјС‹Рµ РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ, РєСЂРѕРјРµ РєРѕР»РµСЃРЅС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ (С€Р°СЃСЃРё) Рё РїСЂРёС†РµРїРѕРІ Рє РЅРёРј, РІРІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (164, '9130', 'РЈС‚РёР»РёР·Р°С†РёРѕРЅРЅС‹Р№ СЃР±РѕСЂ, СѓРїР»Р°С‡РёРІР°РµРјС‹Р№ Р·Р° РєРѕР»РµСЃРЅС‹Рµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° (С€Р°СЃСЃРё) Рё РїСЂРёС†РµРїС‹ Рє РЅРёРј, РІРІРѕР·РёРјС‹Рµ РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (165, '9150', 'РЈС‚РёР»РёР·Р°С†РёРѕРЅРЅС‹Р№ СЃР±РѕСЂ, СѓРїР»Р°С‡РёРІР°РµРјС‹Р№ Р·Р° СЃР°РјРѕС…РѕРґРЅС‹Рµ РјР°С€РёРЅС‹ Рё РїСЂРёС†РµРїС‹ Рє РЅРёРј, РІРІРѕР·РёРјС‹Рµ РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ, РєСЂРѕРјРµ СЃР°РјРѕС…РѕРґРЅС‹С… РјР°С€РёРЅ Рё РїСЂРёС†РµРїРѕРІ Рє РЅРёРј, РІРІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (166, '9160', 'РЈС‚РёР»РёР·Р°С†РёРѕРЅРЅС‹Р№ СЃР±РѕСЂ, СѓРїР»Р°С‡РёРІР°РµРјС‹Р№ Р·Р° СЃР°РјРѕС…РѕРґРЅС‹Рµ РјР°С€РёРЅС‹ Рё РїСЂРёС†РµРїС‹ Рє РЅРёРј, РІРІРѕР·РёРјС‹Рµ РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (167, '9140', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅР°СЏ РїРѕС€Р»РёРЅР° Р·Р° РїСЂРёРЅСЏС‚РёРµ РїСЂРµРґРІР°СЂРёС‚РµР»СЊРЅС‹С… СЂРµС€РµРЅРёР№ РїРѕ РєР»Р°СЃСЃРёС„РёРєР°С†РёРё С‚РѕРІР°СЂРѕРІ РїРѕ РўРќ Р’Р­Р” Р•РђР­РЎ', 'RU', '2.7');
INSERT INTO customsfeesclassifier VALUES (168, '1040', 'РўР°РјРѕР¶РµРЅРЅС‹Рµ СЃР±РѕСЂС‹ Р·Р° РІС‹РґР°С‡Сѓ РєРІР°Р»РёС„РёРєР°С†РёРѕРЅРЅРѕРіРѕ Р°С‚С‚РµСЃС‚Р°С‚Р° СЃРїРµС†РёР°Р»РёСЃС‚Р° РІ РѕР±Р»Р°СЃС‚Рё С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РґРµР»Р° (СЃРїРµС†РёР°Р»РёСЃС‚Р° РїРѕ С‚Р°РјРѕР¶РµРЅРЅС‹Рј РѕРїРµСЂР°С†РёСЏРј, СЃРїРµС†РёР°Р»РёСЃС‚Р° РїРѕ С‚Р°РјРѕР¶РµРЅРЅРѕРјСѓ РѕС„РѕСЂРјР»РµРЅРёСЋ)', 'BY', '3.1');
INSERT INTO customsfeesclassifier VALUES (169, '1050', 'РўР°РјРѕР¶РµРЅРЅС‹Рµ СЃР±РѕСЂС‹ Р·Р° РїСЂРёРЅСЏС‚РёРµ С‚Р°РјРѕР¶РµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј РїСЂРµРґРІР°СЂРёС‚РµР»СЊРЅРѕРіРѕ СЂРµС€РµРЅРёСЏ', 'BY', '3.1');
INSERT INTO customsfeesclassifier VALUES (170, '1060', 'РўР°РјРѕР¶РµРЅРЅС‹Рµ СЃР±РѕСЂС‹ Р·Р° РІРєР»СЋС‡РµРЅРёРµ РІ СЂРµРµСЃС‚СЂ Р±Р°РЅРєРѕРІ Рё РЅРµР±Р°РЅРєРѕРІСЃРєРёС… РєСЂРµРґРёС‚РЅРѕ-С„РёРЅР°РЅСЃРѕРІС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№, РїСЂРёР·РЅР°РЅРЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹РјРё РѕСЂРіР°РЅР°РјРё РіР°СЂР°РЅС‚РѕРј СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ', 'BY', '3.1');
INSERT INTO customsfeesclassifier VALUES (171, '1070', 'РўР°РјРѕР¶РµРЅРЅС‹Рµ СЃР±РѕСЂС‹ Р·Р° СЃРѕРІРµСЂС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕРїРµСЂР°С†РёР№, РІР·РёРјР°РµРјС‹Рµ РїСЂРё РїРµСЂРµРјРµС‰РµРЅРёРё С„РёР·РёС‡РµСЃРєРёРјРё Р»РёС†Р°РјРё С‚РѕРІР°СЂРѕРІ РґР»СЏ Р»РёС‡РЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ, РѕР±Р»Р°РіР°РµРјС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹РјРё РїРѕС€Р»РёРЅР°РјРё, РЅР°Р»РѕРіР°РјРё', 'BY', '3.1');
INSERT INTO customsfeesclassifier VALUES (172, '18РҐ0', 'РџСЂРѕС‡РёРµ С‚Р°РјРѕР¶РµРЅРЅС‹Рµ СЃР±РѕСЂС‹', 'BY', '3.1');
INSERT INTO customsfeesclassifier VALUES (173, '2840', 'РЎРїРµС†РёР°Р»СЊРЅР°СЏ РїРѕС€Р»РёРЅР°, СѓРїР»Р°С‡РёРІР°РµРјР°СЏ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'BY', '3.2');
INSERT INTO customsfeesclassifier VALUES (174, '2850', 'РђРЅС‚РёРґРµРјРїРёРЅРіРѕРІР°СЏ РїРѕС€Р»РёРЅР°, СѓРїР»Р°С‡РёРІР°РµРјР°СЏ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'BY', '3.2');
INSERT INTO customsfeesclassifier VALUES (175, '28РҐ0', 'РџСЂРѕС‡РёРµ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… С‚РѕРІР°СЂРѕРІ', 'BY', '3.2');
INSERT INTO customsfeesclassifier VALUES (176, '3010', 'Р’С‹РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР° РЅР° С‚РѕРІР°СЂС‹, РІ РѕС‚РЅРѕС€РµРЅРёРё РєРѕС‚РѕСЂС‹С… РЅРµ СѓСЃС‚Р°РЅРѕРІР»РµРЅ РѕС‚РґРµР»СЊРЅС‹Р№ РєРѕРґ РІРёРґР° РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹', 'BY', '3.3');
INSERT INTO customsfeesclassifier VALUES (177, '3050', 'Р’С‹РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР° РЅР° РєР°Р»РёР№РЅС‹Рµ СѓРґРѕР±СЂРµРЅРёСЏ', 'BY', '3.3');
INSERT INTO customsfeesclassifier VALUES (178, '3800', 'Р’С‹РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР°, РёСЃС‡РёСЃР»СЏРµРјР°СЏ Рё СѓРїР»Р°С‡РёРІР°РµРјР°СЏ РІ РґРѕР»Р»Р°СЂР°С… РЎРЁРђ РїСЂРё РїРѕРјРµС‰РµРЅРёРё РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ СЌРєСЃРїРѕСЂС‚Р° РЅРµС„С‚Рё СЃС‹СЂРѕР№, СЃС‚СЂР°РЅРѕР№ РїСЂРѕРёСЃС…РѕР¶РґРµРЅРёСЏ РєРѕС‚РѕСЂРѕР№ РЅРµ СЏРІР»СЏРµС‚СЃСЏ Р РµСЃРїСѓР±Р»РёРєР° Р‘РµР»Р°СЂСѓСЃСЊ, Рё РѕС‚РґРµР»СЊРЅС‹С… РєР°С‚РµРіРѕСЂРёР№ С‚РѕРІР°СЂРѕРІ, РІС‹СЂР°Р±РѕС‚Р°РЅРЅС‹С… РёР· РЅРµС„С‚Рё', 'BY', '3.3');
INSERT INTO customsfeesclassifier VALUES (179, '3810', 'Р’С‹РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР° РїСЂРё СЌРєСЃРїРѕСЂС‚Рµ РЅРµС„С‚Рё СЃС‹СЂРѕР№, СЃС‚СЂР°РЅРѕР№ РїСЂРѕРёСЃС…РѕР¶РґРµРЅРёСЏ РєРѕС‚РѕСЂРѕР№ СЏРІР»СЏРµС‚СЃСЏ Р РµСЃРїСѓР±Р»РёРєР° Р‘РµР»Р°СЂСѓСЃСЊ', 'BY', '3.3');
INSERT INTO customsfeesclassifier VALUES (180, '38РҐ0', 'РџСЂРѕС‡РёРµ РІС‹РІРѕР·РЅС‹Рµ С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РїРѕС€Р»РёРЅС‹', 'BY', '3.3');
INSERT INTO customsfeesclassifier VALUES (181, '4180', 'РђРєС†РёР·С‹, РЅР° Р°Р»РєРѕРіРѕР»СЊРЅСѓСЋ РїСЂРѕРґСѓРєС†РёСЋ Рё СЃРїРёСЂС‚РѕСЃРѕРґРµСЂР¶Р°С‰РёРµ СЂР°СЃС‚РІРѕСЂС‹', 'BY', '3.4');
INSERT INTO customsfeesclassifier VALUES (182, '4190', 'РђРєС†РёР·С‹ РЅР° РїРёРІРѕ', 'BY', '3.4');
INSERT INTO customsfeesclassifier VALUES (183, '4200', 'РђРєС†РёР·С‹ РЅР° С‚Р°Р±Р°С‡РЅС‹Рµ РёР·РґРµР»РёСЏ', 'BY', '3.4');
INSERT INTO customsfeesclassifier VALUES (184, '4220', 'РђРєС†РёР·С‹ РЅР° Р°РІС‚РѕРјРѕР±РёР»СЊРЅРѕРµ Рё РёРЅРѕРµ РёСЃРїРѕР»СЊР·СѓРµРјРѕРµ РІ РєР°С‡РµСЃС‚РІРµ Р°РІС‚РѕРјРѕР±РёР»СЊРЅРѕРіРѕ С‚РѕРїР»РёРІРѕ', 'BY', '3.4');
INSERT INTO customsfeesclassifier VALUES (185, '4230', 'РђРєС†РёР·С‹ РЅР° РјР°СЃР»Р° РјРѕС‚РѕСЂРЅС‹Рµ', 'BY', '3.4');
INSERT INTO customsfeesclassifier VALUES (186, '48РҐ0', 'РџСЂРѕС‡РёРµ Р°РєС†РёР·С‹', 'BY', '3.4');
INSERT INTO customsfeesclassifier VALUES (187, 'РҐРҐРҐ2', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РїР»Р°С‚РµР¶Р°', 'BY', '3.5');
INSERT INTO customsfeesclassifier VALUES (188, 'РҐРҐРҐ3', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РїР»Р°С‚РµР¶Р°', 'BY', '3.5');
INSERT INTO customsfeesclassifier VALUES (189, '9120', 'РЈС‚РёР»РёР·Р°С†РёРѕРЅРЅС‹Р№ СЃР±РѕСЂ, РїР»Р°С‚РµР»СЊС‰РёРєРѕРј РєРѕС‚РѕСЂРѕРіРѕ РІС‹СЃС‚СѓРїР°РµС‚ С„РёР·РёС‡РµСЃРєРѕРµ Р»РёС†Рѕ, РЅРµ СЏРІР»СЏСЋС‰РµРµСЃСЏ РёРЅРґРёРІРёРґСѓР°Р»СЊРЅС‹Рј РїСЂРµРґРїСЂРёРЅРёРјР°С‚РµР»РµРј', 'BY', '3.6');
INSERT INTO customsfeesclassifier VALUES (247, '4640', 'РђРєС†РёР· РЅР° РЅРµС„С‚СЊ Рё РїСЂРѕРґСѓРєС‚С‹ РёР· РЅРµС„С‚Рё', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (191, '9200', 'РћР±РµСЃРїРµС‡РµРЅРёРµ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РѕР±РµСЃРїРµС‡РµРЅРёСЏ, РІРЅРѕСЃРёРјРѕРіРѕ РІ СЃРІСЏР·Рё СЃ РѕСЃСѓС‰РµСЃС‚РІР»РµРЅРёРµРј РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё РІ СЃС„РµСЂРµ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РґРµР»Р°)', 'BY', '3.6');
INSERT INTO customsfeesclassifier VALUES (192, '9910', 'РћР±РµСЃРїРµС‡РµРЅРёРµ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ, РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРЅРѕРµ РІ СЃРІСЏР·Рё СЃ РѕСЃСѓС‰РµСЃС‚РІР»РµРЅРёРµРј РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё РІ СЃС„РµСЂРµ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РґРµР»Р°', 'BY', '3.6');
INSERT INTO customsfeesclassifier VALUES (193, '98РҐ0', 'РџСЂРѕС‡РёРµ СЃСѓРјРјС‹ РѕР±РµСЃРїРµС‡РµРЅРёСЏ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ', 'BY', '3.6');
INSERT INTO customsfeesclassifier VALUES (194, '1039', 'РџР»Р°С‚Р° Р·Р° РїСЂРёРЅСЏС‚РёРµ С‚Р°РјРѕР¶РµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј РїСЂРµРґРІР°СЂРёС‚РµР»СЊРЅРѕРіРѕ СЂРµС€РµРЅРёСЏ', 'KZ', '4.1');
INSERT INTO customsfeesclassifier VALUES (195, '1049', 'РџСЂРѕС‡РёРµ С‚Р°РјРѕР¶РµРЅРЅС‹Рµ СЃР±РѕСЂС‹', 'KZ', '4.1');
INSERT INTO customsfeesclassifier VALUES (196, '3010', 'Р’С‹РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР° РЅР° С‚РѕРІР°СЂС‹, РІ РѕС‚РЅРѕС€РµРЅРёРё РєРѕС‚РѕСЂС‹С… РЅРµ СѓСЃС‚Р°РЅРѕРІР»РµРЅ РѕС‚РґРµР»СЊРЅС‹Р№ РєРѕРґ РІРёРґР° РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹', 'KZ', '4.2');
INSERT INTO customsfeesclassifier VALUES (197, '3070', 'Р’С‹РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР° РЅР° СЃС‹СЂСѓСЋ РЅРµС„С‚СЊ', 'KZ', '4.2');
INSERT INTO customsfeesclassifier VALUES (198, '3080', 'Р’С‹РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР° РЅР° С‚РѕРІР°СЂС‹, РІС‹СЂР°Р±РѕС‚Р°РЅРЅС‹Рµ РёР· РЅРµС„С‚Рё', 'KZ', '4.2');
INSERT INTO customsfeesclassifier VALUES (199, '39РҐ0', 'РџСЂРѕС‡РёРµ РІС‹РІРѕР·РЅС‹Рµ С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РїРѕС€Р»РёРЅС‹', 'KZ', '4.2');
INSERT INTO customsfeesclassifier VALUES (200, '4310', 'РђРєС†РёР· РЅР° СЃРёРіР°СЂС‹, РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹Рµ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РєСЂРѕРјРµ С‚РѕРІР°СЂРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІРІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (201, '4320', 'РђРєС†РёР· РЅР° СЃР»Р°Р±РѕРіСЂР°РґСѓСЃРЅС‹Рµ Р»РёРєРµСЂРѕРІРѕРґРѕС‡РЅС‹Рµ РёР·РґРµР»РёСЏ СЃ РѕР±СЉРµРјРЅРѕР№ РґРѕР»РµР№ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р° РѕС‚ 1,5 РґРѕ 12 РїСЂРѕС†РµРЅС‚РѕРІ, РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹Рµ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РєСЂРѕРјРµ С‚РѕРІР°СЂРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІРІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (202, '4330', 'РђРєС†РёР·С‹ РЅР° СЃРёРіР°СЂРёР»Р»С‹, РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹Рµ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РєСЂРѕРјРµ С‚РѕРІР°СЂРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІРІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (203, '4340', 'РђРєС†РёР·С‹ РЅР° С‚Р°Р±Р°Рє С‚СЂСѓР±РѕС‡РЅС‹Р№, РєСѓСЂРёС‚РµР»СЊРЅС‹Р№, Р¶РµРІР°С‚РµР»СЊРЅС‹Р№, СЃРѕСЃР°С‚РµР»СЊРЅС‹Р№, РЅСЋС…Р°С‚РµР»СЊРЅС‹Р№, РєР°Р»СЊСЏРЅРЅС‹Р№ Рё РїСЂРѕС‡РёР№, СѓРїР°РєРѕРІР°РЅРЅС‹Р№ РІ РїРѕС‚СЂРµР±РёС‚РµР»СЊСЃРєСѓСЋ С‚Р°СЂСѓ Рё РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Р№ РґР»СЏ РєРѕРЅРµС‡РЅРѕРіРѕ РїРѕС‚СЂРµР±Р»РµРЅРёСЏ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј С„Р°СЂРјР°С†РµРІС‚РёС‡РµСЃРєРѕР№ РїСЂРѕРґСѓРєС†РёРё, СЃРѕРґРµСЂР¶Р°С‰РµР№ РЅРёРєРѕС‚РёРЅ, РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹Р№ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РєСЂРѕРјРµ С‚РѕРІР°СЂРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІРІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (204, '4350', 'РђРєС†РёР· РЅР° РІСЃРµ РІРёРґС‹ СЃРїРёСЂС‚Р° Рё СЃРїРёСЂС‚РѕСЃРѕРґРµСЂР¶Р°С‰СѓСЋ РїСЂРѕРґСѓРєС†РёСЋ, РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹Рµ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РєСЂРѕРјРµ С‚РѕРІР°СЂРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІРІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (205, '4360', 'РђРєС†РёР· РЅР° РІРѕРґРєСѓ, РёРјРїРѕСЂС‚РёСЂСѓРµРјСѓСЋ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РєСЂРѕРјРµ С‚РѕРІР°СЂРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІРІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (206, '4370', 'РђРєС†РёР· РЅР° РєСЂРµРїРєРёРµ Р»РёРєРµСЂРѕРІРѕРґРѕС‡РЅС‹Рµ РёР·РґРµР»РёСЏ СЃ РѕР±СЉРµРјРЅРѕР№ РґРѕР»РµР№ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р° РѕС‚ 30 РґРѕ 60 РїСЂРѕС†РµРЅС‚РѕРІ, РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹Рµ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РєСЂРѕРјРµ С‚РѕРІР°СЂРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІРІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (207, '4380', 'РђРєС†РёР·С‹ РЅР° РІРёРЅР°, РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹Рµ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РєСЂРѕРјРµ С‚РѕРІР°СЂРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІРІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (208, '4390', 'РђРєС†РёР·С‹ РЅР° РєРѕРЅСЊСЏРє, Р±СЂРµРЅРґРё РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹Рµ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РєСЂРѕРјРµ С‚РѕРІР°СЂРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІРІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (209, '4400', 'РђРєС†РёР·С‹ РЅР° РїРёРІРѕ, РёРјРїРѕСЂС‚РёСЂСѓРµРјРѕРµ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РєСЂРѕРјРµ С‚РѕРІР°СЂРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІРІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (210, '4410', 'РђРєС†РёР·С‹ РЅР° СЃР»Р°Р±РѕРіСЂР°РґСѓСЃРЅС‹Рµ Р»РёРєРµСЂРѕРІРѕРґРѕС‡РЅС‹Рµ РёР·РґРµР»РёСЏ СЃ РѕР±СЉРµРјРЅРѕР№ РґРѕР»РµР№ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р° РѕС‚ 12 РґРѕ 30 РїСЂРѕС†РµРЅС‚РѕРІ, РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹Рµ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РєСЂРѕРјРµ С‚РѕРІР°СЂРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІРІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (211, '4420', 'РђРєС†РёР·С‹ РЅР° СЃРёРіР°СЂРµС‚С‹ СЃ С„РёР»СЊС‚СЂРѕРј, РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹Рµ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РєСЂРѕРјРµ С‚РѕРІР°СЂРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІРІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (212, '4430', 'РђРєС†РёР·С‹ РЅР° СЃРёРіР°СЂРµС‚С‹ Р±РµР· С„РёР»СЊС‚СЂР°, РїР°РїРёСЂРѕСЃС‹, РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹Рµ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РєСЂРѕРјРµ С‚РѕРІР°СЂРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІРІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (248, '4650', 'РђРєС†РёР· РЅР° РЅРµС„С‚СЏРЅС‹Рµ РіР°Р·С‹ Рё РіР°Р·РѕРѕР±СЂР°Р·РЅС‹Рµ СѓРіР»РµРІРѕРґРѕСЂРѕРґС‹ (РєСЂРѕРјРµ РЅР°С‚СѓСЂР°Р»СЊРЅРѕРіРѕ РіР°Р·Р°)', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (249, '46X0', 'РџСЂРѕС‡РёРµ Р°РєС†РёР·С‹', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (213, '4440', 'РђРєС†РёР·С‹ РЅР° Р»РµРіРєРѕРІС‹Рµ Р°РІС‚РѕРјРѕР±РёР»Рё (РєСЂРѕРјРµ Р°РІС‚РѕРјРѕР±РёР»РµР№ СЃ СЂСѓС‡РЅС‹Рј СѓРїСЂР°РІР»РµРЅРёРµРј РёР»Рё Р°РґР°РїС‚РµСЂРѕРј СЂСѓС‡РЅРѕРіРѕ СѓРїСЂР°РІР»РµРЅРёСЏ, СЃРїРµС†РёР°Р»СЊРЅРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РёРЅРІР°Р»РёРґРѕРІ), РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹Рµ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РєСЂРѕРјРµ С‚РѕРІР°СЂРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІРІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (214, '4450', 'РђРєС†РёР·С‹ РЅР° РІРёРЅРѕРјР°С‚РµСЂРёР°Р»С‹, РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹Рµ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РєСЂРѕРјРµ С‚РѕРІР°СЂРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІРІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (215, '4460', 'РђРєС†РёР·С‹ РЅР° РґРёР·РµР»СЊРЅРѕРµ С‚РѕРїР»РёРІРѕ, РёРјРїРѕСЂС‚РёСЂСѓРµРјРѕРµ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РєСЂРѕРјРµ С‚РѕРІР°СЂРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІРІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (216, '4470', 'РђРєС†РёР·С‹ РЅР° Р±РµРЅР·РёРЅ (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј Р°РІРёР°С†РёРѕРЅРЅРѕРіРѕ), РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹Р№ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РєСЂРѕРјРµ С‚РѕРІР°СЂРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІРІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (217, '4480', 'РђРєС†РёР·С‹ РЅР° СЃС‹СЂСѓСЋ РЅРµС„С‚СЊ, РіР°Р·РѕРІС‹Р№ РєРѕРЅРґРµРЅСЃР°С‚, РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹Рµ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РєСЂРѕРјРµ С‚РѕРІР°СЂРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІРІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (218, '4490', 'РђРєС†РёР·С‹, РґРѕРЅР°С‡РёСЃР»РµРЅРЅС‹Рµ РІ СЂРµР·СѓР»СЊС‚Р°С‚Рµ РїСЂРѕРІРµРґРµРЅРёСЏ РЅРµР·Р°РІРёСЃРёРјРѕР№ СЌРєСЃРїРµСЂС‚РёР·С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ СЃС‚РѕРёРјРѕСЃС‚Рё С‚РѕРІР°СЂРѕРІ, РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (219, '49РҐ0', 'РџСЂРѕС‡РёРµ Р°РєС†РёР·С‹', 'KZ', '4.3');
INSERT INTO customsfeesclassifier VALUES (220, 'XXX6', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹', '', '4.4.1');
INSERT INTO customsfeesclassifier VALUES (221, 'XXX7', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹', '', '4.4.1');
INSERT INTO customsfeesclassifier VALUES (222, '5020', 'РќР°Р»РѕРі РЅР° РґРѕР±Р°РІР»РµРЅРЅСѓСЋ СЃС‚РѕРёРјРѕСЃС‚СЊ РЅР° С‚РѕРІР°СЂС‹, РїСЂРѕРёСЃС…РѕРґСЏС‰РёРµ Рё РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹Рµ СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РґРѕ СЃРѕР·РґР°РЅРёСЏ РµРґРёРЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё', 'KZ', '4.4');
INSERT INTO customsfeesclassifier VALUES (223, '5030', 'РќР°Р»РѕРі РЅР° РґРѕР±Р°РІР»РµРЅРЅСѓСЋ СЃС‚РѕРёРјРѕСЃС‚СЊ РЅР° С‚РѕРІР°СЂС‹, РїСЂРѕРёСЃС…РѕРґСЏС‰РёРµ Рё РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹Рµ СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ РґРѕ СЃРѕР·РґР°РЅРёСЏ РµРґРёРЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё', 'KZ', '4.4');
INSERT INTO customsfeesclassifier VALUES (224, '5040', 'РќР°Р»РѕРі РЅР° РґРѕР±Р°РІР»РµРЅРЅСѓСЋ СЃС‚РѕРёРјРѕСЃС‚СЊ, РґРѕРЅР°С‡РёСЃР»РµРЅРЅС‹Р№ РІ СЂРµР·СѓР»СЊС‚Р°С‚Рµ РїСЂРѕРІРµРґРµРЅРёСЏ РЅРµР·Р°РІРёСЃРёРјРѕР№ СЌРєСЃРїРµСЂС‚РёР·С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ СЃС‚РѕРёРјРѕСЃС‚Рё С‚РѕРІР°СЂРѕРІ, РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РєСЂРѕРјРµ РЅР°Р»РѕРіР° РЅР° РґРѕР±Р°РІР»РµРЅРЅСѓСЋ СЃС‚РѕРёРјРѕСЃС‚СЊ РЅР° С‚РѕРІР°СЂС‹, РїСЂРѕРёСЃС…РѕРґСЏС‰РёС… Рё РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'KZ', '4.4');
INSERT INTO customsfeesclassifier VALUES (225, '5050', 'РќР°Р»РѕРі РЅР° РґРѕР±Р°РІР»РµРЅРЅСѓСЋ СЃС‚РѕРёРјРѕСЃС‚СЊ, РґРѕРЅР°С‡РёСЃР»РµРЅРЅС‹Р№ РІ СЂРµР·СѓР»СЊС‚Р°С‚Рµ РїСЂРѕРІРµРґРµРЅРёСЏ РЅРµР·Р°РІРёСЃРёРјРѕР№ СЌРєСЃРїРµСЂС‚РёР·С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ СЃС‚РѕРёРјРѕСЃС‚Рё С‚РѕРІР°СЂРѕРІ, РїСЂРѕРёСЃС…РѕРґСЏС‰РёС… Рё РёРјРїРѕСЂС‚РёСЂСѓРµРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'KZ', '4.4');
INSERT INTO customsfeesclassifier VALUES (226, '5060', 'РџСЂРѕС‡РёРµ РІРёРґС‹ РЅР°Р»РѕРіР° РЅР° РґРѕР±Р°РІР»РµРЅРЅСѓСЋ СЃС‚РѕРёРјРѕСЃС‚СЊ', 'KZ', '4.4');
INSERT INTO customsfeesclassifier VALUES (227, '7020', 'РђРґРјРёРЅРёСЃС‚СЂР°С‚РёРІРЅС‹Рµ С€С‚СЂР°С„С‹, СЃР°РЅРєС†РёРё, РІР·С‹СЃРєР°РЅРёСЏ, РЅР°Р»Р°РіР°РµРјС‹Рµ С‚Р°РјРѕР¶РµРЅРЅС‹РјРё РѕСЂРіР°РЅР°РјРё, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїРѕСЃС‚СѓРїР»РµРЅРёР№ РѕС‚ РѕСЂРіР°РЅРёР·Р°С†РёР№ РЅРµС„С‚СЏРЅРѕРіРѕ СЃРµРєС‚РѕСЂР°', 'KZ', '4.5');
INSERT INTO customsfeesclassifier VALUES (228, '9300', 'РЎР±РѕСЂ Р·Р° РїСЂРѕРµР·Рґ Р°РІС‚РѕС‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ РїРѕ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РєСЂРѕРјРµ СЃР±РѕСЂР° Р·Р° РїСЂРѕРµР·Рґ Р°РІС‚РѕС‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ РїРѕ РїР»Р°С‚РЅС‹Рј РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рј Р°РІС‚РѕРјРѕР±РёР»СЊРЅС‹Рј РґРѕСЂРѕРіР°Рј РјРµСЃС‚РЅРѕРіРѕ Р·РЅР°С‡РµРЅРёСЏ', 'KZ', '4.5');
INSERT INTO customsfeesclassifier VALUES (229, '9350', 'РЎРїРµС†РёР°Р»СЊРЅР°СЏ (Р·Р°С‰РёС‚РЅР°СЏ) РїРѕС€Р»РёРЅР°, СѓРїР»Р°С‡РёРІР°РµРјР°СЏ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ', '4.5');
INSERT INTO customsfeesclassifier VALUES (230, '9400', 'Р�РЅС‹Рµ РІРёРґС‹ РїР»Р°С‚РµР¶РµР№, РІР·РёРјР°РЅРёРµ РєРѕС‚РѕСЂС‹С… РІРѕР·Р»РѕР¶РµРЅРѕ РЅР° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕСЂРіР°РЅС‹', 'KZ', '4.5');
INSERT INTO customsfeesclassifier VALUES (231, '1030', 'РўР°РјРѕР¶РµРЅРЅС‹Рµ СЃР±РѕСЂС‹ Р·Р° РІСЂРµРјРµРЅРЅРѕРµ С…СЂР°РЅРµРЅРёРµ', 'AM', '5.1');
INSERT INTO customsfeesclassifier VALUES (232, '1050', 'РўР°РјРѕР¶РµРЅРЅС‹Рµ СЃР±РѕСЂС‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј РїСЂРµРґРІР°СЂРёС‚РµР»СЊРЅРѕРіРѕ СЂРµС€РµРЅРёСЏ Рѕ РєР»Р°СЃСЃРёС„РёРєР°С†РёРё С‚РѕРІР°СЂРѕРІ', 'AM', '5.1');
INSERT INTO customsfeesclassifier VALUES (233, '1090', 'РўР°РјРѕР¶РµРЅРЅС‹Рµ СЃР±РѕСЂС‹ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Р№ РєРѕРЅС‚СЂРѕР»СЊ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… РїРѕ С‚СЂСѓР±РѕРїСЂРѕРІРѕРґР°Рј Рё Р»РёРЅРёСЏРј СЌР»РµРєС‚СЂРѕРїРµСЂРµРґР°С‡', 'AM', '5.1');
INSERT INTO customsfeesclassifier VALUES (234, '15РҐ0', 'РџСЂРѕС‡РёРµ С‚Р°РјРѕР¶РµРЅРЅС‹Рµ СЃР±РѕСЂС‹', 'AM', '5.1');
INSERT INTO customsfeesclassifier VALUES (235, '3010', 'Р’С‹РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР° РЅР° С‚РѕРІР°СЂС‹, РІ РѕС‚РЅРѕС€РµРЅРёРё РєРѕС‚РѕСЂС‹С… РЅРµ СѓСЃС‚Р°РЅРѕРІР»РµРЅ РѕС‚РґРµР»СЊРЅС‹Р№ РєРѕРґ РІРёРґР° РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹', 'AM', '5.2');
INSERT INTO customsfeesclassifier VALUES (236, '35РҐ0', 'РџСЂРѕС‡РёРµ РІС‹РІРѕР·РЅС‹Рµ С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РїРѕС€Р»РёРЅС‹', 'AM', '5.2');
INSERT INTO customsfeesclassifier VALUES (237, '46РҐ0', 'РџСЂРѕС‡РёРµ Р°РєС†РёР·С‹', 'AM', '5.2');
INSERT INTO customsfeesclassifier VALUES (238, '4510', 'РђРєС†РёР· РЅР° СЌС‚РёР»РѕРІС‹Р№ СЃРїРёСЂС‚', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (239, '4520', 'РђРєС†РёР· РЅР° СЃРїРёСЂС‚РѕСЃРѕРґРµСЂР¶Р°С‰СѓСЋ РїСЂРѕРґСѓРєС†РёСЋ', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (240, '4530', 'РђРєС†РёР· РЅР° РІРёРЅР°', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (241, '4540', 'РђРєС†РёР· РЅР° РїРёРІРѕ', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (242, '4550', 'РђРєС†РёР· РЅР° Р·Р°РјРµРЅРёС‚РµР»Рё С‚Р°Р±Р°РєР°', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (243, '4560', 'РђРєС†РёР· РЅР° С‚Р°Р±Р°С‡РЅС‹Рµ РёР·РґРµР»РёСЏ', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (244, '4610', 'РђРєС†РёР· РЅР° Р±РµРЅР·РёРЅ', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (245, '4620', 'РђРєС†РёР· РЅР° РґРёР·РµР»СЊРЅРѕРµ С‚РѕРїР»РёРІРѕ', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (246, '4630', 'РђРєС†РёР· РЅР° СЃРјР°Р·РѕС‡РЅС‹Рµ РјР°С‚РµСЂРёР°Р»С‹', 'AM', '5.3');
INSERT INTO customsfeesclassifier VALUES (254, '1080', 'РџСЂРѕС‡РёРµ С‚Р°РјРѕР¶РµРЅРЅС‹Рµ СЃР±РѕСЂС‹, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ СЂР°Р·РґРµР»Рµ 1', 'KG', '6.1');
INSERT INTO customsfeesclassifier VALUES (255, '3010', 'Р’С‹РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР° РЅР° С‚РѕРІР°СЂС‹, РІ РѕС‚РЅРѕС€РµРЅРёРё РєРѕС‚РѕСЂС‹С… РЅРµ СѓСЃС‚Р°РЅРѕРІР»РµРЅ РѕС‚РґРµР»СЊРЅС‹Р№ РєРѕРґ РІРёРґР° РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹', 'KG', '6.2');
INSERT INTO customsfeesclassifier VALUES (256, '3060', 'Р’С‹РІРѕР·РЅР°СЏ СЃРµР·РѕРЅРЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР°', 'KG', '6.2');
INSERT INTO customsfeesclassifier VALUES (257, '36РҐ0', 'РџСЂРѕС‡РёРµ РІС‹РІРѕР·РЅС‹Рµ С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РїРѕС€Р»РёРЅС‹', 'KG', '6.2');
INSERT INTO customsfeesclassifier VALUES (258, '4010', 'РђРєС†РёР· РЅР° СЌС‚РёР»РѕРІС‹Р№ СЃРїРёСЂС‚', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (259, '4020', 'РђРєС†РёР· РЅР° РІРѕРґРєСѓ Рё Р»РёРєРµСЂРѕ-РІРѕРґРѕС‡РЅС‹Рµ РёР·РґРµР»РёСЏ', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (260, '4030', 'РђРєС†РёР· РЅР° РєСЂРµРїР»РµРЅС‹Рµ РЅР°РїРёС‚РєРё, РєСЂРµРїР»РµРЅС‹Рµ СЃРѕРєРё Рё Р±Р°Р»СЊР·Р°РјС‹', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (261, '4040', 'РђРєС†РёР· РЅР° РІРёРЅР°', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (262, '4050', 'РђРєС†РёР· РЅР° РєРѕРЅСЊСЏРєРё', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (263, '4060', 'РђРєС†РёР· РЅР° РІРёРЅРѕ РёРіСЂРёСЃС‚РѕРµ, РІРєР»СЋС‡Р°СЏ С€Р°РјРїР°РЅСЃРєРѕРµ', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (264, '4070', 'РђРєС†РёР· РЅР° РїРёРІРѕ СЂР°СЃС„Р°СЃРѕРІР°РЅРЅРѕРµ', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (265, '4080', 'РђРєС†РёР· РЅР° РїРёРІРѕ РЅРµС„Р°СЃРѕРІР°РЅРЅРѕРµ', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (266, '4090', 'РђРєС†РёР· РЅР° РІРёРЅРѕРјР°С‚РµСЂРёР°Р»С‹', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (267, '4100', 'РђРєС†РёР· РЅР° С‚Р°Р±Р°С‡РЅС‹Рµ РёР·РґРµР»РёСЏ СЃ С„РёР»СЊС‚СЂРѕРј', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (268, '4110', 'РђРєС†РёР· РЅР° С‚Р°Р±Р°С‡РЅС‹Рµ РёР·РґРµР»РёСЏ Р±РµР· С„РёР»СЊС‚СЂР°', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (269, '4120', 'РђРєС†РёР· РЅР° СЃРёРіР°СЂС‹ Рё СЃРёРіР°СЂРёР»Р»С‹', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (270, '4130', 'РђРєС†РёР· РЅР° РїСЂРѕС‡РёРµ РёР·РґРµР»РёСЏ, СЃРѕРґРµСЂР¶Р°С‰РёРµ С‚Р°Р±Р°Рє, РєСЂРѕРјРµ С‚Р°Р±Р°РєР° С„РµСЂРјРµРЅС‚РёСЂРѕРІР°РЅРЅРѕРіРѕ', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (271, '4140', 'РђРєС†РёР· РЅР° Р±РµРЅР·РёРЅ, Р»РµРіРєРёРµ Рё СЃСЂРµРґРЅРёРµ РґРёСЃС‚РёР»Р»СЏС‚С‹ Рё РїСЂРѕС‡РёРµ Р±РµРЅР·РёРЅС‹', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (272, '4150', 'РђРєС†РёР· РЅР° С‚РѕРїР»РёРІРѕ СЂРµР°РєС‚РёРІРЅРѕРµ', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (273, '4160', 'РђРєС†РёР· РЅР° РґРёР·РµР»СЊРЅРѕРµ С‚РѕРїР»РёРІРѕ', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (274, '4170', 'РђРєС†РёР· РЅР° РјР°Р·СѓС‚', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (275, '4180', 'РђРєС†РёР· РЅР° РјР°СЃР»Р° Рё РіР°Р·РѕРІС‹Р№ РєРѕРЅРґРµРЅСЃР°С‚', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (276, '4190', 'РђРєС†РёР· РЅР° РЅРµС„С‚СЊ СЃС‹СЂСѓСЋ Рё РЅРµС„С‚РµРїСЂРѕРґСѓРєС‚С‹ СЃС‹СЂС‹Рµ, РїРѕР»СѓС‡РµРЅРЅС‹Рµ РёР· Р±РёС‚СѓРјРёРЅРѕР·РЅС‹С… РјР°С‚РµСЂРёР°Р»РѕРІ', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (277, '47РҐ6', 'РџСЂРѕС‡РёРµ Р°РєС†РёР·С‹', 'KG', '6.3');
INSERT INTO customsfeesclassifier VALUES (278, 'РҐРҐРҐ4', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РїР»Р°С‚РµР¶Р°', 'KG', '6.4');
INSERT INTO customsfeesclassifier VALUES (279, 'РҐРҐРҐ5', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РїР»Р°С‚РµР¶Р°', 'KG', '6.4');
INSERT INTO customsfeesclassifier VALUES (280, '9420', 'РЎР±РѕСЂС‹ СЃ РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… Р°РІС‚РѕРїРµСЂРµРІРѕР·С‡РёРєРѕРІ', 'KG', '6.5');
INSERT INTO customsfeesclassifier VALUES (281, '9430', 'РђРґРјРёРЅРёСЃС‚СЂР°С‚РёРІРЅС‹Рµ С€С‚СЂР°С„С‹', 'KG', '6.5');
INSERT INTO customsfeesclassifier VALUES (282, '9440', 'РџРѕСЃС‚СѓРїР»РµРЅРёСЏ РѕС‚ СЂРµР°Р»РёР·Р°С†РёРё РєРѕРЅС„РёСЃРєРѕРІР°РЅРЅРѕРіРѕ РёРјСѓС‰РµСЃС‚РІР°', 'KG', '6.5');
INSERT INTO customsfeesclassifier VALUES (283, '9450', 'РџР»Р°С‚Р° Р·Р° РІС‹РґР°С‡Сѓ Р»РёС†РµРЅР·РёР№', 'KG', '6.5');


--
-- TOC entry 4543 (class 0 OID 18831)
-- Dependencies: 237
-- Data for Name: customsfeesclassifierchapters; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO customsfeesclassifierchapters VALUES (1, '1', 'Р’РёРґС‹ РїР»Р°С‚РµР¶РµР№, РїСЂРёРјРµРЅСЏРµРјС‹С… РЅР° РІСЃРµР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '');
INSERT INTO customsfeesclassifierchapters VALUES (2, '2', 'Р’РёРґС‹ РїР»Р°С‚РµР¶РµР№, СѓРїР»Р°С‚Р° РєРѕС‚РѕСЂС‹С… РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅР° Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Рѕ С‚Р°РјРѕР¶РµРЅРЅРѕРј РґРµР»Рµ РІ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (3, '3', 'Р’РёРґС‹ РїР»Р°С‚РµР¶РµР№, СѓРїР»Р°С‚Р° РєРѕС‚РѕСЂС‹С… РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅР° С‚Р°РјРѕР¶РµРЅРЅС‹Рј Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'BY');
INSERT INTO customsfeesclassifierchapters VALUES (4, '4', 'Р’РёРґС‹ РїР»Р°С‚РµР¶РµР№, СѓРїР»Р°С‚Р° РєРѕС‚РѕСЂС‹С… РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅР° Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ');
INSERT INTO customsfeesclassifierchapters VALUES (5, '5', 'Р’РёРґС‹ РїР»Р°С‚РµР¶РµР№, СѓРїР»Р°С‚Р° РєРѕС‚РѕСЂС‹С… РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅР° Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ', 'AM');
INSERT INTO customsfeesclassifierchapters VALUES (6, '6', 'Р’РёРґС‹ РїР»Р°С‚РµР¶РµР№, СѓРїР»Р°С‚Р° РєРѕС‚РѕСЂС‹С… РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅР° Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё', 'KG');
INSERT INTO customsfeesclassifierchapters VALUES (7, '2.1', 'РўР°РјРѕР¶РµРЅРЅС‹Рµ СЃР±РѕСЂС‹', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (8, '2.2', 'Р�РЅС‹Рµ РїРѕС€Р»РёРЅС‹, РІР·РёРјР°РЅРёРµ РєРѕС‚РѕСЂС‹С… РІРѕР·Р»РѕР¶РµРЅРѕ РЅР° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕСЂРіР°РЅС‹', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (9, '2.3', 'Р’С‹РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР°', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (10, '2.4', 'РђРєС†РёР·С‹', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (11, '2.4.1', 'РђРєС†РёР· РЅР° СЌС‚РёР»РѕРІС‹Р№ СЃРїРёСЂС‚ РёР· РїРёС‰РµРІРѕРіРѕ СЃС‹СЂСЊСЏ (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РґРёСЃС‚РёР»Р»СЏС‚РѕРІ РІРёРЅРЅРѕРіРѕ, РІРёРЅРѕРіСЂР°РґРЅРѕРіРѕ, РїР»РѕРґРѕРІРѕРіРѕ, РєРѕРЅСЊСЏС‡РЅРѕРіРѕ, РєР°Р»СЊРІР°РґРѕСЃРЅРѕРіРѕ, РІРёСЃРєРѕРІРѕРіРѕ)', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (12, '2.4.2', 'РђРєС†РёР· РЅР° РґРёСЃС‚РёР»Р»СЏС‚С‹ РІРёРЅРЅС‹Р№, РІРёРЅРѕРіСЂР°РґРЅС‹Р№, РїР»РѕРґРѕРІС‹Р№, РєРѕРЅСЊСЏС‡РЅС‹Р№, РєР°Р»СЊРІР°РґРѕСЃРЅС‹Р№, РІРёСЃРєРѕРІС‹Р№', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (13, '2.4.3', 'РђРєС†РёР· РЅР° СЌС‚РёР»РѕРІС‹Р№ СЃРїРёСЂС‚ РёР· РЅРµРїРёС‰РµРІРѕРіРѕ СЃС‹СЂСЊСЏ', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (14, '2.4.4', 'РђРєС†РёР· РЅР° СЃРїРёСЂС‚РѕСЃРѕРґРµСЂР¶Р°С‰СѓСЋ РїСЂРѕРґСѓРєС†РёСЋ', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (15, '2.4.5', 'РђРєС†РёР· РЅР° Р°Р»РєРѕРіРѕР»СЊРЅСѓСЋ РїСЂРѕРґСѓРєС†РёСЋ СЃ РѕР±СЉРµРјРЅРѕР№ РґРѕР»РµР№ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р° СЃРІС‹С€Рµ 9 % (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїРёРІР°, РІРёРЅ, С„СЂСѓРєС‚РѕРІС‹С… РІРёРЅ, РёРіСЂРёСЃС‚С‹С… РІРёРЅ (С€Р°РјРїР°РЅСЃРєРёС…), РІРёРЅРЅС‹С… РЅР°РїРёС‚РєРѕРІ, РёР·РіРѕС‚Р°РІР»РёРІР°РµРјС‹С… Р±РµР· РґРѕР±Р°РІР»РµРЅРёСЏ СЂРµРєС‚РёС„РёРєРѕРІР°РЅРЅРѕРіРѕ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р°, РїСЂРѕРёР·РІРµРґРµРЅРЅРѕРіРѕ РёР· РїРёС‰РµРІРѕРіРѕ СЃС‹СЂСЊСЏ, Рё (РёР»Рё) СЃРїРёСЂС‚РѕРІР°РЅРЅС‹С… РІРёРЅРѕРіСЂР°РґРЅРѕРіРѕ РёР»Рё РёРЅРѕРіРѕ С„СЂСѓРєС‚РѕРІРѕРіРѕ СЃСѓСЃР»Р°, Рё (РёР»Рё) РІРёРЅРЅРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°, Рё (РёР»Рё) С„СЂСѓРєС‚РѕРІРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°)', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (16, '2.4.6', 'РђРєС†РёР· РЅР° Р°Р»РєРѕРіРѕР»СЊРЅСѓСЋ РїСЂРѕРґСѓРєС†РёСЋ СЃ РѕР±СЉРµРјРЅРѕР№ РґРѕР»РµР№ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р° РґРѕ 9 % РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїРёРІР°, РЅР°РїРёС‚РєРѕРІ, РёР·РіРѕС‚Р°РІР»РёРІР°РµРјС‹С… РЅР° РѕСЃРЅРѕРІРµ РїРёРІР°, РІРёРЅ, С„СЂСѓРєС‚РѕРІС‹С… РІРёРЅ, РёРіСЂРёСЃС‚С‹С… РІРёРЅ (С€Р°РјРїР°РЅСЃРєРёС…), СЃРёРґСЂР°, РїСѓР°СЂРµ, РјРµРґРѕРІСѓС…Рё, РІРёРЅРЅС‹С… РЅР°РїРёС‚РєРѕРІ, РёР·РіРѕС‚Р°РІР»РёРІР°РµРјС‹С… Р±РµР· РґРѕР±Р°РІР»РµРЅРёСЏ СЂРµРєС‚РёС„РёРєРѕРІР°РЅРЅРѕРіРѕ СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р°, РїСЂРѕРёР·РІРµРґРµРЅРЅРѕРіРѕ РёР· РїРёС‰РµРІРѕРіРѕ СЃС‹СЂСЊСЏ, Рё (РёР»Рё) СЃРїРёСЂС‚РѕРІР°РЅРЅС‹С… РІРёРЅРѕРіСЂР°РґРЅРѕРіРѕ РёР»Рё РёРЅРѕРіРѕ С„СЂСѓРєС‚РѕРІРѕРіРѕ СЃСѓСЃР»Р°, Рё (РёР»Рё) РІРёРЅРЅРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°, Рё (РёР»Рё) С„СЂСѓРєС‚РѕРІРѕРіРѕ РґРёСЃС‚РёР»Р»СЏС‚Р°)', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (17, '2.4.7', 'РђРєС†РёР· РЅР° РІРёРЅР°', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (18, '2.4.8', 'РђРєС†РёР· РЅР° СЃРёРґСЂ, РїСѓР°СЂРµ, РјРµРґРѕРІСѓС…Сѓ', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (19, '2.4.9', 'РђРєС†РёР· РЅР° РїРёРІРѕ', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (20, '2.4.10', 'РђРєС†РёР· РЅР° С‚Р°Р±Р°С‡РЅСѓСЋ РїСЂРѕРґСѓРєС†РёСЋ', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (21, '2.4.11', 'РђРєС†РёР· РЅР° Р°РІС‚РѕРјРѕР±РёР»Рё Р»РµРіРєРѕРІС‹Рµ Рё РјРѕС‚РѕС†РёРєР»С‹', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (22, '2.4.12', 'РђРєС†РёР· РЅР° Р±РµРЅР·РёРЅ Р°РІС‚РѕРјРѕР±РёР»СЊРЅС‹Р№', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (23, '2.4.13', 'РђРєС†РёР· РЅР° РґРёР·РµР»СЊРЅРѕРµ С‚РѕРїР»РёРІРѕ', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (24, '2.4.14', 'РђРєС†РёР· РЅР° РјРѕС‚РѕСЂРЅС‹Рµ РјР°СЃР»Р° РґР»СЏ РґРёР·РµР»СЊРЅС‹С… Рё (РёР»Рё) РєР°СЂР±СЋСЂР°С‚РѕСЂРЅС‹С… (РёРЅР¶РµРєС‚РѕСЂРЅС‹С…) РґРІРёРіР°С‚РµР»РµР№', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (25, '2.4.15', 'РђРєС†РёР· РЅР° РїСЂСЏРјРѕРіРѕРЅРЅС‹Р№ Р±РµРЅР·РёРЅ', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (26, '2.4.17', 'РђРєС†РёР· РЅР° СЃСЂРµРґРЅРёРµ РґРёСЃС‚РёР»Р»СЏС‚С‹', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (27, '2.4.18', 'РђРєС†РёР· РЅР° СЌР»РµРєС‚СЂРѕРЅРЅС‹Рµ СЃРёСЃС‚РµРјС‹ РґРѕСЃС‚Р°РІРєРё РЅРёРєРѕС‚РёРЅР°', '');
INSERT INTO customsfeesclassifierchapters VALUES (28, '2.4.19', 'РђРєС†РёР· РЅР° Р¶РёРґРєРѕСЃС‚Рё РґР»СЏ СЌР»РµРєС‚СЂРѕРЅРЅС‹С… СЃРёСЃС‚РµРј РґРѕСЃС‚Р°РІРєРё РЅРёРєРѕС‚РёРЅР°', '');
INSERT INTO customsfeesclassifierchapters VALUES (29, '2.4.20', 'РђРєС†РёР· РЅР° С‚Р°Р±Р°Рє (С‚Р°Р±Р°С‡РЅС‹Рµ РёР·РґРµР»РёСЏ), РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Р№ РґР»СЏ РїРѕС‚СЂРµР±Р»РµРЅРёСЏ РїСѓС‚РµРј РЅР°РіСЂРµРІР°РЅРёСЏ', '');
INSERT INTO customsfeesclassifierchapters VALUES (30, '2.5', 'РџСЂРѕС†РµРЅС‚С‹', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (31, '2.5.1', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РѕС‚СЃСЂРѕС‡РєРё С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РїР»Р°С‚РµР¶Р°', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (32, '2.5.2', 'РџСЂРѕС†РµРЅС‚С‹ Р·Р° РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ СЂР°СЃСЃСЂРѕС‡РєРё С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РїР»Р°С‚РµР¶Р°', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (33, '2.6', 'РЎСЂРµРґСЃС‚РІР° Рё С€С‚СЂР°С„С‹', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (34, '2.7', 'Р�РЅС‹Рµ РІРёРґС‹ РїР»Р°С‚РµР¶РµР№, РІР·РёРјР°РЅРёРµ РєРѕС‚РѕСЂС‹С… РІРѕР·Р»РѕР¶РµРЅРѕ РЅР° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕСЂРіР°РЅС‹', 'RU');
INSERT INTO customsfeesclassifierchapters VALUES (35, '3.1', 'РўР°РјРѕР¶РµРЅРЅС‹Рµ СЃР±РѕСЂС‹', 'BY');
INSERT INTO customsfeesclassifierchapters VALUES (36, '3.2', 'Р�РЅС‹Рµ РїРѕС€Р»РёРЅС‹, РІР·РёРјР°РЅРёРµ РєРѕС‚РѕСЂС‹С… РІРѕР·Р»РѕР¶РµРЅРѕ РЅР° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕСЂРіР°РЅС‹', 'BY');
INSERT INTO customsfeesclassifierchapters VALUES (37, '3.3', 'Р’С‹РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР°', 'BY');
INSERT INTO customsfeesclassifierchapters VALUES (38, '3.4', 'РђРєС†РёР·С‹, РІР·РёРјР°РµРјС‹Рµ РїСЂРё РІРІРѕР·Рµ С‚РѕРІР°СЂРѕРІ РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'BY');
INSERT INTO customsfeesclassifierchapters VALUES (39, '3.5', 'РџСЂРѕС†РµРЅС‚С‹', 'BY');
INSERT INTO customsfeesclassifierchapters VALUES (40, '3.6', 'Р�РЅС‹Рµ РІРёРґС‹ РїР»Р°С‚РµР¶РµР№, РІР·РёРјР°РЅРёРµ РєРѕС‚РѕСЂС‹С… РІРѕР·Р»РѕР¶РµРЅРѕ РЅР° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕСЂРіР°РЅС‹', 'BY');
INSERT INTO customsfeesclassifierchapters VALUES (41, '4.1', 'РўР°РјРѕР¶РµРЅРЅС‹Рµ СЃР±РѕСЂС‹', 'KZ');
INSERT INTO customsfeesclassifierchapters VALUES (42, '4.2', 'Р’С‹РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР°', 'KZ');
INSERT INTO customsfeesclassifierchapters VALUES (43, '4.3', 'РђРєС†РёР·С‹', 'KZ');
INSERT INTO customsfeesclassifierchapters VALUES (44, '4.4', 'РќР°Р»РѕРі РЅР° РґРѕР±Р°РІР»РµРЅРЅСѓСЋ СЃС‚РѕРёРјРѕСЃС‚СЊ', 'KZ');
INSERT INTO customsfeesclassifierchapters VALUES (45, '4.4.1', 'РџСЂРѕС†РµРЅС‚С‹', '');
INSERT INTO customsfeesclassifierchapters VALUES (46, '4.5', 'Р�РЅС‹Рµ РІРёРґС‹ РїР»Р°С‚РµР¶РµР№, РІР·РёРјР°РЅРёРµ РєРѕС‚РѕСЂС‹С… РІРѕР·Р»РѕР¶РµРЅРѕ РЅР° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕСЂРіР°РЅС‹', 'KZ');
INSERT INTO customsfeesclassifierchapters VALUES (47, '5.1', 'РўР°РјРѕР¶РµРЅРЅС‹Рµ СЃР±РѕСЂС‹', 'AM');
INSERT INTO customsfeesclassifierchapters VALUES (48, '5.2', 'Р’С‹РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР°', 'AM');
INSERT INTO customsfeesclassifierchapters VALUES (49, '5.3', 'РђРєС†РёР·С‹', 'AM');
INSERT INTO customsfeesclassifierchapters VALUES (50, '5.4', 'Р�РЅС‹Рµ РІРёРґС‹ РїР»Р°С‚РµР¶РµР№, РІР·РёРјР°РЅРёРµ РєРѕС‚РѕСЂС‹С… РІРѕР·Р»РѕР¶РµРЅРѕ РЅР° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕСЂРіР°РЅС‹', 'AM');
INSERT INTO customsfeesclassifierchapters VALUES (51, '6.1', 'РўР°РјРѕР¶РµРЅРЅС‹Рµ СЃР±РѕСЂС‹', 'KG');
INSERT INTO customsfeesclassifierchapters VALUES (52, '6.2', 'Р’С‹РІРѕР·РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР°', 'KG');
INSERT INTO customsfeesclassifierchapters VALUES (53, '6.3', 'РђРєС†РёР·С‹', 'KG');
INSERT INTO customsfeesclassifierchapters VALUES (54, '6.4', 'РџСЂРѕС†РµРЅС‚С‹', 'KG');
INSERT INTO customsfeesclassifierchapters VALUES (55, '6.5', 'Р�РЅС‹Рµ РІРёРґС‹ РїР»Р°С‚РµР¶РµР№, РІР·РёРјР°РЅРёРµ РєРѕС‚РѕСЂС‹С… РІРѕР·Р»РѕР¶РµРЅРѕ РЅР° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕСЂРіР°РЅС‹', 'KG');


--
-- TOC entry 4545 (class 0 OID 18839)
-- Dependencies: 239
-- Data for Name: customsfeesfeaturesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO customsfeesfeaturesclassifier VALUES (1, 'Р—Рќ', 'РЈРїР»Р°С‚Р° РЅР°Р»РѕРіР° РЅР° РґРѕР±Р°РІР»РµРЅРЅСѓСЋ СЃС‚РѕРёРјРѕСЃС‚СЊ РјРµС‚РѕРґРѕРј Р·Р°С‡РµС‚Р° (РґР»СЏ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ)', 'KZ');
INSERT INTO customsfeesfeaturesclassifier VALUES (2, 'РўР ', 'РЈРїР»Р°С‚Р° С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РїРѕ РІСЂРµРјРµРЅРЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РґРµРєР»Р°СЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… С‚СЂСѓР±РѕРїСЂРѕРІРѕРґРЅС‹Рј С‚СЂР°РЅСЃРїРѕСЂС‚РѕРј (РґР»СЏ Р РѕСЃСЃРёР№СЃРєРѕРј Р¤РµРґРµСЂР°С†РёРё)', 'RU');
INSERT INTO customsfeesfeaturesclassifier VALUES (3, 'Р�РЈ', 'РЈРїР»Р°С‚Р° РїР»Р°С‚РµР¶Р° РґРѕ РІС‹РїСѓСЃРєР°, Р° С‚Р°РєР¶Рµ РґРѕ РёСЃС‚РµС‡РµРЅРёСЏ СЃСЂРѕРєР°, СѓРєР°Р·Р°РЅРЅРѕРіРѕ РІ РїРѕРґРїСѓРЅРєС‚Рµ 2 РїСѓРЅРєС‚Р° 1 СЃС‚Р°С‚СЊРё 197 РўРљ, РІ СЃР»СѓС‡Р°Рµ РІС‹РїСѓСЃРєР° С‚РѕРІР°СЂРѕРІ РґРѕ РїРѕРґР°С‡Рё С‚Р°РјРѕР¶РµРЅРЅРѕР№ РґРµРєР»Р°СЂР°С†РёРё', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');
INSERT INTO customsfeesfeaturesclassifier VALUES (4, 'Р’РЈ', 'РџР»Р°С‚РµР¶ СѓРїР»Р°С‡РµРЅ (РІР·С‹СЃРєР°РЅ) РїРѕСЃР»Рµ РІС‹РїСѓСЃРєР° С‚РѕРІР°СЂРѕРІ РІ РїРѕР»РЅРѕРј СЂР°Р·РјРµСЂРµ РёСЃС‡РёСЃР»РµРЅРЅРѕР№ СЃСѓРјРјС‹', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');
INSERT INTO customsfeesfeaturesclassifier VALUES (5, 'РћРџ', 'РћС‚СЃСЂРѕС‡РєР° СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РёР·РјРµРЅРµРЅРёРµ СЃСЂРѕРєР° СѓРїР»Р°С‚С‹ РЅР°Р»РѕРіРѕРІ РёР»Рё С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ СЃ РµРґРёРЅРѕРІСЂРµРјРµРЅРЅС‹Рј РїРѕРіР°С€РµРЅРёРµРј СЃСѓРјРјС‹ РїР»Р°С‚РµР¶Р°', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');
INSERT INTO customsfeesfeaturesclassifier VALUES (6, 'Р Рџ', 'Р Р°СЃСЃСЂРѕС‡РєР° СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РёР·РјРµРЅРµРЅРёРµ СЃСЂРѕРєР° СѓРїР»Р°С‚С‹ РЅР°Р»РѕРіРѕРІ РёР»Рё С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ СЃ РїРѕСЌС‚Р°РїРЅС‹Рј РїРѕРіР°С€РµРЅРёРµРј СЃСѓРјРјС‹ РїР»Р°С‚РµР¶Р°', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');
INSERT INTO customsfeesfeaturesclassifier VALUES (7, 'РЈРќ', 'РЈСЃР»РѕРІРЅРѕРµ РёСЃС‡РёСЃР»РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ Рё С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ, РѕСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ РєРѕС‚РѕСЂС‹С… РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРѕ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё Рё Р°РєС‚Р°РјРё, СЃРѕСЃС‚Р°РІР»СЏСЋС‰РёРјРё РїСЂР°РІРѕ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, Рё Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІ вЂ“ С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');
INSERT INTO customsfeesfeaturesclassifier VALUES (8, 'РЈР ', 'РЈСЃР»РѕРІРЅРѕРµ РёСЃС‡РёСЃР»РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ Рё С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ РёСЃС…РѕРґСЏ РёР· СЃРѕРґРµСЂР¶Р°РЅРёСЏ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїСЂРѕС†РµРґСѓСЂС‹, СѓСЃР»РѕРІРёСЏРјРё РєРѕС‚РѕСЂРѕР№ РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРѕ РѕСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ Рё С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');
INSERT INTO customsfeesfeaturesclassifier VALUES (9, 'РЈРњ', 'РџР»Р°С‚РµР¶ РЅРµ СѓРїР»Р°С‡РёРІР°РµС‚СЃСЏ РёР»Рё СѓРїР»Р°С‡РёРІР°РµС‚СЃСЏ РІ СЂР°Р·РјРµСЂРµ, РјРµРЅСЊС€РµРј РёСЃС‡РёСЃР»РµРЅРЅРѕР№ СЃСѓРјРјС‹', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');
INSERT INTO customsfeesfeaturesclassifier VALUES (10, 'Р’Р’', 'РџР»Р°С‚РµР¶ СѓРїР»Р°С‡РёРІР°РµС‚СЃСЏ (РІР·С‹СЃРєР°РЅ) РїСЂРё С‡Р°СЃС‚РёС‡РЅРѕРј СѓСЃР»РѕРІРЅРѕРј РѕСЃРІРѕР±РѕР¶РґРµРЅРёРё РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїСЂРѕС†РµРґСѓСЂРѕР№ РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° (РґРѕРїСѓСЃРєР°)', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');
INSERT INTO customsfeesfeaturesclassifier VALUES (11, 'РћР§', 'РћС‚СЃСЂРѕС‡РєР° С‡Р°СЃС‚Рё СЃСѓРјРјС‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РёР·РјРµРЅРµРЅРёРµ СЃСЂРѕРєР° СѓРїР»Р°С‚С‹ С‡Р°СЃС‚Рё СЃСѓРјРјС‹ РЅР°Р»РѕРіРѕРІ РёР»Рё С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ СЃ РµРґРёРЅРѕРІСЂРµРјРµРЅРЅС‹Рј РїРѕРіР°С€РµРЅРёРµРј СЃСѓРјРјС‹ РїР»Р°С‚РµР¶Р°', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');


--
-- TOC entry 4547 (class 0 OID 18847)
-- Dependencies: 241
-- Data for Name: customsfeesguaranteemethodsclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4549 (class 0 OID 18855)
-- Dependencies: 243
-- Data for Name: customsfeesmethodsclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO customsfeesmethodsclassifier VALUES (1, 'Р‘Рќ', 'Р’ Р±РµР·РЅР°Р»РёС‡РЅРѕР№ С„РѕСЂРјРµ РЅР° СЃРѕРѕС‚РІРµС‚СЃС‚РІСѓСЋС‰РёР№ РєРѕРґ Р±СЋРґР¶РµС‚РЅРѕР№ РєР»Р°СЃСЃРёС„РёРєР°С†РёРё', '');
INSERT INTO customsfeesmethodsclassifier VALUES (2, 'Р‘Р—', 'Р—Р°С‡РµС‚РѕРј РїР»Р°С‚РµР¶Р°, СѓРїР»Р°С‡РµРЅРЅРѕРіРѕ РІ Р±РµР·РЅР°Р»РёС‡РЅРѕР№ С„РѕСЂРјРµ РЅР° РёРЅРѕР№ РєРѕРґ Р±СЋРґР¶РµС‚РЅРѕР№ РєР»Р°СЃСЃРёС„РёРєР°С†РёРё', '');
INSERT INTO customsfeesmethodsclassifier VALUES (3, 'РќР ', 'Р’ РЅР°Р»РёС‡РЅРѕР№ С„РѕСЂРјРµ', '');
INSERT INTO customsfeesmethodsclassifier VALUES (4, 'РќР—', 'Р—Р°С‡РµС‚РѕРј РїР»Р°С‚РµР¶Р°, СѓРїР»Р°С‡РµРЅРЅРѕРіРѕ РІ РЅР°Р»РёС‡РЅРѕР№ С„РѕСЂРјРµ РЅР° РёРЅРѕР№ РєРѕРґ Р±СЋРґР¶РµС‚РЅРѕР№ РєР»Р°СЃСЃРёС„РёРєР°С†РёРё', 'KZ');
INSERT INTO customsfeesmethodsclassifier VALUES (5, 'РџРљ', 'РЎ РїСЂРёРјРµРЅРµРЅРёРµРј РјРёРєСЂРѕРїСЂРѕС†РµСЃСЃРѕСЂРЅС‹С… РїР»Р°СЃС‚РёРєРѕРІС‹С… РєР°СЂС‚', '');
INSERT INTO customsfeesmethodsclassifier VALUES (6, 'РљР—', 'Р—Р°С‡РµС‚РѕРј РїР»Р°С‚РµР¶Р°, СѓРїР»Р°С‡РµРЅРЅРѕРіРѕ СЃ РїСЂРёРјРµРЅРµРЅРёРµРј РјРёРєСЂРѕРїСЂРѕС†РµСЃСЃРѕСЂРЅС‹С… РїР»Р°СЃС‚РёРєРѕРІС‹С… РєР°СЂС‚ РЅР° РёРЅРѕР№ РєРѕРґ Р±СЋРґР¶РµС‚РЅРѕР№ РєР»Р°СЃСЃРёС„РёРєР°С†РёРё', 'KZ');
INSERT INTO customsfeesmethodsclassifier VALUES (7, 'РџРЎ', 'РџСЂРµРґРїСЂРёСЏС‚РёСЋ СЃРІСЏР·Рё', '');
INSERT INTO customsfeesmethodsclassifier VALUES (8, 'РЎР—', 'Р—Р°С‡РµС‚РѕРј РїР»Р°С‚РµР¶Р°, СѓРїР»Р°С‡РµРЅРЅРѕРіРѕ РїСЂРµРґРїСЂРёСЏС‚РёСЋ СЃРІСЏР·Рё РЅР° РёРЅРѕР№ РєРѕРґ Р±СЋРґР¶РµС‚РЅРѕР№ РєР»Р°СЃСЃРёС„РёРєР°С†РёРё', 'KZ');
INSERT INTO customsfeesmethodsclassifier VALUES (9, 'РћР‘', 'РџСѓС‚РµРј РѕР±СЂР°С‰РµРЅРёСЏ РІ С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РїР»Р°С‚РµР¶Рё СЃСѓРјРј, РІРЅРµСЃРµРЅРЅС‹С… РЅР° СЃС‡РµС‚Р°, РЅРµ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ Р·Р°С‡РёСЃР»РµРЅРёСЏ СЃСѓРјРј С‚Р°РјРѕР¶РµРЅРЅС‹С… РїР»Р°С‚РµР¶РµР№', 'KZ');
INSERT INTO customsfeesmethodsclassifier VALUES (10, 'Р’Р—', 'Р’Р·Р°РёРјРѕР·Р°С‡РµС‚РѕРј С‚Р°РјРѕР¶РµРЅРЅС‹С… РїР»Р°С‚РµР¶РµР№, РїРѕРґР»РµР¶Р°С‰РёС… СѓРїР»Р°С‚Рµ РїР»Р°С‚РµР»СЊС‰РёРєРѕРј, Рё С„РёРЅР°РЅСЃРѕРІС‹С… РѕР±СЏР·Р°С‚РµР»СЊСЃС‚РІ РѕСЂРіР°РЅРѕРІ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕРіРѕ СѓРїСЂР°РІР»РµРЅРёСЏ, РёСЃРїРѕР»РЅРёС‚РµР»СЊРЅС‹С… Рё СЂР°СЃРїРѕСЂСЏРґРёС‚РµР»СЊРЅС‹С… РѕСЂРіР°РЅРѕРІ РіРѕСЃСѓРґР°СЂСЃС‚РІР°-С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РїРµСЂРµРґ СЌС‚РёРј РїР»Р°С‚РµР»СЊС‰РёРєРѕРј', 'BY');


--
-- TOC entry 4551 (class 0 OID 18863)
-- Dependencies: 245
-- Data for Name: customstransitmovementofgoodsclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO customstransitmovementofgoodsclassifier VALUES (1, 'РўР ', 'РџРµСЂРµРІРѕР·РєР° РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… С‚РѕРІР°СЂРѕРІ РѕС‚ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РІ РјРµСЃС‚Рµ РїСЂРёР±С‹С‚РёСЏ РґРѕ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РІ РјРµСЃС‚Рµ СѓР±С‹С‚РёСЏ', NULL, NULL);
INSERT INTO customstransitmovementofgoodsclassifier VALUES (2, 'Р�Рњ', 'РџРµСЂРµРІРѕР·РєР° РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… С‚РѕРІР°СЂРѕРІ РѕС‚ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РІ РјРµСЃС‚Рµ РїСЂРёР±С‹С‚РёСЏ РґРѕ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР°', NULL, NULL);
INSERT INTO customstransitmovementofgoodsclassifier VALUES (3, 'Р­Рљ', 'РџРµСЂРµРІРѕР·РєР° РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… С‚РѕРІР°СЂРѕРІ, Р° С‚Р°РєР¶Рµ С‚РѕРІР°СЂРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РѕС‚ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РґРѕ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РІ РјРµСЃС‚Рµ СѓР±С‹С‚РёСЏ', NULL, NULL);
INSERT INTO customstransitmovementofgoodsclassifier VALUES (4, 'Р’Рў', 'РџРµСЂРµРІРѕР·РєР° РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… С‚РѕРІР°СЂРѕРІ РѕС‚ РѕРґРЅРѕРіРѕ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РґРѕ РґСЂСѓРіРѕРіРѕ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР°', NULL, NULL);
INSERT INTO customstransitmovementofgoodsclassifier VALUES (5, 'РўРЎ', 'РџРµСЂРµРІРѕР·РєР° С‚РѕРІР°СЂРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РѕС‚ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РјРµСЃС‚Р° СѓР±С‹С‚РёСЏ РґРѕ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РјРµСЃС‚Р° РїСЂРёР±С‹С‚РёСЏ С‡РµСЂРµР· С‚РµСЂСЂРёС‚РѕСЂРёСЋ РіРѕСЃСѓРґР°СЂСЃС‚РІР°, РЅРµ СЏРІР»СЏСЋС‰РµРіРѕСЃСЏ С‡Р»РµРЅРѕРј Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', NULL, NULL);


--
-- TOC entry 4553 (class 0 OID 18871)
-- Dependencies: 247
-- Data for Name: customsvalueconclusionclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO customsvalueconclusionclassifier VALUES (1, '0', 'РўР°РјРѕР¶РµРЅРЅР°СЏ СЃС‚РѕРёРјРѕСЃС‚СЊ РїСЂРёРЅСЏС‚Р°', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');
INSERT INTO customsvalueconclusionclassifier VALUES (2, '1', 'РўР°РјРѕР¶РµРЅРЅР°СЏ СЃС‚РѕРёРјРѕСЃС‚СЊ СЃРєРѕСЂСЂРµРєС‚РёСЂРѕРІР°РЅР°', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');
INSERT INTO customsvalueconclusionclassifier VALUES (3, '2', 'РџСЂРѕРІРѕРґРёС‚СЃСЏ РґРѕРїРѕР»РЅРёС‚РµР»СЊРЅР°СЏ РїСЂРѕРІРµСЂРєР°', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');


--
-- TOC entry 4555 (class 0 OID 18879)
-- Dependencies: 249
-- Data for Name: dataformatclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4557 (class 0 OID 18887)
-- Dependencies: 251
-- Data for Name: declarationofgoodsfeaturesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO declarationofgoodsfeaturesclassifier VALUES (1, 'РџРџР”', 'РџРµСЂРёРѕРґРёС‡РµСЃРєРѕРµ С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ (РїРѕР»РЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РґРµРєР»Р°СЂР°С†РёСЏ) (РґР»СЏ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ)', 'KZ');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (2, 'Р”Р’Р”', 'Р”РѕРїРѕР»РЅРёС‚РµР»СЊРЅС‹Рµ РѕСЃРѕР±РµРЅРЅРѕСЃС‚Рё С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёСЏ С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… С‚СЂСѓР±РѕРїСЂРѕРІРѕРґРЅС‹Рј С‚СЂР°РЅСЃРїРѕСЂС‚РѕРј Рё РїРѕ Р»РёРЅРёСЏРј СЌР»РµРєС‚СЂРѕРїРµСЂРµРґР°С‡Рё (РґРѕРїРѕР»РЅРёС‚РµР»СЊРЅР°СЏ РІСЂРµРјРµРЅРЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РґРµРєР»Р°СЂР°С†РёСЏ) (РґР»СЏ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё)', 'RU');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (3, 'Р—РћРЎ', 'РўР°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ С‚РѕРІР°СЂРѕРІ СЃ СѓРєР°Р·Р°РЅРёРµРј РѕСЂРёРµРЅС‚РёСЂРѕРІРѕС‡РЅС‹С… СЃРІРµРґРµРЅРёР№ (РґР»СЏ Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ)', 'BY');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (4, 'Р—РўРЎ', 'РўР°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ С‚РѕРІР°СЂРѕРІ СЃ СѓРєР°Р·Р°РЅРёРµРј С‚РѕС‡РЅС‹С… СЃРІРµРґРµРЅРёР№ (РґР»СЏ Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ)', 'BY');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (5, 'РћРўР›', 'РћСЃРѕР±РµРЅРЅРѕСЃС‚Рё С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёСЏ С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… С‚СЂСѓР±РѕРїСЂРѕРІРѕРґРЅС‹Рј С‚СЂР°РЅСЃРїРѕСЂС‚РѕРј РёР»Рё РїРѕ Р»РёРЅРёСЏРј СЌР»РµРєС‚СЂРѕРїРµСЂРµРґР°С‡Рё (РґР»СЏ Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ)', 'BY');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (6, 'РќРўР”', 'РќРµРїРѕР»РЅРѕРµ С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ (РґР»СЏ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ Рё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё)', 'KZ, RU');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (7, 'РџР”Рў', 'РџРµСЂРёРѕРґРёС‡РµСЃРєРѕРµ С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ (РїРµСЂРёРѕРґРёС‡РµСЃРєР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ РґРµРєР»Р°СЂР°С†РёСЏ, РїРµСЂРёРѕРґРёС‡РµСЃРєР°СЏ РґРµРєР»Р°СЂР°С†РёСЏ РЅР° С‚РѕРІР°СЂС‹) (РґР»СЏ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ Рё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё СЃРѕРѕС‚РІРµС‚СЃС‚РІРµРЅРЅРѕ)', 'KZ, RU');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (8, 'Р’РўР”', 'Р’СЂРµРјРµРЅРЅРѕРµ (РІСЂРµРјРµРЅРЅРѕРµ РїРµСЂРёРѕРґРёС‡РµСЃРєРѕРµ) С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ (РІСЂРµРјРµРЅРЅР°СЏ РґРµРєР»Р°СЂР°С†РёСЏ РЅР° С‚РѕРІР°СЂС‹) (РґР»СЏ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ Рё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё)', 'KZ, RU');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (9, 'РџР’Р”', 'Р’СЂРµРјРµРЅРЅРѕРµ (РІСЂРµРјРµРЅРЅРѕРµ РїРµСЂРёРѕРґРёС‡РµСЃРєРѕРµ) С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ (РїРѕР»РЅР°СЏ РґРµРєР»Р°СЂР°С†РёСЏ РЅР° С‚РѕРІР°СЂС‹) (РґР»СЏ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ Рё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё)', 'KZ, RU');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (10, 'РћРљРў', 'РћСЃРѕР±РµРЅРЅРѕСЃС‚Рё С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёСЏ С‚РѕРІР°СЂРѕРІ РІ РЅРµСЃРѕР±СЂР°РЅРЅРѕРј РёР»Рё СЂР°Р·РѕР±СЂР°РЅРЅРѕРј РІРёРґРµ, РІ С‚РѕРј С‡РёСЃР»Рµ РЅРµРєРѕРјРїР»РµРєС‚РЅРѕРј РёР»Рё РЅРµР·Р°РІРµСЂС€РµРЅРЅРѕРј РІРёРґРµ, РІ С‚РµС‡РµРЅРёРµ СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅРѕРіРѕ РїРµСЂРёРѕРґР° РІСЂРµРјРµРЅРё (РґРµРєР»Р°СЂР°С†РёСЏ РЅР° С‚РѕРІР°СЂС‹ (Р·Р°СЏРІР»РµРЅРёРµ) РЅР° РѕС‚РґРµР»СЊРЅС‹Рµ РєРѕРјРїРѕРЅРµРЅС‚С‹)', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (11, 'Р—РџРљ', 'РћСЃРѕР±РµРЅРЅРѕСЃС‚Рё С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёСЏ С‚РѕРІР°СЂРѕРІ РІ РЅРµСЃРѕР±СЂР°РЅРЅРѕРј РёР»Рё СЂР°Р·РѕР±СЂР°РЅРЅРѕРј РІРёРґРµ, РІ С‚РѕРј С‡РёСЃР»Рµ РЅРµРєРѕРјРїР»РµРєС‚РЅРѕРј РёР»Рё РЅРµР·Р°РІРµСЂС€РµРЅРЅРѕРј РІРёРґРµ, РІ С‚РµС‡РµРЅРёРµ СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅРѕРіРѕ РїРµСЂРёРѕРґР° РІСЂРµРјРµРЅРё (РїРѕР»РЅР°СЏ РґРµРєР»Р°СЂР°С†РёСЏ РЅР° С‚РѕРІР°СЂС‹ РЅР° РІСЃРµ РєРѕРјРїРѕРЅРµРЅС‚С‹)', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (12, 'Р’Р”Рў', 'РћСЃРѕР±РµРЅРЅРѕСЃС‚Рё С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёСЏ С‚РѕРІР°СЂРѕРІ РїСЂРё РёС… РІС‹РїСѓСЃРєРµ РґРѕ РїРѕРґР°С‡Рё С‚Р°РјРѕР¶РµРЅРЅРѕР№ РґРµРєР»Р°СЂР°С†РёРё', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (13, 'РќР’Рў', 'РћСЃРѕР±РµРЅРЅРѕСЃС‚Рё С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёСЏ С‚РѕРІР°СЂРѕРІ, РЅРµР·Р°РєРѕРЅРЅРѕ РІРІРµР·РµРЅРЅС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');
INSERT INTO declarationofgoodsfeaturesclassifier VALUES (14, 'РџРўР”', 'РџСЂРµРґРІР°СЂРёС‚РµР»СЊРЅРѕРµ С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');


--
-- TOC entry 4559 (class 0 OID 18895)
-- Dependencies: 253
-- Data for Name: definingcustomsvaluemethodsclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO definingcustomsvaluemethodsclassifier VALUES (1, '0', 'РћС‚Р»РѕР¶РµРЅРЅРѕРµ РѕРїСЂРµРґРµР»РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅРѕР№ СЃС‚РѕРёРјРѕСЃС‚Рё', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');
INSERT INTO definingcustomsvaluemethodsclassifier VALUES (2, '1', 'РњРµС‚РѕРґ РїРѕ СЃС‚РѕРёРјРѕСЃС‚Рё СЃРґРµР»РєРё СЃ РІРІРѕР·РёРјС‹РјРё С‚РѕРІР°СЂР°РјРё', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');
INSERT INTO definingcustomsvaluemethodsclassifier VALUES (3, '2', 'РњРµС‚РѕРґ РїРѕ СЃС‚РѕРёРјРѕСЃС‚Рё СЃРґРµР»РєРё СЃ РёРґРµРЅС‚РёС‡РЅС‹РјРё С‚РѕРІР°СЂР°РјРё', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');
INSERT INTO definingcustomsvaluemethodsclassifier VALUES (4, '3', 'РњРµС‚РѕРґ РїРѕ СЃС‚РѕРёРјРѕСЃС‚Рё СЃРґРµР»РєРё СЃ РѕРґРЅРѕСЂРѕРґРЅС‹РјРё С‚РѕРІР°СЂР°РјРё', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');
INSERT INTO definingcustomsvaluemethodsclassifier VALUES (5, '4', 'РњРµС‚РѕРґ РІС‹С‡РёС‚Р°РЅРёСЏ', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');
INSERT INTO definingcustomsvaluemethodsclassifier VALUES (6, '5', 'РњРµС‚РѕРґ СЃР»РѕР¶РµРЅРёСЏ', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');
INSERT INTO definingcustomsvaluemethodsclassifier VALUES (7, '6', 'Р РµР·РµСЂРІРЅС‹Р№ РјРµС‚РѕРґ', 'РћРіСЂР°РЅРёС‡РµРЅРёР№ РЅРµС‚');


--
-- TOC entry 4561 (class 0 OID 18903)
-- Dependencies: 255
-- Data for Name: docstatstatusclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4563 (class 0 OID 18911)
-- Dependencies: 257
-- Data for Name: documentprocessingresultcodeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO documentprocessingresultcodeclassifier VALUES (1, '01', 'СЃРІРµРґРµРЅРёСЏ РѕС‚СЃСѓС‚СЃС‚РІСѓСЋС‚');
INSERT INTO documentprocessingresultcodeclassifier VALUES (2, '02', 'СЃРІРµРґРµРЅРёСЏ РїРѕР»СѓС‡РµРЅС‹');
INSERT INTO documentprocessingresultcodeclassifier VALUES (3, '03', 'СЃРІРµРґРµРЅРёСЏ РґРѕР±Р°РІР»РµРЅС‹');
INSERT INTO documentprocessingresultcodeclassifier VALUES (4, '04', 'СЃРІРµРґРµРЅРёСЏ РёР·РјРµРЅРµРЅС‹');
INSERT INTO documentprocessingresultcodeclassifier VALUES (5, '05', 'СЃРІРµРґРµРЅРёСЏ СѓРґР°Р»РµРЅС‹');
INSERT INTO documentprocessingresultcodeclassifier VALUES (6, '06', 'СЃРІРµРґРµРЅРёСЏ РѕР±СЂР°Р±РѕС‚Р°РЅС‹');
INSERT INTO documentprocessingresultcodeclassifier VALUES (7, '07', 'СЃРІРµРґРµРЅРёСЏ РЅРµ РјРѕРіСѓС‚ Р±С‹С‚СЊ РѕР±СЂР°Р±РѕС‚Р°РЅС‹');
INSERT INTO documentprocessingresultcodeclassifier VALUES (8, '08', 'СЃРІРµРґРµРЅРёСЏ РЅРµ РјРѕРіСѓС‚ Р±С‹С‚СЊ РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅС‹');


--
-- TOC entry 4565 (class 0 OID 18919)
-- Dependencies: 259
-- Data for Name: electronicvehicleandchassiscertificatestatusclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO electronicvehicleandchassiscertificatestatusclassifier VALUES (1, '00', 'Р·Р°РїРѕР»РЅРµРЅРёРµ СЌР»РµРєС‚СЂРѕРЅРЅРѕРіРѕ РїР°СЃРїРѕСЂС‚Р° РЅРµ Р·Р°РІРµСЂС€РµРЅРѕ', 'РЅРµР·Р°РІРµСЂС€РµРЅРЅС‹Р№', NULL, NULL);
INSERT INTO electronicvehicleandchassiscertificatestatusclassifier VALUES (2, '05', 'СЌР»РµРєС‚СЂРѕРЅРЅС‹Р№ РїР°СЃРїРѕСЂС‚ РґРµР№СЃС‚РІСѓРµС‚', 'РґРµР№СЃС‚РІСѓСЋС‰РёР№', NULL, NULL);
INSERT INTO electronicvehicleandchassiscertificatestatusclassifier VALUES (3, '10', 'СЌР»РµРєС‚СЂРѕРЅРЅС‹Р№ РїР°СЃРїРѕСЂС‚ Р°РЅРЅСѓР»РёСЂРѕРІР°РЅ', 'Р°РЅРЅСѓР»РёСЂРѕРІР°РЅРЅС‹Р№', NULL, NULL);
INSERT INTO electronicvehicleandchassiscertificatestatusclassifier VALUES (4, '15', 'СЌР»РµРєС‚СЂРѕРЅРЅС‹Р№ РїР°СЃРїРѕСЂС‚ РїРѕРіР°С€РµРЅ', 'РїРѕРіР°С€РµРЅРЅС‹Р№', NULL, NULL);
INSERT INTO electronicvehicleandchassiscertificatestatusclassifier VALUES (5, '90', 'СЌР»РµРєС‚СЂРѕРЅРЅС‹Р№ РїР°СЃРїРѕСЂС‚ СѓС‚РёР»РёР·РёСЂРѕРІР°РЅРЅРѕРіРѕ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° (С€Р°СЃСЃРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°, СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ РёР»Рё РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё)', 'СѓС‚РёР»РёР·РёСЂРѕРІР°РЅРЅС‹Р№', NULL, NULL);


--
-- TOC entry 4567 (class 0 OID 18927)
-- Dependencies: 261
-- Data for Name: exemptionsfromcustomsdutychapters; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO exemptionsfromcustomsdutychapters VALUES (1, '1', 'Р›СЊРіРѕС‚С‹, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ РїСЂР°РІРѕРј Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (2, '1.1', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹', '');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (3, '2.4', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ РїСЂРё РІРІРѕР·Рµ С‚РѕРІР°СЂРѕРІ РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (4, '2.4.1', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊРЅС‹РјРё Р°РєС‚Р°РјРё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (5, '2.4.3', 'Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Р°С… 1.3. Рё 2.4, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (6, '1.2', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·РѕРІ, РІР·РёРјР°РµРјС‹С… РїСЂРё РІРІРѕР·Рµ РїРѕРґР°РєС†РёР·РЅС‹С… С‚РѕРІР°СЂРѕРІ РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (7, '1.3', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РЅР°Р»РѕРіР° РЅР° РґРѕР±Р°РІР»РµРЅРЅСѓСЋ СЃС‚РѕРёРјРѕСЃС‚СЊ (РґР°Р»РµРµ - РќР”РЎ), РІР·РёРјР°РµРјРѕРіРѕ РїСЂРё РІРІРѕР·Рµ С‚РѕРІР°СЂРѕРІ РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (8, '2', 'Р›СЊРіРѕС‚С‹ РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (9, '2.1', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (10, '6.4.2', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё', 'KG');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (11, '6.4.3', 'Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Р°С… 1.3 Рё 6.4, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ', 'KG');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (12, '3.4.3', 'Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ СЂР°Р·РґРµР»Р°С… 1.3. Рё 3.4., Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (13, '4', 'Р›СЊРіРѕС‚С‹, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Рѕ С‚Р°РјРѕР¶РµРЅРЅРѕРј РґРµР»Рµ РІ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (14, '4.1', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (15, '4.1.1', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊРЅС‹РјРё Р°РєС‚Р°РјРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (16, '2.2', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (17, '2.2.1', 'Р›СЊРіРѕС‚С‹, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊРЅС‹РјРё Р°РєС‚Р°РјРё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (18, '2.2.2', 'Р›СЊРіРѕС‚С‹, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (19, '2.2.3', 'Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Рµ 2.2, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (20, '2.3', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·РѕРІ, РІР·РёРјР°РµРјС‹С… РїСЂРё РІРІРѕР·Рµ РїРѕРґР°РєС†РёР·РЅС‹С… С‚РѕРІР°СЂРѕРІ РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (21, '2.3.1', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·РѕРІ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊРЅС‹РјРё Р°РєС‚Р°РјРё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (22, '2.3.2', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·РѕРІ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (23, '2.3.3', 'Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Р°С… 1.2. Рё 2.3, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·РѕРІ РІ РѕС‚РЅРѕС€РµРЅРёРё РїРѕРґР°РєС†РёР·РЅС‹С… С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (24, '2.4.2', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё', 'BY');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (25, '3', 'Р›СЊРіРѕС‚С‹, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (26, '3.1', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (27, '3.1.1', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊРЅС‹РјРё Р°РєС‚Р°РјРё Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (28, '3.1.2', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (29, '3.1.3', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРѕРјРµС‰Р°РµРјС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ РѕС‚РєР°Р·Р° РІ РїРѕР»СЊР·Сѓ РіРѕСЃСѓРґР°СЂСЃС‚РІР°', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (30, '3.1.4', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ РЅРµ РёСЃРїРѕР»СЊР·СѓРµС‚СЃСЏ (РЅРµ Р·Р°РїСЂР°С€РёРІР°РµС‚СЃСЏ)', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (31, '3.1.5', 'Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Рµ 3.1, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (32, '3.2', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (33, '3.2.1', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, РїРѕРґРїРёСЃР°РЅРЅС‹РјРё РґРѕ 1 СЏРЅРІР°СЂСЏ 2010 Рі.', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (34, '6.2', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё', 'KG');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (35, '6.2.1', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё', 'KG');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (71, '6.4', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ РїСЂРё РІРІРѕР·Рµ С‚РѕРІР°СЂРѕРІ РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'KG');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (72, '6.4.1', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊРЅС‹РјРё Р°РєС‚Р°РјРё РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё', 'KG');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (36, '3.2.2', 'РўР°СЂРёС„РЅР°СЏ РїСЂРµС„РµСЂРµРЅС†РёСЏ РІ РІРёРґРµ РѕСЃРІРѕР±РѕР¶РґРµРЅРёСЏ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїСЂРѕРёСЃС…РѕРґСЏС‰РёС… Рё РІРІРѕР·РёРјС‹С… РёР· РіРѕСЃСѓРґР°СЂСЃС‚РІ, РѕР±СЂР°Р·СѓСЋС‰РёС… РІРјРµСЃС‚Рµ СЃ Р РµСЃРїСѓР±Р»РёРєРѕР№ РљР°Р·Р°С…СЃС‚Р°РЅ Р·РѕРЅСѓ СЃРІРѕР±РѕРґРЅРѕР№ С‚РѕСЂРіРѕРІР»Рё, Р° С‚Р°РєР¶Рµ С‚РѕРІР°СЂРѕРІ, РїСЂРѕРёСЃС…РѕРґСЏС‰РёС… Рё РІС‹РІРѕР·РёРјС‹С… РёР· Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ РІ РіРѕСЃСѓРґР°СЂСЃС‚РІР°, РѕР±СЂР°Р·СѓСЋС‰РёРµ РІРјРµСЃС‚Рµ СЃ Р РµСЃРїСѓР±Р»РёРєРѕР№ РљР°Р·Р°С…СЃС‚Р°РЅ Р·РѕРЅСѓ СЃРІРѕР±РѕРґРЅРѕР№ С‚РѕСЂРіРѕРІР»Рё', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (37, '3.2.3', 'Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Рµ 3.2, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (38, '3.3', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·Р°', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (39, '3.3.1', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·Р°, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊРЅС‹РјРё Р°РєС‚Р°РјРё Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (40, '3.3.2', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·Р°, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (41, '3.3.3', 'Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Р°С… 1.2 Рё 3.3, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё РїРѕРґР°РєС†РёР·РЅС‹С… С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (42, '3.4', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (43, '3.4.1', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (44, '3.4.2', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊРЅС‹РјРё Р°РєС‚Р°РјРё Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (45, '4.1.2', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (46, '4.1.3', 'Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Рµ 4.1., Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ Рё РІС‹РІРѕР·РёРјС‹С… РёР· Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (47, '4.2', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (48, '4.2.1', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊРЅС‹РјРё Р°РєС‚Р°РјРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (49, '4.2.2', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (50, '4.2.3', 'Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Рµ 4.2, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (51, '4.3', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·Р°, РІР·РёРјР°РµРјРѕРіРѕ РїСЂРё РІРІРѕР·Рµ РїРѕРґР°РєС†РёР·РЅС‹С… С‚РѕРІР°СЂРѕРІ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (52, '4.3.1', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·Р°, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊРЅС‹РјРё Р°РєС‚Р°РјРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (53, '4.3.2', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·Р°, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (54, '4.3.3', 'Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Р°С… 1.2. Рё 4.3., Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё РїРѕРґР°РєС†РёР·РЅС‹С… С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (55, '4.4', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (56, '4.4.1', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊРЅС‹РјРё Р°РєС‚Р°РјРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (57, '4.4.2', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (58, '4.4.3', 'Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Р°С… 1.3. Рё 4.4., Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'RU');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (59, '5', 'Р›СЊРіРѕС‚С‹, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ', 'AM');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (60, '5.1', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ', 'AM');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (61, '5.2', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ', 'AM');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (62, '5.2.1', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ', 'AM');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (63, '5.2.2', 'Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїСѓРЅРєС‚Рµ 5.2.1 РїРѕРґСЂР°Р·РґРµР»Р° 5.2, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ', 'AM');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (64, '5.3', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·РѕРІ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ', 'AM');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (65, '5.4', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ', 'AM');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (66, '5.5', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ СЌРєРѕР»РѕРіРёС‡РµСЃРєРѕРіРѕ СЃР±РѕСЂР°, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ', 'AM');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (67, '6', 'Р›СЊРіРѕС‚С‹, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё', 'KG');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (68, '6.1', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё', 'KG');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (69, '6.2.2', 'Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїСѓРЅРєС‚Рµ 6.2.1 РїРѕРґСЂР°Р·РґРµР»Р° 6.2, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ', 'KG');
INSERT INTO exemptionsfromcustomsdutychapters VALUES (70, '6.3', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·РѕРІ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё', 'KG');


--
-- TOC entry 4569 (class 0 OID 18935)
-- Dependencies: 263
-- Data for Name: exemptionsfromcustomsdutyclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (1, 'Р’Р‘', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё РІР°Р»СЋС‚С‹ РіРѕСЃСѓРґР°СЂСЃС‚РІ вЂ“ С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІР°Р»СЋС‚С‹ С‚СЂРµС‚СЊРёС… СЃС‚СЂР°РЅ (РєСЂРѕРјРµ РёСЃРїРѕР»СЊР·СѓРµРјРѕР№ РґР»СЏ РЅСѓРјРёР·РјР°С‚РёС‡РµСЃРєРёС… С†РµР»РµР№), Р° С‚Р°РєР¶Рµ С†РµРЅРЅС‹С… Р±СѓРјР°Рі РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІ вЂ“ С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (2, 'Р‘Р“', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РІ РєР°С‡РµСЃС‚РІРµ РіСѓРјР°РЅРёС‚Р°СЂРЅРѕР№ РїРѕРјРѕС‰Рё Рё (РёР»Рё) РІ С†РµР»СЏС… Р»РёРєРІРёРґР°С†РёРё РїРѕСЃР»РµРґСЃС‚РІРёР№ Р°РІР°СЂРёР№ Рё РєР°С‚Р°СЃС‚СЂРѕС„, СЃС‚РёС…РёР№РЅС‹С… Р±РµРґСЃС‚РІРёР№', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (3, 'Р‘Рў', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РєСЂРѕРјРµ РїРѕРґР°РєС†РёР·РЅС‹С… (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј Р»РµРіРєРѕРІС‹С… Р°РІС‚РѕРјРѕР±РёР»РµР№, СЃРїРµС†РёР°Р»СЊРЅРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РјРµРґРёС†РёРЅСЃРєРёС… С†РµР»РµР№), РІРІРѕР·РёРјС‹С… РїРѕ Р»РёРЅРёРё С‚СЂРµС‚СЊРёС… СЃС‚СЂР°РЅ, РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№, РїСЂР°РІРёС‚РµР»СЊСЃС‚РІ РІ Р±Р»Р°РіРѕС‚РІРѕСЂРёС‚РµР»СЊРЅС‹С… С†РµР»СЏС… Рё (РёР»Рё) РїСЂРёР·РЅР°РІР°РµРјС‹С… РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІ вЂ“ С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РІ РєР°С‡РµСЃС‚РІРµ Р±РµР·РІРѕР·РјРµР·РґРЅРѕР№ РїРѕРјРѕС‰Рё (СЃРѕРґРµР№СЃС‚РІРёСЏ), РІ С‚РѕРј С‡РёСЃР»Рµ С‚РµС…РЅРёС‡РµСЃРєРѕР№ РїРѕРјРѕС‰Рё (СЃРѕРґРµР№СЃС‚РІРёСЏ)', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (4, 'РљРњ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ, РІРєР»СЋС‡Р°СЏ РјР°С€РёРЅС‹, РјРµС…Р°РЅРёР·РјС‹, РјР°С‚РµСЂРёР°Р»С‹, РІС…РѕРґСЏС‰РёРµ РІ РєРѕРјРїР»РµРєС‚ РїРѕСЃС‚Р°РІРєРё СЃРѕРѕС‚РІРµС‚СЃС‚РІСѓСЋС‰РµРіРѕ РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ, Рё РєРѕРјРїР»РµРєС‚СѓСЋС‰РёС… РёР·РґРµР»РёР№ (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїРѕРґР°РєС†РёР·РЅС‹С…), РІРІРѕР·РёРјС‹С… РІ СЃС‡РµС‚ РєСЂРµРґРёС‚РѕРІ, РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРЅС‹С… РёРЅРѕСЃС‚СЂР°РЅРЅС‹РјРё РіРѕСЃСѓРґР°СЂСЃС‚РІР°РјРё Рё РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё С„РёРЅР°РЅСЃРѕРІС‹РјРё РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё РіРѕСЃСѓРґР°СЂСЃС‚РІ вЂ“ С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (5, 'РџРЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё РјРѕС‚РѕСЂРЅС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ С‚РѕРІР°СЂРЅС‹С… РїРѕР·РёС†РёР№ 8701, 8702, 8703, 8704, 8705 РўРќ Р’Р­Р” Р•РђР­РЎ, РїСЂРѕРёР·РІРµРґРµРЅРЅС‹С… С…РѕР·СЏР№СЃС‚РІСѓСЋС‰РёРјРё СЃСѓР±СЉРµРєС‚Р°РјРё РіРѕСЃСѓРґР°СЂСЃС‚РІ вЂ“ С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° СЃ РїСЂРёРјРµРЅРµРЅРёРµРј РїРѕРЅСЏС‚РёСЏ РїСЂРѕРјС‹С€Р»РµРЅРЅР°СЏ СЃР±РѕСЂРєР°, РїСЂРё РІС‹РїРѕР»РЅРµРЅРёРё СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅС‹С… СѓСЃР»РѕРІРёР№ Рё РєСЂРёС‚РµСЂРёРµРІ', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (6, 'РЈРљ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ РєР°С‡РµСЃС‚РІРµ РІРєР»Р°РґР° РёРЅРѕСЃС‚СЂР°РЅРЅРѕРіРѕ СѓС‡СЂРµРґРёС‚РµР»СЏ РІ СѓСЃС‚Р°РІРЅС‹Р№ (СЃРєР»Р°РґРѕС‡РЅС‹Р№) РєР°РїРёС‚Р°Р» РѕСЂРіР°РЅРёР·Р°С†РёР№ РІ РїСЂРµРґРµР»Р°С… СЃСЂРѕРєРѕРІ, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅС‹С… СѓС‡СЂРµРґРёС‚РµР»СЊРЅС‹РјРё РґРѕРєСѓРјРµРЅС‚Р°РјРё РґР»СЏ С„РѕСЂРјРёСЂРѕРІР°РЅРёСЏ СЌС‚РѕРіРѕ РєР°РїРёС‚Р°Р»Р° (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РѕСЃРІРѕР±РѕР¶РґРµРЅРёСЏ, РѕРїСЂРµРґРµР»РµРЅРЅРѕРіРѕ РєРѕРґРѕРј РЈР¤)', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (7, 'РЈР¤', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РёР· С‚СЂРµС‚СЊРёС… СЃС‚СЂР°РЅ РІ РєР°С‡РµСЃС‚РІРµ РІРєР»Р°РґР° СѓС‡СЂРµРґРёС‚РµР»СЏ РІ СѓСЃС‚Р°РІРЅС‹Р№ (СЃРєР»Р°РґРѕС‡РЅС‹Р№) РєР°РїРёС‚Р°Р» (С„РѕРЅРґ) РѕСЂРіР°РЅРёР·Р°С†РёР№ РІ РїСЂРµРґРµР»Р°С… СЃСЂРѕРєРѕРІ, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅС‹С… СѓС‡СЂРµРґРёС‚РµР»СЊРЅС‹РјРё РґРѕРєСѓРјРµРЅС‚Р°РјРё РґР»СЏ С„РѕСЂРјРёСЂРѕРІР°РЅРёСЏ СЌС‚РѕРіРѕ РєР°РїРёС‚Р°Р»Р° (С„РѕРЅРґР°) РІ РїРѕСЂСЏРґРєРµ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅРѕРј Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (8, 'Р РЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё РїР»Р°РІСѓС‡РёС… СЃСѓРґРѕРІ, СЂРµРіРёСЃС‚СЂРёСЂСѓРµРјС‹С… РІ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… СЂРµРµСЃС‚СЂР°С… СЃСѓРґРѕРІ, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅС‹С… Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (9, 'РџРњ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё РїСЂРѕРґСѓРєС†РёРё РјРѕСЂСЃРєРѕРіРѕ РїСЂРѕРјС‹СЃР»Р° СЃСѓРґРѕРІ РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, Р° С‚Р°РєР¶Рµ СЃСѓРґРѕРІ, Р°СЂРµРЅРґРѕРІР°РЅРЅС‹С… (Р·Р°С„СЂР°С…С‚РѕРІР°РЅРЅС‹С…) СЋСЂРёРґРёС‡РµСЃРєРёРјРё Р»РёС†Р°РјРё Рё С„РёР·РёС‡РµСЃРєРёРјРё Р»РёС†Р°РјРё РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (10, 'РЎРњ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё СЃСѓРґРѕРІ СЂС‹Р±РѕР»РѕРІРЅС‹С…, РїР»Р°РІСѓС‡РёС… Р±Р°Р· Рё РїСЂРѕС‡РёС… СЃСѓРґРѕРІ РґР»СЏ РїРµСЂРµСЂР°Р±РѕС‚РєРё Рё РєРѕРЅСЃРµСЂРІРёСЂРѕРІР°РЅРёСЏ СЂС‹Р±РЅС‹С… РїСЂРѕРґСѓРєС‚РѕРІ, РјРѕСЂСЃРєРёС… (РєРѕРґ 8902 00 100 0 РўРќ Р’Р­Р” Р•РђР­РЎ), Р·Р°СЂРµРіРёСЃС‚СЂРёСЂРѕРІР°РЅРЅС‹С… РІ СЂРµРµСЃС‚СЂРµ СЃСѓРґРѕРІ РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РїР»Р°РІР°СЋС‰РёС… РїРѕРґ С„Р»Р°РіРѕРј РѕРґРЅРѕРіРѕ РёР· РіРѕСЃСѓРґР°СЂСЃС‚РІ вЂ“ С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° Рё РїРѕРјРµС‰Р°РµРјС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ РІС‹РїСѓСЃРєР° РґР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ РїРѕС‚СЂРµР±Р»РµРЅРёСЏ РґРѕ 1 СЏРЅРІР°СЂСЏ 2018 Рі. РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (11, 'Р§РҐ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїРѕРґР°РєС†РёР·РЅС‹С…, РІРІРѕР·РёРјС‹С… РІ С†РµР»СЏС… РїСЂРѕРІРµРґРµРЅРёСЏ Р§РµРјРїРёРѕРЅР°С‚Р° РјРёСЂР° РїРѕ С…РѕРєРєРµСЋ РІ 2014 РіРѕРґСѓ РІ РіРѕСЂРѕРґРµ РњРёРЅСЃРєРµ', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (12, 'РљРў', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё Р±Р»Р°РЅРєРѕРІ РєРЅРёР¶РµРє РњР”Рџ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… РјРµР¶РґСѓ РђСЃСЃРѕС†РёР°С†РёРµР№ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… Р°РІС‚РѕРјРѕР±РёР»СЊРЅС‹С… РїРµСЂРµРІРѕР·С‡РёРєРѕРІ Рё РњРµР¶РґСѓРЅР°СЂРѕРґРЅС‹Рј СЃРѕСЋР·РѕРј Р°РІС‚РѕРјРѕР±РёР»СЊРЅРѕРіРѕ С‚СЂР°РЅСЃРїРѕСЂС‚Р°', 'BY', '2.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (235, 'Р‘Р’', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РЎР Рџ РЎР°С…Р°Р»РёРЅ-2', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (13, 'РќРЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° С‚РѕРІР°СЂРѕРІ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј С‚РѕРІР°СЂРѕРІ РґР»СЏ Р»РёС‡РЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ, РІ Р°РґСЂРµСЃ РѕРґРЅРѕРіРѕ РїРѕР»СѓС‡Р°С‚РµР»СЏ РѕС‚ РѕРґРЅРѕРіРѕ РѕС‚РїСЂР°РІРёС‚РµР»СЏ РїРѕ РѕРґРЅРѕРјСѓ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРјСѓ (РїРµСЂРµРІРѕР·РѕС‡РЅРѕРјСѓ) РґРѕРєСѓРјРµРЅС‚Сѓ, РѕР±С‰Р°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ СЃС‚РѕРёРјРѕСЃС‚СЊ РєРѕС‚РѕСЂС‹С… РЅРµ РїСЂРµРІС‹С€Р°РµС‚ СЃСѓРјРјС‹, СЌРєРІРёРІР°Р»РµРЅС‚РЅРѕР№ РґРІСѓРјСЃС‚Р°Рј РµРІСЂРѕ', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (14, 'Р�Рџ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РµС…РЅРѕР»РѕРіРёС‡РµСЃРєРѕРіРѕ РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ, РєРѕРјРїР»РµРєС‚СѓСЋС‰РёС… Рё Р·Р°РїР°СЃРЅС‹С… С‡Р°СЃС‚РµР№ Рє РЅРµРјСѓ, СЃС‹СЂСЊСЏ Рё РјР°С‚РµСЂРёР°Р»РѕРІ, РІРІРѕР·РёРјС‹С… РґР»СЏ РёСЃРєР»СЋС‡РёС‚РµР»СЊРЅРѕРіРѕ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёРё РіРѕСЃСѓРґР°СЂСЃС‚РІР°-С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РІ СЂР°РјРєР°С… СЂРµР°Р»РёР·Р°С†РёРё РёРЅРІРµСЃС‚РёС†РёРѕРЅРЅРѕРіРѕ РїСЂРѕРµРєС‚Р°, СЃРѕРѕС‚РІРµС‚СЃС‚РІСѓСЋС‰РµРіРѕ РїСЂРёРѕСЂРёС‚РµС‚РЅРѕРјСѓ РІРёРґСѓ РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё (СЃРµРєС‚РѕСЂСѓ СЌРєРѕРЅРѕРјРёРєРё) РіРѕСЃСѓРґР°СЂСЃС‚РІР°-С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј СЌС‚РѕРіРѕ РіРѕСЃСѓРґР°СЂСЃС‚РІР°-С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (15, 'Р”Рњ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё Р·РѕР»РѕС‚Р° РІ СЃР»РёС‚РєР°С… СЃ СЃРѕРґРµСЂР¶Р°РЅРёРµРј С…РёРјРёС‡РµСЃРєРё С‡РёСЃС‚РѕРіРѕ Р·РѕР»РѕС‚Р° РЅРµ РЅРёР¶Рµ 995 РґРѕР»РµР№ РЅР° 1000 РґРѕР»РµР№ Р»РёРіР°С‚СѓСЂРЅРѕР№ РјР°СЃСЃС‹ (РїСЂРѕР±Р° РЅРµ РјРµРЅРµРµ 99,5%), СЃРµСЂРµР±СЂР° РІ СЃР»РёС‚РєР°С… СЃ СЃРѕРґРµСЂР¶Р°РЅРёРµРј С…РёРјРёС‡РµСЃРєРё С‡РёСЃС‚РѕРіРѕ СЃРµСЂРµР±СЂР° РЅРµ РЅРёР¶Рµ 999 РґРѕР»РµР№ РЅР° 1000 РґРѕР»РµР№ Р»РёРіР°С‚СѓСЂРЅРѕР№ РјР°СЃСЃС‹ (РїСЂРѕР±Р° РЅРµ РјРµРЅРµРµ 99,9%) Рё РїР»Р°С‚РёРЅС‹ РІ СЃР»РёС‚РєР°С… СЃ СЃРѕРґРµСЂР¶Р°РЅРёРµРј С…РёРјРёС‡РµСЃРєРё С‡РёСЃС‚РѕРіРѕ РјРµС‚Р°Р»Р»Р° РЅРµ РЅРёР¶Рµ 999,5 РґРѕР»Рё РЅР° 1000 РґРѕР»РµР№ Р»РёРіР°С‚СѓСЂРЅРѕР№ РјР°СЃСЃС‹ (РїСЂРѕР±Р° РЅРµ РјРµРЅРµРµ 99,95%), РІРІРѕР·РёРјС‹С… С†РµРЅС‚СЂР°Р»СЊРЅС‹РјРё (РЅР°С†РёРѕРЅР°Р»СЊРЅС‹РјРё) Р±Р°РЅРєР°РјРё РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (16, 'Р’РЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё РіСЂР°Р¶РґР°РЅСЃРєРёС… РїР°СЃСЃР°Р¶РёСЂСЃРєРёС… СЃР°РјРѕР»РµС‚РѕРІ РїРѕРґСЃСѓР±РїРѕР·РёС†РёР№ 8802 40 003 5 Рё 8802 40 003 6 РўРќ Р’Р­Р” Р•РђР­РЎ, РІРІРѕР·РёРјС‹С… РїРѕ 31 РґРµРєР°Р±СЂСЏ 2023 Рі. РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РІ С†РµР»СЏС… РёС… РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ РІ РїСЂРµРґРµР»Р°С… С‚РµСЂСЂРёС‚РѕСЂРёРё РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІ РєРѕС‚РѕСЂРѕРµ РѕСЃСѓС‰РµСЃС‚РІР»СЏРµС‚СЃСЏ РІРІРѕР· СЌС‚РѕРіРѕ С‚РѕРІР°СЂР°, Р° С‚Р°РєР¶Рµ РґР»СЏ РїРµСЂРµРІРѕР·РѕРє РјРµР¶РґСѓ С‚РµСЂСЂРёС‚РѕСЂРёСЏРјРё РіРѕСЃСѓРґР°СЂСЃС‚РІ вЂ“ С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° Рё (РёР»Рё) РґР»СЏ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РїРµСЂРµРІРѕР·РѕРє', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (17, 'РЎР ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё РіСЂР°Р¶РґР°РЅСЃРєРёС… РїР°СЃСЃР°Р¶РёСЂСЃРєРёС… СЃР°РјРѕР»РµС‚РѕРІ РїРѕРґСЃСѓР±РїРѕР·РёС†РёР№ 8802 40 003 5 Рё 8802 40 003 6 РўРќ Р’Р­Р” Р•РђР­РЎ, СѓРєР°Р·Р°РЅРЅС‹С… РІ РїРѕР·РёС†РёРё СЃ РєРѕРґРѕРј Р’РЎ, РІРІРµР·РµРЅРЅС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° СЃ РїСЂРёРјРµРЅРµРЅРёРµРј Р»СЊРіРѕС‚С‹ Рё РІРІРѕР·РёРјС‹С… РІ С‚РµС‡РµРЅРёРµ СЃСЂРѕРєР° РёС… СЌРєСЃРїР»СѓР°С‚Р°С†РёРё РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РїРѕСЃР»Рµ РёС… СЂРµРјРѕРЅС‚Р° РёР»Рё С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ РѕР±СЃР»СѓР¶РёРІР°РЅРёСЏ Р·Р° РїСЂРµРґРµР»Р°РјРё С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (18, 'РђР—', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё Р°РІРёР°С†РёРѕРЅРЅС‹С… РґРІРёРіР°С‚РµР»РµР№, Р·Р°РїР°СЃРЅС‹С… С‡Р°СЃС‚РµР№ Рё РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ, РЅРµРѕР±С…РѕРґРёРјС‹С… РґР»СЏ СЂРµРјРѕРЅС‚Р° Рё (РёР»Рё) С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ РѕР±СЃР»СѓР¶РёРІР°РЅРёСЏ РіСЂР°Р¶РґР°РЅСЃРєРёС… РїР°СЃСЃР°Р¶РёСЂСЃРєРёС… СЃР°РјРѕР»РµС‚РѕРІ Рё (РёР»Рё) Р°РІРёР°С†РёРѕРЅРЅС‹С… РґРІРёРіР°С‚РµР»РµР№ Рє РЅРёРј', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (19, 'Р Рџ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ РёР»Рё РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё РїРµСЂРµРјРµС‰Р°РµРјС‹С… РїСЂРёРїР°СЃРѕРІ', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (20, 'РџРџ', 'РўР°РјРѕР¶РµРЅРЅР°СЏ РїРѕС€Р»РёРЅР° РЅРµ СѓРїР»Р°С‡РёРІР°РµС‚СЃСЏ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРѕРјРµС‰Р°РµРјС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ, РёРЅСѓСЋ, С‡РµРј С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РїСЂРѕС†РµРґСѓСЂС‹ РІС‹РїСѓСЃРєР° РґР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ РїРѕС‚СЂРµР±Р»РµРЅРёСЏ, РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° (РґРѕРїСѓСЃРєР°), СЌРєСЃРїРѕСЂС‚Р°', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (21, 'Р Р’', 'РџРѕР»РЅРѕРµ СѓСЃР»РѕРІРЅРѕРµ РѕСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµС‡РµРЅСЊ РєРѕС‚РѕСЂС‹С… РѕРїСЂРµРґРµР»РµРЅ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё, РІС…РѕРґСЏС‰РёРјРё РІ РїСЂР°РІРѕ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, Рё (РёР»Рё) СЂРµС€РµРЅРёСЏРјРё РљРѕРјРёСЃСЃРёРё РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° (Р•РІСЂР°Р·РёР№СЃРєРѕР№ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ РєРѕРјРёСЃСЃРёРё), РїРѕРјРµС‰Р°РµРјС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° (РґРѕРїСѓСЃРєР°)', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (22, 'Р“Р“', 'РўР°СЂРёС„РЅР°СЏ РїСЂРµС„РµСЂРµРЅС†РёСЏ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїСЂРѕРёСЃС…РѕРґСЏС‰РёС… РёР· СЂР°Р·РІРёРІР°СЋС‰РёС…СЃСЏ СЃС‚СЂР°РЅ', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (23, 'РќРќ', 'РўР°СЂРёС„РЅР°СЏ РїСЂРµС„РµСЂРµРЅС†РёСЏ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїСЂРѕРёСЃС…РѕРґСЏС‰РёС… РёР· РЅР°РёРјРµРЅРµРµ СЂР°Р·РІРёС‚С‹С… СЃС‚СЂР°РЅ', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (24, 'Р’Рў', 'РўР°СЂРёС„РЅР°СЏ РїСЂРµС„РµСЂРµРЅС†РёСЏ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїСЂРѕРёСЃС…РѕРґСЏС‰РёС… РёР· РЎРѕС†РёР°Р»РёСЃС‚РёС‡РµСЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё Р’СЊРµС‚РЅР°Рј Рё РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РЎРѕРіР»Р°С€РµРЅРёРµРј Рѕ СЃРІРѕР±РѕРґРЅРѕР№ С‚РѕСЂРіРѕРІР»Рµ РјРµР¶РґСѓ Р•РІСЂР°Р·РёР№СЃРєРёРј СЌРєРѕРЅРѕРјРёС‡РµСЃРєРёРј СЃРѕСЋР·РѕРј Рё РµРіРѕ РіРѕСЃСѓРґР°СЂСЃС‚РІР°РјРё-С‡Р»РµРЅР°РјРё, СЃ РѕРґРЅРѕР№ СЃС‚РѕСЂРѕРЅС‹, Рё РЎРѕС†РёР°Р»РёСЃС‚РёС‡РµСЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРѕР№ Р’СЊРµС‚РЅР°Рј, СЃ РґСЂСѓРіРѕР№ СЃС‚РѕСЂРѕРЅС‹, РѕС‚ 29 РјР°СЏ 2015 РіРѕРґР°', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (25, 'РџР�', '5.2.2. Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїСѓРЅРєС‚Рµ 5.2.1 РїРѕРґСЂР°Р·РґРµР»Р° 5.2, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ', 'AM', '5.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (314, 'РќР�', 'Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Р°С… 1.3 Рё 5.4, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ', 'AM', '5.4');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (26, 'РњР”', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° Рё РІС‹РІРѕР·РёРјС‹С… РёР· РЅРµРµ Рё РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РѕС„РёС†РёР°Р»СЊРЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ РґРёРїР»РѕРјР°С‚РёС‡РµСЃРєРёС… РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ, РєРѕРЅСЃСѓР»СЊСЃРєРёС… СѓС‡СЂРµР¶РґРµРЅРёР№, РёРЅС‹С… РѕС„РёС†РёР°Р»СЊРЅС‹С… РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… РіРѕСЃСѓРґР°СЂСЃС‚РІ, СЂР°СЃРїРѕР»РѕР¶РµРЅРЅС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЏС… РіРѕСЃСѓРґР°СЂСЃС‚РІ вЂ“ С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, Р° С‚Р°РєР¶Рµ РґР»СЏ Р»РёС‡РЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ РґРёРїР»РѕРјР°С‚РёС‡РµСЃРєРѕРіРѕ Рё Р°РґРјРёРЅРёСЃС‚СЂР°С‚РёРІРЅРѕ-С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ РїРµСЂСЃРѕРЅР°Р»Р° СЌС‚РёС… РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ, РІРєР»СЋС‡Р°СЏ С‡Р»РµРЅРѕРІ РёС… СЃРµРјРµР№, РїСЂРѕР¶РёРІР°СЋС‰РёС… РІРјРµСЃС‚Рµ СЃ РЅРёРјРё', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (27, 'РћРћ', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РЅРµ Р·Р°РїСЂР°С€РёРІР°СЋС‚СЃСЏ', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (28, 'РђРЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РґР»СЏ С†РµР»РµР№ СЃС‚СЂРѕРёС‚РµР»СЊСЃС‚РІР° РЅР° С‚РµСЂСЂРёС‚РѕСЂРёРё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ Р°С‚РѕРјРЅРѕР№ СЌР»РµРєС‚СЂРѕСЃС‚Р°РЅС†РёРё Рё РµРµ СЌРєСЃРїР»СѓР°С‚Р°С†РёРё РІ С‚РµС‡РµРЅРёРµ РіР°СЂР°РЅС‚РёР№РЅРѕРіРѕ СЃСЂРѕРєР° СЃРѕРіР»Р°СЃРЅРѕ РџРµСЂРµС‡РЅСЋ С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° РґР»СЏ С†РµР»РµР№ СЃС‚СЂРѕРёС‚РµР»СЊСЃС‚РІР° Р°С‚РѕРјРЅРѕР№ СЌР»РµРєС‚СЂРѕСЃС‚Р°РЅС†РёРё Рё РµРµ СЌРєСЃРїР»СѓР°С‚Р°С†РёРё РІ С‚РµС‡РµРЅРёРµ РіР°СЂР°РЅС‚РёР№РЅРѕРіРѕ СЃСЂРѕРєР°, СѓС‚РІРµСЂР¶РґР°РµРјРѕРјСѓ РЎРѕРІРµС‚РѕРј Р•РІСЂР°Р·РёР№СЃРєРѕР№ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ РєРѕРјРёСЃСЃРёРё', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (29, 'Р Р—', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё РЅРµР·Р°СЂРµРіРёСЃС‚СЂРёСЂРѕРІР°РЅРЅС‹С… Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ, РєСЂРѕРІРё С‡РµР»РѕРІРµС‡РµСЃРєРѕР№ Рё РµРµ РєРѕРјРїРѕРЅРµРЅС‚РѕРІ, РѕСЂРіР°РЅРѕРІ Рё (РёР»Рё) С‚РєР°РЅРµР№ С‡РµР»РѕРІРµРєР°, РІ С‚РѕРј С‡РёСЃР»Рµ РіРµРјРѕРїРѕСЌС‚РёС‡РµСЃРєРёС… СЃС‚РІРѕР»РѕРІС‹С… РєР»РµС‚РѕРє Рё (РёР»Рё) РєРѕСЃС‚РЅРѕРіРѕ РјРѕР·РіР°, РІРІРѕР·РёРјС‹С… (РІРІРµР·РµРЅРЅС‹С…) РґР»СЏ РѕРєР°Р·Р°РЅРёСЏ РјРµРґРёС†РёРЅСЃРєРѕР№ РїРѕРјРѕС‰Рё РїРѕ Р¶РёР·РЅРµРЅРЅС‹Рј РїРѕРєР°Р·Р°РЅРёСЏРј РєРѕРЅРєСЂРµС‚РЅРѕРіРѕ РїР°С†РёРµРЅС‚Р° Рё (РёР»Рё) РїСЂРѕРІРµРґРµРЅРёСЏ РЅРµСЂРѕРґСЃС‚РІРµРЅРЅРѕР№ С‚СЂР°РЅСЃРїР»Р°РЅС‚Р°С†РёРё РЅР° РѕСЃРЅРѕРІР°РЅРёРё Р·Р°РєР»СЋС‡РµРЅРёСЏ (СЂР°Р·СЂРµС€РёС‚РµР»СЊРЅРѕРіРѕ РґРѕРєСѓРјРµРЅС‚Р°) Р»РёР±Рѕ Р»РёС†РµРЅР·РёРё, РІС‹РґР°РЅРЅС‹С… СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Рј РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (30, 'РљРЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕРіРѕ СЃРѕС‚СЂСѓРґРЅРёС‡РµСЃС‚РІР° РІ РѕР±Р»Р°СЃС‚Рё РёСЃСЃР»РµРґРѕРІР°РЅРёСЏ Рё РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ РєРѕСЃРјРёС‡РµСЃРєРѕРіРѕ РїСЂРѕСЃС‚СЂР°РЅСЃС‚РІР°, РІ С‚РѕРј С‡РёСЃР»Рµ РѕРєР°Р·Р°РЅРёСЏ СѓСЃР»СѓРі РїРѕ Р·Р°РїСѓСЃРєСѓ РєРѕСЃРјРёС‡РµСЃРєРёС… Р°РїРїР°СЂР°С‚РѕРІ, РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РїРµСЂРµС‡РЅРµРј, СѓС‚РІРµСЂР¶РґР°РµРјС‹Рј Р•РІСЂР°Р·РёР№СЃРєРѕР№ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ РєРѕРјРёСЃСЃРёРµР№', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (31, 'Р“Р’', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё РіСЂР°Р¶РґР°РЅСЃРєРёС… РіСЂСѓР·РѕРІС‹С… СЃР°РјРѕР»РµС‚РѕРІ РїРѕРґСЃСѓР±РїРѕР·РёС†РёРё 8802 40 003 9 РўРќ Р’Р­Р” Р•РђР­РЎ СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ РІР·Р»РµС‚РЅРѕР№ РјР°СЃСЃРѕР№ РЅРµ РјРµРЅРµРµ 60 000 РєРі, РЅРѕ РЅРµ Р±РѕР»РµРµ 80 000 РєРі, РІРІРѕР·РёРјС‹С… РїРѕ 31 РґРµРєР°Р±СЂСЏ 2017В Рі.В РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ РІ Р РµСЃРїСѓР±Р»РёРєСѓ РљР°Р·Р°С…СЃС‚Р°РЅ', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (32, 'РўР’', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚СѓСЂР±РѕРІРёРЅС‚РѕРІС‹С… РіСЂР°Р¶РґР°РЅСЃРєРёС… РїР°СЃСЃР°Р¶РёСЂСЃРєРёС… СЃР°РјРѕР»РµС‚РѕРІ, РєР»Р°СЃСЃРёС„РёС†РёСЂСѓРµРјС‹С… РєРѕРґР°РјРё 8802 30 000 7 Рё 8802 40 001 6 РўРќ Р’Р­Р” Р•РђР­РЎ, СЃ РєРѕР»РёС‡РµСЃС‚РІРѕРј РїР°СЃСЃР°Р¶РёСЂСЃРєРёС… РјРµСЃС‚, СѓРєР°Р·Р°РЅРЅС‹Рј РІ СЃС…РµРјРµ СЂР°Р·РјРµС‰РµРЅРёСЏ РїР°СЃСЃР°Р¶РёСЂРѕРІ (LOPA), РѕРґРѕР±СЂРµРЅРЅРѕР№ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј, РѕС‚РІРµС‚СЃС‚РІРµРЅРЅС‹Рј Р·Р° РїРѕРґРґРµСЂР¶Р°РЅРёРµ Р»РµС‚РЅРѕР№ РіРѕРґРЅРѕСЃС‚Рё РІРѕР·РґСѓС€РЅС‹С… СЃСѓРґРѕРІ, РЅРµ Р±РѕР»РµРµ С‡РµРј РЅР° 90 С‡РµР»РѕРІРµРє, РІРІРѕР·РёРјС‹С… РІ Р РµСЃРїСѓР±Р»РёРєСѓ РљР°Р·Р°С…СЃС‚Р°РЅ СЃ 1 СЏРЅРІР°СЂСЏ 2015 Рі. РїРѕ 31 РґРµРєР°Р±СЂСЏ 2017 Рі. РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (33, 'Р—РЁ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ РѕС‚РЅРѕС€РµРЅРёРё СЃР°С…Р°СЂР°-СЃС‹СЂС†Р° С‚СЂРѕСЃС‚РЅРёРєРѕРІРѕРіРѕ СЃСѓР±РїРѕР·РёС†РёР№ 1701 13 Рё 1701 14 РўРќ Р’Р­Р” Р•РђР­РЎ, РІРІРѕР·РёРјРѕРіРѕ РІ РїРµСЂРёРѕРґ 2010 вЂ“ 2019 РіРѕРґРѕРІ РґР»СЏ РїСЂРѕРјС‹С€Р»РµРЅРЅРѕР№ РїРµСЂРµСЂР°Р±РѕС‚РєРё РЅР° С‚РµСЂСЂРёС‚РѕСЂРёРё Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (34, 'Р’Р›', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё РІР°РЅР°РґРёР№-Р°Р»СЋРјРёРЅРёРµРІРѕР№ Р»РёРіР°С‚СѓСЂС‹, РєР»Р°СЃСЃРёС„РёС†РёСЂСѓРµРјРѕР№ РєРѕРґРѕРј 8112 92 910 0 РўРќ Р’Р­Р” Р•РђР­РЎ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅРѕР№ РґР»СЏ РїСЂРѕРёР·РІРѕРґСЃС‚РІР° С‚РёС‚Р°РЅРѕРІС‹С… СЃР»РёС‚РєРѕРІ, СЃРїР»Р°РІРѕРІ Рё СЃР»СЏР±РѕРІ Рё РІРІРѕР·РёРјРѕР№ РІ Р РµСЃРїСѓР±Р»РёРєСѓ РљР°Р·Р°С…СЃС‚Р°РЅ РІ РїРµСЂРёРѕРґ СЃ 1 СЏРЅРІР°СЂСЏ РїРѕ 31 РґРµРєР°Р±СЂСЏ 2017 Рі. РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ РІ РѕР±СЉРµРјРµ РЅРµ Р±РѕР»РµРµ 400', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (35, 'РћРў', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё РѕРєСЃРёРґРѕРІ С‚РёС‚Р°РЅР°, РєР»Р°СЃСЃРёС„РёС†РёСЂСѓРµРјС‹С… РєРѕРґРѕРј 2823 00 000 0 РўРќ Р’Р­Р” Р•РђР­РЎ, РІРІРѕР·РёРјС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ РІ РїРµСЂРёРѕРґ СЃ 1 СЃРµРЅС‚СЏР±СЂСЏ 2016 Рі. РїРѕ 31 Р°РІРіСѓСЃС‚Р° 2021 Рі. РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ РІ РѕР±СЉРµРјРµ РЅРµ Р±РѕР»РµРµ 40 С‚РѕРЅРЅ РµР¶РµРіРѕРґРЅРѕ Рё РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РїСЂРѕРёР·РІРѕРґСЃС‚РІР° С‚РёС‚Р°РЅРѕРІС‹С… СЃР»РёС‚РєРѕРІ Рё СЃРїР»Р°РІРѕРІ, РёСЃРїРѕР»СЊР·СѓРµРјС‹С… РІ Р°СЌСЂРѕРєРѕСЃРјРёС‡РµСЃРєРѕР№ РѕС‚СЂР°СЃР»Рё', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (36, 'РќРЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РїСЂРё РІРІРѕР·Рµ С‚РѕРІР°СЂРѕРІ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј С‚РѕРІР°СЂРѕРІ РґР»СЏ Р»РёС‡РЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ, РІ Р°РґСЂРµСЃ РѕРґРЅРѕРіРѕ РїРѕР»СѓС‡Р°С‚РµР»СЏ РѕС‚ РѕРґРЅРѕРіРѕ РѕС‚РїСЂР°РІРёС‚РµР»СЏ РїРѕ РѕРґРЅРѕРјСѓ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРјСѓ (РїРµСЂРµРІРѕР·РѕС‡РЅРѕРјСѓ) РґРѕРєСѓРјРµРЅС‚Сѓ, РѕР±С‰Р°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ СЃС‚РѕРёРјРѕСЃС‚СЊ РєРѕС‚РѕСЂС‹С… РЅРµ РїСЂРµРІС‹С€Р°РµС‚ СЃСѓРјРјС‹, СЌРєРІРёРІР°Р»РµРЅС‚РЅРѕР№ РґРІСѓРјСЃС‚Р°Рј РµРІСЂРѕ', '', '1.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (37, 'Р Рџ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РїРµСЂРµРјРµС‰Р°РµРјС‹С… РїСЂРёРїР°СЃРѕРІ', '', '1.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (315, 'Р­РЎ', 'Р›СЊРіРѕС‚Р° РїРѕ СѓРїР»Р°С‚Рµ СЌРєРѕР»РѕРіРёС‡РµСЃРєРѕРіРѕ СЃР±РѕСЂР°', 'AM', '5.5');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (38, 'Р—РЈ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, СЏРІР»СЏСЋС‰РёС…СЃСЏ РїСЂРѕРґСѓРєС†РёРµР№ РІРѕРµРЅРЅРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ, РІРІРѕР· РєРѕС‚РѕСЂС‹С… РѕСЃСѓС‰РµСЃС‚РІР»СЏРµС‚СЃСЏ РІ РїРµСЂРёРѕРґ 2015 вЂ“ 2022 РіРѕРґРѕРІ РІ Р РµСЃРїСѓР±Р»РёРєСѓ РђСЂРјРµРЅРёСЏ Рё РљС‹СЂРіС‹Р·СЃРєСѓСЋ Р РµСЃРїСѓР±Р»РёРєСѓ РґР»СЏ РѕР±РµСЃРїРµС‡РµРЅРёСЏ РїРѕС‚СЂРµР±РЅРѕСЃС‚РµР№ СЃРѕРѕС‚РІРµС‚СЃС‚РІРµРЅРЅРѕ Р’РѕРѕСЂСѓР¶РµРЅРЅС‹С… СЃРёР» Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ Рё Р’РѕРѕСЂСѓР¶РµРЅРЅС‹С… СЃРёР» РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё Рё Р°РЅР°Р»РѕРіРё РєРѕС‚РѕСЂС‹С… РЅРµ РїСЂРѕРёР·РІРѕРґСЏС‚СЃСЏ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЏС… РґСЂСѓРіРёС… РіРѕСЃСѓРґР°СЂСЃС‚РІ вЂ“ С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (39, 'РЈРќ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РґРѕ 31 РґРµРєР°Р±СЂСЏ 2022 Рі. РІ Р РµСЃРїСѓР±Р»РёРєСѓ РђСЂРјРµРЅРёСЏ Рё РљС‹СЂРіС‹Р·СЃРєСѓСЋ Р РµСЃРїСѓР±Р»РёРєСѓ РІ С†РµР»СЏС… РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ РґР»СЏ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РїРµСЂРµРІРѕР·РѕРє Рё (РёР»Рё) РІРЅСѓС‚СЂРµРЅРЅРёС… РїРµСЂРµРІРѕР·РѕРє РїРѕ С‚РµСЂСЂРёС‚РѕСЂРёРё РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІ РєРѕС‚РѕСЂРѕРµ РѕСЃСѓС‰РµСЃС‚РІР»СЏРµС‚СЃСЏ РІРІРѕР· СЃРѕРѕС‚РІРµС‚СЃС‚РІСѓСЋС‰РµРіРѕ С‚РѕРІР°СЂР°, Рё (РёР»Рё) РјРµР¶РґСѓ С‚РµСЂСЂРёС‚РѕСЂРёСЏРјРё РіРѕСЃСѓРґР°СЂСЃС‚РІ вЂ“ С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°: РІРµСЂС‚РѕР»РµС‚РѕРІ РіСЂР°Р¶РґР°РЅСЃРєРёС… СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ РІР·Р»РµС‚РЅРѕР№ РјР°СЃСЃРѕР№ Р±РѕР»РµРµ 750 РєРі, РЅРѕ РЅРµ Р±РѕР»РµРµ 3 175 РєРі, РІРєР»СЋС‡Р°РµРјС‹С… РІ РїРѕРґСЃСѓР±РїРѕР·РёС†РёРё 8802 11 000 2 Рё 8802 11 000 3 РўРќ Р’Р­Р” Р•РђР­РЎР±  РІРµСЂС‚РѕР»РµС‚РѕРІ РіСЂР°Р¶РґР°РЅСЃРєРёС… СЃ РјР°СЃСЃРѕР№ РїСѓСЃС‚РѕРіРѕ СЃРЅР°СЂСЏР¶РµРЅРЅРѕРіРѕ Р°РїРїР°СЂР°С‚Р° Р±РѕР»РµРµ 2 000 РєРі, РЅРѕ РЅРµ Р±РѕР»РµРµ 5 000 РєРі, Рё РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ РІР·Р»РµС‚РЅРѕР№ РјР°СЃСЃРѕР№ Р±РѕР»РµРµ 4 000 РєРі, РЅРѕ РЅРµ Р±РѕР»РµРµ 10 500 РєРі, РІРєР»СЋС‡Р°РµРјС‹С… РІ РїРѕРґСЃСѓР±РїРѕР·РёС†РёСЋ 8802 12 000 1 РўРќ Р’Р­Р” Р•РђР­РЎР±  РіСЂР°Р¶РґР°РЅСЃРєРёС… РїР°СЃСЃР°Р¶РёСЂСЃРєРёС… СЃР°РјРѕР»РµС‚РѕРІ СЃ РјР°СЃСЃРѕР№ РїСѓСЃС‚РѕРіРѕ СЃРЅР°СЂСЏР¶РµРЅРЅРѕРіРѕ Р°РїРїР°СЂР°С‚Р° РЅРµ Р±РѕР»РµРµ 2 000 РєРі Рё РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ РІР·Р»РµС‚РЅРѕР№ РјР°СЃСЃРѕР№ Р±РѕР»РµРµ 750 РєРі, РІРєР»СЋС‡Р°РµРјС‹С… РІ РїРѕРґСЃСѓР±РїРѕР·РёС†РёСЋ 8802 20 000 1 РўРќ Р’Р­Р” Р•РђР­РЎР±  СЃР°РјРѕР»РµС‚РѕРІ СЃ РјР°СЃСЃРѕР№ РїСѓСЃС‚РѕРіРѕ СЃРЅР°СЂСЏР¶РµРЅРЅРѕРіРѕ Р°РїРїР°СЂР°С‚Р° Р±РѕР»РµРµ 60 000 РєРі, РЅРѕ РЅРµ Р±РѕР»РµРµ 90 000 РєРі, СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ РІР·Р»РµС‚РЅРѕР№ РјР°СЃСЃРѕР№ Р±РѕР»РµРµ 120 000 РєРі, РЅРѕ РЅРµ Р±РѕР»РµРµ 180 000 РєРі, РіСЂР°Р¶РґР°РЅСЃРєРёС… РіСЂСѓР·РѕРІС‹С… СЃСЂРµРґРЅРµРјР°РіРёСЃС‚СЂР°Р»СЊРЅС‹С…, РІРєР»СЋС‡Р°РµРјС‹С… РІ РїРѕРґСЃСѓР±РїРѕР·РёС†РёСЋ 8802 40 003 9 РўРќ Р’Р­Р” Р•РђР­РЎР±  СЃР°РјРѕР»РµС‚РѕРІ СЃ РјР°СЃСЃРѕР№ РїСѓСЃС‚РѕРіРѕ СЃРЅР°СЂСЏР¶РµРЅРЅРѕРіРѕ Р°РїРїР°СЂР°С‚Р° Р±РѕР»РµРµ 160 000 РєРі, РіСЂР°Р¶РґР°РЅСЃРєРёС… РіСЂСѓР·РѕРІС‹С… С€РёСЂРѕРєРѕС„СЋР·РµР»СЏР¶РЅС‹С… РґР°Р»СЊРЅРµРјР°РіРёСЃС‚СЂР°Р»СЊРЅС‹С… СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ РІР·Р»РµС‚РЅРѕР№ РјР°СЃСЃРѕР№ РЅРµ Р±РѕР»РµРµ 370 000 РєРі, РІРєР»СЋС‡Р°РµРјС‹С… РІ РїРѕРґСЃСѓР±РїРѕР·РёС†РёСЋ 8802 40 009 7 РўРќ Р’Р­Р” Р•РђР­РЎ', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (40, 'РђР­', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РґР»СЏ С†РµР»РµР№ СЃС‚СЂРѕРёС‚РµР»СЊСЃС‚РІР° Рё РјРѕРґРµСЂРЅРёР·Р°С†РёРё РЅР° С‚РµСЂСЂРёС‚РѕСЂРёРё Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ Р°С‚РѕРјРЅРѕР№ СЌР»РµРєС‚СЂРѕСЃС‚Р°РЅС†РёРё Рё РµРµ СЌРєСЃРїР»СѓР°С‚Р°С†РёРё РІ С‚РµС‡РµРЅРёРµ РіР°СЂР°РЅС‚РёР№РЅРѕРіРѕ СЃСЂРѕРєР° РїРѕ РџРµСЂРµС‡РЅСЋ С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° РґР»СЏ С†РµР»РµР№ СЃС‚СЂРѕРёС‚РµР»СЊСЃС‚РІР° Р°С‚РѕРјРЅРѕР№ СЌР»РµРєС‚СЂРѕСЃС‚Р°РЅС†РёРё Рё РµРµ СЌРєСЃРїР»СѓР°С‚Р°С†РёРё РІ С‚РµС‡РµРЅРёРµ РіР°СЂР°РЅС‚РёР№РЅРѕРіРѕ СЃСЂРѕРєР°, СѓС‚РІРµСЂР¶РґРµРЅРЅРѕРјСѓ Р РµС€РµРЅРёРµРј РЎРѕРІРµС‚Р° Р•РІСЂР°Р·РёР№СЃРєРѕР№ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ РєРѕРјРёСЃСЃРёРё РѕС‚ 19 РјР°СЂС‚Р° 2012 Рі. в„– 9', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (41, 'Р•РЁ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ РІР·РёРјР°РЅРёСЏ РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ РѕС‚РЅРѕС€РµРЅРёРё СЃР°С…Р°СЂР°-СЃС‹СЂС†Р° С‚СЂРѕСЃС‚РЅРёРєРѕРІРѕРіРѕ СЃСѓР±РїРѕР·РёС†РёР№ 1701 13 Рё 1701 14 РўРќ Р’Р­Р” Р•РђР­РЎ, РІРІРѕР·РёРјРѕРіРѕ РІ РїРµСЂРёРѕРґ 2015 вЂ“ 2025 РіРѕРґРѕРІ РґР»СЏ РїСЂРѕРјС‹С€Р»РµРЅРЅРѕР№ РїРµСЂРµСЂР°Р±РѕС‚РєРё РЅР° С‚РµСЂСЂРёС‚РѕСЂРёРё Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (42, 'Р›Р­', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ РґР»СЏ С†РµР»РµР№ СЃС‚СЂРѕРёС‚РµР»СЊСЃС‚РІР° С‚СЂРµС‚СЊРµР№ Р»РёРЅРёРё СЌР»РµРєС‚СЂРѕРїРµСЂРµРґР°С‡Рё Р�СЂР°РЅ вЂ“ РђСЂРјРµРЅРёСЏ СЃРѕРіР»Р°СЃРЅРѕ РїРµСЂРµС‡РЅСЋ С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ РґР»СЏ С†РµР»РµР№ СЃС‚СЂРѕРёС‚РµР»СЊСЃС‚РІР° С‚СЂРµС‚СЊРµР№ Р»РёРЅРёРё СЌР»РµРєС‚СЂРѕРїРµСЂРµРґР°С‡Рё Р�СЂР°РЅ вЂ“ РђСЂРјРµРЅРёСЏ, СѓС‚РІРµСЂР¶РґРµРЅРЅРѕРјСѓ Р РµС€РµРЅРёРµРј РЎРѕРІРµС‚Р° Р•РІСЂР°Р·РёР№СЃРєРѕР№ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ РєРѕРјРёСЃСЃРёРё РѕС‚ 6 Р°РїСЂРµР»СЏ 2016 Рі. в„– 24', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (43, 'РќРџ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РµРєСЃС‚СѓСЂРёСЂРѕРІР°РЅРЅС‹С… РЅРёС‚РµР№ РїРѕР»РёРїСЂРѕРїРёР»РµРЅРѕРІС‹С…, РєР»Р°СЃСЃРёС„РёС†РёСЂСѓРµРјС‹С… РєРѕРґРѕРј 5402 34 000 0 РўРќ Р’Р­Р” Р•РђР­РЎ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РїСЂРѕРёР·РІРѕРґСЃС‚РІР° РєРѕРІСЂРѕРІ Рё РєРѕРІСЂРѕРІС‹С… РёР·РґРµР»РёР№, РІРІРѕР·РёРјС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ РІ РїРµСЂРёРѕРґ СЃ 1 СЏРЅРІР°СЂСЏ РїРѕ 31 РґРµРєР°Р±СЂСЏ 2017 Рі. РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ РІ РѕР±СЉРµРјРµ РЅРµ Р±РѕР»РµРµ 4 С‚С‹СЃ. С‚РѕРЅРЅ', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (44, 'Р�РЁ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ РІР·РёРјР°РЅРёСЏ РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ РѕС‚РЅРѕС€РµРЅРёРё СЃР°С…Р°СЂР°-СЃС‹СЂС†Р° С‚СЂРѕСЃС‚РЅРёРєРѕРІРѕРіРѕ СЃСѓР±РїРѕР·РёС†РёР№ 1701 13 Рё 1701 14 РўРќ Р’Р­Р” Р•РђР­РЎ, РІРІРѕР·РёРјРѕРіРѕ РІ С‚РµС‡РµРЅРёРµ 5 Р»РµС‚ СЃ РґР°С‚С‹ РїСЂРёРЅСЏС‚РёСЏ Р’С‹СЃС€РёРј Р•РІСЂР°Р·РёР№СЃРєРёРј СЌРєРѕРЅРѕРјРёС‡РµСЃРєРёРј СЃРѕРІРµС‚РѕРј СЂРµС€РµРЅРёСЏ РѕР± РѕС‚РјРµРЅРµ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РєРѕРЅС‚СЂРѕР»СЏ С‚РѕРІР°СЂРѕРІ Рё С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… С‡РµСЂРµР· РєС‹СЂРіС‹Р·СЃРєРѕ-РєР°Р·Р°С…СЃС‚Р°РЅСЃРєРёР№ СѓС‡Р°СЃС‚РѕРє РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕР№ РіСЂР°РЅРёС†С‹, РґР»СЏ РїСЂРѕРјС‹С€Р»РµРЅРЅРѕР№ РїРµСЂРµСЂР°Р±РѕС‚РєРё РЅР° С‚РµСЂСЂРёС‚РѕСЂРёРё РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё РІ РѕР±СЉРµРјРµ РЅРµ Р±РѕР»РµРµ 100 000 С‚РѕРЅРЅ РІ РіРѕРґ', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (45, 'РџР›', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ РљС‹СЂРіС‹Р·СЃРєСѓСЋ Р РµСЃРїСѓР±Р»РёРєСѓ РІ РїРµСЂРёРѕРґ РїРѕ 31 РґРµРєР°Р±СЂСЏ 2016 Рі. РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ С‚РѕРІР°СЂРѕРІ РїРѕРґСЃСѓР±РїРѕР·РёС†РёРё 3920 10 250 0 РўРќ Р’Р­Р” Р•РђР­РЎ РІ РѕР±СЉРµРјРµ РЅРµ Р±РѕР»РµРµ 820 С‚РѕРЅРЅ РІ РіРѕРґ, С‚РѕРІР°СЂРѕРІ РїРѕРґСЃСѓР±РїРѕР·РёС†РёР№ 3920 20 210 1 Рё 3920 20 210 9 РўРќ Р’Р­Р” Р•РђР­РЎ РІ РѕР±СЉРµРјРµ РЅРµ Р±РѕР»РµРµ 75 С‚РѕРЅРЅ РІ РіРѕРґ Рё С‚РѕРІР°СЂРѕРІ РїРѕРґСЃСѓР±РїРѕР·РёС†РёРё 3923 30 101 0 РўРќ Р’Р­Р” Р•РђР­РЎ РІ РѕР±СЉРµРјРµ РЅРµ Р±РѕР»РµРµ 200 С‚РѕРЅРЅ РІ РіРѕРґ', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (46, 'Р”Рџ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё РІ 2016 РіРѕРґСѓ РІ С†РµР»СЏС… СЃС‚СЂРѕРёС‚РµР»СЊСЃС‚РІР° Р”РѕРјР° РїСЂРёРµРјРѕРІ Рё РїСЂРѕРІРµРґРµРЅРёСЏ РѕС„РёС†РёР°Р»СЊРЅС‹С… РјРµСЂРѕРїСЂРёСЏС‚РёР№ СЃРѕРіР»Р°СЃРЅРѕ РїРµСЂРµС‡РЅСЋ С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё РІ С†РµР»СЏС… СЃС‚СЂРѕРёС‚РµР»СЊСЃС‚РІР° Р”РѕРјР° РїСЂРёРµРјРѕРІ Рё РїСЂРѕРІРµРґРµРЅРёСЏ РѕС„РёС†РёР°Р»СЊРЅС‹С… РјРµСЂРѕРїСЂРёСЏС‚РёР№, СѓС‚РІРµСЂР¶РґРµРЅРЅРѕРјСѓ Р РµС€РµРЅРёРµРј РЎРѕРІРµС‚Р° Р•РІСЂР°Р·РёР№СЃРєРѕР№ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ РєРѕРјРёСЃСЃРёРё РѕС‚ 11 РёСЋР»СЏ 2016 Рі. в„– 57', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (47, 'РћРћ', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ РЅРµ Р·Р°РїСЂР°С€РёРІР°СЋС‚СЃСЏ', '', '1.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (48, 'Р’Р‘', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° СЃРѕРІРµСЂС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕРїРµСЂР°С†РёР№ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РёР»Рё РІС‹РІРѕР·РёРјС‹С… РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рј Р±Р°РЅРєРѕРј Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ РёР»Рё РµРіРѕ СЃС‚СЂСѓРєС‚СѓСЂРЅС‹РјРё РїРѕРґСЂР°Р·РґРµР»РµРЅРёСЏРјРё', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (49, 'Р�', 'Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Р°С… 1.2 Рё 5.3, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·РѕРІ', 'AM', '5.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (316, 'РЎРћ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ', 'KG', '6.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (50, 'РЎРљ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ Рё С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ, РІРІРѕР·РёРјС‹С… СЂРµР·РёРґРµРЅС‚Р°РјРё Р¤РёРЅР»СЏРЅРґСЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё РЅР° Р°СЂРµРЅРґСѓРµРјСѓСЋ Р¤РёРЅР»СЏРЅРґСЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёСЋ РЎР°Р№РјРµРЅСЃРєРѕРіРѕ РєР°РЅР°Р»Р° РґР»СЏ РѕСЃСѓС‰РµСЃС‚РІР»РµРЅРёСЏ СЂР°Р±РѕС‚, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹С… Р”РѕРіРѕРІРѕСЂРѕРј РјРµР¶РґСѓ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРµР№ Рё Р¤РёРЅР»СЏРЅРґСЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРѕР№ РѕР± Р°СЂРµРЅРґРµ Р¤РёРЅР»СЏРЅРґСЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРѕР№ СЂРѕСЃСЃРёР№СЃРєРѕР№ С‡Р°СЃС‚Рё РЎР°Р№РјРµРЅСЃРєРѕРіРѕ РєР°РЅР°Р»Р° Рё РїСЂРёР»РµРіР°СЋС‰РµР№ Рє РЅРµРјСѓ С‚РµСЂСЂРёС‚РѕСЂРёРё Рё РѕР± РѕСЃСѓС‰РµСЃС‚РІР»РµРЅРёРё СЃСѓРґРѕС…РѕРґСЃС‚РІР° С‡РµСЂРµР· РЎР°Р№РјРµРЅСЃРєРёР№ РєР°РЅР°Р» РѕС‚ 27 РјР°СЏ 2010 РіРѕРґР°, Рё СЌРєСЃРїР»СѓР°С‚Р°С†РёРё Р°СЂРµРЅРґСѓРµРјРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (51, 'РЈРҐ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё СѓРґРѕР±СЂРµРЅРёР№ Рё СЃСЂРµРґСЃС‚РІ С…РёРјРёС‡РµСЃРєРѕР№ Р·Р°С‰РёС‚С‹ СЂР°СЃС‚РµРЅРёР№', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (52, 'РЎР—', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё СЃС‚Р°РЅРєРѕРІ РґР»СЏ СЃСѓРґРѕСЃС‚СЂРѕРёС‚РµР»СЊРЅРѕР№ РїСЂРѕРјС‹С€Р»РµРЅРЅРѕСЃС‚Рё, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ СЃ 1 РёСЋР»СЏ 2016 Рі. РїРѕ 31 РѕРєС‚СЏР±СЂСЏ 2016 Рі. РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ РґР»СЏ С†РµР»РµР№ РІС‹РїРѕР»РЅРµРЅРёСЏ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕРіРѕ РѕР±РѕСЂРѕРЅРЅРѕРіРѕ Р·Р°РєР°Р·Р° Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё, СЃРѕРіР»Р°СЃРЅРѕ РїРµСЂРµС‡РЅСЋ РѕС‚РґРµР»СЊРЅС‹С… РІРёРґРѕРІ СЃС‚Р°РЅРєРѕРІ РґР»СЏ СЃСѓРґРѕСЃС‚СЂРѕРёС‚РµР»СЊРЅРѕР№ РїСЂРѕРјС‹С€Р»РµРЅРЅРѕСЃС‚Рё, РІРІРѕР·РёРјС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё, СѓС‚РІРµСЂР¶РґРµРЅРЅРѕРјСѓ Р РµС€РµРЅРёРµРј РЎРѕРІРµС‚Р° Р•РІСЂР°Р·РёР№СЃРєРѕР№ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ РєРѕРјРёСЃСЃРёРё РѕС‚ 9 Р°РІРіСѓСЃС‚Р° 2016 Рі. в„– 64', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (53, 'РўР�', 'Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Рµ 1.1, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ', '', '1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (54, 'Р”', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё РїРѕРґР°РєС†РёР·РЅС‹С… С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° Рё РІС‹РІРѕР·РёРјС‹С… РёР· РЅРµС‘ Рё РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РѕС„РёС†РёР°Р»СЊРЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ РґРёРїР»РѕРјР°С‚РёС‡РµСЃРєРёС… РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ, РєРѕРЅСЃСѓР»СЊСЃРєРёС… СѓС‡СЂРµР¶РґРµРЅРёР№, РёРЅС‹С… РѕС„РёС†РёР°Р»СЊРЅС‹С… РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… РіРѕСЃСѓРґР°СЂСЃС‚РІ, СЂР°СЃРїРѕР»РѕР¶РµРЅРЅС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЏС… РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, Р° С‚Р°РєР¶Рµ РґР»СЏ Р»РёС‡РЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ РґРёРїР»РѕРјР°С‚РёС‡РµСЃРєРѕРіРѕ Рё Р°РґРјРёРЅРёСЃС‚СЂР°С‚РёРІРЅРѕ-С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ РїРµСЂСЃРѕРЅР°Р»Р° СЌС‚РёС… РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ, РІРєР»СЋС‡Р°СЏ С‡Р»РµРЅРѕРІ РёС… СЃРµРјРµР№, РїСЂРѕР¶РёРІР°СЋС‰РёС… РІРјРµСЃС‚Рµ СЃ РЅРёРјРё', '', '1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (55, 'Р’', 'РџРѕР»РЅРѕРµ СѓСЃР»РѕРІРЅРѕРµ РѕСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·РѕРІ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµС‡РµРЅСЊ РєРѕС‚РѕСЂС‹С… РѕРїСЂРµРґРµР»РµРЅ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё, РІС…РѕРґСЏС‰РёРјРё РІ РїСЂР°РІРѕ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, Рё (РёР»Рё) СЂРµС€РµРЅРёСЏРјРё РљРѕРјРёСЃСЃРёРё РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° (Р•РІСЂР°Р·РёР№СЃРєРѕР№ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ РєРѕРјРёСЃСЃРёРё), РїРѕРјРµС‰Р°РµРјС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° (РґРѕРїСѓСЃРєР°)', '', '1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (56, 'Рќ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·РѕРІ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° С‚РѕРІР°СЂРѕРІ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј С‚РѕРІР°СЂРѕРІ РґР»СЏ Р»РёС‡РЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ, РІ Р°РґСЂРµСЃ РѕРґРЅРѕРіРѕ РїРѕР»СѓС‡Р°С‚РµР»СЏ РѕС‚ РѕРґРЅРѕРіРѕ РѕС‚РїСЂР°РІРёС‚РµР»СЏ РїРѕ РѕРґРЅРѕРјСѓ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРјСѓ (РїРµСЂРµРІРѕР·РѕС‡РЅРѕРјСѓ) РґРѕРєСѓРјРµРЅС‚Сѓ, РѕР±С‰Р°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ СЃС‚РѕРёРјРѕСЃС‚СЊ РєРѕС‚РѕСЂС‹С… РЅРµ РїСЂРµРІС‹С€Р°РµС‚ СЃСѓРјРјС‹, СЌРєРІРёРІР°Р»РµРЅС‚РЅРѕР№ РґРІСѓРјСЃС‚Р°Рј РµРІСЂРѕ', '', '1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (57, 'Рџ', 'РђРєС†РёР·С‹ РЅРµ СѓРїР»Р°С‡РёРІР°СЋС‚СЃСЏ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРѕРјРµС‰Р°РµРјС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ, РёРЅСѓСЋ, С‡РµРј С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РїСЂРѕС†РµРґСѓСЂС‹ РІС‹РїСѓСЃРєР° РґР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ РїРѕС‚СЂРµР±Р»РµРЅРёСЏ, РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° (РґРѕРїСѓСЃРєР°), РїРµСЂРµСЂР°Р±РѕС‚РєРё РґР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ РїРѕС‚СЂРµР±Р»РµРЅРёСЏ', '', '1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (58, 'Р ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·РѕРІ РІ РѕС‚РЅРѕС€РµРЅРёРё РїРµСЂРµРјРµС‰Р°РµРјС‹С… РїСЂРёРїР°СЃРѕРІ', '', '1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (59, 'Рћ', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·РѕРІ РЅРµ Р·Р°РїСЂР°С€РёРІР°СЋС‚СЃСЏ', '', '1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (60, 'РњР”', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° Рё РІС‹РІРѕР·РёРјС‹С… РёР· РЅРµС‘ Рё РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РѕС„РёС†РёР°Р»СЊРЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ РґРёРїР»РѕРјР°С‚РёС‡РµСЃРєРёС… РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ, РєРѕРЅСЃСѓР»СЊСЃРєРёС… СѓС‡СЂРµР¶РґРµРЅРёР№, РёРЅС‹С… РѕС„РёС†РёР°Р»СЊРЅС‹С… РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… РіРѕСЃСѓРґР°СЂСЃС‚РІ, СЂР°СЃРїРѕР»РѕР¶РµРЅРЅС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЏС… РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, Р° С‚Р°РєР¶Рµ РґР»СЏ Р»РёС‡РЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ РґРёРїР»РѕРјР°С‚РёС‡РµСЃРєРѕРіРѕ Рё Р°РґРјРёРЅРёСЃС‚СЂР°С‚РёРІРЅРѕ-С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ РїРµСЂСЃРѕРЅР°Р»Р° СЌС‚РёС… РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ, РІРєР»СЋС‡Р°СЏ С‡Р»РµРЅРѕРІ РёС… СЃРµРјРµР№, РїСЂРѕР¶РёРІР°СЋС‰РёС… РІРјРµСЃС‚Рµ СЃ РЅРёРјРё', '', '1.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (61, 'Р Р’', 'РџРѕР»РЅРѕРµ СѓСЃР»РѕРІРЅРѕРµ РѕСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµС‡РµРЅСЊ РєРѕС‚РѕСЂС‹С… РѕРїСЂРµРґРµР»РµРЅ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё, РІС…РѕРґСЏС‰РёРјРё РІ РїСЂР°РІРѕ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, Рё (РёР»Рё) СЂРµС€РµРЅРёСЏРјРё РљРѕРјРёСЃСЃРёРё РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° (Р•РІСЂР°Р·РёР№СЃРєРѕР№ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ РєРѕРјРёСЃСЃРёРё), РїРѕРјРµС‰Р°РµРјС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° (РґРѕРїСѓСЃРєР°)', '', '1.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (62, 'РџРџ', 'РќР”РЎ РЅРµ СѓРїР»Р°С‡РёРІР°РµС‚СЃСЏ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРѕРјРµС‰Р°РµРјС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ, РёРЅСѓСЋ, С‡РµРј С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РїСЂРѕС†РµРґСѓСЂС‹ РІС‹РїСѓСЃРєР° РґР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ РїРѕС‚СЂРµР±Р»РµРЅРёСЏ, РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° (РґРѕРїСѓСЃРєР°), РїРµСЂРµСЂР°Р±РѕС‚РєРё РґР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ РїРѕС‚СЂРµР±Р»РµРЅРёСЏ', '', '1.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (63, 'Р‘Р“', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° СЃРѕРІРµСЂС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕРїРµСЂР°С†РёР№ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РёР»Рё РІС‹РІРѕР·РёРјС‹С… С‚РѕРІР°СЂРѕРІ, РѕС‚РЅРѕСЃСЏС‰РёС…СЃСЏ Рє РёРЅРѕСЃС‚СЂР°РЅРЅРѕР№ Р±РµР·РІРѕР·РјРµР·РґРЅРѕР№ РїРѕРјРѕС‰Рё', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (64, 'Р‘Рў', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° СЃРѕРІРµСЂС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕРїРµСЂР°С†РёР№ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РёР»Рё РІС‹РІРѕР·РёРјС‹С… С‚РѕРІР°СЂРѕРІ, РѕС‚РЅРѕСЃСЏС‰РёС…СЃСЏ Рє РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕР№ С‚РµС…РЅРёС‡РµСЃРєРѕР№ РїРѕРјРѕС‰Рё', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (65, 'РљРў', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° СЃРѕРІРµСЂС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕРїРµСЂР°С†РёР№ РІ РѕС‚РЅРѕС€РµРЅРёРё Р±Р»Р°РЅРєРѕРІ РєРЅРёР¶РµРє РњР”Рџ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… РјРµР¶РґСѓ РђСЃСЃРѕС†РёР°С†РёРµР№ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… Р°РІС‚РѕРјРѕР±РёР»СЊРЅС‹С… РїРµСЂРµРІРѕР·С‡РёРєРѕРІ Рё РњРµР¶РґСѓРЅР°СЂРѕРґРЅС‹Рј СЃРѕСЋР·РѕРј Р°РІС‚РѕРјРѕР±РёР»СЊРЅРѕРіРѕ С‚СЂР°РЅСЃРїРѕСЂС‚Р°', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (66, 'РљРђ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° СЃРѕРІРµСЂС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕРїРµСЂР°С†РёР№ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РёР»Рё РІС‹РІРѕР·РёРјС‹С… Р±Р»Р°РЅРєРѕРІ РєР°СЂРЅРµС‚РѕРІ РђРўРђ РёР»Рё РёС… С‡Р°СЃС‚РµР№', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (67, 'РџРЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РїР»РµРјРµРЅРЅС‹С… Р¶РёРІРѕС‚РЅС‹С… Рё СЃРµРјРµРЅРЅС‹С… РјР°С‚РµСЂРёР°Р»РѕРІ', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (68, 'РњР�', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё СЃРїРµС†РёР°Р»РёР·РёСЂРѕРІР°РЅРЅС‹С… С‚РѕРІР°СЂРѕРІ РґР»СЏ РёРЅРІР°Р»РёРґРѕРІ', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (69, 'РЈР§', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё СѓС‡РµР±РЅС‹С… РїРѕСЃРѕР±РёР№, С€РєРѕР»СЊРЅС‹С… РїСЂРёРЅР°РґР»РµР¶РЅРѕСЃС‚РµР№ Рё РЅР°СѓС‡РЅС‹С… РёР·РґР°РЅРёР№', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (70, 'Р’Р‘', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С†РµРЅРЅС‹С… Р±СѓРјР°Рі, Р±Р»Р°РЅРєРѕРІ РїР°СЃРїРѕСЂС‚РѕРІ Рё СѓРґРѕСЃС‚РѕРІРµСЂРµРЅРёР№ Р»РёС‡РЅРѕСЃС‚Рё РіСЂР°Р¶РґР°РЅРёРЅР° РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅРѕРіРѕ РѕР±СЂР°Р·С†Р°, РјР°СЂРѕРє Р°РєС†РёР·РЅРѕРіРѕ СЃР±РѕСЂР°, РІР°Р»СЋС‚С‹ (РєСЂРѕРјРµ РёСЃРїРѕР»СЊР·СѓРµРјРѕР№ РІ РЅСѓРјРёР·РјР°С‚РёС‡РµСЃРєРёС… С†РµР»СЏС…)', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (71, 'РџР“', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РїСЂРёСЂРѕРґРЅРѕРіРѕ РіР°Р·Р°', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (72, 'РќР‘', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё Р±Р°РЅРєРѕРІСЃРєРѕРіРѕ РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (73, 'РљР ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… СЂРµР°Р»РёР·Р°С†РёРё РїСЂРѕРµРєС‚Р° В«РљСѓРјС‚РѕСЂВ»', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (74, 'РЎРћ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ РєР°С‡РµСЃС‚РІРµ РѕСЃРЅРѕРІРЅС‹С… СЃСЂРµРґСЃС‚РІ', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (75, 'Р›РЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (76, 'РњРҐ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р°РґСЂРµСЃ РІРѕРµРЅРЅС‹С… Р±Р°Р· С‚СЂРµС‚СЊРёС… СЃС‚СЂР°РЅ', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (77, 'РџРљ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё СЃРїРµС†РёР°Р»РёР·РёСЂРѕРІР°РЅРЅС‹С… С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РґР»СЏ СЃС‚СЂРѕРёС‚РµР»СЊСЃС‚РІР° Рё СЂРµРєРѕРЅСЃС‚СЂСѓРєС†РёРё СЃС‚РµРєР»РѕРІР°СЂРµРЅРЅРѕР№ РїРµС‡Рё Рё РєРѕРЅРІРµСЂС‚РµСЂР° (С„РµСЂСЂРѕСЃРїР»Р°РІРЅРѕР№ РїРµС‡Рё)', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (78, 'Р“Рћ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РЅР°СѓС‡РЅРѕРіРѕ РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ РіРµРѕР»РѕРіРёС‡РµСЃРєРёС… (РіРµРѕС„РёР·РёС‡РµСЃРєРёС…, РіРµРѕРґРµР·РёС‡РµСЃРєРёС…) СЌРєСЃРїРµРґРёС†РёР№ РїРѕ РёР·РјРµСЂРµРЅРёСЋ Рё РєРѕРЅС‚СЂРѕР»СЋ СЃРµР№СЃРјРёС‡РµСЃРєРѕР№ РѕР±СЃС‚Р°РЅРѕРІРєРё', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (79, 'РњРћ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РїСЂР°РІРёС‚РµР»СЊСЃС‚РІРµРЅРЅС‹С… Рё РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ', 'KG', '6.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (80, 'РўР­', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… СЂРµР°Р»РёР·Р°С†РёРё РїСЂРѕРµРєС‚Р° В«РњРѕРґРµСЂРЅРёР·Р°С†РёСЏ С‚РµРїР»РѕРІРѕР№ СЌР»РµРєС‚СЂРѕС†РµРЅС‚СЂР°Р»Рё РіРѕСЂРѕРґР° Р‘РёС€РєРµРєВ» РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РєСЂРµРґРёС‚РЅС‹Рј СЃРѕРіР»Р°С€РµРЅРёРµРј Р»СЊРіРѕС‚РЅРѕРіРѕ РїРѕРєСѓРїР°С‚РµР»СЊСЃРєРѕРіРѕ РєСЂРµРґРёС‚Р° РјРµР¶РґСѓ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё Рё Р­РєСЃРїРѕСЂС‚РЅРѕ-РёРјРїРѕСЂС‚РЅС‹Рј Р±Р°РЅРєРѕРј РљРёС‚Р°Р№СЃРєРѕР№ РќР°СЂРѕРґРЅРѕР№ Р РµСЃРїСѓР±Р»РёРєРё РѕС‚ 11 СЃРµРЅС‚СЏР±СЂСЏ 2013 Рі.', 'KG', '6.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (81, 'Р”Рљ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… СЂРµР°Р»РёР·Р°С†РёРё РїСЂРѕРµРєС‚Р° В«РЎС‚СЂРѕРёС‚РµР»СЊСЃС‚РІРѕ Р»РёРЅРёРё СЌР»РµРєС‚СЂРѕРїРµСЂРµРґР°С‡Рё 500 РєР’ В«Р”Р°С‚РєР°-РљРµРјРёРЅВ» Рё РїРѕРґСЃС‚Р°РЅС†РёРё 500 РєР’ В«РљРµРјРёРЅВ» РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р»СЊРіРѕС‚РЅС‹Рј РєСЂРµРґРёС‚РЅС‹Рј СЃРѕРіР»Р°С€РµРЅРёРµРј РјРµР¶РґСѓ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё Рё Р­РєСЃРїРѕСЂС‚РЅРѕ-РёРјРїРѕСЂС‚РЅС‹Рј Р±Р°РЅРєРѕРј РљРёС‚Р°Р№СЃРєРѕР№ РќР°СЂРѕРґРЅРѕР№ Р РµСЃРїСѓР±Р»РёРєРё РѕС‚ 5 РёСЋРЅСЏ 2012 Рі.', 'KG', '6.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (82, 'Р”Р ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… СЂРµР°Р»РёР·Р°С†РёРё РїСЂРѕРµРєС‚Р° РїРѕ СЂРµР°Р±РёР»РёС‚Р°С†РёРё РґРІСѓС… СѓС‡Р°СЃС‚РєРѕРІ РґРѕСЂРѕРі РІ РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРµ (Р Р’РЎ в„– (2012) 54 РЅРѕРјРµСЂ (242)) РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р»СЊРіРѕС‚РЅС‹Рј РєСЂРµРґРёС‚РЅС‹Рј СЃРѕРіР»Р°С€РµРЅРёРµРј РјРµР¶РґСѓ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё Рё Р­РєСЃРїРѕСЂС‚РЅРѕ-РёРјРїРѕСЂС‚РЅС‹Рј Р±Р°РЅРєРѕРј РљРёС‚Р°Р№СЃРєРѕР№ РќР°СЂРѕРґРЅРѕР№ Р РµСЃРїСѓР±Р»РёРєРё РѕС‚ 4 РґРµРєР°Р±СЂСЏ 2012 Рі.', 'KG', '6.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (83, 'Р”Р›', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… СЂРµР°Р»РёР·Р°С†РёРё РїСЂРѕРµРєС‚Р° Р°Р»СЊС‚РµСЂРЅР°С‚РёРІРЅРѕР№ Р°РІС‚РѕРґРѕСЂРѕРіРё РЎРµРІРµСЂ вЂ“ Р®Рі РЅР° СѓС‡Р°СЃС‚РєР°С… РљР°Р·Р°СЂРјР°РЅ вЂ“ Р”Р¶Р°Р»Р°Р»-РђР±Р°Рґ (РєРј 291 вЂ“ 433) Рё Р‘Р°Р»С‹РєС‡С‹ вЂ“ РђСЂР°Р» (РєРј 183+500 вЂ“ 195+486) РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р»СЊРіРѕС‚РЅС‹Рј РєСЂРµРґРёС‚РЅС‹Рј СЃРѕРіР»Р°С€РµРЅРёРµРј РјРµР¶РґСѓ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё Рё Р­РєСЃРїРѕСЂС‚РЅРѕ-РёРјРїРѕСЂС‚РЅС‹Рј Р±Р°РЅРєРѕРј РљРёС‚Р°Р№СЃРєРѕР№ РќР°СЂРѕРґРЅРѕР№ Р РµСЃРїСѓР±Р»РёРєРё РѕС‚ 11 СЃРµРЅС‚СЏР±СЂСЏ 2013 Рі.', 'KG', '6.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (84, 'РљР¦', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РµСЃРїСѓР±Р»РёРєСѓ РђСЂРјРµРЅРёСЏ РєСѓР»СЊС‚СѓСЂРЅС‹С… С†РµРЅРЅРѕСЃС‚РµР№', 'AM', '5.4');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (118, 'Р�РЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РµС…РЅРѕР»РѕРіРёС‡РµСЃРєРѕРіРѕ РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ (РєРѕРјРїР»РµРєС‚СѓСЋС‰РёС… Рё Р·Р°РїР°СЃРЅС‹С… С‡Р°СЃС‚РµР№ Рє РЅРµРјСѓ), СЃС‹СЂСЊСЏ Рё РјР°С‚РµСЂРёР°Р»РѕРІ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ СЂРµР°Р»РёР·Р°С†РёРё РёРЅРІРµСЃС‚РёС†РёРѕРЅРЅС‹С… РїСЂРѕРµРєС‚РѕРІ, РІ С‚РѕРј С‡РёСЃР»Рµ СЂРµР°Р»РёР·СѓРµРјС‹С… РІ СЂР°РјРєР°С… Р·Р°РєР»СЋС‡РµРЅРЅС‹С… РёРЅРІРµСЃС‚РёС†РёРѕРЅРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ РјРµР¶РґСѓ РёРЅРІРµСЃС‚РѕСЂРѕРј Рё Р РµСЃРїСѓР±Р»РёРєРѕР№ Р‘РµР»Р°СЂСѓСЃСЊ', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (85, 'Р”Р‘', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… СЂРµР°Р»РёР·Р°С†РёРё РїСЂРѕРµРєС‚Р° СЂРµРєРѕРЅСЃС‚СЂСѓРєС†РёРё Р°РІС‚РѕРґРѕСЂРѕРіРё Р‘РёС€РєРµРє вЂ“ РќР°СЂС‹РЅ вЂ“ РўРѕСЂСѓРіР°СЂС‚ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РєСЂРµРґРёС‚РЅС‹РјРё СЃРѕРіР»Р°С€РµРЅРёСЏРјРё РјРµР¶РґСѓ РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРѕР№ Рё РЎР°СѓРґРѕРІСЃРєРёРј С„РѕРЅРґРѕРј СЂР°Р·РІРёС‚РёСЏ РѕС‚ 13 СЃРµРЅС‚СЏР±СЂСЏ 2011 Рі., РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРѕР№ Рё РљСѓРІРµР№С‚СЃРєРёРј С„РѕРЅРґРѕРј Р°СЂР°Р±СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЂР°Р·РІРёС‚РёСЏ РѕС‚ 7 СЃРµРЅС‚СЏР±СЂСЏ 2011 Рі. Рё РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё Рё Р¤РѕРЅРґРѕРј СЂР°Р·РІРёС‚РёСЏ РђР±Сѓ-Р”Р°Р±Рё РѕС‚ 8 С„РµРІСЂР°Р»СЏ 2012 Рі.', 'KG', '6.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (86, 'Р”Рў', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… СЂРµР°Р»РёР·Р°С†РёРё РїСЂРѕРµРєС‚Р° СЂРµРєРѕРЅСЃС‚СЂСѓРєС†РёРё Р°РІС‚РѕРґРѕСЂРѕРіРё РўР°СЂР°Р· вЂ“ РўР°Р»Р°СЃ вЂ“ РЎСѓСѓСЃР°РјС‹СЂ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РєСЂРµРґРёС‚РЅС‹Рј СЃРѕРіР»Р°С€РµРЅРёРµРј РјРµР¶РґСѓ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё Рё РЎР°СѓРґРѕРІСЃРєРёРј С„РѕРЅРґРѕРј СЂР°Р·РІРёС‚РёСЏ РѕС‚ 13 Р°РІРіСѓСЃС‚Р° 2013 Рі.', 'KG', '6.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (87, 'РќР�', '6.4.3. Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Р°С… 1.3 Рё 6.4, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ', 'KG', '6.4.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (88, 'Р‘Р“', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїРѕРґР°РєС†РёР·РЅС‹С…, РІРІРѕР·РёРјС‹С… РІ РєР°С‡РµСЃС‚РІРµ РіСѓРјР°РЅРёС‚Р°СЂРЅРѕР№ РїРѕРјРѕС‰Рё', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (89, 'Р‘Рџ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїРѕРґР°РєС†РёР·РЅС‹С…, РІРІРѕР·РёРјС‹С… РІ С†РµР»СЏС… Р±Р»Р°РіРѕС‚РІРѕСЂРёС‚РµР»СЊРЅРѕР№ РїРѕРјРѕС‰Рё РїРѕ Р»РёРЅРёРё РіРѕСЃСѓРґР°СЂСЃС‚РІ, РїСЂР°РІРёС‚РµР»СЊСЃС‚РІ РіРѕСЃСѓРґР°СЂСЃС‚РІ, РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (90, 'РўРҐ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїРѕРґР°РєС†РёР·РЅС‹С…, РІРІРѕР·РёРјС‹С… РІ С†РµР»СЏС… РѕРєР°Р·Р°РЅРёСЏ С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЃРѕРґРµР№СЃС‚РІРёСЏ РїРѕ Р»РёРЅРёРё РіРѕСЃСѓРґР°СЂСЃС‚РІ, РїСЂР°РІРёС‚РµР»СЊСЃС‚РІ РіРѕСЃСѓРґР°СЂСЃС‚РІ, РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (91, 'Р“Р ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РёРјРїРѕСЂС‚Р° С‚РѕРІР°СЂРѕРІ, РѕСЃСѓС‰РµСЃС‚РІР»СЏРµРјРѕРіРѕ Р·Р° СЃС‡РµС‚ СЃСЂРµРґСЃС‚РІ РіСЂР°РЅС‚РѕРІ, РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРЅС‹С… РїРѕ Р»РёРЅРёРё РіРѕСЃСѓРґР°СЂСЃС‚РІ, РїСЂР°РІРёС‚РµР»СЊСЃС‚РІ РіРѕСЃСѓРґР°СЂСЃС‚РІ Рё РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (92, 'РќР�', '3.4.3. Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ СЂР°Р·РґРµР»Р°С… 1.3. Рё 3.4., Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'KZ', '3.4.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (93, 'Р’Р‘', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё РЅР°Р»РёС‡РЅРѕР№ РІР°Р»СЋС‚С‹ РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІРІРѕР·РёРјРѕР№ РёР»Рё РІС‹РІРѕР·РёРјРѕР№ С†РµРЅС‚СЂР°Р»СЊРЅС‹РјРё Р±Р°РЅРєР°РјРё РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїР°РјСЏС‚РЅС‹С… РјРѕРЅРµС‚', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (94, 'Р‘Р“', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ Рё РІС‹РІРѕР·РёРјС‹С… РёР· Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё, РѕС‚РЅРѕСЃСЏС‰РёС…СЃСЏ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рє РіСѓРјР°РЅРёС‚Р°СЂРЅРѕР№ РїРѕРјРѕС‰Рё (СЃРѕРґРµР№СЃС‚РІРёСЋ)', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (95, 'Р‘Рў', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ Рё РІС‹РІРѕР·РёРјС‹С… РёР· Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё, РѕС‚РЅРѕСЃСЏС‰РёС…СЃСЏ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рє С‚РµС…РЅРёС‡РµСЃРєРѕР№ РїРѕРјРѕС‰Рё (СЃРѕРґРµР№СЃС‚РІРёСЋ)', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (96, 'РњР”', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ Рё РІС‹РІРѕР·РёРјС‹С… РёР· Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РґРёРїР»РѕРјР°С‚РёС‡РµСЃРєРёРјРё РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІР°РјРё, РєРѕРЅСЃСѓР»СЊСЃРєРёРјРё СѓС‡СЂРµР¶РґРµРЅРёСЏРјРё, РёРЅС‹РјРё РѕС„РёС†РёР°Р»СЊРЅС‹РјРё РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІР°РјРё РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… РіРѕСЃСѓРґР°СЂСЃС‚РІ, РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё, РїРµСЂСЃРѕРЅР°Р»РѕРј СЌС‚РёС… РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ, СѓС‡СЂРµР¶РґРµРЅРёР№ Рё РѕСЂРіР°РЅРёР·Р°С†РёР№, Р° С‚Р°РєР¶Рµ С‚РѕРІР°СЂРѕРІ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ Р»РёС‡РЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ РѕС‚РґРµР»СЊРЅС‹С… РєР°С‚РµРіРѕСЂРёР№ РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… Р»РёС†, РїРѕР»СЊР·СѓСЋС‰РёС…СЃСЏ РїСЂРµРёРјСѓС‰РµСЃС‚РІР°РјРё, РїСЂРёРІРёР»РµРіРёСЏРјРё Рё (РёР»Рё) РёРјРјСѓРЅРёС‚РµС‚Р°РјРё РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (97, 'РљРў', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё Р±Р»Р°РЅРєРѕРІ РєРЅРёР¶РµРє РњР”Рџ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… РјРµР¶РґСѓ РђСЃСЃРѕС†РёР°С†РёРµР№ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… Р°РІС‚РѕРјРѕР±РёР»СЊРЅС‹С… РїРµСЂРµРІРѕР·С‡РёРєРѕРІ Р РѕСЃСЃРёРё (РђРЎРњРђРџ) Рё РњРµР¶РґСѓРЅР°СЂРѕРґРЅС‹Рј СЃРѕСЋР·РѕРј Р°РІС‚РѕРјРѕР±РёР»СЊРЅРѕРіРѕ С‚СЂР°РЅСЃРїРѕСЂС‚Р° (РњРЎРђРў)', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (98, 'РљРђ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё Р±Р»Р°РЅРєРѕРІ РєР°СЂРЅРµС‚РѕРІ РђРўРђ РёР»Рё РёС… С‡Р°СЃС‚РµР№, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РІС‹РґР°С‡Рё РЅР° С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (99, 'РђРњ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё Р°РєС†РёР·РЅС‹С… РјР°СЂРѕРє, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ Рё РІС‹РІРѕР·РёРјС‹С… РёР· Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (100, 'Р›Р›', 'РўР°СЂРёС„РЅР°СЏ РїСЂРµС„РµСЂРµРЅС†РёСЏ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїСЂРѕРёСЃС…РѕРґСЏС‰РёС… Рё РІРІРѕР·РёРјС‹С… РёР· РЎРµСЂР±РёРё РІ СЂР°РјРєР°С… РЎРѕРіР»Р°С€РµРЅРёСЏ Рѕ СЃРІРѕР±РѕРґРЅРѕР№ С‚РѕСЂРіРѕРІР»Рµ РјРµР¶РґСѓ Р РµСЃРїСѓР±Р»РёРєРѕР№ Р‘РµР»Р°СЂСѓСЃСЊ Рё РЎРµСЂР±СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРѕР№', 'BY', '2.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (172, 'РњРЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РёРЅС‹С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ', '3.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (101, 'Р’Рњ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ Рё РІС‹РІРѕР·РёРјС‹С… РёР· Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РІ С†РµР»СЏС… РґРµРјРѕРЅСЃС‚СЂР°С†РёРё РїСЂРё РїСЂРѕРІРµРґРµРЅРёРё РІС‹СЃС‚Р°РІРѕС‡РЅРѕ-РєРѕРЅРіСЂРµСЃСЃРЅС‹С… РјРµСЂРѕРїСЂРёСЏС‚РёР№ СЃ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј СѓС‡Р°СЃС‚РёРµРј, Р°РІРёР°С†РёРѕРЅРЅРѕ-РєРѕСЃРјРёС‡РµСЃРєРёС… СЃР°Р»РѕРЅРѕРІ Рё РЅР° РёРЅС‹С… РїРѕРґРѕР±РЅС‹С… РјРµСЂРѕРїСЂРёСЏС‚РёР№, РїРѕ СЂРµС€РµРЅРёСЋ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІР° Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (102, 'РњР®', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё, РёС… РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІР°РјРё, РїРµСЂСЃРѕРЅР°Р»РѕРј СЌС‚РёС… РѕСЂРіР°РЅРёР·Р°С†РёР№ Рё РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ, Р° С‚Р°РєР¶Рµ С‡Р»РµРЅР°РјРё РёС… СЃРµРјРµР№', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (103, 'РљР’', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° СЃРѕРІРµСЂС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕРїРµСЂР°С†РёР№ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РёР»Рё РІС‹РІРѕР·РёРјС‹С… СЃ РїСЂРёРјРµРЅРµРЅРёРµРј РєР°СЂРЅРµС‚Р° РђРўРђ РїСЂРё СѓСЃР»РѕРІРёРё РёС… РїРѕР»РЅРѕРіРѕ РѕСЃРІРѕР±РѕР¶РґРµРЅРёСЏ РѕС‚ РѕР±Р»РѕР¶РµРЅРёСЏ С‚Р°РјРѕР¶РµРЅРЅС‹РјРё РїРѕС€Р»РёРЅР°РјРё, РЅР°Р»РѕРіР°РјРё', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (104, 'РђРђ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° СЃРѕРІРµСЂС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕРїРµСЂР°С†РёР№ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… (РІРІРµР·РµРЅРЅС‹С…) РёР»Рё РІС‹РІРѕР·РёРјС‹С… (РІС‹РІРµР·РµРЅРЅС‹С…) Р°РєС†РёР·РЅС‹С… РјР°СЂРѕРє Рё РєРѕРЅС‚СЂРѕР»СЊРЅС‹С… (РёРґРµРЅС‚РёС„РёРєР°С†РёРѕРЅРЅС‹С…) Р·РЅР°РєРѕРІ', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (105, 'РќРЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° СЃРѕРІРµСЂС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕРїРµСЂР°С†РёР№ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, С‚Р°РјРѕР¶РµРЅРЅР°СЏ СЃС‚РѕРёРјРѕСЃС‚СЊ РєРѕС‚РѕСЂС‹С… РЅРµ РїСЂРµРІС‹С€Р°РµС‚ СЃСѓРјРјСѓ, СЌРєРІРёРІР°Р»РµРЅС‚РЅСѓСЋ 200 РµРІСЂРѕ, Рё РІ РѕС‚РЅРѕС€РµРЅРёРё РєРѕС‚РѕСЂС‹С… РЅРµ СѓРїР»Р°С‡РёРІР°СЋС‚СЃСЏ С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РїРѕС€Р»РёРЅС‹, РЅР°Р»РѕРіРё', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (106, 'Р Рџ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° СЃРѕРІРµСЂС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕРїРµСЂР°С†РёР№ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… С‡РµСЂРµР· С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РіСЂР°РЅРёС†Сѓ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РІ РєР°С‡РµСЃС‚РІРµ РїСЂРёРїР°СЃРѕРІ', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (107, 'РџРџ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° СЃРѕРІРµСЂС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕРїРµСЂР°С†РёР№ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРѕРјРµС‰Р°РµРјС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РїСЂРѕС†РµРґСѓСЂС‹ СЌРєСЃРїРѕСЂС‚Р°, СЂРµСЌРєСЃРїРѕСЂС‚Р°, С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ С‚СЂР°РЅР·РёС‚Р°, РѕС‚РєР°Р·Р° РІ РїРѕР»СЊР·Сѓ РіРѕСЃСѓРґР°СЂСЃС‚РІР°, РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° (РґРѕРїСѓСЃРєР°) СЃ РїРѕР»РЅС‹Рј СѓСЃР»РѕРІРЅС‹Рј РѕСЃРІРѕР±РѕР¶РґРµРЅРёРµРј РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ, СЃРїРµС†РёР°Р»СЊРЅСѓСЋ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ, Р° С‚Р°РєР¶Рµ РїСЂРё РІСЂРµРјРµРЅРЅРѕРј РІРІРѕР·Рµ (РІСЂРµРјРµРЅРЅРѕРј РІС‹РІРѕР·Рµ) С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕР№ РїРµСЂРµРІРѕР·РєРё', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (108, 'РњР”', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° СЃРѕРІРµСЂС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕРїРµСЂР°С†РёР№ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… РґР»СЏ РѕС„РёС†РёР°Р»СЊРЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ РёРЅРѕСЃС‚СЂР°РЅРЅС‹РјРё РґРёРїР»РѕРјР°С‚РёС‡РµСЃРєРёРјРё Рё РїСЂРёСЂР°РІРЅРµРЅРЅС‹РјРё Рє РЅРёРј РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІР°РјРё, Р»РёР±Рѕ РґР»СЏ Р»РёС‡РЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ РґРёРїР»РѕРјР°С‚РёС‡РµСЃРєРёС… Рё (РёР»Рё) Р°РґРјРёРЅРёСЃС‚СЂР°С‚РёРІРЅРѕ-С‚РµС…РЅРёС‡РµСЃРєРёС… СЂР°Р±РѕС‚РЅРёРєРѕРІ СЌС‚РёС… РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ (РІРєР»СЋС‡Р°СЏ РїСЂРѕР¶РёРІР°СЋС‰РёС… РІРјРµСЃС‚Рµ СЃ РЅРёРјРё С‡Р»РµРЅРѕРІ РёС… СЃРµРјРµР№), РµСЃР»Рё РѕРЅРё РЅРµ СЏРІР»СЏСЋС‚СЃСЏ РіСЂР°Р¶РґР°РЅР°РјРё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (109, 'РњР®', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° СЃРѕРІРµСЂС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕРїРµСЂР°С†РёР№ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё, РїРµСЂСЃРѕРЅР°Р»РѕРј СЌС‚РёС… РѕСЂРіР°РЅРёР·Р°С†РёР№', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (110, 'РњР’', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° СЃРѕРІРµСЂС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕРїРµСЂР°С†РёР№ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ Рѕ РІРѕР·РґСѓС€РЅРѕРј СЃРѕРѕР±С‰РµРЅРёРё', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (111, 'РЎР‘', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° СЃРѕРІРµСЂС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕРїРµСЂР°С†РёР№ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… (РІРІРµР·РµРЅРЅС‹С…) Рё (РёР»Рё) РІС‹РІРѕР·РёРјС‹С… (РІС‹РІРµР·РµРЅРЅС‹С…) РІ С†РµР»СЏС… Р»РёРєРІРёРґР°С†РёРё РїРѕСЃР»РµРґСЃС‚РІРёР№ Р°РІР°СЂРёР№, РєР°С‚Р°СЃС‚СЂРѕС„ Рё СЃС‚РёС…РёР№РЅС‹С… Р±РµРґСЃС‚РІРёР№', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (112, 'РЎР�', 'Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Рµ 2.1., Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° СЃРѕРІРµСЂС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕРїРµСЂР°С†РёР№', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (113, 'РћРћ', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° СЃРѕРІРµСЂС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕРїРµСЂР°С†РёР№ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ РЅРµ РёСЃРїРѕР»СЊР·СѓСЋС‚СЃСЏ', 'BY', '2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (114, 'Р’Рџ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІС‹РІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'BY', '2.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (115, 'РњР®', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё, РёС… РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІР°РјРё, РїРµСЂСЃРѕРЅР°Р»РѕРј СЌС‚РёС… РѕСЂРіР°РЅРёР·Р°С†РёР№ Рё РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ, Р° С‚Р°РєР¶Рµ С‡Р»РµРЅР°РјРё РёС… СЃРµРјРµР№', 'BY', '2.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (116, 'РњР’', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ Рѕ РІРѕР·РґСѓС€РЅРѕРј СЃРѕРѕР±С‰РµРЅРёРё', 'BY', '2.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (117, 'РљРў', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ РѕС‚РЅРѕС€РµРЅРёРё Р±Р»Р°РЅРєРѕРІ РєРЅРёР¶РµРє РњР”Рџ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… РјРµР¶РґСѓ РђСЃСЃРѕС†РёР°С†РёРµР№ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… Р°РІС‚РѕРјРѕР±РёР»СЊРЅС‹С… РїРµСЂРµРІРѕР·С‡РёРєРѕРІ Рё РњРµР¶РґСѓРЅР°СЂРѕРґРЅС‹Рј СЃРѕСЋР·РѕРј Р°РІС‚РѕРјРѕР±РёР»СЊРЅРѕРіРѕ С‚СЂР°РЅСЃРїРѕСЂС‚Р°', 'BY', '2.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (317, 'РћРћ', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ РЅРµ РёСЃРїРѕР»СЊР·СѓСЋС‚СЃСЏ (РЅРµ Р·Р°РїСЂР°С€РёРІР°СЋС‚СЃСЏ)', 'KG', '6.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (119, 'Р­Р‘', 'РўР°СЂРёС„РЅР°СЏ РїСЂРµС„РµСЂРµРЅС†РёСЏ РІ РІРёРґРµ РѕСЃРІРѕР±РѕР¶РґРµРЅРёСЏ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїСЂРѕРёСЃС…РѕРґСЏС‰РёС… Рё РІРІРѕР·РёРјС‹С… РёР· РіРѕСЃСѓРґР°СЂСЃС‚РІ, РѕР±СЂР°Р·СѓСЋС‰РёС… РІРјРµСЃС‚Рµ СЃ Р РµСЃРїСѓР±Р»РёРєРѕР№ Р‘РµР»Р°СЂСѓСЃСЊ Р·РѕРЅСѓ СЃРІРѕР±РѕРґРЅРѕР№ С‚РѕСЂРіРѕРІР»Рё, Р° С‚Р°РєР¶Рµ С‚РѕРІР°СЂРѕРІ, РїСЂРѕРёСЃС…РѕРґСЏС‰РёС… Рё РІС‹РІРѕР·РёРјС‹С… РёР· Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ РІ РіРѕСЃСѓРґР°СЂСЃС‚РІР°, РѕР±СЂР°Р·СѓСЋС‰РёРµ РІРјРµСЃС‚Рµ СЃ Р РµСЃРїСѓР±Р»РёРєРѕР№ Р‘РµР»Р°СЂСѓСЃСЊ Р·РѕРЅСѓ СЃРІРѕР±РѕРґРЅРѕР№ С‚РѕСЂРіРѕРІР»Рё (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј С‚Р°СЂРёС„РЅРѕР№ РїСЂРµС„РµСЂРµРЅС†РёРё, РѕРїСЂРµРґРµР»РµРЅРЅРѕР№ РєРѕРґРѕРј Р›Р›)', 'BY', '2.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (120, 'РџР�', '2.2.3.В Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІВ РїРѕРґСЂР°Р·РґРµР»Рµ 2.2,В Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ', 'BY', '2.2.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (121, 'Рђ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·РѕРІ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ РїРѕ РїРµСЂРµС‡РЅСЋ, СѓС‚РІРµСЂР¶РґРµРЅРЅРѕРјСѓ РџСЂРµР·РёРґРµРЅС‚РѕРј Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'BY', '2.3.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (122, 'Р“', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·РѕРІ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РѕС‚РЅРѕСЃСЏС‰РёРµСЃСЏ Рє РёРЅРѕСЃС‚СЂР°РЅРЅРѕР№ Р±РµР·РІРѕР·РјРµР·РґРЅРѕР№ РїРѕРјРѕС‰Рё', 'BY', '2.3.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (123, 'Рў', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·РѕРІ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїСЂРёРѕР±СЂРµС‚РµРЅРЅС‹С… Р·Р° СЃС‡РµС‚ Рё (РёР»Рё) РїРѕР»СѓС‡Р°РµРјС‹С… (РїРѕР»СѓС‡РµРЅРЅС‹С…) РІ РєР°С‡РµСЃС‚РІРµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕР№ С‚РµС…РЅРёС‡РµСЃРєРѕР№ РїРѕРјРѕС‰Рё', 'BY', '2.3.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (124, 'РЈ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·РѕРІ РІ РѕС‚РЅРѕС€РµРЅРёРё РіР°Р·Р° СѓРіР»РµРІРѕРґРѕСЂРѕРґРЅРѕРіРѕ СЃР¶РёР¶РµРЅРЅРѕРіРѕ Рё РіР°Р·Р° РїСЂРёСЂРѕРґРЅРѕРіРѕ С‚РѕРїР»РёРІРЅРѕРіРѕ РєРѕРјРїСЂРёРјРёСЂРѕРІР°РЅРЅРѕРіРѕ', 'BY', '2.3.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (125, 'Р®', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·РѕРІ РѕС‚РЅРѕС€РµРЅРёРё РїРѕРґР°РєС†РёР·РЅС‹С… С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё РёР»Рё РјРµР¶РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹РјРё РѕР±СЂР°Р·РѕРІР°РЅРёСЏРјРё, РёС… РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІР°РјРё РЅР° С‚РµСЂСЂРёС‚РѕСЂРёРё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ, РїРµСЂСЃРѕРЅР°Р»РѕРј СЌС‚РёС… РѕСЂРіР°РЅРёР·Р°С†РёР№ Рё РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ, Р° С‚Р°РєР¶Рµ С‡Р»РµРЅР°РјРё РёС… СЃРµРјРµР№', 'BY', '2.3.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (126, 'Р�', '2.3.3. Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Р°С… 1.2. Рё 2.3, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·РѕРІ РІ РѕС‚РЅРѕС€РµРЅРёРё РїРѕРґР°РєС†РёР·РЅС‹С… С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'BY', '2.3.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (127, 'Р’Р‘', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё Р±РµР»РѕСЂСѓСЃСЃРєРёС… СЂСѓР±Р»РµР№, РёРЅРѕСЃС‚СЂР°РЅРЅРѕР№ РІР°Р»СЋС‚С‹, РІ С‡Р°СЃС‚РЅРѕСЃС‚Рё Р±Р°РЅРєРЅРѕС‚ Рё РјРѕРЅРµС‚, СЏРІР»СЏСЋС‰РёС…СЃСЏ Р·Р°РєРѕРЅРЅС‹РјРё СЃСЂРµРґСЃС‚РІР°РјРё РїР»Р°С‚РµР¶Р°, Р° С‚Р°РєР¶Рµ С†РµРЅРЅС‹С… Р±СѓРјР°Рі, Р°РєС†РёР·РЅС‹С… РјР°СЂРѕРє, РјР°СЂРѕРє С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РєРѕРЅС‚СЂРѕР»СЏ, РјР°СЂРѕРє РїРѕС€Р»РёРЅ Рё СЃР±РѕСЂРѕРІ, СѓРїР»Р°С‡РёРІР°РµРјС‹С… РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (128, 'Р‘Р“', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РѕС‚РЅРѕСЃСЏС‰РёС…СЃСЏ Рє РёРЅРѕСЃС‚СЂР°РЅРЅРѕР№ Р±РµР·РІРѕР·РјРµР·РґРЅРѕР№ РїРѕРјРѕС‰Рё', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (129, 'Р‘Рў', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРѕР»СѓС‡Р°РµРјС‹С… (РїРѕР»СѓС‡РµРЅРЅС‹С…) РІ РєР°С‡РµСЃС‚РІРµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕР№ С‚РµС…РЅРёС‡РµСЃРєРѕР№ РїРѕРјРѕС‰Рё Рё (РёР»Рё) РїСЂРёРѕР±СЂРµС‚РµРЅРЅС‹С… Р·Р° СЃС‡РµС‚ СЃСЂРµРґСЃС‚РІ РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕР№ С‚РµС…РЅРёС‡РµСЃРєРѕР№ РїРѕРјРѕС‰Рё, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ С†РµР»РµР№, РѕРїСЂРµРґРµР»РµРЅРЅС‹С… РїСЂРѕРµРєС‚РѕРј (РїСЂРѕРіСЂР°РјРјРѕР№) РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕР№ С‚РµС…РЅРёС‡РµСЃРєРѕР№ РїРѕРјРѕС‰Рё', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (130, 'РњР�', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РµС…РЅРёС‡РµСЃРєРёС… СЃСЂРµРґСЃС‚РІ, РєРѕС‚РѕСЂС‹Рµ РЅРµ РјРѕРіСѓС‚ Р±С‹С‚СЊ РёСЃРїРѕР»СЊР·РѕРІР°РЅС‹ РёРЅР°С‡Рµ РєР°Рє РґР»СЏ РїСЂРѕС„РёР»Р°РєС‚РёРєРё РёРЅРІР°Р»РёРґРЅРѕСЃС‚Рё Рё (РёР»Рё) СЂРµР°Р±РёР»РёС‚Р°С†РёРё РёРЅРІР°Р»РёРґРѕРІ', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (131, 'РњР›', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ, РёР·РґРµР»РёР№ РјРµРґРёС†РёРЅСЃРєРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ, РїСЂРѕС‚РµР·РЅРѕ-РѕСЂС‚РѕРїРµРґРёС‡РµСЃРєРёС… РёР·РґРµР»РёР№ Рё РјРµРґРёС†РёРЅСЃРєРѕР№ С‚РµС…РЅРёРєРё, Р° С‚Р°РєР¶Рµ СЃС‹СЂСЊСЏ, РјР°С‚РµСЂРёР°Р»РѕРІ РґР»СЏ РёС… РёР·РіРѕС‚РѕРІР»РµРЅРёСЏ, РєРѕРјРїР»РµРєС‚СѓСЋС‰РёС… РёР·РґРµР»РёР№ РґР»СЏ РёС… РїСЂРѕРёР·РІРѕРґСЃС‚РІР°, РїРѕР»СѓС„Р°Р±СЂРёРєР°С‚РѕРІ Рє РЅРёРј', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (132, 'РЎРЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё СЃРїРµС†РёР°Р»СЊРЅРѕ РѕР±РѕСЂСѓРґРѕРІР°РЅРЅС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ РґР»СЏ РЅСѓР¶Рґ СЃРєРѕСЂРѕР№ РјРµРґРёС†РёРЅСЃРєРѕР№ РїРѕРјРѕС‰Рё, РѕСЂРіР°РЅРѕРІ Рё РїРѕРґСЂР°Р·РґРµР»РµРЅРёР№ РїРѕ С‡СЂРµР·РІС‹С‡Р°Р№РЅС‹Рј СЃРёС‚СѓР°С†РёСЏРј, Р°РІР°СЂРёР№РЅРѕ-СЃРїР°СЃР°С‚РµР»СЊРЅС‹С… СЃР»СѓР¶Р±, РѕСЂРіР°РЅРѕРІ РІРЅСѓС‚СЂРµРЅРЅРёС… РґРµР»', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (133, 'Р‘РЎ', 'Р‘Р°РЅРєРѕРІСЃРєРёРµ Рё РјРµСЂРЅС‹Рµ СЃР»РёС‚РєРё РёР· РґСЂР°РіРѕС†РµРЅРЅС‹С… РјРµС‚Р°Р»Р»РѕРІ, РІРІРѕР·РёРјС‹Рµ Р±Р°РЅРєР°РјРё РґР»СЏ РѕСЃСѓС‰РµСЃС‚РІР»РµРЅРёСЏ Р±Р°РЅРєРѕРІСЃРєРёС… РѕРїРµСЂР°С†РёР№ Рё РёРЅС‹РјРё РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё РґР»СЏ СЂРµР°Р»РёР·Р°С†РёРё РёС… Р±Р°РЅРєР°Рј', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (134, 'Р“Р—', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РµС…РЅРѕР»РѕРіРёС‡РµСЃРєРѕРіРѕ РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ Рё Р·Р°РїР°СЃРЅС‹С… С‡Р°СЃС‚РµР№ Рє РЅРµРјСѓ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ СЂРµР°Р»РёР·Р°С†РёРё РёРЅРІРµСЃС‚РёС†РёРѕРЅРЅС‹С… РїСЂРѕРµРєС‚РѕРІ, С„РёРЅР°РЅСЃРёСЂСѓРµРјС‹С… Р·Р° СЃС‡РµС‚ РІРЅРµС€РЅРёС… РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹С… Р·Р°Р№РјРѕРІ (РєСЂРµРґРёС‚РѕРІ),', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (135, 'Р”Рњ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РґСЂР°РіРѕС†РµРЅРЅС‹С… РјРµС‚Р°Р»Р»РѕРІ, РґСЂР°РіРѕС†РµРЅРЅС‹С… РєР°РјРЅРµР№, Рё РёР·РґРµР»РёР№ (С‡Р°СЃС‚РµР№ РёР·РґРµР»РёР№) РёР· РЅРёС… (РєРѕРјРµ СЋРІРµР»РёСЂРЅС‹С… РёР·РґРµР»РёР№) Р° С‚Р°РєР¶Рµ РєРѕРЅС†РµРЅС‚СЂР°С‚С‹ Рё РґСЂСѓРіРёРµ РїСЂРѕРјС‹С€Р»РµРЅРЅС‹Рµ РѕС‚С…РѕРґС‹, Р»РѕРј Рё РѕС‚С…РѕРґС‹, СЃРѕРґРµСЂР¶Р°С‰РёРµ РґСЂР°РіРѕС†РµРЅРЅС‹Рµ Рё С†РІРµС‚РЅС‹Рµ РјРµС‚Р°Р»Р»С‹, РІРІРѕР·РёРјС‹Рµ РґР»СЏ РїРѕРїРѕР»РЅРµРЅРёСЏ Р“РѕСЃС„РѕРЅРґР°', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (136, 'Р•Рћ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІСЃРµС… РІРёРґРѕРІ РїРµС‡Р°С‚РЅС‹С… РёР·РґР°РЅРёР№, РїРѕР»СѓС‡Р°РµРјС‹С… РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹РјРё Р±РёР±Р»РёРѕС‚РµРєР°РјРё Рё РјСѓР·РµСЏРјРё РїРѕ РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕРјСѓ РєРЅРёРіРѕРѕР±РјРµРЅСѓ, Р° С‚Р°РєР¶Рµ РєРёРЅРѕ- Рё РІРёРґРµРѕРїСЂРѕРёР·РІРµРґРµРЅРёР№, РІРІРѕР·РёРјС‹С… РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹РјРё РєРёРЅРѕ- Рё РІРёРґРµРѕРѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё РІ С†РµР»СЏС… РѕСЃСѓС‰РµСЃС‚РІР»РµРЅРёСЏ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РЅРµРєРѕРјРјРµСЂС‡РµСЃРєРёС… РѕР±РјРµРЅРѕРІ', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (137, 'Р•РҐ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РЅРѕСЃРёС‚РµР»РµР№ СЌРєР·РµРјРїР»СЏСЂРѕРІ С„РёР»СЊРјРѕРІ, РєСѓР»СЊС‚СѓСЂРЅС‹С… С†РµРЅРЅРѕСЃС‚РµР№, РІРІРѕР·РёРјС‹С… РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё РєСѓР»СЊС‚СѓСЂС‹', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (138, 'РќР¦', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ, РїСЂРёР±РѕСЂРѕРІ, РјР°С‚РµСЂРёР°Р»РѕРІ Рё РєРѕРјРїР»РµРєС‚СѓСЋС‰РёС… РёР·РґРµР»РёР№, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РІС‹РїРѕР»РЅРµРЅРёСЏ РЅР°СѓС‡РЅРѕ-РёСЃСЃР»РµРґРѕРІР°С‚РµР»СЊСЃРєРёС…, РѕРїС‹С‚РЅРѕ-РєРѕРЅСЃС‚СЂСѓРєС‚РѕСЂСЃРєРёС… Рё РѕРїС‹С‚РЅРѕ-С‚РµС…РЅРѕР»РѕРіРёС‡РµСЃРєРёС… СЂР°Р±РѕС‚', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (139, 'Р›Рћ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё, РѕСЃСѓС‰РµСЃС‚РІР»СЏСЋС‰РёРјРё РїСЂРѕРёР·РІРѕРґСЃС‚РІРѕ Р»Р°Р·РµСЂРЅРѕ-РѕРїС‚РёС‡РµСЃРєРѕР№ С‚РµС…РЅРёРєРё, С‚РѕРІР°СЂС‹, РїСЂРёРјРµРЅСЏРµРјС‹Рµ С‚Р°РєРёРјРё РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё РІ СЃРѕСЃС‚Р°РІРµ Р»Р°Р·РµСЂРЅРѕ-РѕРїС‚РёС‡РµСЃРєРѕР№ С‚РµС…РЅРёРєРё Рё РЅРµ РїСЂРѕРёР·РІРѕРґРёРјС‹Рµ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёРё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ, Р° С‚Р°РєР¶Рµ РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµ Рё РѕСЃРЅР°СЃС‚РєР°, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РёРјРё РґР»СЏ РїСЂРѕРёР·РІРѕРґСЃС‚РІР° Р»Р°Р·РµСЂРЅРѕ-РѕРїС‚РёС‡РµСЃРєРѕР№ С‚РµС…РЅРёРєРё', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (140, 'РќР­', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё СѓСЃС‚Р°РЅРѕРІРѕРє РїРѕ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЋ РІРѕР·РѕР±РЅРѕРІР»СЏРµРјС‹С… РёСЃС‚РѕС‡РЅРёРєРѕРІ СЌРЅРµСЂРіРёРё', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (141, 'РџРў', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РµС…РЅРѕР»РѕРіРёС‡РµСЃРєРѕРіРѕ РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ, РєРѕРјРїР»РµРєС‚СѓСЋС‰РёС… Рё (РёР»Рё) Р·Р°РїР°СЃРЅС‹С… С‡Р°СЃС‚РµР№ Рє РЅРµРјСѓ, РІРІРѕР·РёРјС‹С… (РІРІРµР·РµРЅРЅС‹С…) СЂРµР·РёРґРµРЅС‚Р°РјРё РџР°СЂРєР° РІС‹СЃРѕРєРёС… С‚РµС…РЅРѕР»РѕРіРёР№', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (142, 'РџР”', 'РџСЂРёРјРµРЅРµРЅРёРµ СЃС‚Р°РІРєРё РќР”РЎ РІ СЂР°Р·РјРµСЂРµ 10% РІ РѕС‚РЅРѕС€РµРЅРёРё РїСЂРѕРґРѕРІРѕР»СЊСЃС‚РІРµРЅРЅС‹С… С‚РѕРІР°СЂРѕРІ Рё С‚РѕРІР°СЂРѕРІ РґР»СЏ РґРµС‚РµР№', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (143, 'Р§Рќ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… (РІРІРµР·РµРЅРЅС‹С…) РІ С†РµР»СЏС… РїСЂРѕРІРµРґРµРЅРёСЏ Р§РµРјРїРёРѕРЅР°С‚Р° РјРёСЂР° РїРѕ С…РѕРєРєРµСЋ РІ 2014 РіРѕРґСѓ РІ РіРѕСЂРѕРґРµ РњРёРЅСЃРєРµ', 'BY', '2.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (144, 'РњР®', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё, РёС… РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІР°РјРё РЅР° С‚РµСЂСЂРёС‚РѕСЂРёРё Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'BY', '2.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (145, 'РњР’', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ Рѕ РІРѕР·РґСѓС€РЅРѕРј СЃРѕРѕР±С‰РµРЅРёРё', 'BY', '2.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (146, 'РќР�', '2.4.3. Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Р°С… 1.3. Рё 2.4, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'BY', '2.4.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (147, 'РўРЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ, РѕСЃСѓС‰РµСЃС‚РІР»СЏСЋС‰РёС… СЂРµРіСѓР»СЏСЂРЅС‹Рµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹Рµ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ, Р±Р°РіР°Р¶Р° Рё РїР°СЃСЃР°Р¶РёСЂРѕРІ, Р° С‚Р°РєР¶Рµ РїСЂРµРґРјРµС‚РѕРІ РјР°С‚РµСЂРёР°Р»СЊРЅРѕ-С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЃРЅР°Р±Р¶РµРЅРёСЏ, СЃРЅР°СЂСЏР¶РµРЅРёСЏ, С‚РѕРїР»РёРІР°, РїСЂРѕРґРѕРІРѕР»СЊСЃС‚РІРёСЏ Рё РґСЂСѓРіРѕРіРѕ РёРјСѓС‰РµСЃС‚РІР°, РЅРµРѕР±С…РѕРґРёРјС‹С… РґР»СЏ РёС… СЌРєСЃРїР»СѓР°С‚Р°С†РёРё РІРѕ РІСЂРµРјСЏ СЃР»РµРґРѕРІР°РЅРёСЏ РІ РїСѓС‚Рё, РІ РїСѓРЅРєС‚Р°С… РїСЂРѕРјРµР¶СѓС‚РѕС‡РЅРѕР№ РѕСЃС‚Р°РЅРѕРІРєРё РёР»Рё РїСЂРёРѕР±СЂРµС‚РµРЅРЅС‹С… Р·Р° РіСЂР°РЅРёС†РµР№ РІ СЃРІСЏР·Рё СЃ Р»РёРєРІРёРґР°С†РёРµР№ Р°РІР°СЂРёРё (РїРѕР»РѕРјРєРё) РґР°РЅРЅС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ', 'KZ', '3.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (148, 'РЎРњ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ РІ РѕС‚РЅРѕС€РµРЅРёРё РїСЂРµРґРјРµС‚РѕРІ РјР°С‚РµСЂРёР°Р»СЊРЅРѕ-С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЃРЅР°Р±Р¶РµРЅРёСЏ, СЃРЅР°СЂСЏР¶РµРЅРёСЏ, С‚РѕРїР»РёРІР°, РїСЂРѕРґРѕРІРѕР»СЊСЃС‚РІРёСЏ Рё РґСЂСѓРіРѕРіРѕ РёРјСѓС‰РµСЃС‚РІР°, РІС‹РІРѕР·РёРјС‹С… Р·Р° РїСЂРµРґРµР»С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РґР»СЏ РѕР±РµСЃРїРµС‡РµРЅРёСЏ РїСЂРѕРёР·РІРѕРґСЃС‚РІРµРЅРЅРѕР№ РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё РєР°Р·Р°С…СЃС‚Р°РЅСЃРєРёС… РёР»Рё Р°СЂРµРЅРґРѕРІР°РЅРЅС‹С… (Р·Р°С„СЂР°С…С‚РѕРІР°РЅРЅС‹С…) РєР°Р·Р°С…СЃС‚Р°РЅСЃРєРёРјРё Р»РёС†Р°РјРё РјРѕСЂСЃРєРёС… СЃСѓРґРѕРІ, РІРµРґСѓС‰РёС… РјРѕСЂСЃРєРѕР№ РїСЂРѕРјС‹СЃРµР», Р° С‚Р°РєР¶Рµ РїСЂРѕРґСѓРєС†РёРё РёС… РїСЂРѕРјС‹СЃР»Р°, РІРІРѕР·РёРјРѕР№ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ', '3.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (149, 'Р”Рќ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ РІ РѕС‚РЅРѕС€РµРЅРёРё Р±Р°РЅРєРЅРѕС‚ Рё РјРѕРЅРµС‚ РЅР°С†РёРѕРЅР°Р»СЊРЅРѕР№ Рё РёРЅРѕСЃС‚СЂР°РЅРЅРѕР№ РІР°Р»СЋС‚С‹ (РєСЂРѕРјРµ Р±Р°РЅРєРЅРѕС‚ Рё РјРѕРЅРµС‚, РїСЂРµРґСЃС‚Р°РІР»СЏСЋС‰РёС… СЃРѕР±РѕР№ РєСѓР»СЊС‚СѓСЂРЅРѕ-РёСЃС‚РѕСЂРёС‡РµСЃРєСѓСЋ С†РµРЅРЅРѕСЃС‚СЊ), Р° С‚Р°РєР¶Рµ С†РµРЅРЅС‹С… Р±СѓРјР°Рі', 'KZ', '3.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (150, 'Р‘Р“', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїРѕРґР°РєС†РёР·РЅС‹С…, РІРІРѕР·РёРјС‹С… РІ РєР°С‡РµСЃС‚РІРµ РіСѓРјР°РЅРёС‚Р°СЂРЅРѕР№ РїРѕРјРѕС‰Рё', 'KZ', '3.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (151, 'Р‘Рџ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїРѕРґР°РєС†РёР·РЅС‹С… (РєСЂРѕРјРµ Р»РµРіРєРѕРІС‹С… Р°РІС‚РѕРјРѕР±РёР»РµР№, СЃРїРµС†РёР°Р»СЊРЅРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РјРµРґРёС†РёРЅСЃРєРёС… С†РµР»РµР№), РІРІРѕР·РёРјС‹С… РІ С†РµР»СЏС… Р±Р»Р°РіРѕС‚РІРѕСЂРёС‚РµР»СЊРЅРѕР№ РїРѕРјРѕС‰Рё РїРѕ Р»РёРЅРёРё РіРѕСЃСѓРґР°СЂСЃС‚РІ, РїСЂР°РІРёС‚РµР»СЊСЃС‚РІ РіРѕСЃСѓРґР°СЂСЃС‚РІ, РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№', 'KZ', '3.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (152, 'РџР ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ РІ РѕР±Р»Р°СЃС‚Рё РїСЂРµРґРѕС‚РІСЂР°С‰РµРЅРёСЏ СЂР°СЃРїСЂРѕСЃС‚СЂР°РЅРµРЅРёСЏ СЏРґРµСЂРЅРѕРіРѕ РѕСЂСѓР¶РёСЏ', 'KZ', '3.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (153, 'РўРҐ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїРѕРґР°РєС†РёР·РЅС‹С… (РєСЂРѕРјРµ Р»РµРіРєРѕРІС‹С… Р°РІС‚РѕРјРѕР±РёР»РµР№, СЃРїРµС†РёР°Р»СЊРЅРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РјРµРґРёС†РёРЅСЃРєРёС… С†РµР»РµР№), РІРІРѕР·РёРјС‹С… РІ С†РµР»СЏС… РѕРєР°Р·Р°РЅРёСЏ С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЃРѕРґРµР№СЃС‚РІРёСЏ РїРѕ Р»РёРЅРёРё РіРѕСЃСѓРґР°СЂСЃС‚РІ, РїСЂР°РІРёС‚РµР»СЊСЃС‚РІ РіРѕСЃСѓРґР°СЂСЃС‚РІ, РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№', 'KZ', '3.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (173, 'Р Рќ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РїСЂРµРґРјРµС‚РѕРІ СЂРµР»РёРіРёРѕР·РЅРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ, РІРІРѕР·РёРјС‹С… СЂРµР»РёРіРёРѕР·РЅС‹РјРё РѕР±СЉРµРґРёРЅРµРЅРёСЏРјРё, Р·Р°СЂРµРіРёСЃС‚СЂРёСЂРѕРІР°РЅРЅС‹РјРё РІ РѕСЂРіР°РЅР°С… СЋСЃС‚РёС†РёРё Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (154, 'Р“Р ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїСЂРёРѕР±СЂРµС‚Р°РµРјС‹С… Р·Р° СЃС‡РµС‚ СЃСЂРµРґСЃС‚РІ РіСЂР°РЅС‚РѕРІ, РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРЅС‹С… РїРѕ Р»РёРЅРёРё РіРѕСЃСѓРґР°СЂСЃС‚РІ, РїСЂР°РІРёС‚РµР»СЊСЃС‚РІ РіРѕСЃСѓРґР°СЂСЃС‚РІ, Р° С‚Р°РєР¶Рµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№, РѕРїСЂРµРґРµР»РµРЅРЅС‹С… РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РЅР°Р»РѕРіРѕРІС‹Рј Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ', '3.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (155, 'Р”РЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ РІ РѕС‚РЅРѕС€РµРЅРёРё СЃС‹СЂСЊСЏ, РІРІРѕР·РёРјРѕРіРѕ РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рј Р‘Р°РЅРєРѕРј Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ Рё РµРіРѕ С„РёР»РёР°Р»Р°РјРё, РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІР°РјРё Рё РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё РґР»СЏ РїСЂРѕРёР·РІРѕРґСЃС‚РІР° РґРµРЅРµР¶РЅС‹С… Р·РЅР°РєРѕРІ', 'KZ', '3.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (156, 'РњР”', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… Рё РІС‹РІРѕР·РёРјС‹С… РґР»СЏ РѕС„РёС†РёР°Р»СЊРЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ РёРЅРѕСЃС‚СЂР°РЅРЅС‹РјРё РґРёРїР»РѕРјР°С‚РёС‡РµСЃРєРёРјРё Рё РїСЂРёСЂР°РІРЅРµРЅРЅС‹РјРё Рє РЅРёРј РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІР°РјРё, РєРѕРЅСЃСѓР»СЊСЃРєРёРјРё СѓС‡СЂРµР¶РґРµРЅРёСЏРјРё, Р° С‚Р°РєР¶Рµ РґР»СЏ Р»РёС‡РЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ Р»РёС†Р°РјРё, РѕС‚РЅРѕСЃСЏС‰РёРјРёСЃСЏ Рє РґРёРїР»РѕРјР°С‚РёС‡РµСЃРєРѕРјСѓ Рё Р°РґРјРёРЅРёСЃС‚СЂР°С‚РёРІРЅРѕ-С‚РµС…РЅРёС‡РµСЃРєРѕРјСѓ РїРµСЂСЃРѕРЅР°Р»Сѓ СЌС‚РёС… РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ, РІРєР»СЋС‡Р°СЏ С‡Р»РµРЅРѕРІ РёС… СЃРµРјРµР№, РїСЂРѕР¶РёРІР°СЋС‰РёС… РІРјРµСЃС‚Рµ СЃ РЅРёРјРё, РЅРµ СЏРІР»СЏСЋС‰РёС…СЃСЏ РіСЂР°Р¶РґР°РЅР°РјРё Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ Рё РѕСЃРІРѕР±РѕР¶РґР°РµРјС‹С… РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ', '3.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (157, 'РњР®', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РґР»СЏ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РјРµР¶РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹С… Рё РјРµР¶РїСЂР°РІРёС‚РµР»СЊСЃС‚РІРµРЅРЅС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№, РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… РіРѕСЃСѓРґР°СЂСЃС‚РІ РїСЂРё РЅРёС…, Р° С‚Р°РєР¶Рµ РґР»СЏ РїРµСЂСЃРѕРЅР°Р»Р° СЌС‚РёС… РѕСЂРіР°РЅРёР·Р°С†РёР№ Рё РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ Рё С‡Р»РµРЅРѕРІ РёС… СЃРµРјРµР№', 'KZ', '3.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (158, 'РњР’', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ Рѕ РІРѕР·РґСѓС€РЅРѕРј СЃРѕРѕР±С‰РµРЅРёРё', 'KZ', '3.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (159, 'РњРђ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ РѕР± Р°РІС‚РѕРјРѕР±РёР»СЊРЅРѕРј СЃРѕРѕР±С‰РµРЅРёРё', 'KZ', '3.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (160, 'РџР ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ РІ РѕР±Р»Р°СЃС‚Рё РїСЂРµРґРѕС‚РІСЂР°С‰РµРЅРёСЏ СЂР°СЃРїСЂРѕСЃС‚СЂР°РЅРµРЅРёСЏ СЏРґРµСЂРЅРѕРіРѕ РѕСЂСѓР¶РёСЏ', 'KZ', '3.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (161, 'Р’Р ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ РІ РѕС‚РЅРѕС€РµРЅРёРё РїСЂРѕРґСѓРєС†РёРё РІРѕРµРЅРЅРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ Рё РІРѕРµРЅРЅРѕР№ С‚РµС…РЅРёРєРё, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ', 'KZ', '3.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (162, 'РњР“', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ Рѕ СЃРѕС‚СЂСѓРґРЅРёС‡РµСЃС‚РІРµ РІ РѕР±Р»Р°СЃС‚Рё РіСЂР°Р¶РґР°РЅСЃРєРѕР№ РѕР±РѕСЂРѕРЅС‹, РїСЂРµРґСѓРїСЂРµР¶РґРµРЅРёСЏ Рё Р»РёРєРІРёРґР°С†РёРё С‡СЂРµР·РІС‹С‡Р°Р№РЅС‹С… СЃРёС‚СѓР°С†РёР№', 'KZ', '3.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (163, 'РњРЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РёРЅС‹С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ', '3.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (164, 'РџРџ', '3.1.3.В РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРѕРјРµС‰Р°РµРјС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ РѕС‚РєР°Р·Р° РІ РїРѕР»СЊР·Сѓ РіРѕСЃСѓРґР°СЂСЃС‚РІР°', 'KZ', '3.1.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (165, 'РћРћ', '3.1.4.В РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ РЅРµ РёСЃРїРѕР»СЊР·СѓРµС‚СЃСЏ (РЅРµ Р·Р°РїСЂР°С€РёРІР°РµС‚СЃСЏ)', 'KZ', '3.1.4');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (166, 'РЎР�', '3.1.5.В Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Рµ 3.1, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅРѕРµ РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ', 'KZ', '3.1.5');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (167, 'РњР®', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РґР»СЏ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РјРµР¶РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹С… Рё РјРµР¶РїСЂР°РІРёС‚РµР»СЊСЃС‚РІРµРЅРЅС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№, РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… РіРѕСЃСѓРґР°СЂСЃС‚РІ РїСЂРё РЅРёС…, Р° С‚Р°РєР¶Рµ РґР»СЏ РїРµСЂСЃРѕРЅР°Р»Р° СЌС‚РёС… РѕСЂРіР°РЅРёР·Р°С†РёР№ Рё РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ Рё С‡Р»РµРЅРѕРІ РёС… СЃРµРјРµР№', 'KZ', '3.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (168, 'РњР’', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ Рѕ РІРѕР·РґСѓС€РЅРѕРј СЃРѕРѕР±С‰РµРЅРёРё', 'KZ', '3.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (169, 'РњРђ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ РѕР± Р°РІС‚РѕРјРѕР±РёР»СЊРЅРѕРј СЃРѕРѕР±С‰РµРЅРёРё', 'KZ', '3.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (170, 'Р’Р ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ РѕС‚РЅРѕС€РµРЅРёРё РїСЂРѕРґСѓРєС†РёРё РІРѕРµРЅРЅРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ Рё РІРѕРµРЅРЅРѕР№ С‚РµС…РЅРёРєРё, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ', 'KZ', '3.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (171, 'РњР“', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ Рѕ СЃРѕС‚СЂСѓРґРЅРёС‡РµСЃС‚РІРµ РІ РѕР±Р»Р°СЃС‚Рё РіСЂР°Р¶РґР°РЅСЃРєРѕР№ РѕР±РѕСЂРѕРЅС‹, РїСЂРµРґСѓРїСЂРµР¶РґРµРЅРёСЏ Рё Р»РёРєРІРёРґР°С†РёРё С‡СЂРµР·РІС‹С‡Р°Р№РЅС‹С… СЃРёС‚СѓР°С†РёР№', 'KZ', '3.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (174, 'Р­Рљ', '3.2.2.В РўР°СЂРёС„РЅР°СЏ РїСЂРµС„РµСЂРµРЅС†РёСЏ РІ РІРёРґРµ РѕСЃРІРѕР±РѕР¶РґРµРЅРёСЏ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїСЂРѕРёСЃС…РѕРґСЏС‰РёС… Рё РІРІРѕР·РёРјС‹С… РёР· РіРѕСЃСѓРґР°СЂСЃС‚РІ, РѕР±СЂР°Р·СѓСЋС‰РёС… РІРјРµСЃС‚Рµ СЃ Р РµСЃРїСѓР±Р»РёРєРѕР№ РљР°Р·Р°С…СЃС‚Р°РЅ Р·РѕРЅСѓ СЃРІРѕР±РѕРґРЅРѕР№ С‚РѕСЂРіРѕРІР»Рё, Р° С‚Р°РєР¶Рµ С‚РѕРІР°СЂРѕРІ, РїСЂРѕРёСЃС…РѕРґСЏС‰РёС… Рё РІС‹РІРѕР·РёРјС‹С… РёР· Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ РІ РіРѕСЃСѓРґР°СЂСЃС‚РІР°, РѕР±СЂР°Р·СѓСЋС‰РёРµ РІРјРµСЃС‚Рµ СЃ Р РµСЃРїСѓР±Р»РёРєРѕР№ РљР°Р·Р°С…СЃС‚Р°РЅ Р·РѕРЅСѓ СЃРІРѕР±РѕРґРЅРѕР№ С‚РѕСЂРіРѕРІР»Рё', 'KZ', '3.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (175, 'РџР�', '3.2.3.В Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Рµ 3.2, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ', 'KZ', '3.2.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (176, 'Рў', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё РїРѕРґР°РєС†РёР·РЅС‹С… С‚РѕРІР°СЂРѕРІ, РЅРµРѕР±С…РѕРґРёРјС‹С… РґР»СЏ СЌРєСЃРїР»СѓР°С‚Р°С†РёРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ, РѕСЃСѓС‰РµСЃС‚РІР»СЏСЋС‰РёС… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹Рµ РїРµСЂРµРІРѕР·РєРё, РІРѕ РІСЂРµРјСЏ СЃР»РµРґРѕРІР°РЅРёСЏ РІ РїСѓС‚Рё Рё РІ РїСѓРЅРєС‚Р°С… РїСЂРѕРјРµР¶СѓС‚РѕС‡РЅРѕР№ РѕСЃС‚Р°РЅРѕРІРєРё', 'KZ', '3.3.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (177, 'Р¤', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё РїРѕРґР°РєС†РёР·РЅС‹С… С‚РѕРІР°СЂРѕРІ, РѕРєР°Р·Р°РІС€РёС…СЃСЏ РІСЃР»РµРґСЃС‚РІРёРµ РїРѕРІСЂРµР¶РґРµРЅРёСЏ РґРѕ РїСЂРѕРїСѓСЃРєР° РёС… С‡РµСЂРµР· С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РіСЂР°РЅРёС†Сѓ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РЅРµ РїСЂРёРіРѕРґРЅС‹РјРё Рє РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЋ РІ РєР°С‡РµСЃС‚РІРµ РёР·РґРµР»РёР№ Рё РјР°С‚РµСЂРёР°Р»РѕРІ', 'KZ', '3.3.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (178, 'РЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё СЃРїРёСЂС‚РѕСЃРѕРґРµСЂР¶Р°С‰РµР№ РїСЂРѕРґСѓРєС†РёРё РјРµРґРёС†РёРЅСЃРєРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ (РєСЂРѕРјРµ Р±Р°Р»СЊР·Р°РјРѕРІ), Р·Р°СЂРµРіРёСЃС‚СЂРёСЂРѕРІР°РЅРЅРѕР№ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ', '3.3.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (179, 'Р”', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё РїРѕРґР°РєС†РёР·РЅС‹С… С‚РѕРІР°СЂРѕРІ, РІРІРµР·РµРЅРЅС‹С… РґР»СЏ РѕС„РёС†РёР°Р»СЊРЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ РёРЅРѕСЃС‚СЂР°РЅРЅС‹РјРё РґРёРїР»РѕРјР°С‚РёС‡РµСЃРєРёРјРё Рё РїСЂРёСЂР°РІРЅРµРЅРЅС‹РјРё Рє РЅРёРј РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІР°РјРё, Р° С‚Р°РєР¶Рµ РґР»СЏ Р»РёС‡РЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ Р»РёС†Р°РјРё РёР· С‡РёСЃР»Р° РґРёРїР»РѕРјР°С‚РёС‡РµСЃРєРѕРіРѕ Рё Р°РґРјРёРЅРёСЃС‚СЂР°С‚РёРІРЅРѕ-С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ РїРµСЂСЃРѕРЅР°Р»Р° СЌС‚РёС… РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ, РІРєР»СЋС‡Р°СЏ С‡Р»РµРЅРѕРІ РёС… СЃРµРјРµР№, РїСЂРѕР¶РёРІР°СЋС‰РёС… РІРјРµСЃС‚Рµ СЃ РЅРёРјРё', 'KZ', '3.3.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (180, 'Рџ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё РїРѕРґР°РєС†РёР·РЅС‹С… С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… С‡РµСЂРµР· С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РіСЂР°РЅРёС†Сѓ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РѕСЃРІРѕР±РѕР¶РґР°РµРјС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёРё Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ РІ СЂР°РјРєР°С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїСЂРѕС†РµРґСѓСЂ, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅС‹С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё Рё Р°РєС‚Р°РјРё, СЃРѕСЃС‚Р°РІР»СЏСЋС‰РёРјРё РїСЂР°РІРѕ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, Рё (РёР»Рё) С‚Р°РјРѕР¶РµРЅРЅС‹Рј Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїСЂРѕС†РµРґСѓСЂС‹ РІС‹РїСѓСЃРєР° РґР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ РїРѕС‚СЂРµР±Р»РµРЅРёСЏ', 'KZ', '3.3.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (181, 'Рњ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё РїРѕРґР°РєС†РёР·РЅС‹С… С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РґР»СЏ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РјРµР¶РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹С… Рё РјРµР¶РїСЂР°РІРёС‚РµР»СЊСЃС‚РІРµРЅРЅС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№, РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… РіРѕСЃСѓРґР°СЂСЃС‚РІ РїСЂРё РЅРёС…, Р° С‚Р°РєР¶Рµ РґР»СЏ РїРµСЂСЃРѕРЅР°Р»Р° СЌС‚РёС… РѕСЂРіР°РЅРёР·Р°С†РёР№ Рё РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ Рё С‡Р»РµРЅРѕРІ РёС… СЃРµРјРµР№', 'KZ', '3.3.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (182, 'Р‘', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ Рѕ РІРѕР·РґСѓС€РЅРѕРј СЃРѕРѕР±С‰РµРЅРёРё', 'KZ', '3.3.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (183, 'Р•', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ РѕР± Р°РІС‚РѕРјРѕР±РёР»СЊРЅРѕРј СЃРѕРѕР±С‰РµРЅРёРё', 'KZ', '3.3.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (184, 'Р–', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ РІ РѕР±Р»Р°СЃС‚Рё РїСЂРµРґРѕС‚РІСЂР°С‰РµРЅРёСЏ СЂР°СЃРїСЂРѕСЃС‚СЂР°РЅРµРЅРёСЏ СЏРґРµСЂРЅРѕРіРѕ РѕСЂСѓР¶РёСЏ', 'KZ', '3.3.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (185, 'Р—', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё РїСЂРѕРґСѓРєС†РёРё РІРѕРµРЅРЅРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ Рё РІРѕРµРЅРЅРѕР№ С‚РµС…РЅРёРєРё, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ', 'KZ', '3.3.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (186, 'РҐ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ Рѕ СЃРѕС‚СЂСѓРґРЅРёС‡РµСЃС‚РІРµ РІ РѕР±Р»Р°СЃС‚Рё РіСЂР°Р¶РґР°РЅСЃРєРѕР№ РѕР±РѕСЂРѕРЅС‹, РїСЂРµРґСѓРїСЂРµР¶РґРµРЅРёСЏ Рё Р»РёРєРІРёРґР°С†РёРё С‡СЂРµР·РІС‹С‡Р°Р№РЅС‹С… СЃРёС‚СѓР°С†РёР№', 'KZ', '3.3.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (187, 'Р®', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РёРЅС‹С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ', '3.3.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (188, 'Р’Рќ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјРѕРіРѕ РІ Р РµСЃРїСѓР±Р»РёРєСѓ РђСЂРјРµРЅРёСЏ РґРёР·РµР»СЊРЅРѕРіРѕ С‚РѕРїР»РёРІР°', 'AM', '5.4');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (189, 'Р�', '3.3.3.В Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Р°С… 1.2 Рё 3.3, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё РїРѕРґР°РєС†РёР·РЅС‹С… С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'KZ', '3.3.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (190, 'РњР®', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РґР»СЏ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РјРµР¶РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹С… Рё РјРµР¶РїСЂР°РІРёС‚РµР»СЊСЃС‚РІРµРЅРЅС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№, РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… РіРѕСЃСѓРґР°СЂСЃС‚РІ РїСЂРё РЅРёС…, Р° С‚Р°РєР¶Рµ РґР»СЏ РїРµСЂСЃРѕРЅР°Р»Р° СЌС‚РёС… РѕСЂРіР°РЅРёР·Р°С†РёР№ Рё РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ Рё С‡Р»РµРЅРѕРІ РёС… СЃРµРјРµР№', 'KZ', '3.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (191, 'РњР’', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ Рѕ РІРѕР·РґСѓС€РЅРѕРј СЃРѕРѕР±С‰РµРЅРёРё', 'KZ', '3.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (192, 'РњРђ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ РѕР± Р°РІС‚РѕРјРѕР±РёР»СЊРЅРѕРј СЃРѕРѕР±С‰РµРЅРёРё', 'KZ', '3.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (193, 'РџР ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ РІ РѕР±Р»Р°СЃС‚Рё РїСЂРµРґРѕС‚РІСЂР°С‰РµРЅРёСЏ СЂР°СЃРїСЂРѕСЃС‚СЂР°РЅРµРЅРёСЏ СЏРґРµСЂРЅРѕРіРѕ РѕСЂСѓР¶РёСЏ', 'KZ', '3.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (194, 'Р’Р ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РїСЂРѕРґСѓРєС†РёРё РІРѕРµРЅРЅРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ Рё РІРѕРµРЅРЅРѕР№ С‚РµС…РЅРёРєРё, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ', 'KZ', '3.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (195, 'РњР“', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ Рѕ СЃРѕС‚СЂСѓРґРЅРёС‡РµСЃС‚РІРµ РІ РѕР±Р»Р°СЃС‚Рё РіСЂР°Р¶РґР°РЅСЃРєРѕР№ РѕР±РѕСЂРѕРЅС‹, РїСЂРµРґСѓРїСЂРµР¶РґРµРЅРёСЏ Рё Р»РёРєРІРёРґР°С†РёРё С‡СЂРµР·РІС‹С‡Р°Р№РЅС‹С… СЃРёС‚СѓР°С†РёР№', 'KZ', '3.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (196, 'РўРў', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё Р±Р°РЅРєРЅРѕС‚ Рё РјРѕРЅРµС‚ РЅР°С†РёРѕРЅР°Р»СЊРЅРѕР№ Рё РёРЅРѕСЃС‚СЂР°РЅРЅРѕР№ РІР°Р»СЋС‚С‹ (РєСЂРѕРјРµ Р±Р°РЅРєРЅРѕС‚ Рё РјРѕРЅРµС‚, РїСЂРµРґСЃС‚Р°РІР»СЏСЋС‰РёС… СЃРѕР±РѕР№ РєСѓР»СЊС‚СѓСЂРЅРѕ-РёСЃС‚РѕСЂРёС‡РµСЃРєСѓСЋ С†РµРЅРЅРѕСЃС‚СЊ), Р° С‚Р°РєР¶Рµ С†РµРЅРЅС‹С… Р±СѓРјР°Рі, РІРІРѕР·РёРјС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (197, 'РџР§', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РїРѕС‡С‚РѕРІС‹С… РјР°СЂРѕРє (РєСЂРѕРјРµ РєРѕР»Р»РµРєС†РёРѕРЅРЅС‹С…), РІРІРѕР·РёРјС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (198, 'Р”РЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё СЃС‹СЂСЊСЏ РґР»СЏ РїСЂРѕРёР·РІРѕРґСЃС‚РІР° РґРµРЅРµР¶РЅС‹С… Р·РЅР°РєРѕРІ, РІРІРѕР·РёРјРѕРіРѕ РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рј Р‘Р°РЅРєРѕРј Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ Рё РµРіРѕ РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (199, 'Р¤Р‘', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… С„РёР·РёС‡РµСЃРєРёРјРё Р»РёС†Р°РјРё РїРѕ РЅРѕСЂРјР°Рј Р±РµСЃРїРѕС€Р»РёРЅРЅРѕРіРѕ РІРІРѕР·Р° С‚РѕРІР°СЂРѕРІ, СѓС‚РІРµСЂР¶РґРµРЅРЅС‹Рј РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ СЂРµРіСѓР»РёСЂСѓСЋС‰РёРјРё С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РїСЂР°РІРѕРѕС‚РЅРѕС€РµРЅРёСЏ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё Рё Р°РєС‚Р°РјРё, СЃРѕСЃС‚Р°РІР»СЏСЋС‰РёРјРё РїСЂР°РІРѕ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, Рё (РёР»Рё) С‚Р°РјРѕР¶РµРЅРЅС‹Рј Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (200, 'Р�Р—', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РёРЅРІРµСЃС‚РёС†РёРѕРЅРЅРѕРіРѕ Р·РѕР»РѕС‚Р°, РёРјРїРѕСЂС‚РёСЂСѓРµРјРѕРіРѕ РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рј Р‘Р°РЅРєРѕРј Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (201, 'РљР”', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РєРѕСЃРјРёС‡РµСЃРєРёС… РѕР±СЉРµРєС‚РѕРІ, РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ РѕР±СЉРµРєС‚РѕРІ РЅР°Р·РµРјРЅРѕР№ РєРѕСЃРјРёС‡РµСЃРєРѕР№ РёРЅС„СЂР°СЃС‚СЂСѓРєС‚СѓСЂС‹, РІРІРѕР·РёРјС‹С… СѓС‡Р°СЃС‚РЅРёРєР°РјРё РєРѕСЃРјРёС‡РµСЃРєРѕР№ РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё, РїРµСЂРµС‡РµРЅСЊ РєРѕС‚РѕСЂС‹С… РѕРїСЂРµРґРµР»РµРЅ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (202, 'Р—РЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РёРјРїРѕСЂС‚Р° Р·Р°СЂРµРіРёСЃС‚СЂРёСЂРѕРІР°РЅРЅС‹С… РІ Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕРј СЂРµРµСЃС‚СЂРµ Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ, РёР·РґРµР»РёР№ РјРµРґРёС†РёРЅСЃРєРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ Рё РјРµРґРёС†РёРЅСЃРєРѕР№ С‚РµС…РЅРёРєРё Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ Р»СЋР±С‹С… С„РѕСЂРј, РёР·РґРµР»РёР№ РјРµРґРёС†РёРЅСЃРєРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ Рё РјРµРґРёС†РёРЅСЃРєРѕР№ С‚РµС…РЅРёРєРё', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (203, 'РЎРќ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РёРјРїРѕСЂС‚Р° РЅРµ Р·Р°СЂРµРіРёСЃС‚СЂРёСЂРѕРІР°РЅРЅС‹С… РІ Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕРј СЂРµРµСЃС‚СЂРµ Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ, РёР·РґРµР»РёР№ РјРµРґРёС†РёРЅСЃРєРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ Рё РјРµРґРёС†РёРЅСЃРєРѕР№ С‚РµС…РЅРёРєРё Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ Р»СЋР±С‹С… С„РѕСЂРј, РёР·РґРµР»РёР№ РјРµРґРёС†РёРЅСЃРєРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ Рё РјРµРґРёС†РёРЅСЃРєРѕР№ С‚РµС…РЅРёРєРё', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (204, 'Р—Р“', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РёРјРїРѕСЂС‚Р° Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ Р»СЋР±С‹С… С„РѕСЂРј, РёР·РґРµР»РёР№ РјРµРґРёС†РёРЅСЃРєРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ Рё РјРµРґРёС†РёРЅСЃРєРѕР№ С‚РµС…РЅРёРєРё РІ СЂР°РјРєР°С… РґРѕРіРѕРІРѕСЂРѕРІ Рѕ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹С… Р·Р°РєСѓРїРєР°С…', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (205, 'Р“РЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РёРјРїРѕСЂС‚Р° РјР°С‚РµСЂРёР°Р»РѕРІ, РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ, СЃС‹СЂСЊСЏ Рё РєРѕРјРїР»РµРєС‚СѓСЋС‰РёС… РґР»СЏ РїСЂРѕРёР·РІРѕРґСЃС‚РІР° Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ Р»СЋР±С‹С… С„РѕСЂРј, РІ С‚РѕРј С‡РёСЃР»Рµ Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСѓР±СЃС‚Р°РЅС†РёР№, РёР·РґРµР»РёР№ РјРµРґРёС†РёРЅСЃРєРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ, РІРєР»СЋС‡Р°СЏ РїСЂРѕС‚РµР·РЅРѕ-РѕСЂС‚РѕРїРµРґРёС‡РµСЃРєРёРµ РёР·РґРµР»РёСЏ, Рё РјРµРґРёС†РёРЅСЃРєРѕР№ С‚РµС…РЅРёРєРё', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (206, 'РЎР�', '4.1.3. Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Рµ 4.1., Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ Рё РІС‹РІРѕР·РёРјС‹С… РёР· Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU', '4.1.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (207, 'Р›Р–', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РёРјРїРѕСЂС‚Р° Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ, РёСЃРїРѕР»СЊР·СѓРµРјС‹С… (РїСЂРёРјРµРЅСЏРµРјС‹С…) РІ РѕР±Р»Р°СЃС‚Рё РІРµС‚РµСЂРёРЅР°СЂРёРё, РёР·РґРµР»РёР№ РІРµС‚РµСЂРёРЅР°СЂРЅРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ Рё РІРµС‚РµСЂРёРЅР°СЂРЅРѕР№ С‚РµС…РЅРёРєРё, СЃСѓСЂРґРѕС‚РёС„Р»РѕС‚РµС…РЅРёРєРё, РІРєР»СЋС‡Р°СЏ РїСЂРѕС‚РµР·РЅРѕ-РѕСЂС‚РѕРїРµРґРёС‡РµСЃРєРёРµ РёР·РґРµР»РёСЏ, СЃРїРµС†РёР°Р»СЊРЅС‹С… СЃСЂРµРґСЃС‚РІ РїРµСЂРµРґРІРёР¶РµРЅРёСЏ, РїСЂРµРґРѕСЃС‚Р°РІР»СЏРµРјС‹С… РёРЅРІР°Р»РёРґР°Рј,  РјР°С‚РµСЂРёР°Р»РѕРІ, РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ Рё РєРѕРјРїР»РµРєС‚СѓСЋС‰РёС… РґР»СЏ РїСЂРѕРёР·РІРѕРґСЃС‚РІР° Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ Р»СЋР±С‹С… С„РѕСЂРј, РёР·РґРµР»РёР№ РјРµРґРёС†РёРЅСЃРєРѕРіРѕ (РІРµС‚РµСЂРёРЅР°СЂРЅРѕРіРѕ) РЅР°Р·РЅР°С‡РµРЅРёСЏ, РІРєР»СЋС‡Р°СЏ РїСЂРѕС‚РµР·РЅРѕ-РѕСЂС‚РѕРїРµРґРёС‡РµСЃРєРёРµ РёР·РґРµР»РёСЏ, Рё РјРµРґРёС†РёРЅСЃРєРѕР№ (РІРµС‚РµСЂРёРЅР°СЂРЅРѕР№) С‚РµС…РЅРёРєРё', 'KZ', '3.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (208, 'РќРЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј С‚РѕРІР°СЂРѕРІ РґР»СЏ Р»РёС‡РЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ), РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РёР»Рё РІС‹РІРѕР·РёРјС‹С… РёР· Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РІ Р°РґСЂРµСЃ РѕРґРЅРѕРіРѕ РїРѕР»СѓС‡Р°С‚РµР»СЏ РѕС‚ РѕРґРЅРѕРіРѕ РѕС‚РїСЂР°РІРёС‚РµР»СЏ РїРѕ РѕРґРЅРѕРјСѓ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРјСѓ (РїРµСЂРµРІРѕР·РѕС‡РЅРѕРјСѓ) РґРѕРєСѓРјРµРЅС‚Сѓ, РѕР±С‰Р°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ СЃС‚РѕРёРјРѕСЃС‚СЊ РєРѕС‚РѕСЂС‹С… РЅРµ РїСЂРµРІС‹С€Р°РµС‚ СЃСѓРјРјС‹, СЌРєРІРёРІР°Р»РµРЅС‚РЅРѕР№ 200 (РґРІСѓРјСЃС‚Р°Рј) РµРІСЂРѕ РїРѕ РєСѓСЂСЃСѓ Р¦РµРЅС‚СЂР°Р»СЊРЅРѕРіРѕ Р±Р°РЅРєР° Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё, РґРµР№СЃС‚РІСѓСЋС‰РµРјСѓ РЅР° РјРѕРјРµРЅС‚ СЂРµРіРёСЃС‚СЂР°С†РёРё С‚Р°РјРѕР¶РµРЅРЅРѕР№ РґРµРєР»Р°СЂР°С†РёРё С‚Р°РјРѕР¶РµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (209, 'Р—Рњ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РїСЂРѕРІРµРґРµРЅРёСЏ РєРёРЅРѕСЃСЉРµРјРѕРє, РїСЂРµРґСЃС‚Р°РІР»РµРЅРёР№, СЃРїРµРєС‚Р°РєР»РµР№ Рё РїРѕРґРѕР±РЅС‹С… РјРµСЂРѕРїСЂРёСЏС‚РёР№ (С‚РµР°С‚СЂР°Р»СЊРЅС‹С… РєРѕСЃС‚СЋРјРѕРІ, С†РёСЂРєРѕРІС‹С… РєРѕСЃС‚СЋРјРѕРІ, РєРёРЅРѕРєРѕСЃС‚СЋРјРѕРІ, СЃС†РµРЅРёС‡РµСЃРєРѕРіРѕ РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ, РїР°СЂС‚РёС‚СѓСЂ, РјСѓР·С‹РєР°Р»СЊРЅС‹С… РёРЅСЃС‚СЂСѓРјРµРЅС‚РѕРІ Рё РґСЂСѓРіРѕРіРѕ С‚РµР°С‚СЂР°Р»СЊРЅРѕРіРѕ СЂРµРєРІРёР·РёС‚Р°, С†РёСЂРєРѕРІРѕРіРѕ СЂРµРєРІРёР·РёС‚Р°, РєРёРЅРѕСЂРµРєРІРёР·РёС‚Р°), РїРѕРјРµС‰Р°РµРјС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° (РґРѕРїСѓСЃРєР°) РёР»Рё С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ РІСЂРµРјРµРЅРЅРѕРіРѕ РІС‹РІРѕР·Р° Рё РїСЂРё РёС… РѕР±СЂР°С‚РЅРѕРј РІС‹РІРѕР·Рµ (СЂРµСЌРєСЃРїРѕСЂС‚Рµ) РёР»Рё РѕР±СЂР°С‚РЅРѕРј РІРІРѕР·Рµ (СЂРµРёРјРїРѕСЂС‚Рµ), РµСЃР»Рё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚Р°РєРёС… С‚РѕРІР°СЂРѕРІ РїСЂРµРґРѕСЃС‚Р°РІР»СЏРµС‚СЃСЏ РїРѕР»РЅРѕРµ СѓСЃР»РѕРІРЅРѕРµ РѕСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (210, 'РЎРњ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ СЃРїРѕСЂС‚РёРІРЅС‹С… СЃРѕСЂРµРІРЅРѕРІР°РЅРёР№, РїРѕРєР°Р·Р°С‚РµР»СЊРЅС‹С… СЃРїРѕСЂС‚РёРІРЅС‹С… РјРµСЂРѕРїСЂРёСЏС‚РёР№ РёР»Рё С‚СЂРµРЅРёСЂРѕРІРѕРє, РїРѕРјРµС‰Р°РµРјС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° (РґРѕРїСѓСЃРєР°) РёР»Рё С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ РІСЂРµРјРµРЅРЅРѕРіРѕ РІС‹РІРѕР·Р° Рё РїСЂРё Р·Р°РІРµСЂС€РµРЅРёРё СѓРєР°Р·Р°РЅРЅС‹С… РїСЂРѕС†РµРґСѓСЂ РїРѕРјРµС‰РµРЅРёРµРј С‚РѕРІР°СЂРѕРІ РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ СЂРµСЌРєСЃРїРѕСЂС‚Р° Рё СЂРµРёРјРїРѕСЂС‚Р° СЃРѕРѕС‚РІРµС‚СЃС‚РІРµРЅРЅРѕ', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (211, 'РљР¦', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё РєСѓР»СЊС‚СѓСЂРЅС‹С… С†РµРЅРЅРѕСЃС‚РµР№, РїРѕРјРµС‰Р°РµРјС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° (РґРѕРїСѓСЃРєР°) РёР»Рё С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ РІСЂРµРјРµРЅРЅРѕРіРѕ РІС‹РІРѕР·Р° СЂРѕСЃСЃРёР№СЃРєРёРјРё РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹РјРё РёР»Рё РјСѓРЅРёС†РёРїР°Р»СЊРЅС‹РјРё РјСѓР·РµСЏРјРё, Р°СЂС…РёРІР°РјРё, Р±РёР±Р»РёРѕС‚РµРєР°РјРё, РёРЅС‹РјРё РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹РјРё С…СЂР°РЅРёР»РёС‰Р°РјРё РєСѓР»СЊС‚СѓСЂРЅС‹С… С†РµРЅРЅРѕСЃС‚РµР№ РІ С†РµР»СЏС… РёС… СЌРєСЃРїРѕРЅРёСЂРѕРІР°РЅРёСЏ, Р° С‚Р°РєР¶Рµ РїСЂРё РёС… РѕР±СЂР°С‚РЅРѕРј РІС‹РІРѕР·Рµ (СЂРµСЌРєСЃРїРѕСЂС‚Рµ) РёР»Рё РѕР±СЂР°С‚РЅРѕРј РІРІРѕР·Рµ (СЂРµРёРјРїРѕСЂС‚Рµ)', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (212, 'РћР�', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё РїСЂРѕС„РµСЃСЃРёРѕРЅР°Р»СЊРЅРѕРіРѕ РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ, РёСЃРїРѕР»СЊР·СѓРµРјРѕРіРѕ РґР»СЏ С†РµР»РµР№ РїСЂРѕРёР·РІРѕРґСЃС‚РІР° Рё РІС‹РїСѓСЃРєР° СЃСЂРµРґСЃС‚РІ РјР°СЃСЃРѕРІРѕР№ РёРЅС„РѕСЂРјР°С†РёРё, РїРѕРјРµС‰Р°РµРјРѕРіРѕ РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ РІСЂРµРјРµРЅРЅРѕРіРѕ РІС‹РІРѕР·Р°, Р° С‚Р°РєР¶Рµ РїСЂРё РµРіРѕ РѕР±СЂР°С‚РЅРѕРј РІРІРѕР·Рµ (СЂРµРёРјРїРѕСЂС‚Рµ)', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (213, 'Р Рџ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ Рё РІС‹РІРѕР·РёРјС‹С… РёР· Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РІ РєР°С‡РµСЃС‚РІРµ РїСЂРёРїР°СЃРѕРІ', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (214, 'РЎРџ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРѕРјРµС‰Р°РµРјС‹С… РїРѕРґ СЃРїРµС†РёР°Р»СЊРЅС‹Рµ С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РїСЂРѕС†РµРґСѓСЂС‹, Р° С‚Р°РєР¶Рµ РїСЂРё РїРѕРјРµС‰РµРЅРёРё С‚РѕРІР°СЂРѕРІ РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РїСЂРѕС†РµРґСѓСЂС‹, РЅРµРѕР±С…РѕРґРёРјС‹Рµ РґР»СЏ Р·Р°РІРµСЂС€РµРЅРёСЏ СЃРїРµС†РёР°Р»СЊРЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїСЂРѕС†РµРґСѓСЂС‹', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (215, 'Р РЈ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РєРѕС‚РѕСЂС‹Рµ РѕРєР°Р·Р°Р»РёСЃСЊ СѓРЅРёС‡С‚РѕР¶РµРЅС‹, Р±РµР·РІРѕР·РІСЂР°С‚РЅРѕ СѓС‚РµСЂСЏРЅС‹ Р»РёР±Рѕ РїРѕРІСЂРµР¶РґРµРЅС‹ РІСЃР»РµРґСЃС‚РІРёРµ Р°РІР°СЂРёРё РёР»Рё РґРµР№СЃС‚РІРёСЏ РЅРµРїСЂРµРѕРґРѕР»РёРјРѕР№ СЃРёР»С‹ Рё РїРѕРјРµС‰РµРЅС‹ РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ СѓРЅРёС‡С‚РѕР¶РµРЅРёСЏ', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (216, 'Р Рў', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРѕРјРµС‰Р°РµРјС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ С‚СЂР°РЅР·РёС‚Р°', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (217, 'РЈРћ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё РѕС‚С…РѕРґРѕРІ (РѕСЃС‚Р°С‚РєРѕРІ), РѕР±СЂР°Р·РѕРІР°РІС€РёС…СЃСЏ РІ СЂРµР·СѓР»СЊС‚Р°С‚Рµ СѓРЅРёС‡С‚РѕР¶РµРЅРёСЏ РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… С‚РѕРІР°СЂРѕРІ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїСЂРѕС†РµРґСѓСЂРѕР№ СѓРЅРёС‡С‚РѕР¶РµРЅРёСЏ, РІ РѕС‚РЅРѕС€РµРЅРёРё РєРѕС‚РѕСЂС‹С… РЅРµ РїРѕРґР»РµР¶Р°С‚ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РїРѕС€Р»РёРЅС‹, РЅР°Р»РѕРіРё', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (218, 'РћР’', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїСЂРёР±С‹РІС€РёС… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё, РЅР°С…РѕРґСЏС‰РёС…СЃСЏ РІ РјРµСЃС‚Рµ РїСЂРёР±С‹С‚РёСЏ Р»РёР±Рѕ РІ РёРЅРѕР№ Р·РѕРЅРµ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РєРѕРЅС‚СЂРѕР»СЏ, СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕР№ РІ РЅРµРїРѕСЃСЂРµРґСЃС‚РІРµРЅРЅРѕР№ Р±Р»РёР·РѕСЃС‚Рё РѕС‚ РјРµСЃС‚Р° РїСЂРёР±С‹С‚РёСЏ, РЅРµ РїРѕРјРµС‰РµРЅРЅС‹С… РїРѕРґ РєР°РєСѓСЋ-Р»РёР±Рѕ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ, РїРѕРјРµС‰Р°РµРјС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ СЂРµСЌРєСЃРїРѕСЂС‚Р° Рё СѓР±С‹РІР°СЋС‰РёС… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (219, 'Р“Рџ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІС‹РІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РІ РєР°С‡РµСЃС‚РІРµ РіСѓРјР°РЅРёС‚Р°СЂРЅРѕР№ РїРѕРјРѕС‰Рё,  РІ С†РµР»СЏС… Р»РёРєРІРёРґР°С†РёРё РїРѕСЃР»РµРґСЃС‚РІРёР№ Р°РІР°СЂРёР№ Рё РєР°С‚Р°СЃС‚СЂРѕС„, СЃС‚РёС…РёР№РЅС‹С… Р±РµРґСЃС‚РІРёР№', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (220, 'Р’Рђ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІСЂРµРјРµРЅРЅРѕ РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ СЃ РїСЂРёРјРµРЅРµРЅРёРµРј РєР°СЂРЅРµС‚РѕРІ РђРўРђ, РІ СЃР»СѓС‡Р°Рµ СЃРѕР±Р»СЋРґРµРЅРёСЏ СѓСЃР»РѕРІРёР№ РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° С‚РѕРІР°СЂРѕРІ СЃ РїСЂРёРјРµРЅРµРЅРёРµРј РєР°СЂРЅРµС‚РѕРІ РђРўРђ, Рё РёС… РѕР±СЂР°С‚РЅРѕРј РІС‹РІРѕР·Рµ РёР· Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё, Р° С‚Р°РєР¶Рµ С‚РѕРІР°СЂРѕРІ, РІСЂРµРјРµРЅРЅРѕ РІС‹РІРѕР·РёРјС‹С… РёР· Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё СЃ РїСЂРёРјРµРЅРµРЅРёРµРј РєР°СЂРЅРµС‚РѕРІ РђРўРђ, РІ СЃР»СѓС‡Р°Рµ СЃРѕР±Р»СЋРґРµРЅРёСЏ СѓСЃР»РѕРІРёР№ РІСЂРµРјРµРЅРЅРѕРіРѕ РІС‹РІРѕР·Р° С‚РѕРІР°СЂРѕРІ СЃ РїСЂРёРјРµРЅРµРЅРёРµРј РєР°СЂРЅРµС‚РѕРІ РђРўРђ, Рё РёС… РѕР±СЂР°С‚РЅРѕРј РІРІРѕР·Рµ РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (221, 'Р—Рџ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё Р·Р°РїР°СЃРЅС‹С… С‡Р°СЃС‚РµР№ Рё РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ Рё РІС‹РІРѕР·РёРјС‹С… РёР· Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РѕРґРЅРѕРІСЂРµРјРµРЅРЅРѕ СЃ С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рј СЃСЂРµРґСЃС‚РІРѕРј РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃРѕ СЃС‚Р°С‚СЊРµР№ 349 РўР°РјРѕР¶РµРЅРЅРѕРіРѕ РєРѕРґРµРєСЃР° РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р°', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (222, 'РўРЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РїРµСЂРµРІРѕР·РѕРє, РІ С‚РѕРј С‡РёСЃР»Рµ РІС‹РїСѓС‰РµРЅРЅС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїСЂРѕС†РµРґСѓСЂРѕР№ РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° (РґРѕРїСѓСЃРєР°) РёР»Рё С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїСЂРѕС†РµРґСѓСЂРѕР№ СЃРІРѕР±РѕРґРЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ Р·РѕРЅС‹ Рё РІ РґР°Р»СЊРЅРµР№С€РµРј РёСЃРїРѕР»СЊР·СѓРµРјС‹С… РІ РєР°С‡РµСЃС‚РІРµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РїРµСЂРµРІРѕР·РѕРє', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (223, 'Р—Рљ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРµР·РµРЅРЅС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ РљР°Р»РёРЅРёРЅРіСЂР°РґСЃРєРѕР№ РѕР±Р»Р°СЃС‚Рё РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїСЂРѕС†РµРґСѓСЂРѕР№ СЃРІРѕР±РѕРґРЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ Р·РѕРЅС‹, Рё РїСЂРѕРґСѓРєС‚РѕРІ РёС… РїРµСЂРµСЂР°Р±РѕС‚РєРё, РїРѕРјРµС‰Р°РµРјС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ РІС‹РїСѓСЃРєР° РґР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ РїРѕС‚СЂРµР±Р»РµРЅРёСЏ РёР»Рё СЂРµРёРјРїРѕСЂС‚Р°', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (224, 'РќРћ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё РЅР°СѓС‡РЅС‹С… РёР»Рё РєРѕРјРјРµСЂС‡РµСЃРєРёС… РѕР±СЂР°Р·С†РѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїСЂРѕС†РµРґСѓСЂРѕР№ РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° (РґРѕРїСѓСЃРєР°) СЃ РїРѕР»РЅС‹Рј СѓСЃР»РѕРІРЅС‹Рј РѕСЃРІРѕР±РѕР¶РґРµРЅРёРµРј РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ Рё РІС‹РІРѕР·РёРјС‹С… РёР· Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїСЂРѕС†РµРґСѓСЂРѕР№ РІСЂРµРјРµРЅРЅРѕРіРѕ РІС‹РІРѕР·Р°', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (225, 'РћРЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ РІ СЃР»СѓС‡Р°СЏС…, РѕРїСЂРµРґРµР»СЏРµРјС‹С… РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (226, 'РћРћ', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ РЅРµ Р·Р°РїСЂР°С€РёРІР°СЋС‚СЃСЏ', 'RU', '4.1.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (227, 'РњР’', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… С‡РµСЂРµР· С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РіСЂР°РЅРёС†Сѓ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рѕ РІРѕР·РґСѓС€РЅРѕРј СЃРѕРѕР±С‰РµРЅРёРё', 'RU', '4.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (228, 'РњРЈ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… С‡РµСЂРµР· С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РіСЂР°РЅРёС†Сѓ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІ СЂР°РјРєР°С… РјРµР¶РїСЂР°РІРёС‚РµР»СЊСЃС‚РІРµРЅРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РѕР± СѓС…РѕРґРµ Р·Р° РІРѕРµРЅРЅС‹РјРё РјРѕРіРёР»Р°РјРё', 'RU', '4.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (229, 'РњРњ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… С‡РµСЂРµР· С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РіСЂР°РЅРёС†Сѓ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РІ СЂР°РјРєР°С… РЎРѕРіР»Р°С€РµРЅРёСЏ Рѕ РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕ-РїСЂР°РІРѕРІС‹С… РіР°СЂР°РЅС‚РёСЏС… Р±РµСЃРїСЂРµРїСЏС‚СЃС‚РІРµРЅРЅРѕРіРѕ Рё РЅРµР·Р°РІРёСЃРёРјРѕРіРѕ РѕСЃСѓС‰РµСЃС‚РІР»РµРЅРёСЏ РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё РјРµР¶РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕР№ С‚РµР»РµРєРѕРјРїР°РЅРёРё В«РњРёСЂВ»', 'RU', '4.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (230, 'РњРќ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ Р·Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РѕРїРµСЂР°С†РёРё РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… С‡РµСЂРµР· С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РіСЂР°РЅРёС†Сѓ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РІ СЂР°РјРєР°С… РЎРѕРіР»Р°С€РµРЅРёСЏ РјРµР¶РґСѓ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј РљРќР  Рѕ СЃРѕС‚СЂСѓРґРЅРёС‡РµСЃС‚РІРµ РІ РЅРµС„С‚СЏРЅРѕР№ СЃС„РµСЂРµ', 'RU', '4.1.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (231, 'РўРџ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІС‹РІРѕР·РёРјС‹С… СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РІ Р±Р»Р°РіРѕС‚РІРѕСЂРёС‚РµР»СЊРЅС‹С… С†РµР»СЏС… РїРѕ Р»РёРЅРёРё РіРѕСЃСѓРґР°СЂСЃС‚РІ, РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№, РїСЂР°РІРёС‚РµР»СЊСЃС‚РІ, РІ С‚РѕРј С‡РёСЃР»Рµ РІ С†РµР»СЏС… РѕРєР°Р·Р°РЅРёСЏ С‚РµС…РЅРёС‡РµСЃРєРѕР№ РїРѕРјРѕС‰Рё (СЃРѕРґРµР№СЃС‚РІРёСЏ)', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (232, 'РЎРњ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё РїСЂРµРґРјРµС‚РѕРІ РјР°С‚РµСЂРёР°Р»СЊРЅРѕ-С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЃРЅР°Р±Р¶РµРЅРёСЏ Рё СЃРЅР°СЂСЏР¶РµРЅРёСЏ, С‚РѕРїР»РёРІР°, РїСЂРѕРґРѕРІРѕР»СЊСЃС‚РІРёСЏ Рё РґСЂСѓРіРѕРіРѕ РёРјСѓС‰РµСЃС‚РІР°, РІС‹РІРѕР·РёРјРѕРіРѕ Р·Р° РїСЂРµРґРµР»С‹ С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РґР»СЏ РѕР±РµСЃРїРµС‡РµРЅРёСЏ РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё СЃСѓРґРѕРІ РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° Рё СЃСѓРґРѕРІ, Р°СЂРµРЅРґРѕРІР°РЅРЅС‹С… (Р·Р°С„СЂР°РєС‚РѕРІР°РЅРЅС‹С…) СЋСЂРёРґРёС‡РµСЃРєРёРјРё Р»РёС†Р°РјРё Рё С„РёР·РёС‡РµСЃРєРёРјРё Р»РёС†Р°РјРё РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РѕСЃСѓС‰РµСЃС‚РІР»СЏСЋС‰РёС… СЂС‹Р±РѕР»РѕРІСЃС‚РІРѕ', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (233, 'РњР—', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРѕРјРµС‰РµРЅРЅС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ СЃРІРѕР±РѕРґРЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ Р·РѕРЅС‹ РІ РњР°РіР°РґР°РЅСЃРєРѕР№ РѕР±Р»Р°СЃС‚Рё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё РІС‹РІРѕР·РёРјС‹С… СЂРµР·РёРґРµРЅС‚Р°РјРё РѕСЃРѕР±РѕР№ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ Р·РѕРЅС‹ РЅР° РѕСЃС‚Р°Р»СЊРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ РњР°РіР°РґР°РЅСЃРєРѕР№ РѕР±Р»Р°СЃС‚Рё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РґР»СЏ СЃРѕР±СЃС‚РІРµРЅРЅС‹С… РїСЂРѕРёР·РІРѕРґСЃС‚РІРµРЅРЅС‹С… РЅСѓР¶Рґ', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (234, 'РђР’', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РЎРѕРіР»Р°С€РµРЅРёРµРј Рѕ СЂР°Р·РґРµР»Рµ РїСЂРѕРґСѓРєС†РёРё (РґР°Р»РµРµ вЂ“ РЎР Рџ) РЎР°С…Р°Р»РёРЅ-1', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (236, 'Р’Р’', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РЎР Рџ РҐР°СЂСЊСЏРіРёРЅСЃРєРѕРµ РјРµСЃС‚РѕСЂРѕР¶РґРµРЅРёРµ', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (237, 'РќРђ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРѕР»СѓС‡РµРЅРЅС‹С… (РїСЂРѕРёР·РІРµРґРµРЅРЅС‹С…) РїСЂРё СЂР°Р·СЂР°Р±РѕС‚РєРµ РЅРѕРІРѕРіРѕ РјРѕСЂСЃРєРѕРіРѕ РјРµСЃС‚РѕСЂРѕР¶РґРµРЅРёСЏ СѓРіР»РµРІРѕРґРѕСЂРѕРґРЅРѕРіРѕ СЃС‹СЂСЊСЏ, СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕРіРѕ РїРѕР»РЅРѕСЃС‚СЊСЋ РІ РђР·РѕРІСЃРєРѕРј РјРѕСЂРµ РёР»Рё РЅР° 50 Рё Р±РѕР»РµРµ РїСЂРѕС†РµРЅС‚РѕРІ СЃРІРѕРµР№ РїР»РѕС‰Р°РґРё РІ Р‘Р°Р»С‚РёР№СЃРєРѕРј РјРѕСЂРµ, РІ РїРµСЂРёРѕРґ РґРѕ 31 РјР°СЂС‚Р° 2032 Рі. РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (238, 'РќР§', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРѕР»СѓС‡РµРЅРЅС‹С… (РїСЂРѕРёР·РІРµРґРµРЅРЅС‹С…) РїСЂРё СЂР°Р·СЂР°Р±РѕС‚РєРµ РЅРѕРІРѕРіРѕ РјРѕСЂСЃРєРѕРіРѕ РјРµСЃС‚РѕСЂРѕР¶РґРµРЅРёСЏ СѓРіР»РµРІРѕРґРѕСЂРѕРґРЅРѕРіРѕ СЃС‹СЂСЊСЏ, СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕРіРѕ РЅР° 50 Рё Р±РѕР»РµРµ РїСЂРѕС†РµРЅС‚РѕРІ СЃРІРѕРµР№ РїР»РѕС‰Р°РґРё РІ Р§РµСЂРЅРѕРј РјРѕСЂРµ (РіР»СѓР±РёРЅР° РґРѕ 100 РјРµС‚СЂРѕРІ РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ), РџРµС‡РѕСЂСЃРєРѕРј РёР»Рё Р‘РµР»РѕРј РјРѕСЂРµ, СЋР¶РЅРѕР№ С‡Р°СЃС‚Рё РћС…РѕС‚СЃРєРѕРіРѕ РјРѕСЂСЏ (СЋР¶РЅРµРµ 55В° СЃРµРІРµСЂРЅРѕР№ С€РёСЂРѕС‚С‹) Р»РёР±Рѕ СЂРѕСЃСЃРёР№СЃРєРѕР№ С‡Р°СЃС‚Рё (СЂРѕСЃСЃРёР№СЃРєРѕРј СЃРµРєС‚РѕСЂРµ) РґРЅР° РљР°СЃРїРёР№СЃРєРѕРіРѕ РјРѕСЂСЏ, РІ РїРµСЂРёРѕРґ РґРѕ 31 РјР°СЂС‚Р° 2032 Рі. РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (239, 'РќР’', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРѕР»СѓС‡РµРЅРЅС‹С… (РїСЂРѕРёР·РІРµРґРµРЅРЅС‹С…) РїСЂРё СЂР°Р·СЂР°Р±РѕС‚РєРµ РЅРѕРІРѕРіРѕ РјРѕСЂСЃРєРѕРіРѕ РјРµСЃС‚РѕСЂРѕР¶РґРµРЅРёСЏ СѓРіР»РµРІРѕРґРѕСЂРѕРґРЅРѕРіРѕ СЃС‹СЂСЊСЏ, СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕРіРѕ РЅР° 50 Рё Р±РѕР»РµРµ РїСЂРѕС†РµРЅС‚РѕРІ СЃРІРѕРµР№ РїР»РѕС‰Р°РґРё РІ Р§РµСЂРЅРѕРј РјРѕСЂРµ (РіР»СѓР±РёРЅР° Р±РѕР»РµРµ 100 РјРµС‚СЂРѕРІ), СЃРµРІРµСЂРЅРѕР№ С‡Р°СЃС‚Рё РћС…РѕС‚СЃРєРѕРіРѕ РјРѕСЂСЏ (РЅР° 55В° СЃРµРІРµСЂРЅРѕР№ С€РёСЂРѕС‚С‹ РёР»Рё СЃРµРІРµСЂРЅРµРµ СЌС‚РѕР№ С€РёСЂРѕС‚С‹), СЋР¶РЅРѕР№ С‡Р°СЃС‚Рё Р‘Р°СЂРµРЅС†РµРІР° РјРѕСЂСЏ (СЋР¶РЅРµРµ 72В° СЃРµРІРµСЂРЅРѕР№ С€РёСЂРѕС‚С‹), РІ РїРµСЂРёРѕРґ РґРѕ 31 РјР°СЂС‚Р° 2042 Рі. РІРєР»СЋС‡РёС‚РµР»СЊРЅРѕ', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (240, 'РќРљ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРѕР»СѓС‡РµРЅРЅС‹С… (РїСЂРѕРёР·РІРµРґРµРЅРЅС‹С…) РїСЂРё СЂР°Р·СЂР°Р±РѕС‚РєРµ РЅРѕРІРѕРіРѕ РјРѕСЂСЃРєРѕРіРѕ РјРµСЃС‚РѕСЂРѕР¶РґРµРЅРёСЏ СѓРіР»РµРІРѕРґРѕСЂРѕРґРЅРѕРіРѕ СЃС‹СЂСЊСЏ, СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕРіРѕ РЅР° 50 Рё Р±РѕР»РµРµ РїСЂРѕС†РµРЅС‚РѕРІ СЃРІРѕРµР№ РїР»РѕС‰Р°РґРё РІ РљР°СЂСЃРєРѕРј РјРѕСЂРµ, СЃРµРІРµСЂРЅРѕР№ С‡Р°СЃС‚Рё Р‘Р°СЂРµРЅС†РµРІР° РјРѕСЂСЏ (РЅР° 72В° СЃРµРІРµСЂРЅРѕР№ С€РёСЂРѕС‚С‹ Рё СЃРµРІРµСЂРЅРµРµ СЌС‚РѕР№ С€РёСЂРѕС‚С‹), РІРѕСЃС‚РѕС‡РЅРѕР№ РђСЂРєС‚РёРєРµ (РјРѕСЂРµ Р›Р°РїС‚РµРІС‹С…, Р’РѕСЃС‚РѕС‡РЅРѕ-РЎРёР±РёСЂСЃРєРѕРј РјРѕСЂРµ, Р§СѓРєРѕС‚СЃРєРѕРј РјРѕСЂРµ Рё Р‘РµСЂРёРЅРіРѕРІРѕРј РјРѕСЂРµ)', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (241, 'РќРњ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІС‹РІРѕР·РёРјС‹С… РёР· Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё РїРѕР»СѓС‡РµРЅРЅС‹С… (РїСЂРѕРёР·РІРµРґРµРЅРЅС‹С…) РїСЂРё СЂР°Р·СЂР°Р±РѕС‚РєРµ РјРѕСЂСЃРєРѕРіРѕ РјРµСЃС‚РѕСЂРѕР¶РґРµРЅРёСЏ СѓРіР»РµРІРѕРґРѕСЂРѕРґРЅРѕРіРѕ СЃС‹СЂСЊСЏ, РїСЂРё СЌС‚РѕРј РЅРµ СЏРІР»СЏСЋС‰РµРіРѕСЃСЏ РЅРѕРІС‹Рј РјРѕСЂСЃРєРёРј РјРµСЃС‚РѕСЂРѕР¶РґРµРЅРёРµРј СѓРіР»РµРІРѕРґРѕСЂРѕРґРЅРѕРіРѕ СЃС‹СЂСЊСЏ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃРѕ СЃС‚Р°С‚СЊРµР№ 11.1 РќР°Р»РѕРіРѕРІРѕРіРѕ РєРѕРґРµРєСЃР° Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё, СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕРіРѕ РЅР° 50 Рё Р±РѕР»РµРµ РїСЂРѕС†РµРЅС‚РѕРІ СЃРІРѕРµР№ РїР»РѕС‰Р°РґРё РІ СЋР¶РЅРѕР№ С‡Р°СЃС‚Рё РћС…РѕС‚СЃРєРѕРіРѕ РјРѕСЂСЏ (СЋР¶РЅРµРµ 55В° СЃРµРІРµСЂРЅРѕР№ С€РёСЂРѕС‚С‹), РІ РїРµСЂРёРѕРґ РґРѕ 1 СЏРЅРІР°СЂСЏ 2021 Рі. РїСЂРё СѓСЃР»РѕРІРёРё, С‡С‚Рѕ СЃС‚РµРїРµРЅСЊ РІС‹СЂР°Р±РѕС‚Р°РЅРЅРѕСЃС‚Рё Р·Р°РїР°СЃРѕРІ РєР°Р¶РґРѕРіРѕ РІРёРґР° СѓРіР»РµРІРѕРґРѕСЂРѕРґРЅРѕРіРѕ СЃС‹СЂСЊСЏ (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїРѕРїСѓС‚РЅРѕРіРѕ РіР°Р·Р°), РґРѕР±С‹РІР°РµРјРѕРіРѕ РЅР° С‚Р°РєРѕРј РјРµСЃС‚РѕСЂРѕР¶РґРµРЅРёРё, РїРѕ СЃРѕСЃС‚РѕСЏРЅРёСЋ РЅР° 1 СЏРЅРІР°СЂСЏ 2015 Рі. СЃРѕСЃС‚Р°РІР»СЏРµС‚ РјРµРЅРµРµ 5 РїСЂРѕС†РµРЅС‚РѕРІ', 'RU', '4.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (242, 'Р›Р›', 'РўР°СЂРёС„РЅР°СЏ РїСЂРµС„РµСЂРµРЅС†РёСЏ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїСЂРѕРёСЃС…РѕРґСЏС‰РёС… Рё РІРІРѕР·РёРјС‹С… РёР· Р РµСЃРїСѓР±Р»РёРєРё РЎРµСЂР±РёРё РёР»Рё Р РµСЃРїСѓР±Р»РёРєРё Р§РµСЂРЅРѕРіРѕСЂРёРё РІ СЂР°РјРєР°С… РЎРѕРіР»Р°С€РµРЅРёСЏ Рѕ СЃРІРѕР±РѕРґРЅРѕР№ С‚РѕСЂРіРѕРІР»Рµ РјРµР¶РґСѓ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРµР№ Рё РЎРѕСЋР·РЅРѕР№ Р РµСЃРїСѓР±Р»РёРєРѕР№ Р®РіРѕСЃР»Р°РІРёРµР№', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (243, 'РњР’', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… С‡РµСЂРµР· РіСЂР°РЅРёС†Сѓ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рѕ РІРѕР·РґСѓС€РЅРѕРј СЃРѕРѕР±С‰РµРЅРёРё', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (244, 'РљРў', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ РѕС‚РЅРѕС€РµРЅРёРё Р±Р»Р°РЅРєРѕРІ РєРЅРёР¶РµРє РњР”Рџ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… РјРµР¶РґСѓ РђСЃСЃРѕС†РёР°С†РёРµР№ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… Р°РІС‚РѕРјРѕР±РёР»СЊРЅС‹С… РїРµСЂРµРІРѕР·С‡РёРєРѕРІ Р РѕСЃСЃРёРё (РђРЎРњРђРџ) Рё РњРµР¶РґСѓРЅР°СЂРѕРґРЅС‹Рј СЃРѕСЋР·РѕРј Р°РІС‚РѕРјРѕР±РёР»СЊРЅРѕРіРѕ С‚СЂР°РЅСЃРїРѕСЂС‚Р° РІ Р–РµРЅРµРІРµ (РњРЎРђРў)', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (245, 'РњРЈ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… РІ СЂР°РјРєР°С… РјРµР¶РїСЂР°РІРёС‚РµР»СЊСЃС‚РІРµРЅРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РѕР± СѓС…РѕРґРµ Р·Р° РІРѕРµРЅРЅС‹РјРё РјРѕРіРёР»Р°РјРё', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (246, 'РњРЇ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РЎРѕРіР»Р°С€РµРЅРёРµРј Рѕ РІРІРѕР·Рµ РјР°С‚РµСЂРёР°Р»РѕРІ РѕР±СЂР°Р·РѕРІР°С‚РµР»СЊРЅРѕРіРѕ, РЅР°СѓС‡РЅРѕРіРѕ Рё РєСѓР»СЊС‚СѓСЂРЅРѕРіРѕ С…Р°СЂР°РєС‚РµСЂР° РѕС‚ 17 РёСЋРЅСЏ 1950 РіРѕРґР° Рё РџСЂРѕС‚РѕРєРѕР»РѕРј Рє РЅРµРјСѓ РѕС‚ 26 РЅРѕСЏР±СЂСЏ 1976 РіРѕРґР°', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (247, 'РњРџ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РЎРѕРіР»Р°С€РµРЅРёРµРј РѕР± РѕР±С‰РёС… СѓСЃР»РѕРІРёСЏС… Рё РјРµС…Р°РЅРёР·РјРµ РїРѕРґРґРµСЂР¶РєРё СЂР°Р·РІРёС‚РёСЏ РїСЂРѕРёР·РІРѕРґСЃС‚РІРµРЅРЅРѕР№ РєРѕРѕРїРµСЂР°С†РёРё РїСЂРµРґРїСЂРёСЏС‚РёР№ Рё РѕС‚СЂР°СЃР»РµР№ РіРѕСЃСѓРґР°СЂСЃС‚РІ вЂ“ СѓС‡Р°СЃС‚РЅРёРєРѕРІ РЎРѕРґСЂСѓР¶РµСЃС‚РІР° РќРµР·Р°РІРёСЃРёРјС‹С… Р“РѕСЃСѓРґР°СЂСЃС‚РІ РѕС‚ 23 РґРµРєР°Р±СЂСЏ 1993 РіРѕРґР°', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (248, 'РњРћ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РјРµР¶РїСЂР°РІРёС‚РµР»СЊСЃС‚РІРµРЅРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рѕ РїСЂРѕРёР·РІРѕРґСЃС‚РІРµРЅРЅРѕР№ Рё РЅР°СѓС‡РЅРѕ-С‚РµС…РЅРёС‡РµСЃРєРѕР№ РєРѕРѕРїРµСЂР°С†РёРё РїСЂРµРґРїСЂРёСЏС‚РёР№ РѕР±РѕСЂРѕРЅРЅС‹С… РѕС‚СЂР°СЃР»РµР№ РїСЂРѕРјС‹С€Р»РµРЅРЅРѕСЃС‚Рё', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (249, 'РњР­', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… РІ СЂР°РјРєР°С… РЎРѕРіР»Р°С€РµРЅРёСЏ РѕР± РѕСЃРІРѕР±РѕР¶РґРµРЅРёРё РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ Рё РІС‹РґР°С‡Рё СЃРїРµС†РёР°Р»СЊРЅС‹С… СЂР°Р·СЂРµС€РµРЅРёР№ Р·Р° РїСЂРѕРІРѕР· РЅРѕСЂРјР°С‚РёРІРЅС‹С… РґРѕРєСѓРјРµРЅС‚РѕРІ, СЌС‚Р°Р»РѕРЅРѕРІ, СЃСЂРµРґСЃС‚РІ РёР·РјРµСЂРµРЅРёР№ Рё СЃС‚Р°РЅРґР°СЂС‚РЅС‹С… РѕР±СЂР°Р·С†РѕРІ, РїСЂРѕРІРѕР·РёРјС‹С… СЃ С†РµР»СЊСЋ РїРѕРІРµСЂРєРё Рё РјРµС‚СЂРѕР»РѕРіРёС‡РµСЃРєРѕР№ Р°С‚С‚РµСЃС‚Р°С†РёРё, РѕС‚ 10 С„РµРІСЂР°Р»СЏ 1995 РіРѕРґР°', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (250, 'РњРў', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё СЂРѕСЃСЃРёР№СЃРєРѕРіРѕ РїСЂРёСЂРѕРґРЅРѕРіРѕ РіР°Р·Р°, РІС‹РІРѕР·РёРјРѕРіРѕ РІ РўСѓСЂРµС†РєСѓСЋ Р РµСЃРїСѓР±Р»РёРєСѓ С‡РµСЂРµР· Р°РєРІР°С‚РѕСЂРёСЋ Р§РµСЂРЅРѕРіРѕ РјРѕСЂСЏ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РЎРѕРіР»Р°С€РµРЅРёРµРј РјРµР¶РґСѓ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј РўСѓСЂРµС†РєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё Рѕ РїРѕСЃС‚Р°РІРєР°С… СЂРѕСЃСЃРёР№СЃРєРѕРіРѕ РїСЂРёСЂРѕРґРЅРѕРіРѕ РіР°Р·Р° РІ РўСѓСЂРµС†РєСѓСЋ Р РµСЃРїСѓР±Р»РёРєСѓ С‡РµСЂРµР· Р°РєРІР°С‚РѕСЂРёСЋ Р§РµСЂРЅРѕРіРѕ РјРѕСЂСЏ РѕС‚ 15 РґРµРєР°Р±СЂСЏ 1997 РіРѕРґР°', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (251, 'РњРњ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РЎРѕРіР»Р°С€РµРЅРёРµРј РјРµР¶РґСѓ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј РњРѕРЅРіРѕР»РёРё Рѕ РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё Р РѕСЃСЃРёР№СЃРєРѕ-РњРѕРЅРіРѕР»СЊСЃРєРѕР№ РєРѕРјРїР°РЅРёРё СЃ РѕРіСЂР°РЅРёС‡РµРЅРЅРѕР№ РѕС‚РІРµС‚СЃС‚РІРµРЅРЅРѕСЃС‚СЊСЋ В«РњРѕРЅРіРѕР»СЂРѕСЃС†РІРµС‚РјРµС‚В» РѕС‚ 25 Р°РїСЂРµР»СЏ 2007 РіРѕРґР°', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (252, 'РњРќ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РІ СЂР°РјРєР°С… РЎРѕРіР»Р°С€РµРЅРёСЏ РјРµР¶РґСѓ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј РљРёС‚Р°Р№СЃРєРѕР№ РќР°СЂРѕРґРЅРѕР№ Р РµСЃРїСѓР±Р»РёРєРё Рѕ СЃРѕС‚СЂСѓРґРЅРёС‡РµСЃС‚РІРµ РІ РЅРµС„С‚СЏРЅРѕР№ СЃС„РµСЂРµ РѕС‚ 21 Р°РїСЂРµР»СЏ 2009 РіРѕРґР°', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (253, 'Р­Р ', 'РўР°СЂРёС„РЅР°СЏ РїСЂРµС„РµСЂРµРЅС†РёСЏ РІ РІРёРґРµ РѕСЃРІРѕР±РѕР¶РґРµРЅРёСЏ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїСЂРѕРёСЃС…РѕРґСЏС‰РёС… Рё РІРІРѕР·РёРјС‹С… РёР· РіРѕСЃСѓРґР°СЂСЃС‚РІ, РѕР±СЂР°Р·СѓСЋС‰РёС… РІРјРµСЃС‚Рµ СЃ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРµР№ Р·РѕРЅСѓ СЃРІРѕР±РѕРґРЅРѕР№ С‚РѕСЂРіРѕРІР»Рё (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј С‚Р°СЂРёС„РЅРѕР№ РїСЂРµС„РµСЂРµРЅС†РёРё, РѕРїСЂРµРґРµР»РµРЅРЅРѕР№ РєРѕРґРѕРј Р›Р›)', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (254, 'РџРќ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РІС‹РІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё РЅРµС„С‚Рё Рё РЅРµС„С‚РµРїСЂРѕРґСѓРєС‚РѕРІ, РІС‹РІРѕР·РёРјС‹С… РёР· Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РІ РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ СѓС‡Р°СЃС‚РЅРёРєРё Р”РѕРіРѕРІРѕСЂР° Рѕ РўР°РјРѕР¶РµРЅРЅРѕРј СЃРѕСЋР·Рµ Рё Р•РґРёРЅРѕРј СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРј РїСЂРѕСЃС‚СЂР°РЅСЃС‚РІРµ РѕС‚ 26 С„РµРІСЂР°Р»СЏ 1999 РіРѕРґР°, Р° С‚Р°РєР¶Рµ РІ РіРѕСЃСѓРґР°СЂСЃС‚РІР°, РѕР±СЂР°Р·СѓСЋС‰РёРµ РІРјРµСЃС‚Рµ СЃ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРµР№ Р·РѕРЅСѓ СЃРІРѕР±РѕРґРЅРѕР№ С‚РѕСЂРіРѕРІР»Рё, РµСЃР»Рё С‚Р°РєРѕРµ РѕСЃРІРѕР±РѕР¶РґРµРЅРёРµ РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРѕ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (255, 'РњР ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… С‡РµСЂРµР· РіСЂР°РЅРёС†Сѓ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РІ СЂР°РјРєР°С… РЎРѕРіР»Р°С€РµРЅРёСЏ Рѕ РїСЂРёРІРёР»РµРіРёСЏС… Рё РёРјРјСѓРЅРёС‚РµС‚Р°С… РњРµР¶РґСѓРЅР°СЂРѕРґРЅРѕР№ РѕСЂРіР°РЅРёР·Р°С†РёРё Р�РўР­Р  РїРѕ С‚РµСЂРјРѕСЏРґРµСЂРЅРѕР№ СЌРЅРµСЂРіРёРё РґР»СЏ СЃРѕРІРјРµСЃС‚РЅРѕР№ СЂРµР°Р»РёР·Р°С†РёРё РїСЂРѕРµРєС‚Р° Р�РўР­Р  РѕС‚ 21 РЅРѕСЏР±СЂСЏ 2006 РіРѕРґР°', 'RU', '4.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (256, 'РџР�', '4.2.3. Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Рµ 4.2, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ', 'RU', '4.2.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (257, 'Р§', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ Рё РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РІС‹РїРѕР»РЅРµРЅРёСЏ СЂР°Р±РѕС‚ РїРѕ РЎР Рџ: - РЎР°С…Р°Р»РёРЅ-1,  - РЎР°С…Р°Р»РёРЅ-2,  - РҐР°СЂСЊСЏРіРёРЅСЃРєРѕРµ РјРµСЃС‚РѕСЂРѕР¶РґРµРЅРёРµ', 'RU', '4.3.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (258, 'Р®', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё РїРѕРґР°РєС†РёР·РЅС‹С… С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё, РёС… РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІР°РјРё РЅР° С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё, РїРµСЂСЃРѕРЅР°Р»РѕРј СЌС‚РёС… РѕСЂРіР°РЅРёР·Р°С†РёР№ Рё РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ, Р° С‚Р°РєР¶Рµ С‡Р»РµРЅР°РјРё РёС… СЃРµРјРµР№', 'RU', '4.3.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (259, 'Рљ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё РїРѕРґР°РєС†РёР·РЅС‹С… С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РЎРѕРіР»Р°С€РµРЅРёРµРј РѕР± РѕР±С‰РёС… СѓСЃР»РѕРІРёСЏС… Рё РјРµС…Р°РЅРёР·РјРµ РїРѕРґРґРµСЂР¶РєРё СЂР°Р·РІРёС‚РёСЏ РїСЂРѕРёР·РІРѕРґСЃС‚РІРµРЅРЅРѕР№ РєРѕРѕРїРµСЂР°С†РёРё РїСЂРµРґРїСЂРёСЏС‚РёР№ Рё РѕС‚СЂР°СЃР»РµР№ РіРѕСЃСѓРґР°СЂСЃС‚РІ вЂ“ СѓС‡Р°СЃС‚РЅРёРєРѕРІ РЎРѕРґСЂСѓР¶РµСЃС‚РІР° РќРµР·Р°РІРёСЃРёРјС‹С… Р“РѕСЃСѓРґР°СЂСЃС‚РІ РѕС‚ 23 РґРµРєР°Р±СЂСЏ 1993 РіРѕРґР°', 'RU', '4.3.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (260, 'Р�', '4.3.3. Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Р°С… 1.2. Рё 4.3., Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё РїРѕРґР°РєС†РёР·РЅС‹С… С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'RU', '4.3.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (261, 'Р’Р‘', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІР°Р»СЋС‚С‹ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё РёРЅРѕСЃС‚СЂР°РЅРЅРѕР№ РІР°Р»СЋС‚С‹, Р±Р°РЅРєРЅРѕС‚, СЏРІР»СЏСЋС‰РёС…СЃСЏ Р·Р°РєРѕРЅРЅС‹РјРё СЃСЂРµРґСЃС‚РІР°РјРё РїР»Р°С‚РµР¶Р° (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РєРѕР»Р»РµРєС†РёРѕРЅРёСЂРѕРІР°РЅРёСЏ), Р° С‚Р°РєР¶Рµ С†РµРЅРЅС‹С… Р±СѓРјР°Рі - Р°РєС†РёР№, РѕР±Р»РёРіР°С†РёР№, СЃРµСЂС‚РёС„РёРєР°С‚РѕРІ, РІРµРєСЃРµР»РµР№', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (262, 'Р‘Р“', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РІ РєР°С‡РµСЃС‚РІРµ РіСѓРјР°РЅРёС‚Р°СЂРЅРѕР№ РїРѕРјРѕС‰Рё', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (263, 'Р‘Рў', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РІ РєР°С‡РµСЃС‚РІРµ С‚РµС…РЅРёС‡РµСЃРєРѕР№ РїРѕРјРѕС‰Рё', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (264, 'Р§Рђ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ Рё РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РІС‹РїРѕР»РЅРµРЅРёСЏ СЂР°Р±РѕС‚ РїРѕ РЎР Рџ: - РЎР°С…Р°Р»РёРЅ-1', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (265, 'Р§Р‘', '- РЎР°С…Р°Р»РёРЅ-2', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (266, 'Р§Р’', '- РҐР°СЂСЊСЏРіРёРЅСЃРєРѕРµ РјРµСЃС‚РѕСЂРѕР¶РґРµРЅРёРµ', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (267, 'РўРћ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјРѕРіРѕ РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ С‚РµС…РЅРѕР»РѕРіРёС‡РµСЃРєРѕРіРѕ РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ (РІ С‚РѕРј С‡РёСЃР»Рµ РєРѕРјРїР»РµРєС‚СѓСЋС‰РёС… Рё Р·Р°РїР°СЃРЅС‹С… С‡Р°СЃС‚РµР№ Рє РЅРµРјСѓ), Р°РЅР°Р»РѕРіРё РєРѕС‚РѕСЂРѕРіРѕ РЅРµ РїСЂРѕРёР·РІРѕРґСЏС‚СЃСЏ РІ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (268, 'Р РЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ СЃСѓРґРѕРІ, РїРѕРґР»РµР¶Р°С‰РёС… СЂРµРіРёСЃС‚СЂР°С†РёРё РІ Р РѕСЃСЃРёР№СЃРєРѕРј РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕРј СЂРµРµСЃС‚СЂРµ СЃСѓРґРѕРІ', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (269, 'РџРњ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјРѕР№ РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РїСЂРѕРґСѓРєС†РёРё РјРѕСЂСЃРєРѕРіРѕ РїСЂРѕРјС‹СЃР»Р°, РІС‹Р»РѕРІР»РµРЅРЅРѕР№ Рё (РёР»Рё) РїРµСЂРµСЂР°Р±РѕС‚Р°РЅРЅРѕР№ СЂС‹Р±РѕРїСЂРѕРјС‹С€Р»РµРЅРЅС‹РјРё РїСЂРµРґРїСЂРёСЏС‚РёСЏРјРё (РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё) Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (270, 'РџРђ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РЅРµРѕР±СЂР°Р±РѕС‚Р°РЅРЅС‹С… РїСЂРёСЂРѕРґРЅС‹С… Р°Р»РјР°Р·РѕРІ', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (271, 'РџРЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РїР»РµРјРµРЅРЅРѕРіРѕ РєСЂСѓРїРЅРѕРіРѕ СЂРѕРіР°С‚РѕРіРѕ СЃРєРѕС‚Р°, РїР»РµРјРµРЅРЅС‹С… СЃРІРёРЅРµР№, РїР»РµРјРµРЅРЅС‹С… РѕРІРµС†, РїР»РµРјРµРЅРЅС‹С… РєРѕР·, РїР»РµРјРµРЅРЅС‹С… Р»РѕС€Р°РґРµР№, РїР»РµРјРµРЅРЅРѕР№ РїС‚РёС†С‹ (РїР»РµРјРµРЅРЅРѕРіРѕ СЏР№С†Р°), СЃРµРјРµРЅРё (СЃРїРµСЂРјС‹), РїРѕР»СѓС‡РµРЅРЅРѕРіРѕ РѕС‚ РїР»РµРјРµРЅРЅС‹С… Р±С‹РєРѕРІ, РїР»РµРјРµРЅРЅС‹С… СЃРІРёРЅРµР№, РїР»РµРјРµРЅРЅС‹С… Р±Р°СЂР°РЅРѕРІ, РїР»РµРјРµРЅРЅС‹С… РєРѕР·Р»РѕРІ, РїР»РµРјРµРЅРЅС‹С… Р¶РµСЂРµР±С†РѕРІ, СЌРјР±СЂРёРѕРЅРѕРІ, РїРѕР»СѓС‡РµРЅРЅС‹С… РѕС‚ РїР»РµРјРµРЅРЅРѕРіРѕ РєСЂСѓРїРЅРѕРіРѕ СЂРѕРіР°С‚РѕРіРѕ СЃРєРѕС‚Р°, РїР»РµРјРµРЅРЅС‹С… СЃРІРёРЅРµР№, РїР»РµРјРµРЅРЅС‹С… РѕРІРµС†, РїР»РµРјРµРЅРЅС‹С… РєРѕР·, РїР»РµРјРµРЅРЅС‹С… Р»РѕС€Р°РґРµР№', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (272, 'РљРћ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РІСЃРµС… РІРёРґРѕРІ РїРµС‡Р°С‚РЅС‹С… РёР·РґР°РЅРёР№, РїРѕР»СѓС‡Р°РµРјС‹С… РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹РјРё Рё РјСѓРЅРёС†РёРїР°Р»СЊРЅС‹РјРё Р±РёР±Р»РёРѕС‚РµРєР°РјРё Рё РјСѓР·РµСЏРјРё РїРѕ РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕРјСѓ РєРЅРёРіРѕРѕР±РјРµРЅСѓ, Р° С‚Р°РєР¶Рµ РїСЂРѕРёР·РІРµРґРµРЅРёР№ РєРёРЅРµРјР°С‚РѕРіСЂР°С„РёРё, РІРІРѕР·РёРјС‹С… СЃРїРµС†РёР°Р»РёР·РёСЂРѕРІР°РЅРЅС‹РјРё РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹РјРё РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё РІ С†РµР»СЏС… РѕСЃСѓС‰РµСЃС‚РІР»РµРЅРёСЏ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РЅРµРєРѕРјРјРµСЂС‡РµСЃРєРёС… РѕР±РјРµРЅРѕРІ', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (273, 'РљРў', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ Р±Р»Р°РЅРєРѕРІ РєРЅРёР¶РµРє РњР”Рџ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… РјРµР¶РґСѓ РђСЃСЃРѕС†РёР°С†РёРµР№ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… Р°РІС‚РѕРјРѕР±РёР»СЊРЅС‹С… РїРµСЂРµРІРѕР·С‡РёРєРѕРІ Р РѕСЃСЃРёРё (РђРЎРњРђРџ) Рё РњРµР¶РґСѓРЅР°СЂРѕРґРЅС‹Рј СЃРѕСЋР·РѕРј Р°РІС‚РѕРјРѕР±РёР»СЊРЅРѕРіРѕ С‚СЂР°РЅСЃРїРѕСЂС‚Р° РІ Р–РµРЅРµРІРµ (РњРЎРђРў)', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (274, 'РњРЈ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РІ СЂР°РјРєР°С… РјРµР¶РїСЂР°РІРёС‚РµР»СЊСЃС‚РІРµРЅРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ РѕР± СѓС…РѕРґРµ Р·Р° РІРѕРµРЅРЅС‹РјРё РјРѕРіРёР»Р°РјРё', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (275, 'РњРЇ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РЎРѕРіР»Р°С€РµРЅРёРµРј Рѕ РІРІРѕР·Рµ РјР°С‚РµСЂРёР°Р»РѕРІ РѕР±СЂР°Р·РѕРІР°С‚РµР»СЊРЅРѕРіРѕ, РЅР°СѓС‡РЅРѕРіРѕ Рё РєСѓР»СЊС‚СѓСЂРЅРѕРіРѕ С…Р°СЂР°РєС‚РµСЂР° РѕС‚ 17 РёСЋРЅСЏ 1950 РіРѕРґР° Рё РџСЂРѕС‚РѕРєРѕР»РѕРј Рє РЅРµРјСѓ РѕС‚ 26 РЅРѕСЏР±СЂСЏ 1976 РіРѕРґР°', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (276, 'Рђ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·РѕРІ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… Рё РІС‹РІРѕР·РёРјС‹С… С‚РѕРІР°СЂРѕРІ, РїРѕРјРµС‰Р°РµРјС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ РёРЅСѓСЋ, С‡РµРј С‚Р°РјРѕР¶РµРЅРЅР°СЏ РїСЂРѕС†РµРґСѓСЂР° РІС‹РїСѓСЃРєР° РґР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ РїРѕС‚СЂРµР±Р»РµРЅРёСЏ', 'AM', '5.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (277, 'РљР¦', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РєСѓР»СЊС‚СѓСЂРЅС‹С… С†РµРЅРЅРѕСЃС‚РµР№, РїСЂРёРѕР±СЂРµС‚РµРЅРЅС‹С… Р·Р° СЃС‡РµС‚ СЃСЂРµРґСЃС‚РІ С„РµРґРµСЂР°Р»СЊРЅРѕРіРѕ Р±СЋРґР¶РµС‚Р°, Р±СЋРґР¶РµС‚РѕРІ СЃСѓР±СЉРµРєС‚РѕРІ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё РјРµСЃС‚РЅС‹С… Р±СЋРґР¶РµС‚РѕРІ, РєСѓР»СЊС‚СѓСЂРЅС‹С… С†РµРЅРЅРѕСЃС‚РµР№, РїРѕР»СѓС‡РµРЅРЅС‹С… РІ РґР°СЂ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹РјРё Рё РјСѓРЅРёС†РёРїР°Р»СЊРЅС‹РјРё СѓС‡СЂРµР¶РґРµРЅРёСЏРјРё РєСѓР»СЊС‚СѓСЂС‹, РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹РјРё Рё РјСѓРЅРёС†РёРїР°Р»СЊРЅС‹РјРё Р°СЂС…РёРІР°РјРё, Р° С‚Р°РєР¶Рµ РєСѓР»СЊС‚СѓСЂРЅС‹С… С†РµРЅРЅРѕСЃС‚РµР№, РїРµСЂРµРґР°РІР°РµРјС‹С… РІ РєР°С‡РµСЃС‚РІРµ РґР°СЂР° СѓС‡СЂРµР¶РґРµРЅРёСЏРј, РѕС‚РЅРµСЃРµРЅРЅС‹Рј РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рє РѕСЃРѕР±Рѕ С†РµРЅРЅС‹Рј РѕР±СЉРµРєС‚Р°Рј РєСѓР»СЊС‚СѓСЂРЅРѕРіРѕ Рё РЅР°С†РёРѕРЅР°Р»СЊРЅРѕРіРѕ РЅР°СЃР»РµРґРёСЏ РЅР°СЂРѕРґРѕРІ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (278, 'Р“Р“', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ С‚РµС…РЅРёС‡РµСЃРєРёС… СЃСЂРµРґСЃС‚РІ, РІРєР»СЋС‡Р°СЏ Р°РІС‚РѕРјРѕС‚РѕС‚СЂР°РЅСЃРїРѕСЂС‚, РјР°С‚РµСЂРёР°Р»РѕРІ, РєРѕС‚РѕСЂС‹Рµ РјРѕРіСѓС‚ Р±С‹С‚СЊ РёСЃРїРѕР»СЊР·РѕРІР°РЅС‹ РёСЃРєР»СЋС‡РёС‚РµР»СЊРЅРѕ РґР»СЏ РїСЂРѕС„РёР»Р°РєС‚РёРєРё РёРЅРІР°Р»РёРґРЅРѕСЃС‚Рё РёР»Рё СЂРµР°Р±РёР»РёС‚Р°С†РёРё РёРЅРІР°Р»РёРґРѕРІ', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (279, 'Р“Рљ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ СЃС‹СЂСЊСЏ Рё РєРѕРјРїР»РµРєС‚СѓСЋС‰РёС… РёР·РґРµР»РёР№ РґР»СЏ РїСЂРѕРёР·РІРѕРґСЃС‚РІР° С‚РµС…РЅРёС‡РµСЃРєРёС… СЃСЂРµРґСЃС‚РІ, РІРєР»СЋС‡Р°СЏ Р°РІС‚РѕРјРѕС‚РѕС‚СЂР°РЅСЃРїРѕСЂС‚, РєРѕС‚РѕСЂС‹Рµ РјРѕРіСѓС‚ Р±С‹С‚СЊ РёСЃРїРѕР»СЊР·РѕРІР°РЅС‹ РёСЃРєР»СЋС‡РёС‚РµР»СЊРЅРѕ РґР»СЏ РїСЂРѕС„РёР»Р°РєС‚РёРєРё РёРЅРІР°Р»РёРґРЅРѕСЃС‚Рё РёР»Рё СЂРµР°Р±РёР»РёС‚Р°С†РёРё РёРЅРІР°Р»РёРґРѕРІ', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (280, 'Р“Рџ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РїСЂРѕС‚РµР·РЅРѕ-РѕСЂС‚РѕРїРµРґРёС‡РµСЃРєРёС… РёР·РґРµР»РёР№', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (281, 'Р“РЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ СЃС‹СЂСЊСЏ Рё РјР°С‚РµСЂРёР°Р»РѕРІ РґР»СЏ РёР·РіРѕС‚РѕРІР»РµРЅРёСЏ РїСЂРѕС‚РµР·РЅРѕ-РѕСЂС‚РѕРїРµРґРёС‡РµСЃРєРёС… РёР·РґРµР»РёР№ Рё РїРѕР»СѓС„Р°Р±СЂРёРєР°С‚РѕРІ Рє РЅРёРј', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (282, 'Р“Р�', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РјР°С‚РµСЂРёР°Р»РѕРІ РґР»СЏ РёР·РіРѕС‚РѕРІР»РµРЅРёСЏ РјРµРґРёС†РёРЅСЃРєРёС… РёРјРјСѓРЅРѕР±РёРѕР»РѕРіРёС‡РµСЃРєРёС… РїСЂРµРїР°СЂР°С‚РѕРІ РґР»СЏ РґРёР°РіРЅРѕСЃС‚РёРєРё, РїСЂРѕС„РёР»Р°РєС‚РёРєРё Рё (РёР»Рё) Р»РµС‡РµРЅРёСЏ РёРЅС„РµРєС†РёРѕРЅРЅС‹С… Р·Р°Р±РѕР»РµРІР°РЅРёР№', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (283, 'РҐРў', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјРѕР№ РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РІР°Р¶РЅРµР№С€РµР№ Рё Р¶РёР·РЅРµРЅРЅРѕ РЅРµРѕР±С…РѕРґРёРјРѕР№ РјРµРґРёС†РёРЅСЃРєРѕР№ С‚РµС…РЅРёРєРё', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (284, 'РҐРЎ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ СЃС‹СЂСЊСЏ Рё РєРѕРјРїР»РµРєС‚СѓСЋС‰РёС… РёР·РґРµР»РёР№ РґР»СЏ РїСЂРѕРёР·РІРѕРґСЃС‚РІР° РІР°Р¶РЅРµР№С€РµР№ Рё Р¶РёР·РЅРµРЅРЅРѕ РЅРµРѕР±С…РѕРґРёРјРѕР№ РјРµРґРёС†РёРЅСЃРєРѕР№ С‚РµС…РЅРёРєРё', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (285, 'РҐРћ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РѕС‡РєРѕРІ, Р»РёРЅР· Рё РѕРїСЂР°РІ РґР»СЏ РѕС‡РєРѕРІ (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј СЃРѕР»РЅС†РµР·Р°С‰РёС‚РЅС‹С…)', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (286, 'РҐРљ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ СЃС‹СЂСЊСЏ Рё РєРѕРјРїР»РµРєС‚СѓСЋС‰РёС… РёР·РґРµР»РёР№ РґР»СЏ РїСЂРѕРёР·РІРѕРґСЃС‚РІР° Р»РёРЅР· Рё РѕРїСЂР°РІ РґР»СЏ РѕС‡РєРѕРІ (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј СЃРѕР»РЅС†РµР·Р°С‰РёС‚РЅС‹С…)', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (287, 'Р Рњ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ СЂР°СЃС…РѕРґРЅС‹С… РјР°С‚РµСЂРёР°Р»РѕРІ РґР»СЏ РЅР°СѓС‡РЅС‹С… РёСЃСЃР»РµРґРѕРІР°РЅРёР№, Р°РЅР°Р»РѕРіРё РєРѕС‚РѕСЂС‹С… РЅРµ РїСЂРѕРёР·РІРѕРґСЏС‚СЃСЏ РІ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (288, 'Р Р—', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РЅРµР·Р°СЂРµРіРёСЃС‚СЂРёСЂРѕРІР°РЅРЅС‹С… Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РѕРєР°Р·Р°РЅРёСЏ РјРµРґРёС†РёРЅСЃРєРѕР№ РїРѕРјРѕС‰Рё РїРѕ Р¶РёР·РЅРµРЅРЅС‹Рј РїРѕРєР°Р·Р°РЅРёСЏРј РєРѕРЅРєСЂРµС‚РЅС‹С… РїР°С†РёРµРЅС‚РѕРІ, Рё РіРµРјРѕРїРѕСЌС‚РёС‡РµСЃРєРёС… СЃС‚РІРѕР»РѕРІС‹С… РєР»РµС‚РѕРє Рё РєРѕСЃС‚РЅРѕРіРѕ РјРѕР·РіР° РґР»СЏ РїСЂРѕРІРµРґРµРЅРёСЏ РЅРµСЂРѕРґСЃС‚РІРµРЅРЅРѕР№ С‚СЂР°РЅСЃРїР»Р°РЅС‚Р°С†РёРё', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (289, 'Р›Рљ', 'РџСЂРёРјРµРЅРµРЅРёРµ СЃС‚Р°РІРєРё РќР”РЎ РІ СЂР°Р·РјРµСЂРµ 10% РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РїРµСЂРёРѕРґРёС‡РµСЃРєРёС… РїРµС‡Р°С‚РЅС‹С… РёР·РґР°РЅРёР№ РєРЅРёР¶РЅРѕР№ РїСЂРѕРґСѓРєС†РёРё, СЃРІСЏР·Р°РЅРЅРѕР№ СЃ РѕР±СЂР°Р·РѕРІР°РЅРёРµРј, РЅР°СѓРєРѕР№ Рё РєСѓР»СЊС‚СѓСЂРѕР№', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (290, 'Р›РЎ', 'РџСЂРёРјРµРЅРµРЅРёРµ СЃС‚Р°РІРєРё РќР”РЎ РІ СЂР°Р·РјРµСЂРµ 10% РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ, РІРєР»СЋС‡Р°СЏ Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹Рµ СЃСѓР±СЃС‚Р°РЅС†РёРё', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (291, 'Р›Рњ', 'РџСЂРёРјРµРЅРµРЅРёРµ СЃС‚Р°РІРєРё РќР”РЎ РІ СЂР°Р·РјРµСЂРµ 10% РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РёР·РґРµР»РёР№ РјРµРґРёС†РёРЅСЃРєРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (292, 'Р›Рџ', 'РџСЂРёРјРµРЅРµРЅРёРµ СЃС‚Р°РІРєРё РќР”РЎ РІ СЂР°Р·РјРµСЂРµ 10% РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РїСЂРѕРґРѕРІРѕР»СЊСЃС‚РІРµРЅРЅС‹С… С‚РѕРІР°СЂРѕРІ', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (293, 'Р›Р”', 'РџСЂРёРјРµРЅРµРЅРёРµ СЃС‚Р°РІРєРё РќР”РЎ РІ СЂР°Р·РјРµСЂРµ 10% РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ С‚РѕРІР°СЂРѕРІ РґР»СЏ РґРµС‚РµР№', 'RU', '4.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (294, 'РњР®', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё, РёС… РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІР°РјРё РЅР° С‚РµСЂСЂРёС‚РѕСЂРёРё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё, РїРµСЂСЃРѕРЅР°Р»РѕРј СЌС‚РёС… РѕСЂРіР°РЅРёР·Р°С†РёР№ Рё РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ, Р° С‚Р°РєР¶Рµ С‡Р»РµРЅР°РјРё РёС… СЃРµРјРµР№', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (295, 'РњР’', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рѕ РІРѕР·РґСѓС€РЅРѕРј СЃРѕРѕР±С‰РµРЅРёРё', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (296, 'РњРџ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РЎРѕРіР»Р°С€РµРЅРёРµРј РѕР± РѕР±С‰РёС… СѓСЃР»РѕРІРёСЏС… Рё РјРµС…Р°РЅРёР·РјРµ РїРѕРґРґРµСЂР¶РєРё СЂР°Р·РІРёС‚РёСЏ РїСЂРѕРёР·РІРѕРґСЃС‚РІРµРЅРЅРѕР№ РєРѕРѕРїРµСЂР°С†РёРё РїСЂРµРґРїСЂРёСЏС‚РёР№ Рё РѕС‚СЂР°СЃР»РµР№ РіРѕСЃСѓРґР°СЂСЃС‚РІ вЂ“ СѓС‡Р°СЃС‚РЅРёРєРѕРІ РЎРѕРґСЂСѓР¶РµСЃС‚РІР° РќРµР·Р°РІРёСЃРёРјС‹С… Р“РѕСЃСѓРґР°СЂСЃС‚РІ РѕС‚ 23 РґРµРєР°Р±СЂСЏ 1993 РіРѕРґР°', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (297, 'РњРљ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїРѕРґР°РєС†РёР·РЅС‹С…, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕРіРѕ СЃРѕС‚СЂСѓРґРЅРёС‡РµСЃС‚РІР° Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РІ РѕР±Р»Р°СЃС‚Рё РёСЃСЃР»РµРґРѕРІР°РЅРёСЏ Рё РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ РєРѕСЃРјРёС‡РµСЃРєРѕРіРѕ РїСЂРѕСЃС‚СЂР°РЅСЃС‚РІР°, Р° С‚Р°РєР¶Рµ РґРѕРіРѕРІРѕСЂРѕРІ РѕР± СѓСЃР»СѓРіР°С… РїРѕ Р·Р°РїСѓСЃРєСѓ РєРѕСЃРјРёС‡РµСЃРєРёС… Р°РїРїР°СЂР°С‚РѕРІ', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (298, 'РњР­', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РІ СЂР°РјРєР°С… РЎРѕРіР»Р°С€РµРЅРёСЏ РѕР± РѕСЃРІРѕР±РѕР¶РґРµРЅРёРё РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ Рё РІС‹РґР°С‡Рё СЃРїРµС†РёР°Р»СЊРЅС‹С… СЂР°Р·СЂРµС€РµРЅРёР№ Р·Р° РїСЂРѕРІРѕР· РЅРѕСЂРјР°С‚РёРІРЅС‹С… РґРѕРєСѓРјРµРЅС‚РѕРІ, СЌС‚Р°Р»РѕРЅРѕРІ, СЃСЂРµРґСЃС‚РІ РёР·РјРµСЂРµРЅРёР№ Рё СЃС‚Р°РЅРґР°СЂС‚РЅС‹С… РѕР±СЂР°Р·С†РѕРІ, РїСЂРѕРІРѕР·РёРјС‹С… СЃ С†РµР»СЊСЋ РїРѕРІРµСЂРєРё Рё РјРµС‚СЂРѕР»РѕРіРёС‡РµСЃРєРѕР№ Р°С‚С‚РµСЃС‚Р°С†РёРё, РѕС‚ 10 С„РµРІСЂР°Р»СЏ 1995 РіРѕРґР°', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (299, 'РњРЁ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІРІРѕР·РёРјРѕР№ РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РїСЂРѕРґСѓРєС†РёРё, РїСЂРѕРёР·РІРµРґРµРЅРЅРѕР№ РІ СЂРµР·СѓР»СЊС‚Р°С‚Рµ С…РѕР·СЏР№СЃС‚РІРµРЅРЅРѕР№ РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё СЂРѕСЃСЃРёР№СЃРєРёС… РѕСЂРіР°РЅРёР·Р°С†РёР№ РЅР° Р·РµРјРµР»СЊРЅС‹С… СѓС‡Р°СЃС‚РєР°С…, СЏРІР»СЏСЋС‰РёС…СЃСЏ С‚РµСЂСЂРёС‚РѕСЂРёРµР№ РёРЅРѕСЃС‚СЂР°РЅРЅРѕРіРѕ РіРѕСЃСѓРґР°СЂСЃС‚РІР° СЃ РїСЂР°РІРѕРј Р·РµРјР»РµРїРѕР»СЊР·РѕРІР°РЅРёСЏ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РЅР° РѕСЃРЅРѕРІР°РЅРёРё РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕРіРѕ РґРѕРіРѕРІРѕСЂР° (РЅР°РїСЂРёРјРµСЂ, РЁРїРёС†Р±РµСЂРіРµРЅ)', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (300, 'РњРќ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РѕСЃСЃРёР№СЃРєСѓСЋ Р¤РµРґРµСЂР°С†РёСЋ РІ СЂР°РјРєР°С… РЎРѕРіР»Р°С€РµРЅРёСЏ РјРµР¶РґСѓ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј РљРёС‚Р°Р№СЃРєРѕР№ РќР°СЂРѕРґРЅРѕР№ Р РµСЃРїСѓР±Р»РёРєРё Рѕ СЃРѕС‚СЂСѓРґРЅРёС‡РµСЃС‚РІРµ РІ РЅРµС„С‚СЏРЅРѕР№ СЃС„РµСЂРµ РѕС‚ 21 Р°РїСЂРµР»СЏ 2009 РіРѕРґР°', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (318, 'Р›Р–', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РІР°РєС†РёРЅ Рё Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ РґР»СЏ Р¶РёРІРѕС‚РЅС‹С…', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (301, 'РњР ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРµСЂРµРјРµС‰Р°РµРјС‹С… С‡РµСЂРµР· РіСЂР°РЅРёС†Сѓ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РІ СЂР°РјРєР°С… РЎРѕРіР»Р°С€РµРЅРёСЏ Рѕ РїСЂРёРІРёР»РµРіРёСЏС… Рё РёРјРјСѓРЅРёС‚РµС‚Р°С… РњРµР¶РґСѓРЅР°СЂРѕРґРЅРѕР№ РѕСЂРіР°РЅРёР·Р°С†РёРё Р�РўР­Р  РїРѕ С‚РµСЂРјРѕСЏРґРµСЂРЅРѕР№ СЌРЅРµСЂРіРёРё РґР»СЏ СЃРѕРІРјРµСЃС‚РЅРѕР№ СЂРµР°Р»РёР·Р°С†РёРё РїСЂРѕРµРєС‚Р° Р�РўР­Р  РѕС‚ 21 РЅРѕСЏР±СЂСЏ 2006 РіРѕРґР°', 'RU', '4.4.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (302, 'РќР�', '4.4.3. Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Р°С… 1.3. Рё 4.4., Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', 'RU', '4.4.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (303, 'Р‘Рђ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ Р РµСЃРїСѓР±Р»РёРєСѓ РђСЂРјРµРЅРёСЏ РІ СЂР°РјРєР°С… РіСѓРјР°РЅРёС‚Р°СЂРЅРѕР№ РїРѕРјРѕС‰Рё Рё (РёР»Рё) Р±Р»Р°РіРѕС‚РІРѕСЂРёС‚РµР»СЊРЅС‹С… РїСЂРѕРіСЂР°РјРј', 'AM', '5.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (304, 'РљР¦', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ РІ РѕС‚РЅРѕС€РµРЅРёРё РєСѓР»СЊС‚СѓСЂРЅС‹С… С†РµРЅРЅРѕСЃС‚РµР№, Р·Р°СЂРµРіРёСЃС‚СЂРёСЂРѕРІР°РЅРЅС‹С… РёР»Рё РїРѕРґР»РµР¶Р°С‰РёС… СЂРµРіРёСЃС‚СЂР°С†РёРё РІ СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅРѕРј РїРѕСЂСЏРґРєРµ РІ Р РµСЃРїСѓР±Р»РёРєРµ РђСЂРјРµРЅРёСЏ, РїРѕРјРµС‰Р°РµРјС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РїСЂРѕС†РµРґСѓСЂС‹ РІСЂРµРјРµРЅРЅРѕРіРѕ РІС‹РІРѕР·Р° РёР»Рё РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° (РґРѕРїСѓСЃРєР°) РІ С†РµР»СЏС… СЌРєСЃРїРѕРЅРёСЂРѕРІР°РЅРёСЏ, СЂРµРёРјРїРѕСЂС‚Р° РїСЂРё РёС… РѕР±СЂР°С‚РЅРѕРј РІРІРѕР·Рµ РёР»Рё СЂРµСЌРєСЃРїРѕСЂС‚Р° РїСЂРё РёС… РѕР±СЂР°С‚РЅРѕРј РІС‹РІРѕР·Рµ', 'AM', '5.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (305, 'РђРђ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РґР»СЏ РєРѕС‚РѕСЂС‹С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё Рё Р°РєС‚Р°РјРё, СЃРѕСЃС‚Р°РІР»СЏСЋС‰РёРјРё РїСЂР°РІРѕ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё Рё Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊРЅС‹РјРё Р°РєС‚Р°РјРё Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ СѓСЃС‚Р°РЅРѕРІР»РµРЅС‹ Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ', 'AM', '5.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (306, 'РЎР�', 'Р�РЅС‹Рµ Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ', 'AM', '5.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (307, 'РћРћ', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… СЃР±РѕСЂРѕРІ РЅРµ РёСЃРїРѕР»СЊР·СѓСЋС‚СЃСЏ (РЅРµ Р·Р°РїСЂР°С€РёРІР°СЋС‚СЃСЏ)', 'AM', '5.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (308, 'РњРћ', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ, Р·Р°РєР»СЋС‡РµРЅРЅС‹С… РґРѕ 1 СЏРЅРІР°СЂСЏ 2015 Рі. (РІ С‚РѕРј С‡РёСЃР»Рµ РїСЂРё СЂРµР°Р»РёР·Р°С†РёРё РїРѕСЃР»Рµ 1 СЏРЅРІР°СЂСЏ 2015 Рі. РїСЂРѕРіСЂР°РјРј, РѕСЃСѓС‰РµСЃС‚РІР»СЏРµРјС‹С… РІ СЂР°РјРєР°С… СЌС‚РёС… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ), РїСЂРёРјРµРЅСЏРµРјС‹Рµ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ СѓРєР°Р·Р°РЅРЅС‹РјРё РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё', 'AM', '5.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (309, 'Р“Рќ', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ СЂР°РјРєР°С… СЂРµР°Р»РёР·Р°С†РёРё РїСЂРѕРіСЂР°РјРјС‹ В«РђСЂРјСЏРЅРѕ-РёРЅРґРёР№СЃРєРёР№ СѓС‡РµР±РЅС‹Р№ С†РµРЅС‚СЂ РёРЅС„РѕСЂРјР°С†РёРѕРЅРЅС‹С… Рё РєРѕРјРјСѓРЅРёРєР°С†РёРѕРЅРЅС‹С… С‚РµС…РЅРѕР»РѕРіРёР№В», РїСЂРёРјРµРЅСЏРµРјС‹Рµ РґРѕ РѕРєРѕРЅС‡Р°РЅРёСЏ СЃСЂРѕРєР° РµРµ РґРµР№СЃС‚РІРёСЏ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РњРµРјРѕСЂР°РЅРґСѓРјРѕРј Рѕ РІР·Р°РёРјРѕРїРѕРЅРёРјР°РЅРёРё РјРµР¶РґСѓ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ Рё РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё Р�РЅРґРёСЏ В«Рћ СЃРѕР·РґР°РЅРёРё Р°СЂРјСЏРЅРѕ-РёРЅРґРёР№СЃРєРѕРіРѕ СѓС‡РµР±РЅРѕРіРѕ С†РµРЅС‚СЂР° РёРЅС„РѕСЂРјР°С†РёРѕРЅРЅС‹С… Рё РєРѕРјРјСѓРЅРёРєР°С†РёРѕРЅРЅС‹С… С‚РµС…РЅРѕР»РѕРіРёР№В» РѕС‚ 26 РёСЋРЅСЏ 2009 Рі.', 'AM', '5.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (310, 'Р”Р”', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ СЂР°РјРєР°С… СЂРµР°Р»РёР·Р°С†РёРё РїСЂРѕРіСЂР°РјРјС‹ В«РњРµР¶РґСѓРЅР°СЂРѕРґРЅР°СЏ С€РєРѕР»Р° Р”РёР»РёР¶Р°РЅР°В», СѓС‚РІРµСЂР¶РґРµРЅРЅРѕР№ Р—Р°РєРѕРЅРѕРј Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ РѕС‚ 19 РёСЋРЅСЏ 2013 Рі., РїСЂРёРјРµРЅСЏРµРјС‹Рµ РґРѕ 1 СЏРЅРІР°СЂСЏ 2018 Рі., Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ, РІРµР»РѕСЃРёРїРµРґРѕРІ, РІРѕРґРЅРѕРіРѕ Рё РІРѕР·РґСѓС€РЅРѕРіРѕ С‚СЂР°РЅСЃРїРѕСЂС‚Р°', 'AM', '5.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (311, 'Р‘Рђ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїРѕСЃС‚Р°РІР»СЏРµРјС‹С… РёРЅРѕСЃС‚СЂР°РЅРЅС‹РјРё РіРѕСЃСѓРґР°СЂСЃС‚РІР°РјРё, РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РјРµР¶РїСЂР°РІРёС‚РµР»СЊСЃС‚РІРµРЅРЅС‹РјРё (РјРµР¶РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹РјРё) РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё, РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё, РёРЅРѕСЃС‚СЂР°РЅРЅС‹РјРё Рё РґРµР№СЃС‚РІСѓСЋС‰РёРјРё РІ Р РµСЃРїСѓР±Р»РёРєРµ РђСЂРјРµРЅРёСЏ РѕР±С‰РµСЃС‚РІРµРЅРЅС‹РјРё (РІРєР»СЋС‡Р°СЏ Р±Р»Р°РіРѕС‚РІРѕСЂРёС‚РµР»СЊРЅС‹Рµ), СЂРµР»РёРіРёРѕР·РЅС‹РјРё Рё РёРЅС‹РјРё РЅРµРіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹РјРё РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё Р°РЅР°Р»РѕРіРёС‡РЅРѕРіРѕ С…Р°СЂР°РєС‚РµСЂР°, РѕС‚РґРµР»СЊРЅС‹РјРё Р±Р»Р°РіРѕС‚РІРѕСЂРёС‚РµР»СЏРјРё РІ СЂР°РјРєР°С… РїСЂРѕРіСЂР°РјРј РіСѓРјР°РЅРёС‚Р°СЂРЅРѕР№ РїРѕРјРѕС‰Рё Рё Р±Р»Р°РіРѕС‚РІРѕСЂРёС‚РµР»СЊРЅС‹С… РїСЂРѕРіСЂР°РјРј (РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё)', 'AM', '5.4');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (312, 'РќР“', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ РёР· С‚СЂРµС‚СЊРёС… СЃС‚СЂР°РЅ РЅР°Р»РѕРіРѕРїР»Р°С‚РµР»СЊС‰РёРєР°РјРё, РёРјРµСЋС‰РёРјРё СЃС‚Р°С‚СѓСЃ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ РѕРїРµСЂР°С‚РѕСЂР°, РёР»Рё РіСЂСѓРїРїРѕР№ СЂРµР·РёРґРµРЅС‚РѕРІ вЂ“ РїР»Р°С‚РµР»СЊС‰РёРєРѕРІ РЅР°Р»РѕРіР° РЅР° РїСЂРёР±С‹Р»СЊ, СЂРµР°Р»РёР·СѓСЋС‰РёС… РїСЂРѕРіСЂР°РјРјСѓ, РѕРґРѕР±СЂРµРЅРЅСѓСЋ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ, РІ СЃР»СѓС‡Р°Рµ РµСЃР»Рё СѓРєР°Р·Р°РЅРЅС‹Рµ С‚РѕРІР°СЂС‹ РІС‹РІРѕР·СЏС‚СЃСЏ РёР· Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ (РІ С‚РѕРј С‡РёСЃР»Рµ РІ РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅС‹ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°) РІ С‚РµС‡РµРЅРёРµ 180 РєР°Р»РµРЅРґР°СЂРЅС‹С… РґРЅРµР№ СЃРѕ РґРЅСЏ, СЃР»РµРґСѓСЋС‰РµРіРѕ Р·Р° РґРЅРµРј РІРІРѕР·Р° СѓРєР°Р·Р°РЅРЅС‹С… С‚РѕРІР°СЂРѕРІ', '', '5.4');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (313, 'Р’Р“', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ РёР· С‚СЂРµС‚СЊРёС… СЃС‚СЂР°РЅ РЅР°Р»РѕРіРѕРїР»Р°С‚РµР»СЊС‰РёРєР°РјРё, РёРјРµСЋС‰РёРјРё СЃС‚Р°С‚СѓСЃ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ РѕРїРµСЂР°С‚РѕСЂР°, РёР»Рё РіСЂСѓРїРїРѕР№ СЂРµР·РёРґРµРЅС‚РѕРІ вЂ“ РїР»Р°С‚РµР»СЊС‰РёРєРѕРІ РЅР°Р»РѕРіР° РЅР° РїСЂРёР±С‹Р»СЊ, СЂРµР°Р»РёР·СѓСЋС‰РёС… РїСЂРѕРіСЂР°РјРјСѓ, РѕРґРѕР±СЂРµРЅРЅСѓСЋ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ, РІ СЃР»СѓС‡Р°Рµ РµСЃР»Рё С‚РѕРІР°СЂС‹, РїРѕР»СѓС‡РµРЅРЅС‹Рµ (РѕР±СЂР°Р·РѕРІР°РІС€РёРµСЃСЏ) РІ СЂРµР·СѓР»СЊС‚Р°С‚Рµ РѕРїРµСЂР°С†РёР№ РїРѕ РїРµСЂРµСЂР°Р±РѕС‚РєРµ СѓРєР°Р·Р°РЅРЅС‹С… С‚РѕРІР°СЂРѕРІ (РїСЂРѕРґСѓРєС‚С‹ РїРµСЂРµСЂР°Р±РѕС‚РєРё), РІС‹РІРѕР·СЏС‚СЃСЏ РёР· Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ (РІ С‚РѕРј С‡РёСЃР»Рµ РІ РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅС‹ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°) РІ С‚РµС‡РµРЅРёРµ 180 РєР°Р»РµРЅРґР°СЂРЅС‹С… РґРЅРµР№ СЃРѕ РґРЅСЏ, СЃР»РµРґСѓСЋС‰РµРіРѕ Р·Р° РґРЅРµРј РІРІРѕР·Р° СѓРєР°Р·Р°РЅРЅС‹С… С‚РѕРІР°СЂРѕРІ', '', '5.4');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (319, 'РњРћ', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРЅС‹Рµ РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРѕР№ РІ СЂР°РјРєР°С… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё, РїРѕРґРїРёСЃР°РЅРЅС‹С… РґРѕ 1 Р°РїСЂРµР»СЏ 2015 Рі., РїСЂРёРјРµРЅСЏРµРјС‹Рµ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ СѓРєР°Р·Р°РЅРЅС‹РјРё РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё РґРѕ РїСЂРµРєСЂР°С‰РµРЅРёСЏ РґРµР№СЃС‚РІРёСЏ СЌС‚РёС… РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РґРѕРіРѕРІРѕСЂРѕРІ', 'KG', '6.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (320, 'РўР­', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ СЂР°РјРєР°С… СЂРµР°Р»РёР·Р°С†РёРё РїСЂРѕРµРєС‚Р° В«РњРѕРґРµСЂРЅРёР·Р°С†РёСЏ С‚РµРїР»РѕРІРѕР№ СЌР»РµРєС‚СЂРѕС†РµРЅС‚СЂР°Р»Рё РіРѕСЂРѕРґР° Р‘РёС€РєРµРєВ», РїСЂРёРјРµРЅСЏРµРјС‹Рµ РґРѕ 30 РЅРѕСЏР±СЂСЏ 2017 Рі., РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РєСЂРµРґРёС‚РЅС‹Рј СЃРѕРіР»Р°С€РµРЅРёРµРј Р»СЊРіРѕС‚РЅРѕРіРѕ РїРѕРєСѓРїР°С‚РµР»СЊСЃРєРѕРіРѕ РєСЂРµРґРёС‚Р° РјРµР¶РґСѓ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё Рё Р­РєСЃРїРѕСЂС‚РЅРѕ-РёРјРїРѕСЂС‚РЅС‹Рј Р±Р°РЅРєРѕРј РљРёС‚Р°Р№СЃРєРѕР№ РќР°СЂРѕРґРЅРѕР№ Р РµСЃРїСѓР±Р»РёРєРё РѕС‚ 11 СЃРµРЅС‚СЏР±СЂСЏ 2013 Рі.', 'KG', '6.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (321, 'Р”Рљ', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ СЂР°РјРєР°С… СЂРµР°Р»РёР·Р°С†РёРё РїСЂРѕРµРєС‚Р° В«РЎС‚СЂРѕРёС‚РµР»СЊСЃС‚РІРѕ Р»РёРЅРёРё СЌР»РµРєС‚СЂРѕРїРµСЂРµРґР°С‡Рё 500В РєР’ В«Р”Р°С‚РєР°-РљРµРјРёРЅВ» Рё РїРѕРґСЃС‚Р°РЅС†РёРё 500 РєР’ В«РљРµРјРёРЅВ», РїСЂРёРјРµРЅСЏРµРјС‹Рµ РґРѕ 31 РґРµРєР°Р±СЂСЏ 2015 Рі., РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р»СЊРіРѕС‚РЅС‹Рј РєСЂРµРґРёС‚РЅС‹Рј СЃРѕРіР»Р°С€РµРЅРёРµРј РјРµР¶РґСѓ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё Рё Р­РєСЃРїРѕСЂС‚РЅРѕ-РёРјРїРѕСЂС‚РЅС‹Рј Р±Р°РЅРєРѕРј РљРёС‚Р°Р№СЃРєРѕР№ РќР°СЂРѕРґРЅРѕР№ Р РµСЃРїСѓР±Р»РёРєРё РѕС‚ 5 РёСЋРЅСЏ 2012 Рі.', 'KG', '6.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (322, 'Р”Р ', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ СЂР°РјРєР°С… СЂРµР°Р»РёР·Р°С†РёРё РїСЂРѕРµРєС‚Р° РїРѕ СЂРµР°Р±РёР»РёС‚Р°С†РёРё РґРІСѓС… СѓС‡Р°СЃС‚РєРѕРІ РґРѕСЂРѕРі РІ РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРµ (Р Р’РЎ в„– (2012) 54 РЅРѕРјРµСЂ (242)), РїСЂРёРјРµРЅСЏРµРјС‹Рµ РґРѕ 31 РґРµРєР°Р±СЂСЏ 2017 Рі., РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р»СЊРіРѕС‚РЅС‹Рј РєСЂРµРґРёС‚РЅС‹Рј СЃРѕРіР»Р°С€РµРЅРёРµРј РјРµР¶РґСѓ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё Рё Р­РєСЃРїРѕСЂС‚РЅРѕ-РёРјРїРѕСЂС‚РЅС‹Рј Р±Р°РЅРєРѕРј РљРёС‚Р°Р№СЃРєРѕР№ РќР°СЂРѕРґРЅРѕР№ Р РµСЃРїСѓР±Р»РёРєРё РѕС‚ 4 РґРµРєР°Р±СЂСЏ 2012 Рі.', 'KG', '6.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (323, 'Р”Р›', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ СЂР°РјРєР°С… СЂРµР°Р»РёР·Р°С†РёРё РїСЂРѕРµРєС‚Р° Р°Р»СЊС‚РµСЂРЅР°С‚РёРІРЅРѕР№ Р°РІС‚РѕРґРѕСЂРѕРіРё РЎРµРІРµСЂ вЂ“ Р®Рі РЅР° СѓС‡Р°СЃС‚РєР°С… РљР°Р·Р°СЂРјР°РЅ вЂ“ Р”Р¶Р°Р»Р°Р»-РђР±Р°Рґ (РєРј 291 вЂ“ 433) Рё Р‘Р°Р»С‹РєС‡С‹ вЂ“ РђСЂР°Р» (РєРј 183+500 вЂ“ 195+486), РїСЂРёРјРµРЅСЏРµРјС‹Рµ РґРѕ 31 РґРµРєР°Р±СЂСЏ 2019 Рі., РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р»СЊРіРѕС‚РЅС‹Рј РєСЂРµРґРёС‚РЅС‹Рј СЃРѕРіР»Р°С€РµРЅРёРµРј РјРµР¶РґСѓ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё Рё Р­РєСЃРїРѕСЂС‚РЅРѕ-РёРјРїРѕСЂС‚РЅС‹Рј Р±Р°РЅРєРѕРј РљРёС‚Р°Р№СЃРєРѕР№ РќР°СЂРѕРґРЅРѕР№ Р РµСЃРїСѓР±Р»РёРєРё РѕС‚ 11 СЃРµРЅС‚СЏР±СЂСЏ 2013 Рі.', 'KG', '6.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (324, 'Р”Р‘', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ СЂР°РјРєР°С… СЂРµР°Р»РёР·Р°С†РёРё РїСЂРѕРµРєС‚Р° СЂРµРєРѕРЅСЃС‚СЂСѓРєС†РёРё Р°РІС‚РѕРґРѕСЂРѕРіРё Р‘РёС€РєРµРє вЂ“ РќР°СЂС‹РЅ вЂ“ РўРѕСЂСѓРіР°СЂС‚, РїСЂРёРјРµРЅСЏРµРјС‹Рµ РґРѕ 31 РґРµРєР°Р±СЂСЏ 2017 Рі., РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РєСЂРµРґРёС‚РЅС‹РјРё СЃРѕРіР»Р°С€РµРЅРёСЏРјРё РјРµР¶РґСѓ РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРѕР№ Рё РЎР°СѓРґРѕРІСЃРєРёРј С„РѕРЅРґРѕРј СЂР°Р·РІРёС‚РёСЏ РѕС‚ 13 СЃРµРЅС‚СЏР±СЂСЏ 2011 Рі., РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРѕР№ Рё РљСѓРІРµР№С‚СЃРєРёРј С„РѕРЅРґРѕРј Р°СЂР°Р±СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЂР°Р·РІРёС‚РёСЏ РѕС‚ 7 СЃРµРЅС‚СЏР±СЂСЏ 2011 Рі. Рё РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё Рё Р¤РѕРЅРґРѕРј СЂР°Р·РІРёС‚РёСЏ РђР±Сѓ-Р”Р°Р±Рё РѕС‚ 8 С„РµРІСЂР°Р»СЏ 2012 Рі.', 'KG', '6.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (325, 'Р”Рў', 'Р›СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ РІРІРѕР·РЅС‹С… С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ РІ СЂР°РјРєР°С… СЂРµР°Р»РёР·Р°С†РёРё РїСЂРѕРµРєС‚Р° СЂРµРєРѕРЅСЃС‚СЂСѓРєС†РёРё Р°РІС‚РѕРґРѕСЂРѕРіРё РўР°СЂР°Р· вЂ“ РўР°Р»Р°СЃ вЂ“ РЎСѓСѓСЃР°РјС‹СЂ, РїСЂРёРјРµРЅСЏРµРјС‹Рµ РґРѕ 31 РґРµРєР°Р±СЂСЏ 2018 Рі., РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РєСЂРµРґРёС‚РЅС‹Рј СЃРѕРіР»Р°С€РµРЅРёРµРј РјРµР¶РґСѓ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё Рё РЎР°СѓРґРѕРІСЃРєРёРј С„РѕРЅРґРѕРј СЂР°Р·РІРёС‚РёСЏ РѕС‚ 13 Р°РІРіСѓСЃС‚Р° 2013 Рі.', 'KG', '6.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (326, 'РљР­', 'РўР°СЂРёС„РЅР°СЏ РїСЂРµС„РµСЂРµРЅС†РёСЏ РІ РІРёРґРµ РѕСЃРІРѕР±РѕР¶РґРµРЅРёСЏ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РїСЂРѕРёСЃС…РѕРґСЏС‰РёС… Рё РІРІРѕР·РёРјС‹С… РёР· РіРѕСЃСѓРґР°СЂСЃС‚РІ, РѕР±СЂР°Р·СѓСЋС‰РёС… РІРјРµСЃС‚Рµ СЃ РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРѕР№ Р·РѕРЅСѓ СЃРІРѕР±РѕРґРЅРѕР№ С‚РѕСЂРіРѕРІР»Рё', 'KG', '6.2.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (327, 'РџР�', '6.2.2. Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїСѓРЅРєС‚Рµ 6.2.1 РїРѕРґСЂР°Р·РґРµР»Р° 6.2, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ', 'KG', '6.2.2');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (328, 'Рђ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ Р°РєС†РёР·РѕРІ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј Р»СЊРіРѕС‚, РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹С… РІ РїРѕРґСЂР°Р·РґРµР»Рµ 1.2', 'KG', '6.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (329, 'Р�', 'Р�РЅС‹Рµ, РЅРµ РїРѕРёРјРµРЅРѕРІР°РЅРЅС‹Рµ РІ РїРѕРґСЂР°Р·РґРµР»Р°С… 1.2 Рё 6.3, Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ Р°РєС†РёР·РѕРІ', 'KG', '6.3');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (330, 'Р‘Рђ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ РљС‹СЂРіС‹Р·СЃРєСѓСЋ Р РµСЃРїСѓР±Р»РёРєСѓ РІ РєР°С‡РµСЃС‚РІРµ РіСѓРјР°РЅРёС‚Р°СЂРЅРѕР№ РїРѕРјРѕС‰Рё, РІ Р±Р»Р°РіРѕС‚РІРѕСЂРёС‚РµР»СЊРЅС‹С… С†РµР»СЏС… РїРѕ Р»РёРЅРёРё РіРѕСЃСѓРґР°СЂСЃС‚РІ, РїСЂР°РІРёС‚РµР»СЊСЃС‚РІ РіРѕСЃСѓРґР°СЂСЃС‚РІ Рё РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (331, 'Р“Р ', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ РљС‹СЂРіС‹Р·СЃРєСѓСЋ Р РµСЃРїСѓР±Р»РёРєСѓ Р·Р° СЃС‡РµС‚ Р±РµР·РІРѕР·РјРµР·РґРЅРѕР№ РїРѕРјРѕС‰Рё (РіСЂР°РЅС‚РѕРІ), РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРЅС‹С… РїРѕ Р»РёРЅРёРё РіРѕСЃСѓРґР°СЂСЃС‚РІ, РїСЂР°РІРёС‚РµР»СЊСЃС‚РІ РіРѕСЃСѓРґР°СЂСЃС‚РІ Рё РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (332, 'РЎР‘', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РѕРІР°СЂРѕРІ, РІРІРѕР·РёРјС‹С… РІ РљС‹СЂРіС‹Р·СЃРєСѓСЋ Р РµСЃРїСѓР±Р»РёРєСѓ РІ С†РµР»СЏС… Р»РёРєРІРёРґР°С†РёРё РїРѕСЃР»РµРґСЃС‚РІРёР№ Р°РІР°СЂРёР№ Рё РєР°С‚Р°СЃС‚СЂРѕС„, СЃС‚РёС…РёР№РЅС‹С… Р±РµРґСЃС‚РІРёР№', 'KG', '6.4.1');
INSERT INTO exemptionsfromcustomsdutyclassifier VALUES (333, 'РџР”', 'РћСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ РќР”РЎ РІ РѕС‚РЅРѕС€РµРЅРёРё РґРµС‚СЃРєРѕРіРѕ РїРёС‚Р°РЅРёСЏ', 'KG', '6.4.1');


--
-- TOC entry 4571 (class 0 OID 18943)
-- Dependencies: 265
-- Data for Name: featureofmovementofgoodsclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4573 (class 0 OID 18951)
-- Dependencies: 267
-- Data for Name: govcontrolsystemandtechresourceskindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4575 (class 0 OID 18959)
-- Dependencies: 269
-- Data for Name: govcontrolsystemkindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4577 (class 0 OID 18967)
-- Dependencies: 271
-- Data for Name: govsupportsystemkindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4579 (class 0 OID 18975)
-- Dependencies: 273
-- Data for Name: incidentassessmentcodeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO incidentassessmentcodeclassifier VALUES (1, '1000', 'РђРєС‚РёРІР°С†РёСЏ, СѓСЃС‚Р°РЅРѕРІРєР° РёР»Рё СЂР°Р·СЉРµРґРёРЅРµРЅРёРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (2, '1001', 'РўСЂСѓРґРЅРѕСЃС‚Рё РІ СѓСЃС‚Р°РЅРѕРІРєРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (3, '1002', 'РћС‚РєР°Р· Р°РєС‚РёРІР°С†РёРё');
INSERT INTO incidentassessmentcodeclassifier VALUES (4, '1003', 'РћС‚РєР°Р· РїСЂРё СЂР°Р·СЉРµРґРёРЅРµРЅРёРё');
INSERT INTO incidentassessmentcodeclassifier VALUES (5, '1004', 'РџСЂРµР¶РґРµРІСЂРµРјРµРЅРЅР°СЏ Р°РєС‚РёРІР°С†РёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (6, '1005', 'Р—Р°РґРµСЂР¶РєР° Р°РєС‚РёРІР°С†РёРё');
INSERT INTO incidentassessmentcodeclassifier VALUES (7, '1100', 'РђРїРїР°СЂР°С‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° РєРѕРјРїСЊСЋС‚РµСЂР°');
INSERT INTO incidentassessmentcodeclassifier VALUES (8, '1101', 'РџСЂРѕР±Р»РµРјР° Р°РїРїР°СЂР°С‚РЅС‹С… СЃСЂРµРґСЃС‚РІ РєРѕРјРїСЊСЋС‚РµСЂР°');
INSERT INTO incidentassessmentcodeclassifier VALUES (9, '1102', 'РџСЂРѕР±Р»РµРјР° СЃРµС‚Рё');
INSERT INTO incidentassessmentcodeclassifier VALUES (10, '1200', 'РљРѕРјРїСЊСЋС‚РµСЂРЅРѕРµ РїСЂРѕРіСЂР°РјРјРЅРѕРµ РѕР±РµСЃРїРµС‡РµРЅРёРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (11, '1201', 'РџСЂРѕР±Р»РµРјР° РїСЂРёРєР»Р°РґРЅРѕР№ РїСЂРѕРіСЂР°РјРјС‹');
INSERT INTO incidentassessmentcodeclassifier VALUES (12, '1202', 'РџСЂРѕР±Р»РµРјР° РїСЂРѕРіСЂР°РјРјРёСЂРѕРІР°РЅРёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (13, '1300', 'РџРѕРґРєР»СЋС‡РµРЅРёРµ РёР»Рё СѓСЃС‚Р°РЅРѕРІРєР°');
INSERT INTO incidentassessmentcodeclassifier VALUES (14, '1301', 'РџСЂРѕР±Р»РµРјР° РїРѕРґРєР»СЋС‡РµРЅРёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (15, '1302', 'РћС‚РєР»СЋС‡РµРЅРёРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (16, '1303', 'РћС‚РєР°Р· РѕС‚РєР»СЋС‡РµРЅРёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (17, '1304', 'РџСЂРѕР±Р»РµРјР° СѓСЃС‚Р°РЅРѕРІРєРё');
INSERT INTO incidentassessmentcodeclassifier VALUES (18, '1305', 'РќРµРЅР°РґРµР¶РЅРѕРµ РёР»Рё РїСЂРµСЂС‹РІР°СЋС‰РµРµ РїРѕРґРєР»СЋС‡РµРЅРёРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (19, '1306', 'РќРµРїСЂР°РІРёР»СЊРЅРѕРµ РїРѕРґРєР»СЋС‡РµРЅРёРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (20, '1400', 'Р­Р»РµРєС‚СЂРёС‡РµСЃС‚РІРѕ/СЌР»РµРєС‚СЂРѕРЅРёРєР°');
INSERT INTO incidentassessmentcodeclassifier VALUES (21, '1401', 'Р�СЃРєСЂРµРЅРёРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (22, '1402', 'РћС‚РєР°Р· С†РµРїРё');
INSERT INTO incidentassessmentcodeclassifier VALUES (23, '1403', 'РџСЂРѕР±Р»РµРјР° С‡СѓРІСЃС‚РІРёС‚РµР»СЊРЅРѕРіРѕ СЌР»РµРјРµРЅС‚Р°');
INSERT INTO incidentassessmentcodeclassifier VALUES (24, '1404', 'РџСЂРѕР±Р»РµРјР° РёСЃС‚РѕС‡РЅРёРєР° РїРёС‚Р°РЅРёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (25, '1405', 'Р�СЃРєСЂР°');
INSERT INTO incidentassessmentcodeclassifier VALUES (26, '1500', 'Р’РЅРµС€РЅРёРµ СѓСЃР»РѕРІРёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (27, '1501', 'РћРєСЂСѓР¶Р°СЋС‰РёРµ С‡Р°СЃС‚РёС†С‹');
INSERT INTO incidentassessmentcodeclassifier VALUES (28, '1502', 'Р“Р°Р·С‹ РёР»Рё РїР°СЂС‹');
INSERT INTO incidentassessmentcodeclassifier VALUES (29, '1503', 'РќРµРїРѕРґС…РѕРґСЏС‰РµРµ С…СЂР°РЅРµРЅРёРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (30, '1504', 'РџРѕС‚РµСЂСЏ РјРѕС‰РЅРѕСЃС‚Рё');
INSERT INTO incidentassessmentcodeclassifier VALUES (31, '1600', 'РћС‚РєР°Р· РёРјРїР»Р°РЅС‚РёСЂСѓРµРјС‹С… РёР·РґРµР»РёР№');
INSERT INTO incidentassessmentcodeclassifier VALUES (32, '1601', 'РњРёРіСЂР°С†РёСЏ РёР·РґРµР»РёСЏ РёР»Рё РєРѕРјРїРѕРЅРµРЅС‚РѕРІ РёР·РґРµР»РёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (33, '1602', 'РџСЂРѕР±Р»РµРјР°, СЃРІСЏР·Р°РЅРЅР°СЏ СЃ СЂР°Р·СЂСѓС€РµРЅРёРµРј РєРѕСЃС‚Рё');
INSERT INTO incidentassessmentcodeclassifier VALUES (34, '1700', 'РќРµСЃРѕРІРјРµСЃС‚РёРјРѕСЃС‚СЊ');
INSERT INTO incidentassessmentcodeclassifier VALUES (35, '1701', 'РќРµСЃРѕРІРјРµСЃС‚РёРјРѕСЃС‚СЊ РєРѕРјРїРѕРЅРµРЅС‚РѕРІ РёР»Рё Р°РєСЃРµСЃСЃСѓР°СЂРѕРІ');
INSERT INTO incidentassessmentcodeclassifier VALUES (36, '1702', 'РќРµСЃРѕРІРјРµСЃС‚РёРјРѕСЃС‚СЊ РЅР° СѓСЂРѕРІРЅРµ "РёР·РґРµР»РёРµ-РёР·РґРµР»РёРµ"');
INSERT INTO incidentassessmentcodeclassifier VALUES (37, '1703', 'РќРµСЃРѕРІРјРµСЃС‚РёРјРѕСЃС‚СЊ РЅР° СѓСЂРѕРІРЅРµ "РїР°С†РёРµРЅС‚-РёР·РґРµР»РёРµ"');
INSERT INTO incidentassessmentcodeclassifier VALUES (38, '1800', 'Р�РЅС„СѓР·РёСЏ/РїРѕРґР°С‡Р°');
INSERT INTO incidentassessmentcodeclassifier VALUES (39, '1801', 'РџСЂРѕР±Р»РµРјР°, СЃРІСЏР·Р°РЅРЅР°СЏ СЃ РѕСЃРІРѕР±РѕР¶РґРµРЅРёРµРј РѕС‚ СЃРѕРґРµСЂР¶РёРјРѕРіРѕ');
INSERT INTO incidentassessmentcodeclassifier VALUES (40, '1802', 'РќРµРїСЂР°РІРёР»СЊРЅР°СЏ РїРѕРґР°С‡Р° РёР»Рё РёРЅС„СѓР·РёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (41, '1803', 'РџСЂРѕР±Р»РµРјР° РЅР°РїРѕР»РЅРµРЅРёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (42, '1804', 'РќРµС‚ РїРѕС‚РѕРєР°');
INSERT INTO incidentassessmentcodeclassifier VALUES (43, '1805', 'Р§СЂРµР·РјРµСЂРЅС‹Р№ РїРѕС‚РѕРє');
INSERT INTO incidentassessmentcodeclassifier VALUES (44, '1806', 'РќРµРґРѕСЃС‚Р°С‚РѕС‡РЅРѕРµ РїРѕСЃС‚СѓРїР»РµРЅРёРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (45, '1900', 'РњР°СЂРєРёСЂРѕРІРєР°, СЌС‚РёРєРµС‚РёСЂРѕРІР°РЅРёРµ Рё РёРЅСЃС‚СЂСѓРєС†РёСЏ РїРѕ РїСЂРёРјРµРЅРµРЅРёСЋ');
INSERT INTO incidentassessmentcodeclassifier VALUES (46, '1901', 'РџСЂРѕР±Р»РµРјР° РёРЅСЃС‚СЂСѓРєС†РёРё РїРѕ РїСЂРёРјРµРЅРµРЅРёСЋ');
INSERT INTO incidentassessmentcodeclassifier VALUES (47, '1902', 'РџСЂРѕР±Р»РµРјР° РјР°СЂРєРёСЂРѕРІРєРё');
INSERT INTO incidentassessmentcodeclassifier VALUES (48, '2000', 'РњР°С‚РµСЂРёР°Р»');
INSERT INTO incidentassessmentcodeclassifier VALUES (49, '2001', 'Р Р°Р·СЂС‹РІ');
INSERT INTO incidentassessmentcodeclassifier VALUES (50, '2002', 'Р Р°СЃС‚СЂРµСЃРєРёРІР°РЅРёРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (51, '2003', 'Р”РµРіСЂР°РґР°С†РёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (52, '2004', 'РћР±РµСЃС†РІРµС‡РёРІР°РЅРёРµ РјР°С‚РµСЂРёР°Р»Р°');
INSERT INTO incidentassessmentcodeclassifier VALUES (53, '2005', 'Р¤СЂР°РіРјРµРЅС‚Р°С†РёСЏ РјР°С‚РµСЂРёР°Р»Р°');
INSERT INTO incidentassessmentcodeclassifier VALUES (54, '2006', 'РџРµСЂС„РѕСЂР°С†РёСЏ РјР°С‚РµСЂРёР°Р»Р°');
INSERT INTO incidentassessmentcodeclassifier VALUES (55, '2007', 'Р Р°СЃСЃР»РѕРµРЅРёРµ РјР°С‚РµСЂРёР°Р»Р°');
INSERT INTO incidentassessmentcodeclassifier VALUES (56, '2100', 'РњРµС…Р°РЅРёС‡РµСЃРєР°СЏ С‡Р°СЃС‚СЊ');
INSERT INTO incidentassessmentcodeclassifier VALUES (57, '2101', 'РќРµСЃРѕРѕС‚РІРµС‚СЃС‚РІСѓСЋС‰Р°СЏ РєР°Р»РёР±СЂРѕРІРєР°');
INSERT INTO incidentassessmentcodeclassifier VALUES (58, '2102', 'РћС‚СЃРѕРµРґРёРЅРµРЅРёРµ РёР·РґРµР»РёСЏ РёР»Рё РєРѕРјРїРѕРЅРµРЅС‚РѕРІ РёР·РґРµР»РёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (59, '2103', 'РЎРјРµС‰РµРЅРёРµ РёР»Рё РїРµСЂРµРјРµС‰РµРЅРёРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (60, '2104', 'РЈС‚РµС‡РєР°');
INSERT INTO incidentassessmentcodeclassifier VALUES (61, '2105', 'РњРµС…Р°РЅРёС‡РµСЃРєР°СЏ РїРѕРјРµС…Р°');
INSERT INTO incidentassessmentcodeclassifier VALUES (62, '2106', 'РџСЂРѕР±Р»РµРјР° РІРѕР·РІСЂР°С‚Р° РІ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅРѕРµ РїРѕР»РѕР¶РµРЅРёРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (63, '2107', 'РќРµРїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅРѕРµ РїРµСЂРµРјРµС‰РµРЅРёРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (64, '2200', 'РќРµРјРµС…Р°РЅРёС‡РµСЃРєР°СЏ С‡Р°СЃС‚СЊ');
INSERT INTO incidentassessmentcodeclassifier VALUES (65, '2201', 'РҐРёРјРёС‡РµСЃРєР°СЏ РїСЂРѕР±Р»РµРјР°');
INSERT INTO incidentassessmentcodeclassifier VALUES (66, '2202', 'РЎРІСЏР·СЊ РёР»Рё СѓСЂРѕРІРµРЅСЊ РїРµСЂРµРґР°РІР°РµРјРѕРіРѕ СЃРёРіРЅР°Р»Р°');
INSERT INTO incidentassessmentcodeclassifier VALUES (67, '2203', 'РЈСЃС‚Р°РЅРѕРІРєР°');
INSERT INTO incidentassessmentcodeclassifier VALUES (68, '2204', 'РћРїС‚РёС‡РµСЃРєР°СЏ РїСЂРѕР±Р»РµРјР°');
INSERT INTO incidentassessmentcodeclassifier VALUES (69, '2205', 'РќРµСЃРѕРѕС‚РІРµС‚СЃС‚РІРёРµ С‚РµР»РµРјРµС‚СЂРёРё');
INSERT INTO incidentassessmentcodeclassifier VALUES (70, '2300', 'РџСЂРѕС‡РёРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (71, '2301', 'РџСЂРѕС‡РёРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (72, '2400', 'РџСЂРѕР±Р»РµРјР° РЅР° РІС‹С…РѕРґРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (73, '2401', 'РќРµРїСЂР°РІРёР»СЊРЅС‹Р№ РІС‹С…РѕРґ СЌРЅРµСЂРіРёРё РЅР° С‚РєР°РЅРё РїР°С†РёРµРЅС‚Р°');
INSERT INTO incidentassessmentcodeclassifier VALUES (74, '2500', 'РЈРїР°РєРѕРІРєР°/РґРѕСЃС‚Р°РІРєР°');
INSERT INTO incidentassessmentcodeclassifier VALUES (75, '2501', 'РџРѕРІСЂРµР¶РґРµРЅРёРµ РґРѕ РїСЂРёРјРµРЅРµРЅРёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (76, '2502', 'РџРѕСЃС‚Р°РІРєР° РЅРµСЃС‚РµСЂРёР»СЊРЅС‹С… РїСЂРѕРґСѓРєС‚РѕРІ');
INSERT INTO incidentassessmentcodeclassifier VALUES (77, '2503', 'РЈРїР°РєРѕРІРєР°');
INSERT INTO incidentassessmentcodeclassifier VALUES (78, '2504', 'Р—Р°РіСЂСЏР·РЅРµРЅРёРµ РёР·РґРµР»РёСЏ РІРѕ РІСЂРµРјСЏ РґРѕСЃС‚Р°РІРєРё');
INSERT INTO incidentassessmentcodeclassifier VALUES (79, '2505', 'РўСЂСѓРґРЅРѕСЃС‚Рё РІ РѕС‚РєСЂС‹С‚РёРё РёР»Рё СѓРґР°Р»РµРЅРёРё СѓРїР°РєРѕРІРѕС‡РЅС‹С… РјР°С‚РµСЂРёР°Р»РѕРІ');
INSERT INTO incidentassessmentcodeclassifier VALUES (80, '2600', 'Р—Р°С‰РёС‚Р°');
INSERT INTO incidentassessmentcodeclassifier VALUES (81, '2601', 'РџСЂРѕР±Р»РµРјР° СЃРёСЃС‚РµРјС‹ СЃРёРіРЅР°Р»РёР·Р°С†РёРё РёР·РґРµР»РёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (82, '2602', 'РџСЂРѕР±Р»РµРјР° Р·Р°С‰РёС‚РЅРѕР№ С„СѓРЅРєС†РёРё');
INSERT INTO incidentassessmentcodeclassifier VALUES (83, '2700', 'РўРµРјРїРµСЂР°С‚СѓСЂР°');
INSERT INTO incidentassessmentcodeclassifier VALUES (84, '2701', 'РЎРѕР¶Р¶РµРЅРЅС‹Рµ РёР·РґРµР»РёСЏ РёР»Рё РєРѕРјРїРѕРЅРµРЅС‚С‹');
INSERT INTO incidentassessmentcodeclassifier VALUES (85, '2702', 'РџРѕР¶Р°СЂ');
INSERT INTO incidentassessmentcodeclassifier VALUES (86, '2703', 'РџР»Р°РјСЏ РёР»Рё РёСЃРєСЂРµРЅРёРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (87, '2704', 'РќРµРґРѕСЃС‚Р°С‚РѕС‡РЅРѕРµ РѕС…Р»Р°Р¶РґРµРЅРёРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (88, '2705', 'РџРµСЂРµРіСЂРµРІ РёР·РґРµР»РёСЏ РёР»Рё РєРѕРјРїРѕРЅРµРЅС‚РѕРІ РёР·РґРµР»РёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (89, '2706', 'Р—Р°РґС‹РјР»РµРЅРёРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (90, '2800', 'РќРµРїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅР°СЏ С„СѓРЅРєС†РёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (91, '2801', 'Р�Р·РґРµР»РёРµ РѕС‚РѕР±СЂР°Р¶Р°РµС‚ РЅРµРїСЂР°РІРёР»СЊРЅРѕРµ СЃРѕРѕР±С‰РµРЅРёРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (92, '2802', 'РџРѕРІСЂРµР¶РґРµРЅРёРµ СЃС†РµРїР»РµРЅРёСЏ РёР»Рё СЃРѕРµРґРёРЅРµРЅРёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (93, '2803', 'РќРµРїСЂР°РІРёР»СЊРЅР°СЏ СЃР±РѕСЂРєР°');
INSERT INTO incidentassessmentcodeclassifier VALUES (94, '2804', 'РџСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ Р»РµС‡РµРЅРёСЏ РЅРµ С‚РѕР№ РѕР±Р»Р°СЃС‚Рё С‚РµР»Р°');
INSERT INTO incidentassessmentcodeclassifier VALUES (95, '2900', 'РћС€РёР±РєР° РїСЂРёРјРµРЅРµРЅРёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (96, '2901', 'РќРµРґРѕСЃС‚Р°С‚РѕС‡РЅР°СЏ РёР»Рё РЅРµРЅР°РґР»РµР¶Р°С‰Р°СЏ РґРµР·РёРЅС„РµРєС†РёСЏ Рё СЃС‚РµСЂРёР»РёР·Р°С†РёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (97, '2902', 'РќРµРґРѕСЃС‚Р°С‚РѕС‡РЅРѕРµ РѕР±СѓС‡РµРЅРёРµ');
INSERT INTO incidentassessmentcodeclassifier VALUES (98, '2903', 'РџСЂРѕР±Р»РµРјР° С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ РѕР±СЃР»СѓР¶РёРІР°РЅРёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (99, '2904', 'РџСЂРѕР±Р»РµРјР° РІРѕСЃСЃС‚Р°РЅРѕРІР»РµРЅРёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (100, '2905', 'РџСЂРѕР±Р»РµРјР° РїСЂРёРјРµРЅРµРЅРёСЏ РёР·РґРµР»РёСЏ');
INSERT INTO incidentassessmentcodeclassifier VALUES (101, '2906', 'РќРµСЂР°Р±РѕС‚Р°СЋС‰РµРµ РёР·РґРµР»РёРµ');


--
-- TOC entry 4581 (class 0 OID 18983)
-- Dependencies: 275
-- Data for Name: institutionaleconomysectorclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO institutionaleconomysectorclassifier VALUES (1, '1', 'Р­РєРѕРЅРѕРјРёРєР° РІ С†РµР»РѕРј');
INSERT INTO institutionaleconomysectorclassifier VALUES (2, '1.1', 'РќРµС„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё');
INSERT INTO institutionaleconomysectorclassifier VALUES (3, '1.1.1', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РЅРµС„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё');
INSERT INTO institutionaleconomysectorclassifier VALUES (4, '1.1.1.1', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РЅРµС„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё');
INSERT INTO institutionaleconomysectorclassifier VALUES (5, '1.1.1.1.1', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РЅРµС„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё вЂ“ РќРљРћ*');
INSERT INTO institutionaleconomysectorclassifier VALUES (6, '1.1.1.1.2', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РЅРµС„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё вЂ“ РћРџРџ**');
INSERT INTO institutionaleconomysectorclassifier VALUES (7, '1.1.2', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ РЅРµС„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё');
INSERT INTO institutionaleconomysectorclassifier VALUES (8, '1.1.2.1', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ РЅРµС„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё');
INSERT INTO institutionaleconomysectorclassifier VALUES (9, '1.1.2.1.1', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ РЅРµС„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (10, '1.1.2.1.2', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ РЅРµС„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (11, '1.1.3', 'РќРµС„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј');
INSERT INTO institutionaleconomysectorclassifier VALUES (12, '1.1.3.1', 'РќРµС„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј');
INSERT INTO institutionaleconomysectorclassifier VALUES (13, '1.1.3.1.1', 'РќРµС„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (14, '1.1.3.1.2', 'РќРµС„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (15, '1.2', 'Р¤РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё');
INSERT INTO institutionaleconomysectorclassifier VALUES (16, '1.2.1', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Р№ (С†РµРЅС‚СЂР°Р»СЊРЅС‹Р№) Р±Р°РЅРє');
INSERT INTO institutionaleconomysectorclassifier VALUES (17, '1.2.2', 'РљРѕСЂРїРѕСЂР°С†РёРё, РїСЂРёРЅРёРјР°СЋС‰РёРµ РґРµРїРѕР·РёС‚С‹, РєСЂРѕРјРµ РЅР°С†РёРѕРЅР°Р»СЊРЅРѕРіРѕ (С†РµРЅС‚СЂР°Р»СЊРЅРѕРіРѕ) Р±Р°РЅРєР°');
INSERT INTO institutionaleconomysectorclassifier VALUES (18, '1.2.2.1', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё, РїСЂРёРЅРёРјР°СЋС‰РёРµ РґРµРїРѕР·РёС‚С‹');
INSERT INTO institutionaleconomysectorclassifier VALUES (19, '1.2.2.1.1', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё, РїСЂРёРЅРёРјР°СЋС‰РёРµ РґРµРїРѕР·РёС‚С‹, вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (20, '1.2.2.1.2', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё, РїСЂРёРЅРёРјР°СЋС‰РёРµ РґРµРїРѕР·РёС‚С‹, вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (21, '1.2.2.2', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё, РїСЂРёРЅРёРјР°СЋС‰РёРµ РґРµРїРѕР·РёС‚С‹');
INSERT INTO institutionaleconomysectorclassifier VALUES (22, '1.2.2.2.1', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё, РїСЂРёРЅРёРјР°СЋС‰РёРµ РґРµРїРѕР·РёС‚С‹, вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (23, '1.2.2.2.2', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё, РїСЂРёРЅРёРјР°СЋС‰РёРµ РґРµРїРѕР·РёС‚С‹, вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (24, '1.2.2.3', 'РљРѕСЂРїРѕСЂР°С†РёРё, РїСЂРёРЅРёРјР°СЋС‰РёРµ РґРµРїРѕР·РёС‚С‹, РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј');
INSERT INTO institutionaleconomysectorclassifier VALUES (25, '1.2.2.3.1', 'РљРѕСЂРїРѕСЂР°С†РёРё, РїСЂРёРЅРёРјР°СЋС‰РёРµ РґРµРїРѕР·РёС‚С‹, РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (26, '1.2.2.3.2', 'РљРѕСЂРїРѕСЂР°С†РёРё, РїСЂРёРЅРёРјР°СЋС‰РёРµ РґРµРїРѕР·РёС‚С‹, РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (27, '1.2.3', 'Р¤РѕРЅРґС‹ РґРµРЅРµР¶РЅРѕРіРѕ СЂС‹РЅРєР°');
INSERT INTO institutionaleconomysectorclassifier VALUES (28, '1.2.3.1', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ С„РѕРЅРґС‹ РґРµРЅРµР¶РЅРѕРіРѕ СЂС‹РЅРєР°');
INSERT INTO institutionaleconomysectorclassifier VALUES (29, '1.2.3.1.1', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ С„РѕРЅРґС‹ РґРµРЅРµР¶РЅРѕРіРѕ СЂС‹РЅРєР° вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (30, '1.2.3.1.2', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ С„РѕРЅРґС‹ РґРµРЅРµР¶РЅРѕРіРѕ СЂС‹РЅРєР° вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (31, '1.2.3.2', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹РµВ  С„РѕРЅРґС‹ РґРµРЅРµР¶РЅРѕРіРѕ СЂС‹РЅРєР°');
INSERT INTO institutionaleconomysectorclassifier VALUES (32, '1.2.3.2.1', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹РµВ  С„РѕРЅРґС‹ РґРµРЅРµР¶РЅРѕРіРѕ СЂС‹РЅРєР° вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (33, '1.2.3.2.2', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹РµВ  С„РѕРЅРґС‹ РґРµРЅРµР¶РЅРѕРіРѕ СЂС‹РЅРєР° вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (34, '1.2.3.3', 'Р¤РѕРЅРґС‹ РґРµРЅРµР¶РЅРѕРіРѕ СЂС‹РЅРєР° РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј');
INSERT INTO institutionaleconomysectorclassifier VALUES (35, '1.2.3.3.1', 'Р¤РѕРЅРґС‹ РґРµРЅРµР¶РЅРѕРіРѕ СЂС‹РЅРєР° РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (36, '1.2.3.3.2', 'Р¤РѕРЅРґС‹ РґРµРЅРµР¶РЅРѕРіРѕ СЂС‹РЅРєР° РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (37, '1.2.4', 'Р�РЅРІРµСЃС‚РёС†РёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹ РЅРµРґРµРЅРµР¶РЅРѕРіРѕ СЂС‹РЅРєР°');
INSERT INTO institutionaleconomysectorclassifier VALUES (38, '1.2.4.1', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РёРЅРІРµСЃС‚РёС†РёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹ РЅРµРґРµРЅРµР¶РЅРѕРіРѕ СЂС‹РЅРєР°');
INSERT INTO institutionaleconomysectorclassifier VALUES (39, '1.2.4.1.1', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РёРЅРІРµСЃС‚РёС†РёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹ РЅРµРґРµРЅРµР¶РЅРѕРіРѕ СЂС‹РЅРєР° вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (40, '1.2.4.1.2', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РёРЅРІРµСЃС‚РёС†РёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹ РЅРµРґРµРЅРµР¶РЅРѕРіРѕ СЂС‹РЅРєР° вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (41, '1.2.4.2', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ РёРЅРІРµСЃС‚РёС†РёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹ РЅРµРґРµРЅРµР¶РЅРѕРіРѕ СЂС‹РЅРєР°');
INSERT INTO institutionaleconomysectorclassifier VALUES (42, '1.2.4.2.1', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ РёРЅРІРµСЃС‚РёС†РёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹ РЅРµРґРµРЅРµР¶РЅРѕРіРѕ СЂС‹РЅРєР° вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (43, '1.2.4.2.2', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ РёРЅРІРµСЃС‚РёС†РёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹ РЅРµРґРµРЅРµР¶РЅРѕРіРѕ СЂС‹РЅРєР° вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (44, '1.2.4.3', 'Р�РЅРІРµСЃС‚РёС†РёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹ РЅРµРґРµРЅРµР¶РЅРѕРіРѕ СЂС‹РЅРєР° РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј');
INSERT INTO institutionaleconomysectorclassifier VALUES (45, '1.2.4.3.1', 'Р�РЅРІРµСЃС‚РёС†РёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹ РЅРµРґРµРЅРµР¶РЅРѕРіРѕ СЂС‹РЅРєР° РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (46, '1.2.4.3.2', 'Р�РЅРІРµСЃС‚РёС†РёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹ РЅРµРґРµРЅРµР¶РЅРѕРіРѕ СЂС‹РЅРєР° РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (47, '1.2.5', 'Р”СЂСѓРіРёРµ С„РёРЅР°РЅСЃРѕРІС‹Рµ РїРѕСЃСЂРµРґРЅРёРєРё, РєСЂРѕРјРµ СЃС‚СЂР°С…РѕРІС‹С… РєРѕСЂРїРѕСЂР°С†РёР№ Рё РїРµРЅСЃРёРѕРЅРЅС‹С… С„РѕРЅРґРѕРІ');
INSERT INTO institutionaleconomysectorclassifier VALUES (48, '1.2.5.1', 'Р”СЂСѓРіРёРµ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё');
INSERT INTO institutionaleconomysectorclassifier VALUES (49, '1.2.5.1.1', 'Р”СЂСѓРіРёРµ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (50, '1.2.5.1.2', 'Р”СЂСѓРіРёРµ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (51, '1.2.5.2', 'Р”СЂСѓРіРёРµ РЅР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё');
INSERT INTO institutionaleconomysectorclassifier VALUES (52, '1.2.5.2.1', 'Р”СЂСѓРіРёРµ РЅР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (53, '1.2.5.2.2', 'Р”СЂСѓРіРёРµ РЅР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (54, '1.2.5.3', 'Р”СЂСѓРіРёРµ С„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј');
INSERT INTO institutionaleconomysectorclassifier VALUES (55, '1.2.5.3.1', 'Р”СЂСѓРіРёРµ С„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (56, '1.2.5.3.2', 'Р”СЂСѓРіРёРµ С„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (57, '1.2.6', 'Р’СЃРїРѕРјРѕРіР°С‚РµР»СЊРЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё');
INSERT INTO institutionaleconomysectorclassifier VALUES (58, '1.2.6.1', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РІСЃРїРѕРјРѕРіР°С‚РµР»СЊРЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё');
INSERT INTO institutionaleconomysectorclassifier VALUES (59, '1.2.6.1.1', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РІСЃРїРѕРјРѕРіР°С‚РµР»СЊРЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (60, '1.2.6.1.2', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РІСЃРїРѕРјРѕРіР°С‚РµР»СЊРЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (61, '1.2.6.2', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ РІСЃРїРѕРјРѕРіР°С‚РµР»СЊРЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё');
INSERT INTO institutionaleconomysectorclassifier VALUES (62, '1.2.6.2.1', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ РІСЃРїРѕРјРѕРіР°С‚РµР»СЊРЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (63, '1.2.6.2.2', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ РІСЃРїРѕРјРѕРіР°С‚РµР»СЊРЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРёВ  вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (64, '1.2.6.3', 'Р¤РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё РІСЃРїРѕРјРѕРіР°С‚РµР»СЊРЅС‹Рµ РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј');
INSERT INTO institutionaleconomysectorclassifier VALUES (65, '1.2.6.3.1', 'Р¤РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё РІСЃРїРѕРјРѕРіР°С‚РµР»СЊРЅС‹Рµ РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (66, '1.2.6.3.2', 'Р¤РёРЅР°РЅСЃРѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё РІСЃРїРѕРјРѕРіР°С‚РµР»СЊРЅС‹Рµ РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (67, '1.2.7', 'РљСЌРїС‚РёРІРЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ Рё СЂРѕСЃС‚РѕРІС‰РёРєРё');
INSERT INTO institutionaleconomysectorclassifier VALUES (68, '1.2.7.1', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РєСЌРїС‚РёРІРЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO institutionaleconomysectorclassifier VALUES (69, '1.2.7.1.1', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РєСЌРїС‚РёРІРЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (70, '1.2.7.1.2', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РєСЌРїС‚РёРІРЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (71, '1.2.7.2', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ РєСЌРїС‚РёРІРЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ');
INSERT INTO institutionaleconomysectorclassifier VALUES (72, '1.2.7.2.1', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ РєСЌРїС‚РёРІРЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (73, '1.2.7.2.2', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ РєСЌРїС‚РёРІРЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (74, '1.2.7.3', 'РљСЌРїС‚РёРІРЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј');
INSERT INTO institutionaleconomysectorclassifier VALUES (75, '1.2.7.3.1', 'РљСЌРїС‚РёРІРЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (76, '1.2.7.3.2', 'РљСЌРїС‚РёРІРЅС‹Рµ С„РёРЅР°РЅСЃРѕРІС‹Рµ СѓС‡СЂРµР¶РґРµРЅРёСЏ РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (77, '1.2.8', 'РЎС‚СЂР°С…РѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё');
INSERT INTO institutionaleconomysectorclassifier VALUES (78, '1.2.8.1', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ СЃС‚СЂР°С…РѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё');
INSERT INTO institutionaleconomysectorclassifier VALUES (79, '1.2.8.1.1', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ СЃС‚СЂР°С…РѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (80, '1.2.8.1.2', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ СЃС‚СЂР°С…РѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (81, '1.2.8.2', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ СЃС‚СЂР°С…РѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё');
INSERT INTO institutionaleconomysectorclassifier VALUES (82, '1.2.8.2.1', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ СЃС‚СЂР°С…РѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (83, '1.2.8.2.2', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ СЃС‚СЂР°С…РѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (84, '1.2.8.3', 'РЎС‚СЂР°С…РѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј');
INSERT INTO institutionaleconomysectorclassifier VALUES (85, '1.2.8.3.1', 'РЎС‚СЂР°С…РѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (86, '1.2.8.3.2', 'РЎС‚СЂР°С…РѕРІС‹Рµ РєРѕСЂРїРѕСЂР°С†РёРё РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (87, '1.2.9', 'РџРµРЅСЃРёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹');
INSERT INTO institutionaleconomysectorclassifier VALUES (88, '1.2.9.1', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РїРµРЅСЃРёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹');
INSERT INTO institutionaleconomysectorclassifier VALUES (89, '1.2.9.1.1', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РїРµРЅСЃРёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹ вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (90, '1.2.9.1.2', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рµ РїРµРЅСЃРёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹ вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (91, '1.2.9.2', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ РїРµРЅСЃРёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹');
INSERT INTO institutionaleconomysectorclassifier VALUES (92, '1.2.9.2.1', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ РїРµРЅСЃРёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹ вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (93, '1.2.9.2.2', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ РїРµРЅСЃРёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹ вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (94, '1.2.9.3', 'РџРµРЅСЃРёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹ РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј');
INSERT INTO institutionaleconomysectorclassifier VALUES (95, '1.2.9.3.1', 'РџРµРЅСЃРёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹ РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј вЂ“ РќРљРћ');
INSERT INTO institutionaleconomysectorclassifier VALUES (96, '1.2.9.3.2', 'РџРµРЅСЃРёРѕРЅРЅС‹Рµ С„РѕРЅРґС‹ РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј вЂ“ РћРџРџ');
INSERT INTO institutionaleconomysectorclassifier VALUES (97, '1.3', 'Р“РѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕРµ СѓРїСЂР°РІР»РµРЅРёРµ');
INSERT INTO institutionaleconomysectorclassifier VALUES (98, '1.3.1', 'Р¦РµРЅС‚СЂР°Р»СЊРЅС‹Рµ РѕСЂРіР°РЅС‹ СѓРїСЂР°РІР»РµРЅРёСЏ (С†РµРЅС‚СЂР°Р»СЊРЅРѕРµ РїСЂР°РІРёС‚РµР»СЊВ­СЃС‚РІРѕ)');
INSERT INTO institutionaleconomysectorclassifier VALUES (99, '1.3.1.1', 'Р¦РµРЅС‚СЂР°Р»СЊРЅС‹Рµ РѕСЂРіР°РЅС‹ СѓРїСЂР°РІР»РµРЅРёСЏ (РєСЂРѕРјРµ С„РѕРЅРґРѕРІ СЃРѕС†РёР°Р»СЊРЅРѕРіРѕ РѕР±РµСЃРїРµС‡РµРЅРёСЏ Рё РЅРµСЂС‹РЅРѕС‡РЅС‹С… РќРљРћ, РєРѕРЅС‚СЂРѕР»РёСЂСѓРµРјС‹С… С†РµРЅС‚СЂР°Р»СЊРЅС‹РјРё РѕСЂРіР°РЅР°РјРё СѓРїСЂР°РІР»РµРЅРёСЏ)');
INSERT INTO institutionaleconomysectorclassifier VALUES (100, '1.3.1.2', 'РќРµСЂС‹РЅРѕС‡РЅС‹Рµ РќРљРћ, РєРѕРЅС‚СЂРѕР»РёСЂСѓРµРјС‹Рµ С†РµРЅС‚СЂР°Р»СЊРЅС‹РјРё РѕСЂРіР°РЅР°РјРё СѓРїСЂР°РІР»РµРЅРёСЏ');
INSERT INTO institutionaleconomysectorclassifier VALUES (101, '1.3.2', 'Р РµРіРёРѕРЅР°Р»СЊРЅС‹Рµ РѕСЂРіР°РЅС‹ СѓРїСЂР°РІР»РµРЅРёСЏ');
INSERT INTO institutionaleconomysectorclassifier VALUES (102, '1.3.2.1', 'Р РµРіРёРѕРЅР°Р»СЊРЅС‹Рµ РѕСЂРіР°РЅС‹ СѓРїСЂР°РІР»РµРЅРёСЏ (РєСЂРѕРјРµ С„РѕРЅРґРѕРІ СЃРѕС†РёР°Р»СЊРЅРѕРіРѕ РѕР±РµСЃРїРµС‡РµРЅРёСЏ Рё РЅРµСЂС‹РЅРѕС‡РЅС‹С… РќРљРћ, РєРѕРЅС‚СЂРѕР»РёСЂСѓРµРјС‹С… СЂРµРіРёРѕРЅР°Р»СЊРЅС‹РјРё РѕСЂРіР°РЅР°РјРё СѓРїСЂР°РІР»РµРЅРёСЏ)');
INSERT INTO institutionaleconomysectorclassifier VALUES (103, '1.3.2.2', 'РќРµСЂС‹РЅРѕС‡РЅС‹Рµ РќРљРћ, РєРѕРЅС‚СЂРѕР»РёСЂСѓРµРјС‹Рµ СЂРµРіРёРѕРЅР°Р»СЊРЅС‹РјРё РѕСЂРіР°РЅР°РјРё СѓРїСЂР°РІР»РµРЅРёСЏ');
INSERT INTO institutionaleconomysectorclassifier VALUES (104, '1.3.3', 'РњРµСЃС‚РЅС‹Рµ РѕСЂРіР°РЅС‹ СѓРїСЂР°РІР»РµРЅРёСЏ');
INSERT INTO institutionaleconomysectorclassifier VALUES (105, '1.3.3.1', 'РњРµСЃС‚РЅС‹Рµ РѕСЂРіР°РЅС‹ СѓРїСЂР°РІР»РµРЅРёСЏ (РєСЂРѕРјРµ С„РѕРЅРґРѕРІ СЃРѕС†РёР°Р»СЊРЅРѕРіРѕ РѕР±РµСЃРїРµС‡РµРЅРёСЏ Рё РЅРµСЂС‹РЅРѕС‡РЅС‹С… РќРљРћ, РєРѕРЅС‚СЂРѕР»РёСЂСѓРµРјС‹С… РјРµСЃС‚РЅС‹РјРё РѕСЂРіР°РЅР°РјРё СѓРїСЂР°РІР»РµРЅРёСЏ)');
INSERT INTO institutionaleconomysectorclassifier VALUES (106, '1.3.3.2', 'РќРµСЂС‹РЅРѕС‡РЅС‹Рµ РќРљРћ, РєРѕРЅС‚СЂРѕР»РёСЂСѓРµРјС‹Рµ РјРµСЃС‚РЅС‹РјРё РѕСЂРіР°РЅР°РјРё СѓРїСЂР°РІР»РµРЅРёСЏ');
INSERT INTO institutionaleconomysectorclassifier VALUES (107, '1.3.4', 'Р¤РѕРЅРґС‹ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕРіРѕ СЃРѕС†РёР°Р»СЊРЅРѕРіРѕ РѕР±РµСЃРїРµС‡РµРЅРёСЏ');
INSERT INTO institutionaleconomysectorclassifier VALUES (108, '1.3.4.1', 'Р¤РѕРЅРґС‹ СЃРѕС†РёР°Р»СЊРЅРѕРіРѕ РѕР±РµСЃРїРµС‡РµРЅРёСЏ С†РµРЅС‚СЂР°Р»СЊРЅС‹С… РѕСЂРіР°РЅРѕРІ СѓРїСЂР°РІР»РµРЅРёСЏ');
INSERT INTO institutionaleconomysectorclassifier VALUES (109, '1.3.4.2', 'Р¤РѕРЅРґС‹ СЃРѕС†РёР°Р»СЊРЅРѕРіРѕ РѕР±РµСЃРїРµС‡РµРЅРёСЏ СЂРµРіРёРѕРЅР°Р»СЊРЅС‹С… РѕСЂРіР°РЅРѕРІ СѓРїСЂР°РІР»РµРЅРёСЏ');
INSERT INTO institutionaleconomysectorclassifier VALUES (110, '1.3.4.3', 'Р¤РѕРЅРґС‹ СЃРѕС†РёР°Р»СЊРЅРѕРіРѕ РѕР±РµСЃРїРµС‡РµРЅРёСЏ РјРµСЃС‚РЅС‹С… РѕСЂРіР°РЅРѕРІ СѓРїСЂР°РІР»РµРЅРёСЏ');
INSERT INTO institutionaleconomysectorclassifier VALUES (111, '1.4', 'Р”РѕРјР°С€РЅРёРµ С…РѕР·СЏР№СЃС‚РІР°');
INSERT INTO institutionaleconomysectorclassifier VALUES (112, '1.4.1', 'Р Р°Р±РѕС‚РѕРґР°С‚РµР»Рё');
INSERT INTO institutionaleconomysectorclassifier VALUES (113, '1.4.2', 'РЎР°РјРѕСЃС‚РѕСЏС‚РµР»СЊРЅРѕ Р·Р°РЅСЏС‚С‹Рµ Р»РёС†Р°');
INSERT INTO institutionaleconomysectorclassifier VALUES (114, '1.4.3', 'Р›РёС†Р°, СЂР°Р±РѕС‚Р°СЋС‰РёРµ РїРѕ РЅР°Р№РјСѓ');
INSERT INTO institutionaleconomysectorclassifier VALUES (115, '1.4.4', 'РџРѕР»СѓС‡Р°С‚РµР»Рё РґРѕС…РѕРґРѕРІ РѕС‚ СЃРѕР±СЃС‚РІРµРЅРЅРѕСЃС‚Рё Рё С‚СЂР°РЅСЃС„РµСЂС‚РѕРІ');
INSERT INTO institutionaleconomysectorclassifier VALUES (116, '1.4.4.1', 'РџРѕР»СѓС‡Р°С‚РµР»Рё РґРѕС…РѕРґРѕРІ РѕС‚ СЃРѕР±СЃС‚РІРµРЅРЅРѕСЃС‚Рё');
INSERT INTO institutionaleconomysectorclassifier VALUES (117, '1.4.4.2', 'РџРѕР»СѓС‡Р°С‚РµР»Рё РїРµРЅСЃРёР№');
INSERT INTO institutionaleconomysectorclassifier VALUES (118, '1.4.4.3', 'РџРѕР»СѓС‡Р°С‚РµР»Рё РґСЂСѓРіРёС… С‚СЂР°РЅСЃС„РµСЂС‚РЅС‹С… РґРѕС…РѕРґРѕРІ');
INSERT INTO institutionaleconomysectorclassifier VALUES (119, '1.5', 'РќРµРєРѕРјРјРµСЂС‡РµСЃРєРёРµ РѕСЂРіР°РЅРёР·Р°С†РёРё, РѕР±СЃР»СѓР¶РёРІР°СЋС‰РёРµ РґРѕРјР°С€РЅРёРµ С…РѕР·СЏР№СЃС‚РІР°');
INSERT INTO institutionaleconomysectorclassifier VALUES (120, '1.5.1', 'РќР°С†РёРѕРЅР°Р»СЊРЅС‹Рµ С‡Р°СЃС‚РЅС‹Рµ РЅРµРєРѕРјРјРµСЂС‡РµСЃРєРёРµ РѕСЂРіР°РЅРёР·Р°С†РёРё, РѕР±СЃР»СѓР¶РёРІР°СЋС‰РёРµ РґРѕРјР°С€РЅРёРµ С…РѕР·СЏР№СЃС‚РІР°');
INSERT INTO institutionaleconomysectorclassifier VALUES (121, '1.5.2', 'РќРµРєРѕРјРјРµСЂС‡РµСЃРєРёРµ РѕСЂРіР°РЅРёР·Р°С†РёРё, РѕР±СЃР»СѓР¶РёРІР°СЋС‰РёРµ РґРѕРјР°С€РЅРёРµ С…РѕР·СЏР№СЃС‚РІР°, РїРѕРґ РёРЅРѕСЃС‚СЂР°РЅРЅС‹Рј РєРѕРЅС‚СЂРѕР»РµРј');
INSERT INTO institutionaleconomysectorclassifier VALUES (122, '2', 'РћСЃС‚Р°Р»СЊРЅРѕР№ РјРёСЂ');
INSERT INTO institutionaleconomysectorclassifier VALUES (123, '3', 'РўРµСЃС‚');


--
-- TOC entry 4583 (class 0 OID 18991)
-- Dependencies: 277
-- Data for Name: internatioanltransporttypesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO internatioanltransporttypesclassifier VALUES (1, '100', 'Р’РѕРґРЅРѕРµ СЃСѓРґРЅРѕ', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (2, '201', 'РџР°СЂРѕРІРѕР·', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (3, '202', 'Р­Р»РµРєС‚СЂРѕРІРѕР·', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (4, '203', 'Р­Р»РµРєС‚СЂРѕРїРѕРµР·Рґ', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (5, '204', 'РўРµРїР»РѕРІРѕР·', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (6, '205', 'Р”РёР·РµР»СЊ-РїРѕРµР·Рґ', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (7, '206', 'РџСѓС‚РµРІР°СЏ РјР°С€РёРЅР°', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (8, '207', 'Р’Р°РіРѕРЅ РїР°СЃСЃР°Р¶РёСЂСЃРєРёР№', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (9, '208', 'Р’Р°РіРѕРЅ Р±Р°РіР°Р¶РЅС‹Р№', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (10, '209', 'Р’Р°РіРѕРЅ РёР·РѕС‚РµСЂРјРёС‡РµСЃРєРёР№', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (11, '210', 'Р¦РёСЃС‚РµСЂРЅР°', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (12, '211', 'РџРѕР»СѓРІР°РіРѕРЅ', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (13, '212', 'РџР»Р°С‚С„РѕСЂРјР°', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (14, '298', 'РџСЂРѕС‡РёР№ РІР°РіРѕРЅ', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (15, '301', 'Р›РµРіРєРѕРІРѕР№ Р°РІС‚РѕРјРѕР±РёР»СЊ РѕР±С‰РµРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ', NULL, '2 Р›РµРіРєРѕРІРѕР№ Р°РІС‚РѕРјРѕР±РёР»СЊ РѕР±С‰РµРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ вЂ“ Р»РµРіРєРѕРІРѕР№ Р°РІС‚РѕРјРѕР±РёР»СЊ Р±РµР· СЃРїРµС†РёР°Р»СЊРЅРѕРіРѕ РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ.; 1В Р›РµРіРєРѕРІРѕР№ Р°РІС‚РѕРјРѕР±РёР»СЊ вЂ“ РїР°СЃСЃР°Р¶РёСЂСЃРєРёР№ Р°РІС‚РѕРјРѕР±РёР»СЊ СЃ С‡РёСЃР»РѕРј РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ РЅРµ Р±РѕР»РµРµ 9, РІРєР»СЋС‡Р°СЏ РјРµСЃС‚Рѕ РІРѕРґРёС‚РµР»СЏ');
INSERT INTO internatioanltransporttypesclassifier VALUES (16, '302', 'РЎРїРµС†РёР°Р»СЊРЅС‹Р№ Р»РµРіРєРѕРІРѕР№ Р°РІС‚РѕРјРѕР±РёР»СЊ', NULL, '1В Р›РµРіРєРѕРІРѕР№ Р°РІС‚РѕРјРѕР±РёР»СЊ вЂ“ РїР°СЃСЃР°Р¶РёСЂСЃРєРёР№ Р°РІС‚РѕРјРѕР±РёР»СЊ СЃ С‡РёСЃР»РѕРј РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ РЅРµ Р±РѕР»РµРµ 9, РІРєР»СЋС‡Р°СЏ РјРµСЃС‚Рѕ РІРѕРґРёС‚РµР»СЏ; 3 РЎРїРµС†РёР°Р»СЊРЅС‹Р№ Р»РµРіРєРѕРІРѕР№ Р°РІС‚РѕРјРѕР±РёР»СЊ вЂ“ Р»РµРіРєРѕРІРѕР№ Р°РІС‚РѕРјРѕР±РёР»СЊ СЃРѕ СЃРїРµС†РёР°Р»СЊРЅС‹Рј РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµРј. Рљ СЃРїРµС†РёР°Р»СЊРЅРѕРјСѓ РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЋ РѕС‚РЅРѕСЃСЏС‚СЃСЏ, РЅР°РїСЂРёРјРµСЂ, С‚Р°РєСЃРѕРјРµС‚СЂ, РјРѕР±РёР»СЊРЅР°СЏ СЂР°РґРёРѕСЃС‚Р°РЅС†РёСЏ, РґРѕРїРѕР»РЅРёС‚РµР»СЊРЅР°СЏ СЃРІРµС‚РѕРІР°СЏ Рё Р·РІСѓРєРѕРІР°СЏ СЃРёРіРЅР°Р»РёР·Р°С†РёСЏ Рё С‚. Рґ. Рљ СЃРїРµС†РёР°Р»СЊРЅС‹Рј Р»РµРіРєРѕРІС‹Рј Р°РІС‚РѕРјРѕР±РёР»СЏРј РѕС‚РЅРѕСЃСЏС‚СЃСЏ, РЅР°РїСЂРёРјРµСЂ, Р°РІС‚РѕРјРѕР±РёР»СЊ СЃРєРѕСЂРѕР№ РїРѕРјРѕС‰Рё, Р°РІС‚РѕРјРѕР±РёР»СЊ РґР»СЏ РёРЅРєР°СЃСЃР°С†РёРё РґРµРЅРµР¶РЅРѕР№ РІС‹СЂСѓС‡РєРё Рё РїРµСЂРµРІРѕР·РєРё С†РµРЅРЅС‹С… РіСЂСѓР·РѕРІ, С‚Р°РєСЃРё.');
INSERT INTO internatioanltransporttypesclassifier VALUES (17, '303', 'Р“СЂСѓР·РѕРІРѕР№ Р°РІС‚РѕРјРѕР±РёР»СЊ РѕР±С‰РµРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ', NULL, '5 Р“СЂСѓР·РѕРІРѕР№ Р°РІС‚РѕРјРѕР±РёР»СЊ РѕР±С‰РµРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ вЂ“ РіСЂСѓР·РѕРІРѕР№ Р°РІС‚РѕРјРѕР±РёР»СЊ СЃ Р±РѕСЂС‚РѕРІРѕР№ РїР»Р°С‚С„РѕСЂРјРѕР№, РЅРµ РѕР±РѕСЂСѓРґРѕРІР°РЅРЅС‹Р№ СЃСЂРµРґСЃС‚РІР°РјРё СЃР°РјРѕРїРѕРіСЂСѓР·РєРё-СЃР°РјРѕСЂР°Р·РіСЂСѓР·РєРё РёР»Рё РґСЂСѓРіРёРј СЃРїРµС†РёР°Р»СЊРЅС‹Рј РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµРј.; 4 Р“СЂСѓР·РѕРІРѕР№ Р°РІС‚РѕРјРѕР±РёР»СЊ вЂ“ Р°РІС‚РѕРјРѕР±РёР»СЊ, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ Рё РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅС‹ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ');
INSERT INTO internatioanltransporttypesclassifier VALUES (18, '304', 'РЎРїРµС†РёР°Р»СЊРЅС‹Р№ РіСЂСѓР·РѕРІРѕР№ Р°РІС‚РѕРјРѕР±РёР»СЊ', NULL, '4В Р“СЂСѓР·РѕРІРѕР№ Р°РІС‚РѕРјРѕР±РёР»СЊ вЂ“ Р°РІС‚РѕРјРѕР±РёР»СЊ, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ Рё РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅС‹ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ; 6 РЎРїРµС†РёР°Р»СЊРЅС‹Р№ РіСЂСѓР·РѕРІРѕР№ Р°РІС‚РѕРјРѕР±РёР»СЊ вЂ“ РіСЂСѓР·РѕРІРѕР№ Р°РІС‚РѕРјРѕР±РёР»СЊ, РѕР±РѕСЂСѓРґРѕРІР°РЅРЅС‹Р№ СЃСЂРµРґСЃС‚РІР°РјРё СЃР°РјРѕРїРѕРіСЂСѓР·РєРё-СЃР°РјРѕСЂР°Р·РіСЂСѓР·РєРё РёР»Рё РґСЂСѓРіРёРј СЃРїРµС†РёР°Р»СЊРЅС‹Рј РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµРј Рё (РёР»Рё) РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Р№ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ РєРѕРЅРєСЂРµС‚РЅС‹С… РєР°С‚РµРіРѕСЂРёР№.');
INSERT INTO internatioanltransporttypesclassifier VALUES (19, '305', 'Р“СЂСѓР·РѕРїР°СЃСЃР°Р¶РёСЂСЃРєРёР№ Р°РІС‚РѕРјРѕР±РёР»СЊ', NULL, '4В Р“СЂСѓР·РѕРІРѕР№ Р°РІС‚РѕРјРѕР±РёР»СЊ вЂ“ Р°РІС‚РѕРјРѕР±РёР»СЊ, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ Рё РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅС‹ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ; 7 Р“СЂСѓР·РѕРїР°СЃСЃР°Р¶РёСЂСЃРєРёР№ Р°РІС‚РѕРјРѕР±РёР»СЊ вЂ“ Р°РІС‚РѕРјРѕР±РёР»СЊ, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ Рё РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅС‹ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё РіСЂСѓР·РѕРІ.');
INSERT INTO internatioanltransporttypesclassifier VALUES (20, '306', 'РђРІС‚РѕРјРѕР±РёР»СЊ-С‚СЏРіР°С‡', NULL, '8В РђРІС‚РѕРјРѕР±РёР»СЊ-С‚СЏРіР°С‡ вЂ“ Р°РІС‚РѕРјРѕР±РёР»СЊ, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ Рё РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅС‹ РёСЃРєР»СЋС‡РёС‚РµР»СЊРЅРѕ РґР»СЏ Р±СѓРєСЃРёСЂРѕРІР°РЅРёСЏ РґРѕСЂРѕР¶РЅС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РїРѕР»СѓРїСЂРёС†РµРїРѕРІ.');
INSERT INTO internatioanltransporttypesclassifier VALUES (21, '307', 'РЎРµРґРµР»СЊРЅС‹Р№ С‚СЏРіР°С‡', NULL, '9В РЎРµРґРµР»СЊРЅС‹Р№ С‚СЏРіР°С‡ вЂ“ Р°РІС‚РѕРјРѕР±РёР»СЊ, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ Рё РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅС‹ РґР»СЏ Р±СѓРєСЃРёСЂРѕРІР°РЅРёСЏ РїРѕР»СѓРїСЂРёС†РµРїР°.');
INSERT INTO internatioanltransporttypesclassifier VALUES (22, '308', 'РџР°СЃСЃР°Р¶РёСЂСЃРєРёР№ РїСЂРёС†РµРї, С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° РєРѕС‚РѕСЂРѕРіРѕ РЅРµ Р±РѕР»РµРµ 0,75 С‚', NULL, '10В РџСЂРёС†РµРї вЂ“ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ Р±РµР· РґРІРёРіР°С‚РµР»СЏ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅРѕРµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ РёР»Рё РіСЂСѓР·РѕРІ, РІРµСЂС‚РёРєР°Р»СЊРЅР°СЏ РЅР°РіСЂСѓР·РєР° РєРѕС‚РѕСЂРѕРіРѕ РїРµСЂРµРґР°РµС‚СЃСЏ РЅР° РѕРїРѕСЂРЅСѓСЋ РїРѕРІРµСЂС…РЅРѕСЃС‚СЊ С‡РµСЂРµР· РєРѕР»РµСЃР° Рё РєРѕС‚РѕСЂРѕРµ РїСЂРёСЃРїРѕСЃРѕР±Р»РµРЅРѕ РґР»СЏ Р±СѓРєСЃРёСЂРѕРІР°РЅРёСЏ Р°РІС‚РѕРјРѕР±РёР»РµРј; 24 РўРµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° вЂ“ СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅР°СЏ РёР·РіРѕС‚РѕРІРёС‚РµР»РµРј РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° СЃРѕ СЃРЅР°СЂСЏР¶РµРЅРёРµРј, РїР°СЃСЃР°Р¶РёСЂР°РјРё Рё РіСЂСѓР·РѕРј, РѕР±СѓСЃР»РѕРІР»РµРЅРЅР°СЏ РµРіРѕ РєРѕРЅСЃС‚СЂСѓРєС†РёРµР№ Рё Р·Р°РґР°РЅРЅС‹РјРё С…Р°СЂР°РєС‚РµСЂРёСЃС‚РёРєР°РјРё. Р’ СЃР»СѓС‡Р°Рµ РїРѕР»СѓРїСЂРёС†РµРїРѕРІ Рё РїСЂРёС†РµРїРѕРІ СЃ С†РµРЅС‚СЂР°Р»СЊРЅРѕ СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕР№ РѕСЃСЊСЋ (РѕСЃСЏРјРё) РїРѕРґ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјРѕР№ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ РјР°СЃСЃРѕР№ РїСЂРёРЅРёРјР°РµС‚СЃСЏ СЃС‚Р°С‚РёС‡РµСЃРєР°СЏ РІРµСЂС‚РёРєР°Р»СЊРЅР°СЏ РЅР°РіСЂСѓР·РєР°, РїРµСЂРµРґР°РІР°РµРјР°СЏ РЅР° РіСЂСѓРЅС‚ РѕСЃСЊСЋ РёР»Рё РѕСЃСЏРјРё РјР°РєСЃРёРјР°Р»СЊРЅРѕ Р·Р°РіСЂСѓР¶РµРЅРЅРѕРіРѕ СЃС†РµРїР»РµРЅРЅРѕРіРѕ СЃ С‚СЏРіР°С‡РѕРј РїРѕР»СѓРїСЂРёС†РµРїР° Рё РїСЂРёС†РµРїР° СЃ С†РµРЅС‚СЂР°Р»СЊРЅРѕ СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕР№ РѕСЃСЊСЋ (РѕСЃСЏРјРё).; 11 РџР°СЃСЃР°Р¶РёСЂСЃРєРёР№ РїСЂРёС†РµРї вЂ“ РїСЂРёС†РµРї, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ Рё РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅС‹ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё Р±Р°РіР°Р¶Р°');
INSERT INTO internatioanltransporttypesclassifier VALUES (23, '320', 'РЎРїРµС†РёР°Р»СЊРЅС‹Р№ РїРѕР»СѓРїСЂРёС†РµРї', NULL, '15В РџРѕР»СѓРїСЂРёС†РµРї вЂ“ РїСЂРёС†РµРї, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅР° РґР»СЏ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ СЃ СЃРµРґРµР»СЊРЅС‹Рј С‚СЏРіР°С‡РѕРј, С‡Р°СЃС‚СЊ РїРѕР»РЅРѕР№ РјР°СЃСЃС‹ РєРѕС‚РѕСЂРѕРіРѕ РїРµСЂРµРґР°РµС‚СЃСЏ РЅР° СЃРµРґРµР»СЊРЅС‹Р№ С‚СЏРіР°С‡ С‡РµСЂРµР· СЃРµРґРµР»СЊРЅРѕ-СЃС†РµРїРЅРѕРµ СѓСЃС‚СЂРѕР№СЃС‚РІРѕ; 18 РЎРїРµС†РёР°Р»СЊРЅС‹Р№ РїРѕР»СѓРїСЂРёС†РµРї вЂ“ РїРѕР»СѓРїСЂРёС†РµРї, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ Рё РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅС‹ РґР»СЏ РІС‹РїРѕР»РЅРµРЅРёСЏ СЃРїРµС†РёР°Р»СЊРЅС‹С… СЂР°Р±РѕС‡РёС… С„СѓРЅРєС†РёР№ РёР»Рё РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ РѕРїСЂРµРґРµР»РµРЅРЅС‹С… РєР°С‚РµРіРѕСЂРёР№.');
INSERT INTO internatioanltransporttypesclassifier VALUES (35, '321', 'РђРІС‚РѕР±СѓСЃ РѕР±С‰РµРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ', NULL, '19В РђРІС‚РѕР±СѓСЃ вЂ“ РїР°СЃСЃР°Р¶РёСЂСЃРєРёР№ Р°РІС‚РѕРјРѕР±РёР»СЊ СЃ С‡РёСЃР»РѕРј РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ Р±РѕР»РµРµ 9, РІРєР»СЋС‡Р°СЏ РјРµСЃС‚Рѕ РІРѕРґРёС‚РµР»СЏ; 20 РђРІС‚РѕР±СѓСЃ РѕР±С‰РµРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ вЂ“ Р°РІС‚РѕР±СѓСЃ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Р№ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё РёСЃРїРѕР»СЊР·СѓРµРјС‹Р№ РІ РєР°С‡РµСЃС‚РІРµ РѕР±С‰РµСЃС‚РІРµРЅРЅРѕРіРѕ С‚СЂР°РЅСЃРїРѕСЂС‚Р° (РїРѕ РјР°СЂС€СЂСѓС‚Р°Рј).');
INSERT INTO internatioanltransporttypesclassifier VALUES (24, '309', 'РџР°СЃСЃР°Р¶РёСЂСЃРєРёР№ РїСЂРёС†РµРї, С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° РєРѕС‚РѕСЂРѕРіРѕ СЃРІС‹С€Рµ 0,75 С‚, РЅРѕ РЅРµ Р±РѕР»РµРµ 3,5 С‚', NULL, '11 РџР°СЃСЃР°Р¶РёСЂСЃРєРёР№ РїСЂРёС†РµРї вЂ“ РїСЂРёС†РµРї, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ Рё РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅС‹ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё Р±Р°РіР°Р¶Р°; 24 РўРµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° вЂ“ СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅР°СЏ РёР·РіРѕС‚РѕРІРёС‚РµР»РµРј РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° СЃРѕ СЃРЅР°СЂСЏР¶РµРЅРёРµРј, РїР°СЃСЃР°Р¶РёСЂР°РјРё Рё РіСЂСѓР·РѕРј, РѕР±СѓСЃР»РѕРІР»РµРЅРЅР°СЏ РµРіРѕ РєРѕРЅСЃС‚СЂСѓРєС†РёРµР№ Рё Р·Р°РґР°РЅРЅС‹РјРё С…Р°СЂР°РєС‚РµСЂРёСЃС‚РёРєР°РјРё. Р’ СЃР»СѓС‡Р°Рµ РїРѕР»СѓРїСЂРёС†РµРїРѕРІ Рё РїСЂРёС†РµРїРѕРІ СЃ С†РµРЅС‚СЂР°Р»СЊРЅРѕ СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕР№ РѕСЃСЊСЋ (РѕСЃСЏРјРё) РїРѕРґ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјРѕР№ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ РјР°СЃСЃРѕР№ РїСЂРёРЅРёРјР°РµС‚СЃСЏ СЃС‚Р°С‚РёС‡РµСЃРєР°СЏ РІРµСЂС‚РёРєР°Р»СЊРЅР°СЏ РЅР°РіСЂСѓР·РєР°, РїРµСЂРµРґР°РІР°РµРјР°СЏ РЅР° РіСЂСѓРЅС‚ РѕСЃСЊСЋ РёР»Рё РѕСЃСЏРјРё РјР°РєСЃРёРјР°Р»СЊРЅРѕ Р·Р°РіСЂСѓР¶РµРЅРЅРѕРіРѕ СЃС†РµРїР»РµРЅРЅРѕРіРѕ СЃ С‚СЏРіР°С‡РѕРј РїРѕР»СѓРїСЂРёС†РµРїР° Рё РїСЂРёС†РµРїР° СЃ С†РµРЅС‚СЂР°Р»СЊРЅРѕ СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕР№ РѕСЃСЊСЋ (РѕСЃСЏРјРё).; 10В РџСЂРёС†РµРї вЂ“ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ Р±РµР· РґРІРёРіР°С‚РµР»СЏ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅРѕРµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ РёР»Рё РіСЂСѓР·РѕРІ, РІРµСЂС‚РёРєР°Р»СЊРЅР°СЏ РЅР°РіСЂСѓР·РєР° РєРѕС‚РѕСЂРѕРіРѕ РїРµСЂРµРґР°РµС‚СЃСЏ РЅР° РѕРїРѕСЂРЅСѓСЋ РїРѕРІРµСЂС…РЅРѕСЃС‚СЊ С‡РµСЂРµР· РєРѕР»РµСЃР° Рё РєРѕС‚РѕСЂРѕРµ РїСЂРёСЃРїРѕСЃРѕР±Р»РµРЅРѕ РґР»СЏ Р±СѓРєСЃРёСЂРѕРІР°РЅРёСЏ Р°РІС‚РѕРјРѕР±РёР»РµРј');
INSERT INTO internatioanltransporttypesclassifier VALUES (25, '310', 'РџР°СЃСЃР°Р¶РёСЂСЃРєРёР№ РїСЂРёС†РµРї, С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° РєРѕС‚РѕСЂРѕРіРѕ СЃРІС‹С€Рµ 3,5 С‚, РЅРѕ РЅРµ Р±РѕР»РµРµ 10 С‚', NULL, '11 РџР°СЃСЃР°Р¶РёСЂСЃРєРёР№ РїСЂРёС†РµРї вЂ“ РїСЂРёС†РµРї, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ Рё РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅС‹ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё Р±Р°РіР°Р¶Р°; 24 РўРµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° вЂ“ СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅР°СЏ РёР·РіРѕС‚РѕРІРёС‚РµР»РµРј РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° СЃРѕ СЃРЅР°СЂСЏР¶РµРЅРёРµРј, РїР°СЃСЃР°Р¶РёСЂР°РјРё Рё РіСЂСѓР·РѕРј, РѕР±СѓСЃР»РѕРІР»РµРЅРЅР°СЏ РµРіРѕ РєРѕРЅСЃС‚СЂСѓРєС†РёРµР№ Рё Р·Р°РґР°РЅРЅС‹РјРё С…Р°СЂР°РєС‚РµСЂРёСЃС‚РёРєР°РјРё. Р’ СЃР»СѓС‡Р°Рµ РїРѕР»СѓРїСЂРёС†РµРїРѕРІ Рё РїСЂРёС†РµРїРѕРІ СЃ С†РµРЅС‚СЂР°Р»СЊРЅРѕ СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕР№ РѕСЃСЊСЋ (РѕСЃСЏРјРё) РїРѕРґ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјРѕР№ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ РјР°СЃСЃРѕР№ РїСЂРёРЅРёРјР°РµС‚СЃСЏ СЃС‚Р°С‚РёС‡РµСЃРєР°СЏ РІРµСЂС‚РёРєР°Р»СЊРЅР°СЏ РЅР°РіСЂСѓР·РєР°, РїРµСЂРµРґР°РІР°РµРјР°СЏ РЅР° РіСЂСѓРЅС‚ РѕСЃСЊСЋ РёР»Рё РѕСЃСЏРјРё РјР°РєСЃРёРјР°Р»СЊРЅРѕ Р·Р°РіСЂСѓР¶РµРЅРЅРѕРіРѕ СЃС†РµРїР»РµРЅРЅРѕРіРѕ СЃ С‚СЏРіР°С‡РѕРј РїРѕР»СѓРїСЂРёС†РµРїР° Рё РїСЂРёС†РµРїР° СЃ С†РµРЅС‚СЂР°Р»СЊРЅРѕ СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕР№ РѕСЃСЊСЋ (РѕСЃСЏРјРё).; 10В РџСЂРёС†РµРї вЂ“ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ Р±РµР· РґРІРёРіР°С‚РµР»СЏ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅРѕРµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ РёР»Рё РіСЂСѓР·РѕРІ, РІРµСЂС‚РёРєР°Р»СЊРЅР°СЏ РЅР°РіСЂСѓР·РєР° РєРѕС‚РѕСЂРѕРіРѕ РїРµСЂРµРґР°РµС‚СЃСЏ РЅР° РѕРїРѕСЂРЅСѓСЋ РїРѕРІРµСЂС…РЅРѕСЃС‚СЊ С‡РµСЂРµР· РєРѕР»РµСЃР° Рё РєРѕС‚РѕСЂРѕРµ РїСЂРёСЃРїРѕСЃРѕР±Р»РµРЅРѕ РґР»СЏ Р±СѓРєСЃРёСЂРѕРІР°РЅРёСЏ Р°РІС‚РѕРјРѕР±РёР»РµРј');
INSERT INTO internatioanltransporttypesclassifier VALUES (26, '311', 'РџР°СЃСЃР°Р¶РёСЂСЃРєРёР№ РїСЂРёС†РµРї, С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° РєРѕС‚РѕСЂРѕРіРѕ Р±РѕР»РµРµ 10 С‚', NULL, '11 РџР°СЃСЃР°Р¶РёСЂСЃРєРёР№ РїСЂРёС†РµРї вЂ“ РїСЂРёС†РµРї, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ Рё РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅС‹ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё Р±Р°РіР°Р¶Р°; 24 РўРµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° вЂ“ СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅР°СЏ РёР·РіРѕС‚РѕРІРёС‚РµР»РµРј РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° СЃРѕ СЃРЅР°СЂСЏР¶РµРЅРёРµРј, РїР°СЃСЃР°Р¶РёСЂР°РјРё Рё РіСЂСѓР·РѕРј, РѕР±СѓСЃР»РѕРІР»РµРЅРЅР°СЏ РµРіРѕ РєРѕРЅСЃС‚СЂСѓРєС†РёРµР№ Рё Р·Р°РґР°РЅРЅС‹РјРё С…Р°СЂР°РєС‚РµСЂРёСЃС‚РёРєР°РјРё. Р’ СЃР»СѓС‡Р°Рµ РїРѕР»СѓРїСЂРёС†РµРїРѕРІ Рё РїСЂРёС†РµРїРѕРІ СЃ С†РµРЅС‚СЂР°Р»СЊРЅРѕ СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕР№ РѕСЃСЊСЋ (РѕСЃСЏРјРё) РїРѕРґ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјРѕР№ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ РјР°СЃСЃРѕР№ РїСЂРёРЅРёРјР°РµС‚СЃСЏ СЃС‚Р°С‚РёС‡РµСЃРєР°СЏ РІРµСЂС‚РёРєР°Р»СЊРЅР°СЏ РЅР°РіСЂСѓР·РєР°, РїРµСЂРµРґР°РІР°РµРјР°СЏ РЅР° РіСЂСѓРЅС‚ РѕСЃСЊСЋ РёР»Рё РѕСЃСЏРјРё РјР°РєСЃРёРјР°Р»СЊРЅРѕ Р·Р°РіСЂСѓР¶РµРЅРЅРѕРіРѕ СЃС†РµРїР»РµРЅРЅРѕРіРѕ СЃ С‚СЏРіР°С‡РѕРј РїРѕР»СѓРїСЂРёС†РµРїР° Рё РїСЂРёС†РµРїР° СЃ С†РµРЅС‚СЂР°Р»СЊРЅРѕ СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕР№ РѕСЃСЊСЋ (РѕСЃСЏРјРё).; 10В РџСЂРёС†РµРї вЂ“ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ Р±РµР· РґРІРёРіР°С‚РµР»СЏ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅРѕРµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ РёР»Рё РіСЂСѓР·РѕРІ, РІРµСЂС‚РёРєР°Р»СЊРЅР°СЏ РЅР°РіСЂСѓР·РєР° РєРѕС‚РѕСЂРѕРіРѕ РїРµСЂРµРґР°РµС‚СЃСЏ РЅР° РѕРїРѕСЂРЅСѓСЋ РїРѕРІРµСЂС…РЅРѕСЃС‚СЊ С‡РµСЂРµР· РєРѕР»РµСЃР° Рё РєРѕС‚РѕСЂРѕРµ РїСЂРёСЃРїРѕСЃРѕР±Р»РµРЅРѕ РґР»СЏ Р±СѓРєСЃРёСЂРѕРІР°РЅРёСЏ Р°РІС‚РѕРјРѕР±РёР»РµРј');
INSERT INTO internatioanltransporttypesclassifier VALUES (27, '312', 'Р“СЂСѓР·РѕРІРѕР№ РїСЂРёС†РµРї РѕР±С‰РµРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ', NULL, '10В РџСЂРёС†РµРї вЂ“ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ Р±РµР· РґРІРёРіР°С‚РµР»СЏ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅРѕРµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ РёР»Рё РіСЂСѓР·РѕРІ, РІРµСЂС‚РёРєР°Р»СЊРЅР°СЏ РЅР°РіСЂСѓР·РєР° РєРѕС‚РѕСЂРѕРіРѕ РїРµСЂРµРґР°РµС‚СЃСЏ РЅР° РѕРїРѕСЂРЅСѓСЋ РїРѕРІРµСЂС…РЅРѕСЃС‚СЊ С‡РµСЂРµР· РєРѕР»РµСЃР° Рё РєРѕС‚РѕСЂРѕРµ РїСЂРёСЃРїРѕСЃРѕР±Р»РµРЅРѕ РґР»СЏ Р±СѓРєСЃРёСЂРѕРІР°РЅРёСЏ Р°РІС‚РѕРјРѕР±РёР»РµРј; 12 Р“СЂСѓР·РѕРІРѕР№ РїСЂРёС†РµРї РѕР±С‰РµРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ вЂ“ РїСЂРёС†РµРї СЃ Р±РѕСЂС‚РѕРІРѕР№ РїР»Р°С‚С„РѕСЂРјРѕР№ РѕС‚РєСЂС‹С‚РѕРіРѕ РёР»Рё Р·Р°РєСЂС‹С‚РѕРіРѕ С‚РёРїР°, РЅРµ РѕР±РѕСЂСѓРґРѕРІР°РЅРЅС‹Р№ СЃСЂРµРґСЃС‚РІР°РјРё СЃР°РјРѕРїРѕРіСЂСѓР·РєРё-СЃР°РјРѕСЂР°Р·РіСЂСѓР·РєРё РёР»Рё РґСЂСѓРіРёРј СЃРїРµС†РёР°Р»СЊРЅС‹Рј РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµРј.');
INSERT INTO internatioanltransporttypesclassifier VALUES (28, '313', 'РЎРїРµС†РёР°Р»СЊРЅС‹Р№ РїСЂРёС†РµРї', NULL, '13 РЎРїРµС†РёР°Р»СЊРЅС‹Р№ РїСЂРёС†РµРї вЂ“ РїСЂРёС†РµРї, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ Рё РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅС‹ РґР»СЏ РІС‹РїРѕР»РЅРµРЅРёСЏ СЃРїРµС†РёР°Р»СЊРЅС‹С… СЂР°Р±РѕС‡РёС… С„СѓРЅРєС†РёР№ РёР»Рё РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ РѕРїСЂРµРґРµР»РµРЅРЅС‹С… РєР°С‚РµРіРѕСЂРёР№.; 10В РџСЂРёС†РµРї вЂ“ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ Р±РµР· РґРІРёРіР°С‚РµР»СЏ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅРѕРµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ РёР»Рё РіСЂСѓР·РѕРІ, РІРµСЂС‚РёРєР°Р»СЊРЅР°СЏ РЅР°РіСЂСѓР·РєР° РєРѕС‚РѕСЂРѕРіРѕ РїРµСЂРµРґР°РµС‚СЃСЏ РЅР° РѕРїРѕСЂРЅСѓСЋ РїРѕРІРµСЂС…РЅРѕСЃС‚СЊ С‡РµСЂРµР· РєРѕР»РµСЃР° Рё РєРѕС‚РѕСЂРѕРµ РїСЂРёСЃРїРѕСЃРѕР±Р»РµРЅРѕ РґР»СЏ Р±СѓРєСЃРёСЂРѕРІР°РЅРёСЏ Р°РІС‚РѕРјРѕР±РёР»РµРј');
INSERT INTO internatioanltransporttypesclassifier VALUES (29, '314', 'РљР°СЂР°РІР°РЅ', NULL, '10В РџСЂРёС†РµРї вЂ“ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ Р±РµР· РґРІРёРіР°С‚РµР»СЏ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅРѕРµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ РёР»Рё РіСЂСѓР·РѕРІ, РІРµСЂС‚РёРєР°Р»СЊРЅР°СЏ РЅР°РіСЂСѓР·РєР° РєРѕС‚РѕСЂРѕРіРѕ РїРµСЂРµРґР°РµС‚СЃСЏ РЅР° РѕРїРѕСЂРЅСѓСЋ РїРѕРІРµСЂС…РЅРѕСЃС‚СЊ С‡РµСЂРµР· РєРѕР»РµСЃР° Рё РєРѕС‚РѕСЂРѕРµ РїСЂРёСЃРїРѕСЃРѕР±Р»РµРЅРѕ РґР»СЏ Р±СѓРєСЃРёСЂРѕРІР°РЅРёСЏ Р°РІС‚РѕРјРѕР±РёР»РµРј; 14 РљР°СЂР°РІР°РЅ вЂ“ РїСЂРёС†РµРї, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Р№ РґР»СЏ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ РІ РґРѕСЂРѕР¶РЅС‹С… СѓСЃР»РѕРІРёСЏС… РІРѕ РІСЂРµРјСЏ СЃС‚РѕСЏРЅРѕРє РІ РєР°С‡РµСЃС‚РІРµ РјРѕР±РёР»СЊРЅРѕРіРѕ Р¶РёР»РѕРіРѕ РїРѕРјРµС‰РµРЅРёСЏ.');
INSERT INTO internatioanltransporttypesclassifier VALUES (30, '315', 'РџР°СЃСЃР°Р¶РёСЂСЃРєРёР№ РїРѕР»СѓРїСЂРёС†РµРї, С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° РєРѕС‚РѕСЂРѕРіРѕ РЅРµ Р±РѕР»РµРµ 0,75 С‚', NULL, '15 РџРѕР»СѓРїСЂРёС†РµРї вЂ“ РїСЂРёС†РµРї, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅР° РґР»СЏ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ СЃ СЃРµРґРµР»СЊРЅС‹Рј С‚СЏРіР°С‡РѕРј, С‡Р°СЃС‚СЊ РїРѕР»РЅРѕР№ РјР°СЃСЃС‹ РєРѕС‚РѕСЂРѕРіРѕ РїРµСЂРµРґР°РµС‚СЃСЏ РЅР° СЃРµРґРµР»СЊРЅС‹Р№ С‚СЏРіР°С‡ С‡РµСЂРµР· СЃРµРґРµР»СЊРЅРѕ-СЃС†РµРїРЅРѕРµ СѓСЃС‚СЂРѕР№СЃС‚РІРѕ; 16 РџР°СЃСЃР°Р¶РёСЂСЃРєРёР№ РїРѕР»СѓРїСЂРёС†РµРї вЂ“ РїРѕР»СѓРїСЂРёС†РµРї, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ Рё РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅС‹ РґР»СЏ РїРµСЂРµРІРѕР·РєРё Р»СЋРґРµР№ Рё Р±Р°РіР°Р¶Р°; 24 РўРµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° вЂ“ СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅР°СЏ РёР·РіРѕС‚РѕРІРёС‚РµР»РµРј РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° СЃРѕ СЃРЅР°СЂСЏР¶РµРЅРёРµРј, РїР°СЃСЃР°Р¶РёСЂР°РјРё Рё РіСЂСѓР·РѕРј, РѕР±СѓСЃР»РѕРІР»РµРЅРЅР°СЏ РµРіРѕ РєРѕРЅСЃС‚СЂСѓРєС†РёРµР№ Рё Р·Р°РґР°РЅРЅС‹РјРё С…Р°СЂР°РєС‚РµСЂРёСЃС‚РёРєР°РјРё. Р’ СЃР»СѓС‡Р°Рµ РїРѕР»СѓРїСЂРёС†РµРїРѕРІ Рё РїСЂРёС†РµРїРѕРІ СЃ С†РµРЅС‚СЂР°Р»СЊРЅРѕ СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕР№ РѕСЃСЊСЋ (РѕСЃСЏРјРё) РїРѕРґ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјРѕР№ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ РјР°СЃСЃРѕР№ РїСЂРёРЅРёРјР°РµС‚СЃСЏ СЃС‚Р°С‚РёС‡РµСЃРєР°СЏ РІРµСЂС‚РёРєР°Р»СЊРЅР°СЏ РЅР°РіСЂСѓР·РєР°, РїРµСЂРµРґР°РІР°РµРјР°СЏ РЅР° РіСЂСѓРЅС‚ РѕСЃСЊСЋ РёР»Рё РѕСЃСЏРјРё РјР°РєСЃРёРјР°Р»СЊРЅРѕ Р·Р°РіСЂСѓР¶РµРЅРЅРѕРіРѕ СЃС†РµРїР»РµРЅРЅРѕРіРѕ СЃ С‚СЏРіР°С‡РѕРј РїРѕР»СѓРїСЂРёС†РµРїР° Рё РїСЂРёС†РµРїР° СЃ С†РµРЅС‚СЂР°Р»СЊРЅРѕ СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕР№ РѕСЃСЊСЋ (РѕСЃСЏРјРё).');
INSERT INTO internatioanltransporttypesclassifier VALUES (31, '316', 'РџР°СЃСЃР°Р¶РёСЂСЃРєРёР№ РїРѕР»СѓРїСЂРёС†РµРї, С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° РєРѕС‚РѕСЂРѕРіРѕ СЃРІС‹С€Рµ 0,75 С‚, РЅРѕ РЅРµ Р±РѕР»РµРµ 3,5 С‚', NULL, '24 РўРµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° вЂ“ СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅР°СЏ РёР·РіРѕС‚РѕРІРёС‚РµР»РµРј РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° СЃРѕ СЃРЅР°СЂСЏР¶РµРЅРёРµРј, РїР°СЃСЃР°Р¶РёСЂР°РјРё Рё РіСЂСѓР·РѕРј, РѕР±СѓСЃР»РѕРІР»РµРЅРЅР°СЏ РµРіРѕ РєРѕРЅСЃС‚СЂСѓРєС†РёРµР№ Рё Р·Р°РґР°РЅРЅС‹РјРё С…Р°СЂР°РєС‚РµСЂРёСЃС‚РёРєР°РјРё. Р’ СЃР»СѓС‡Р°Рµ РїРѕР»СѓРїСЂРёС†РµРїРѕРІ Рё РїСЂРёС†РµРїРѕРІ СЃ С†РµРЅС‚СЂР°Р»СЊРЅРѕ СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕР№ РѕСЃСЊСЋ (РѕСЃСЏРјРё) РїРѕРґ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјРѕР№ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ РјР°СЃСЃРѕР№ РїСЂРёРЅРёРјР°РµС‚СЃСЏ СЃС‚Р°С‚РёС‡РµСЃРєР°СЏ РІРµСЂС‚РёРєР°Р»СЊРЅР°СЏ РЅР°РіСЂСѓР·РєР°, РїРµСЂРµРґР°РІР°РµРјР°СЏ РЅР° РіСЂСѓРЅС‚ РѕСЃСЊСЋ РёР»Рё РѕСЃСЏРјРё РјР°РєСЃРёРјР°Р»СЊРЅРѕ Р·Р°РіСЂСѓР¶РµРЅРЅРѕРіРѕ СЃС†РµРїР»РµРЅРЅРѕРіРѕ СЃ С‚СЏРіР°С‡РѕРј РїРѕР»СѓРїСЂРёС†РµРїР° Рё РїСЂРёС†РµРїР° СЃ С†РµРЅС‚СЂР°Р»СЊРЅРѕ СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕР№ РѕСЃСЊСЋ (РѕСЃСЏРјРё).; 16 РџР°СЃСЃР°Р¶РёСЂСЃРєРёР№ РїРѕР»СѓРїСЂРёС†РµРї вЂ“ РїРѕР»СѓРїСЂРёС†РµРї, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ Рё РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅС‹ РґР»СЏ РїРµСЂРµРІРѕР·РєРё Р»СЋРґРµР№ Рё Р±Р°РіР°Р¶Р°; 15 РџРѕР»СѓРїСЂРёС†РµРї вЂ“ РїСЂРёС†РµРї, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅР° РґР»СЏ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ СЃ СЃРµРґРµР»СЊРЅС‹Рј С‚СЏРіР°С‡РѕРј, С‡Р°СЃС‚СЊ РїРѕР»РЅРѕР№ РјР°СЃСЃС‹ РєРѕС‚РѕСЂРѕРіРѕ РїРµСЂРµРґР°РµС‚СЃСЏ РЅР° СЃРµРґРµР»СЊРЅС‹Р№ С‚СЏРіР°С‡ С‡РµСЂРµР· СЃРµРґРµР»СЊРЅРѕ-СЃС†РµРїРЅРѕРµ СѓСЃС‚СЂРѕР№СЃС‚РІРѕ');
INSERT INTO internatioanltransporttypesclassifier VALUES (32, '317', 'РџР°СЃСЃР°Р¶РёСЂСЃРєРёР№ РїРѕР»СѓРїСЂРёС†РµРї, С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° РєРѕС‚РѕСЂРѕРіРѕ СЃРІС‹С€Рµ 3,5 С‚, РЅРѕ РЅРµ Р±РѕР»РµРµ 10 С‚', NULL, '16 РџР°СЃСЃР°Р¶РёСЂСЃРєРёР№ РїРѕР»СѓРїСЂРёС†РµРї вЂ“ РїРѕР»СѓРїСЂРёС†РµРї, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ Рё РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅС‹ РґР»СЏ РїРµСЂРµРІРѕР·РєРё Р»СЋРґРµР№ Рё Р±Р°РіР°Р¶Р°; 24 РўРµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° вЂ“ СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅР°СЏ РёР·РіРѕС‚РѕРІРёС‚РµР»РµРј РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° СЃРѕ СЃРЅР°СЂСЏР¶РµРЅРёРµРј, РїР°СЃСЃР°Р¶РёСЂР°РјРё Рё РіСЂСѓР·РѕРј, РѕР±СѓСЃР»РѕРІР»РµРЅРЅР°СЏ РµРіРѕ РєРѕРЅСЃС‚СЂСѓРєС†РёРµР№ Рё Р·Р°РґР°РЅРЅС‹РјРё С…Р°СЂР°РєС‚РµСЂРёСЃС‚РёРєР°РјРё. Р’ СЃР»СѓС‡Р°Рµ РїРѕР»СѓРїСЂРёС†РµРїРѕРІ Рё РїСЂРёС†РµРїРѕРІ СЃ С†РµРЅС‚СЂР°Р»СЊРЅРѕ СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕР№ РѕСЃСЊСЋ (РѕСЃСЏРјРё) РїРѕРґ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјРѕР№ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ РјР°СЃСЃРѕР№ РїСЂРёРЅРёРјР°РµС‚СЃСЏ СЃС‚Р°С‚РёС‡РµСЃРєР°СЏ РІРµСЂС‚РёРєР°Р»СЊРЅР°СЏ РЅР°РіСЂСѓР·РєР°, РїРµСЂРµРґР°РІР°РµРјР°СЏ РЅР° РіСЂСѓРЅС‚ РѕСЃСЊСЋ РёР»Рё РѕСЃСЏРјРё РјР°РєСЃРёРјР°Р»СЊРЅРѕ Р·Р°РіСЂСѓР¶РµРЅРЅРѕРіРѕ СЃС†РµРїР»РµРЅРЅРѕРіРѕ СЃ С‚СЏРіР°С‡РѕРј РїРѕР»СѓРїСЂРёС†РµРїР° Рё РїСЂРёС†РµРїР° СЃ С†РµРЅС‚СЂР°Р»СЊРЅРѕ СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕР№ РѕСЃСЊСЋ (РѕСЃСЏРјРё).; 15 РџРѕР»СѓРїСЂРёС†РµРї вЂ“ РїСЂРёС†РµРї, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅР° РґР»СЏ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ СЃ СЃРµРґРµР»СЊРЅС‹Рј С‚СЏРіР°С‡РѕРј, С‡Р°СЃС‚СЊ РїРѕР»РЅРѕР№ РјР°СЃСЃС‹ РєРѕС‚РѕСЂРѕРіРѕ РїРµСЂРµРґР°РµС‚СЃСЏ РЅР° СЃРµРґРµР»СЊРЅС‹Р№ С‚СЏРіР°С‡ С‡РµСЂРµР· СЃРµРґРµР»СЊРЅРѕ-СЃС†РµРїРЅРѕРµ СѓСЃС‚СЂРѕР№СЃС‚РІРѕ');
INSERT INTO internatioanltransporttypesclassifier VALUES (33, '318', 'РџР°СЃСЃР°Р¶РёСЂСЃРєРёР№ РїРѕР»СѓРїСЂРёС†РµРї, С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° РєРѕС‚РѕСЂРѕРіРѕ Р±РѕР»РµРµ 10 С‚', NULL, '15 РџРѕР»СѓРїСЂРёС†РµРї вЂ“ РїСЂРёС†РµРї, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅР° РґР»СЏ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ СЃ СЃРµРґРµР»СЊРЅС‹Рј С‚СЏРіР°С‡РѕРј, С‡Р°СЃС‚СЊ РїРѕР»РЅРѕР№ РјР°СЃСЃС‹ РєРѕС‚РѕСЂРѕРіРѕ РїРµСЂРµРґР°РµС‚СЃСЏ РЅР° СЃРµРґРµР»СЊРЅС‹Р№ С‚СЏРіР°С‡ С‡РµСЂРµР· СЃРµРґРµР»СЊРЅРѕ-СЃС†РµРїРЅРѕРµ СѓСЃС‚СЂРѕР№СЃС‚РІРѕ; 16 РџР°СЃСЃР°Р¶РёСЂСЃРєРёР№ РїРѕР»СѓРїСЂРёС†РµРї вЂ“ РїРѕР»СѓРїСЂРёС†РµРї, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ Рё РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅС‹ РґР»СЏ РїРµСЂРµРІРѕР·РєРё Р»СЋРґРµР№ Рё Р±Р°РіР°Р¶Р°; 24 РўРµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° вЂ“ СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅР°СЏ РёР·РіРѕС‚РѕРІРёС‚РµР»РµРј РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° СЃРѕ СЃРЅР°СЂСЏР¶РµРЅРёРµРј, РїР°СЃСЃР°Р¶РёСЂР°РјРё Рё РіСЂСѓР·РѕРј, РѕР±СѓСЃР»РѕРІР»РµРЅРЅР°СЏ РµРіРѕ РєРѕРЅСЃС‚СЂСѓРєС†РёРµР№ Рё Р·Р°РґР°РЅРЅС‹РјРё С…Р°СЂР°РєС‚РµСЂРёСЃС‚РёРєР°РјРё. Р’ СЃР»СѓС‡Р°Рµ РїРѕР»СѓРїСЂРёС†РµРїРѕРІ Рё РїСЂРёС†РµРїРѕРІ СЃ С†РµРЅС‚СЂР°Р»СЊРЅРѕ СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕР№ РѕСЃСЊСЋ (РѕСЃСЏРјРё) РїРѕРґ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјРѕР№ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ РјР°СЃСЃРѕР№ РїСЂРёРЅРёРјР°РµС‚СЃСЏ СЃС‚Р°С‚РёС‡РµСЃРєР°СЏ РІРµСЂС‚РёРєР°Р»СЊРЅР°СЏ РЅР°РіСЂСѓР·РєР°, РїРµСЂРµРґР°РІР°РµРјР°СЏ РЅР° РіСЂСѓРЅС‚ РѕСЃСЊСЋ РёР»Рё РѕСЃСЏРјРё РјР°РєСЃРёРјР°Р»СЊРЅРѕ Р·Р°РіСЂСѓР¶РµРЅРЅРѕРіРѕ СЃС†РµРїР»РµРЅРЅРѕРіРѕ СЃ С‚СЏРіР°С‡РѕРј РїРѕР»СѓРїСЂРёС†РµРїР° Рё РїСЂРёС†РµРїР° СЃ С†РµРЅС‚СЂР°Р»СЊРЅРѕ СЂР°СЃРїРѕР»РѕР¶РµРЅРЅРѕР№ РѕСЃСЊСЋ (РѕСЃСЏРјРё).');
INSERT INTO internatioanltransporttypesclassifier VALUES (34, '319', 'Р“СЂСѓР·РѕРІРѕР№ РїРѕР»СѓРїСЂРёС†РµРї РѕР±С‰РµРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ', NULL, '15В РџРѕР»СѓРїСЂРёС†РµРї вЂ“ РїСЂРёС†РµРї, РєРѕРЅСЃС‚СЂСѓРєС†РёСЏ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅР° РґР»СЏ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ СЃ СЃРµРґРµР»СЊРЅС‹Рј С‚СЏРіР°С‡РѕРј, С‡Р°СЃС‚СЊ РїРѕР»РЅРѕР№ РјР°СЃСЃС‹ РєРѕС‚РѕСЂРѕРіРѕ РїРµСЂРµРґР°РµС‚СЃСЏ РЅР° СЃРµРґРµР»СЊРЅС‹Р№ С‚СЏРіР°С‡ С‡РµСЂРµР· СЃРµРґРµР»СЊРЅРѕ-СЃС†РµРїРЅРѕРµ СѓСЃС‚СЂРѕР№СЃС‚РІРѕ; 17 Р“СЂСѓР·РѕРІРѕР№ РїРѕР»СѓРїСЂРёС†РµРї РѕР±С‰РµРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ вЂ“ РїРѕР»СѓРїСЂРёС†РµРї СЃ Р±РѕСЂС‚РѕРІРѕР№ РїР»Р°С‚С„РѕСЂРјРѕР№ Р·Р°РєСЂС‹С‚РѕРіРѕ РёР»Рё РѕС‚РєСЂС‹С‚РѕРіРѕ С‚РёРїР°, РЅРµ РѕР±РѕСЂСѓРґРѕРІР°РЅРЅС‹Р№ СЃСЂРµРґСЃС‚РІР°РјРё СЃР°РјРѕРїРѕРіСЂСѓР·РєРё-СЃР°РјРѕСЂР°Р·РіСЂСѓР·РєРё РёР»Рё РґСЂСѓРіРёРј СЃРїРµС†РёР°Р»СЊРЅС‹Рј РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµРј');
INSERT INTO internatioanltransporttypesclassifier VALUES (36, '322', 'РЎРїРµС†РёР°Р»СЊРЅС‹Р№ Р°РІС‚РѕР±СѓСЃ', NULL, '21 РЎРїРµС†РёР°Р»СЊРЅС‹Р№ Р°РІС‚РѕР±СѓСЃ вЂ“ Р°РІС‚РѕР±СѓСЃ СЃРѕ СЃРїРµС†РёР°Р»СЊРЅС‹Рј РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµРј, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Р№ РІ РѕСЃРЅРѕРІРЅРѕРј РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ РѕРїСЂРµРґРµР»РµРЅРЅС‹С… РєР°С‚РµРіРѕСЂРёР№ РёР»Рё РїСЂРѕС„РµСЃСЃРёР№. Рљ С‚Р°РєРёРј Р°РІС‚РѕР±СѓСЃР°Рј РѕС‚РЅРѕСЃСЏС‚СЃСЏ, РЅР°РїСЂРёРјРµСЂ, Р°РІС‚РѕР±СѓСЃ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РёРЅРІР°Р»РёРґРѕРІ, РєР°С‚Р°С„Р°Р»Рє.; 19В РђРІС‚РѕР±СѓСЃ вЂ“ РїР°СЃСЃР°Р¶РёСЂСЃРєРёР№ Р°РІС‚РѕРјРѕР±РёР»СЊ СЃ С‡РёСЃР»РѕРј РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ Р±РѕР»РµРµ 9, РІРєР»СЋС‡Р°СЏ РјРµСЃС‚Рѕ РІРѕРґРёС‚РµР»СЏ');
INSERT INTO internatioanltransporttypesclassifier VALUES (37, '323', 'РЎРѕС‡Р»РµРЅРµРЅРЅС‹Р№ Р°РІС‚РѕР±СѓСЃ', NULL, '22 РЎРѕС‡Р»РµРЅРµРЅРЅС‹Р№ Р°РІС‚РѕР±СѓСЃ вЂ“ Р°РІС‚РѕР±СѓСЃ, СЃРѕСЃС‚РѕСЏС‰РёР№ РёР· 2 РёР»Рё Р±РѕР»РµРµ Р¶РµСЃС‚РєРёС… С€Р°СЂРЅРёСЂРЅРѕ СЃРѕРµРґРёРЅРµРЅРЅС‹С… РјРµР¶РґСѓ СЃРѕР±РѕР№ СЃРµРєС†РёР№ С‚Р°Рє, С‡С‚Рѕ РѕР±РµСЃРїРµС‡РёРІР°РµС‚СЃСЏ РїРµСЂРµРјРµС‰РµРЅРёРµ РїР°СЃСЃР°Р¶РёСЂРѕРІ РёР· РѕРґРЅРѕР№ СЃРµРєС†РёРё РІ РґСЂСѓРіСѓСЋ.; 19В РђРІС‚РѕР±СѓСЃ вЂ“ РїР°СЃСЃР°Р¶РёСЂСЃРєРёР№ Р°РІС‚РѕРјРѕР±РёР»СЊ СЃ С‡РёСЃР»РѕРј РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ Р±РѕР»РµРµ 9, РІРєР»СЋС‡Р°СЏ РјРµСЃС‚Рѕ РІРѕРґРёС‚РµР»СЏ');
INSERT INTO internatioanltransporttypesclassifier VALUES (38, '324', 'РњРёРєСЂРѕР°РІС‚РѕР±СѓСЃ', NULL, '19В РђРІС‚РѕР±СѓСЃ вЂ“ РїР°СЃСЃР°Р¶РёСЂСЃРєРёР№ Р°РІС‚РѕРјРѕР±РёР»СЊ СЃ С‡РёСЃР»РѕРј РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ Р±РѕР»РµРµ 9, РІРєР»СЋС‡Р°СЏ РјРµСЃС‚Рѕ РІРѕРґРёС‚РµР»СЏ; 23 РњРёРєСЂРѕР°РІС‚РѕР±СѓСЃ вЂ“ РѕРґРЅРѕСЌС‚Р°Р¶РЅС‹Р№ Р°РІС‚РѕР±СѓСЃ СЃ С‡РёСЃР»РѕРј РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ РЅРµ Р±РѕР»РµРµ 17, РІРєР»СЋС‡Р°СЏ РјРµСЃС‚Рѕ РІРѕРґРёС‚РµР»СЏ.');
INSERT INTO internatioanltransporttypesclassifier VALUES (39, '400', 'Р’РѕР·РґСѓС€РЅРѕРµ СЃСѓРґРЅРѕ', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (40, '901', 'РљРѕРЅС‚РµР№РЅРµСЂ', NULL, NULL);
INSERT INTO internatioanltransporttypesclassifier VALUES (41, '999', 'РџСЂРѕС‡РµРµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ', NULL, NULL);


--
-- TOC entry 4585 (class 0 OID 18999)
-- Dependencies: 279
-- Data for Name: issuersellerclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO issuersellerclassifier VALUES (1, '1', 'РІС‹РїРѕР»РЅСЏРµС‚ РѕРїРµСЂР°С†РёРё РїРѕ РёР·РіРѕС‚РѕРІР»РµРЅРёСЋ Рё СЂРµР°Р»РёР·Р°С†РёРё РєРѕРЅС‚СЂРѕР»СЊРЅС‹С… (РёРґРµРЅС‚РёС„РёРєР°С†РёРѕРЅРЅС‹С…) Р·РЅР°РєРѕРІ');
INSERT INTO issuersellerclassifier VALUES (2, '2', 'РІС‹РїРѕР»РЅСЏРµС‚ РѕРїРµСЂР°С†РёРё РїРѕ СЂРµР°Р»РёР·Р°С†РёРё РёР·РіРѕС‚РѕРІР»РµРЅРЅС‹С… РєРѕРЅС‚СЂРѕР»СЊРЅС‹С… (РёРґРµРЅС‚РёС„РёРєР°С†РёРѕРЅРЅС‹С…) Р·РЅР°РєРѕРІ');
INSERT INTO issuersellerclassifier VALUES (3, '3', 'РІС‹РїРѕР»РЅСЏРµС‚ РѕРїРµСЂР°С†РёРё РїРѕ РёР·РіРѕС‚РѕРІР»РµРЅРёСЋ РєРѕРЅС‚СЂРѕР»СЊРЅС‹С… (РёРґРµРЅС‚РёС„РёРєР°С†РёРѕРЅРЅС‹С…) Р·РЅР°РєРѕРІ');


--
-- TOC entry 4587 (class 0 OID 19007)
-- Dependencies: 281
-- Data for Name: kindidclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO kindidclassifier VALUES (1, '01', 'Р‘Р�Рќ');
INSERT INTO kindidclassifier VALUES (2, '02', 'Р“Р Р®Р›');
INSERT INTO kindidclassifier VALUES (3, '03', 'РћР“Р Рќ');
INSERT INTO kindidclassifier VALUES (4, '04', 'РћР“Р РќР�Рџ');
INSERT INTO kindidclassifier VALUES (5, '05', 'РћРљРћР“РЈ');
INSERT INTO kindidclassifier VALUES (6, '06', 'РћРљРџРћ');
INSERT INTO kindidclassifier VALUES (7, '07', 'РћРљР®Р›Рџ');


--
-- TOC entry 4589 (class 0 OID 19015)
-- Dependencies: 283
-- Data for Name: kindofdocumentsforcustomsdeclarationchapters; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO kindofdocumentsforcustomsdeclarationchapters VALUES (1, '1', 'Р”РѕРєСѓРјРµРЅС‚С‹, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёРµ СЃРѕР±Р»СЋРґРµРЅРёРµ Р·Р°РїСЂРµС‚РѕРІ Рё РѕРіСЂР°РЅРёС‡РµРЅРёР№');
INSERT INTO kindofdocumentsforcustomsdeclarationchapters VALUES (2, '2', 'РўСЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ (РїРµСЂРµРІРѕР·РѕС‡РЅС‹Рµ) РґРѕРєСѓРјРµРЅС‚С‹');
INSERT INTO kindofdocumentsforcustomsdeclarationchapters VALUES (3, '3', 'Р”РѕРєСѓРјРµРЅС‚С‹, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёРµ СЃРѕРІРµСЂС€РµРЅРёРµ РІРЅРµС€РЅРµСЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ СЃРґРµР»РєРё РёР»Рё РёРЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёРµ РїСЂР°РІРѕ РІР»Р°РґРµРЅРёСЏ, РїРѕР»СЊР·РѕРІР°РЅРёСЏ Рё (РёР»Рё) СЂР°СЃРїРѕСЂСЏР¶РµРЅРёСЏ С‚РѕРІР°СЂР°РјРё');
INSERT INTO kindofdocumentsforcustomsdeclarationchapters VALUES (4, '4', 'РљРѕРјРјРµСЂС‡РµСЃРєРёРµ РґРѕРєСѓРјРµРЅС‚С‹');
INSERT INTO kindofdocumentsforcustomsdeclarationchapters VALUES (5, '5', 'Р”РѕРєСѓРјРµРЅС‚С‹ РЅР° РѕСЃРЅРѕРІР°РЅРёРё РєРѕС‚РѕСЂС‹С… Р±С‹Р» Р·Р°СЏРІР»РµРЅ РєР»Р°СЃСЃРёС„РёРєР°С†РёРѕРЅРЅС‹Р№ РєРѕРґ С‚РѕРІР°СЂР° РїРѕ РўРќ Р’Р­Р” Р•РђР­РЎ');
INSERT INTO kindofdocumentsforcustomsdeclarationchapters VALUES (6, '7', 'Р”РѕРєСѓРјРµРЅС‚С‹, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёРµ РѕР±РµСЃРїРµС‡РµРЅРёРµ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїР»Р°С‚РµР¶РµР№, РїСЂР°РІРѕ РЅР° Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїР»Р°С‚РµР¶РµР№, РЅР° РїСЂРёРјРµРЅРµРЅРёРµ РїРѕР»РЅРѕРіРѕ РёР»Рё С‡Р°СЃС‚РёС‡РЅРѕРіРѕ РѕСЃРІРѕР±РѕР¶РґРµРЅРёСЏ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ С‚Р°РјРѕР¶РµРЅРЅС‹РјРё РїСЂРѕС†РµРґСѓСЂР°РјРё, Р»РёР±Рѕ РЅР° СѓРјРµРЅСЊС€РµРЅРёРµ Р±Р°Р·С‹ (РЅР°Р»РѕРіРѕРІРѕР№ Р±Р°Р·С‹) РґР»СЏ РёСЃС‡РёСЃР»РµРЅРёСЏ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ, Р»РёР±Рѕ РЅР° РёР·РјРµРЅРµРЅРёРµ СЃСЂРѕРєР° СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ, Р° С‚Р°РєР¶Рµ РґРѕРєСѓРјРµРЅС‚С‹, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёРµ РїСЂРёРјРµРЅРµРЅРёРµ С†РµРЅС‚СЂР°Р»РёР·РѕРІР°РЅРЅРѕРіРѕ РїРѕСЂСЏРґРєР° СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ.');
INSERT INTO kindofdocumentsforcustomsdeclarationchapters VALUES (7, '8', 'Р”РѕРєСѓРјРµРЅС‚С‹, РїСЂРµРґРѕСЃС‚Р°РІР»СЏРµРјС‹Рµ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ СѓСЃР»РѕРІРёСЏРјРё С‚Р°РјРѕР¶РµРЅРЅС‹С… РїСЂРѕС†РµРґСѓСЂ');
INSERT INTO kindofdocumentsforcustomsdeclarationchapters VALUES (8, '9', 'Р”РѕРїРѕР»РЅРёС‚РµР»СЊРЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹, РїСЂРµРґРѕСЃС‚Р°РІР»СЏРµРјС‹Рµ РїСЂРё С‚Р°РјРѕР¶РµРЅРЅРѕРј РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРё С‚РѕРІР°СЂРѕРІ');
INSERT INTO kindofdocumentsforcustomsdeclarationchapters VALUES (9, '10', 'РЎРІРµРґРµРЅРёСЏ, Р·Р°СЏРІР»СЏРµРјС‹Рµ РїСЂРё С‚Р°РјРѕР¶РµРЅРЅРѕРј РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРё ');


--
-- TOC entry 4591 (class 0 OID 19023)
-- Dependencies: 285
-- Data for Name: kindofdocumentsforcustomsdeclarationclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (1, '01011', '1', 'Р›РёС†РµРЅР·РёСЏ РЅР° СЌРєСЃРїРѕСЂС‚ Рё (РёР»Рё) РёРјРїРѕСЂС‚ С‚РѕРІР°СЂРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (2, '01017', '1', 'Р Р°Р·СЂРµС€РµРЅРёРµ РЅР° СЌРєСЃРїРѕСЂС‚ Рё (РёР»Рё) РёРјРїРѕСЂС‚ С‚РѕРІР°СЂРѕРІ, РІ РѕС‚РЅРѕС€РµРЅРёРё РєРѕС‚РѕСЂС‹С… РІРІРµРґРµРЅРѕ Р°РІС‚РѕРјР°С‚РёС‡РµСЃРєРѕРµ Р»РёС†РµРЅР·РёСЂРѕРІР°РЅРёРµ (РЅР°Р±Р»СЋРґРµРЅРёРµ)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (3, '01021', '1', 'Р—Р°РєР»СЋС‡РµРЅРёРµ (СЂР°Р·СЂРµС€РёС‚РµР»СЊРЅС‹Р№ РґРѕРєСѓРјРµРЅС‚) РЅР° РІРІРѕР· Рё (РёР»Рё) РІС‹РІРѕР· РіСЂР°Р¶РґР°РЅСЃРєРѕРіРѕ Рё СЃР»СѓР¶РµР±РЅРѕРіРѕ РѕСЂСѓР¶РёСЏ, РµРіРѕ РѕСЃРЅРѕРІРЅС‹С… (СЃРѕСЃС‚Р°РІРЅС‹С…) С‡Р°СЃС‚РµР№ Рё РїР°С‚СЂРѕРЅРѕРІ Рє РЅРµРјСѓ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (4, '01031', '1', 'Р Р°Р·СЂРµС€РµРЅРёРµ (СЃРµСЂС‚РёС„РёРєР°С‚, СѓРґРѕСЃС‚РѕРІРµСЂРµРЅРёРµ), РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅРѕРµ РљРѕРЅРІРµРЅС†РёРµР№ Рѕ РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕР№ С‚РѕСЂРіРѕРІР»Рµ РІРёРґР°РјРё РґРёРєРѕР№ С„Р°СѓРЅС‹ Рё С„Р»РѕСЂС‹, РЅР°С…РѕРґСЏС‰РёРјРёСЃСЏ РїРѕРґ СѓРіСЂРѕР·РѕР№ РёСЃС‡РµР·РЅРѕРІРµРЅРёСЏ, РѕС‚ 3 РјР°СЂС‚Р° 1973 РіРѕРґР°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (5, '01041', '1', 'Р—Р°РєР»СЋС‡РµРЅРёРµ (СЂР°Р·СЂРµС€РёС‚РµР»СЊРЅС‹Р№ РґРѕРєСѓРјРµРЅС‚) РЅР° РІРІРѕР· СЂР°РґРёРѕСЌР»РµРєС‚СЂРѕРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ Рё РІС‹СЃРѕРєРѕС‡Р°СЃС‚РѕС‚РЅС‹С… СѓСЃС‚СЂРѕР№СЃС‚РІ РіСЂР°Р¶РґР°РЅСЃРєРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ, РІ С‚РѕРј С‡РёСЃР»Рµ РІСЃС‚СЂРѕРµРЅРЅС‹С… Р»РёР±Рѕ РІС…РѕРґСЏС‰РёС… РІ СЃРѕСЃС‚Р°РІ РґСЂСѓРіРёС… С‚РѕРІР°СЂРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (6, '01061', '1', 'Р—Р°РєР»СЋС‡РµРЅРёРµ (СЂР°Р·СЂРµС€РёС‚РµР»СЊРЅС‹Р№ РґРѕРєСѓРјРµРЅС‚) РЅР° РІРІРѕР· СЃСЂРµРґСЃС‚РІ Р·Р°С‰РёС‚С‹ СЂР°СЃС‚РµРЅРёР№ (РїРµСЃС‚РёС†РёРґРѕРІ)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (7, '01071', '1', 'Р—Р°РєР»СЋС‡РµРЅРёРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РіРѕСЃСѓРґР°СЂСЃС‚РІ вЂ“ С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РЅР° РІРІРѕР· (РІС‹РІРѕР·) СЏРґРѕРІРёС‚С‹С… РІРµС‰РµСЃС‚РІ, РЅРµ СЏРІР»СЏСЋС‰РёС…СЃСЏ РїСЂРµРєСѓСЂСЃРѕСЂР°РјРё РЅР°СЂРєРѕС‚РёС‡РµСЃРєРёС… СЃСЂРµРґСЃС‚РІ Рё РїСЃРёС…РѕС‚СЂРѕРїРЅС‹С… РІРµС‰РµСЃС‚РІ Рё СЏРІР»СЏСЋС‰РёС…СЃСЏ СЃС‚Р°РЅРґР°СЂС‚РЅС‹РјРё РѕР±СЂР°Р·С†Р°РјРё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (8, '01072', '1', 'Р—Р°РєР»СЋС‡РµРЅРёРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РіРѕСЃСѓРґР°СЂСЃС‚РІ вЂ“ С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РЅР° С‚СЂР°РЅР·РёС‚ СЏРґРѕРІРёС‚С‹С… РІРµС‰РµСЃС‚РІ, РЅРµ СЏРІР»СЏСЋС‰РёС…СЃСЏ РїСЂРµРєСѓСЂСЃРѕСЂР°РјРё РЅР°СЂРєРѕС‚РёС‡РµСЃРєРёС… СЃСЂРµРґСЃС‚РІ Рё РїСЃРёС…РѕС‚СЂРѕРїРЅС‹С… РІРµС‰РµСЃС‚РІ С‡РµСЂРµР· С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (9, '01081', '1', 'Р—Р°РєР»СЋС‡РµРЅРёРµ (СЂР°Р·СЂРµС€РёС‚РµР»СЊРЅС‹Р№ РґРѕРєСѓРјРµРЅС‚) РЅР° РІРІРѕР· Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (10, '01091', '1', 'Р—Р°РєР»СЋС‡РµРЅРёРµ (СЂР°Р·СЂРµС€РёС‚РµР»СЊРЅС‹Р№ РґРѕРєСѓРјРµРЅС‚) РЅР° РІРІРѕР· Рё (РёР»Рё) РІС‹РІРѕР· С€РёС„СЂРѕРІР°Р»СЊРЅС‹С… (РєСЂРёРїС‚РѕРіСЂР°С„РёС‡РµСЃРєРёС…) СЃСЂРµРґСЃС‚РІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (11, '01095', '1', 'Р—Р°РєР»СЋС‡РµРЅРёРµ (СЂР°Р·СЂРµС€РёС‚РµР»СЊРЅС‹Р№ РґРѕРєСѓРјРµРЅС‚) РЅР° РІРІРѕР· Рё (РёР»Рё) РІС‹РІРѕР· СЃРїРµС†РёР°Р»СЊРЅС‹С… С‚РµС…РЅРёС‡РµСЃРєРёС… СЃСЂРµРґСЃС‚РІ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РЅРµРіР»Р°СЃРЅРѕРіРѕ РїРѕР»СѓС‡РµРЅРёСЏ РёРЅС„РѕСЂРјР°С†РёРё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (12, '01101', '1', 'Р—Р°РєР»СЋС‡РµРЅРёРµ (СЂР°Р·СЂРµС€РёС‚РµР»СЊРЅС‹Р№ РґРѕРєСѓРјРµРЅС‚) РЅР° РІС‹РІРѕР· РєСѓР»СЊС‚СѓСЂРЅС‹С… С†РµРЅРЅРѕСЃС‚РµР№, РґРѕРєСѓРјРµРЅС‚РѕРІ РЅР°С†РёРѕРЅР°Р»СЊРЅС‹С… Р°СЂС…РёРІРЅС‹С… С„РѕРЅРґРѕРІ Рё РѕСЂРёРіРёРЅР°Р»РѕРІ Р°СЂС…РёРІРЅС‹С… РґРѕРєСѓРјРµРЅС‚РѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (13, '01111', '1', 'Р—Р°РєР»СЋС‡РµРЅРёРµ (СЂР°Р·СЂРµС€РёС‚РµР»СЊРЅС‹Р№ РґРѕРєСѓРјРµРЅС‚) РЅР° РІС‹РІРѕР· РєРѕР»Р»РµРєС†РёРѕРЅРЅС‹С… РјР°С‚РµСЂРёР°Р»РѕРІ РїРѕ РјРёРЅРµСЂР°Р»РѕРіРёРё, РїР°Р»РµРѕРЅС‚РѕР»РѕРіРёРё, РєРѕСЃС‚РµР№ РёСЃРєРѕРїР°РµРјС‹С… Р¶РёРІРѕС‚РЅС‹С…', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (14, '01121', '1', 'Р—Р°РєР»СЋС‡РµРЅРёРµ (СЂР°Р·СЂРµС€РёС‚РµР»СЊРЅС‹Р№ РґРѕРєСѓРјРµРЅС‚) РЅР° РІС‹РІРѕР· РґРёРєРёС… Р¶РёРІС‹С… Р¶РёРІРѕС‚РЅС‹С…, РѕС‚РґРµР»СЊРЅС‹С… РґРёРєРѕСЂР°СЃС‚СѓС‰РёС… СЂР°СЃС‚РµРЅРёР№ Рё РґРёРєРѕСЂР°СЃС‚СѓС‰РµРіРѕ Р»РµРєР°СЂСЃС‚РІРµРЅРЅРѕРіРѕ СЃС‹СЂСЊСЏ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (15, '01125', '1', 'Р—Р°РєР»СЋС‡РµРЅРёРµ (СЂР°Р·СЂРµС€РёС‚РµР»СЊРЅС‹Р№ РґРѕРєСѓРјРµРЅС‚) РЅР° РІС‹РІРѕР· СЂРµРґРєРёС… Рё РЅР°С…РѕРґСЏС‰РёС…СЃСЏ РїРѕРґ СѓРіСЂРѕР·РѕР№ РёСЃС‡РµР·РЅРѕРІРµРЅРёСЏ РІРёРґРѕРІ РґРёРєРёС… Р¶РёРІС‹С… Р¶РёРІРѕС‚РЅС‹С… Рё РґРёРєРѕСЂР°СЃС‚СѓС‰РёС… СЂР°СЃС‚РµРЅРёР№, РІРєР»СЋС‡РµРЅРЅС‹С… РІ РєСЂР°СЃРЅС‹Рµ РєРЅРёРіРё РіРѕСЃСѓРґР°СЂСЃС‚РІ вЂ“ С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (16, '01131', '1', 'Р—Р°РєР»СЋС‡РµРЅРёРµ (СЂР°Р·СЂРµС€РёС‚РµР»СЊРЅС‹Р№ РґРѕРєСѓРјРµРЅС‚) РЅР° РІРІРѕР· Рё (РёР»Рё) РІС‹РІРѕР· РѕСЂРіР°РЅРѕРІ Рё С‚РєР°РЅРµР№ С‡РµР»РѕРІРµРєР°, РєСЂРѕРІРё Рё РµРµ РєРѕРјРїРѕРЅРµРЅС‚РѕРІ, РѕР±СЂР°Р·С†РѕРІ Р±РёРѕР»РѕРіРёС‡РµСЃРєРёС… РјР°С‚РµСЂРёР°Р»РѕРІ С‡РµР»РѕРІРµРєР°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (17, '01133', '1', 'Р Р°Р·СЂРµС€РµРЅРёРµ РЅР° СЂРµСЌРєСЃРїРѕСЂС‚ С‚РѕРІР°СЂРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (18, '01143', '1', '"РђРєС‚ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕРіРѕ РєРѕРЅС‚СЂРѕР»СЏ РЅР° РІРІРѕР· Рё (РёР»Рё) РІС‹РІРѕР·: вЂ“ РґСЂР°РіРѕС†РµРЅРЅС‹С… РєР°РјРЅРµР№, вЂ“ РґСЂР°РіРѕС†РµРЅРЅС‹С… РјРµС‚Р°Р»Р»РѕРІ Рё СЃС‹СЂСЊРµРІС‹С… С‚РѕРІР°СЂРѕРІ, СЃРѕРґРµСЂР¶Р°С‰РёС… РґСЂР°РіРѕС†РµРЅРЅС‹Рµ РјРµС‚Р°Р»Р»С‹"', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (19, '01151', '1', 'Р›РёС†РµРЅР·РёСЏ, РїРµСЂРµС‡РµРЅСЊ (РїСЂРёР»РѕР¶РµРЅРёРµ) Рє Р»РёС†РµРЅР·РёРё РЅР° РІРІРѕР· (РІС‹РІРѕР·) С‚РѕРІР°СЂРѕРІ, РїРѕРґР»РµР¶Р°С‰РёС… СЌРєСЃРїРѕСЂС‚РЅРѕРјСѓ РєРѕРЅС‚СЂРѕР»СЋ, РІС‹РґР°РЅРЅС‹Рµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Рј РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (20, '01152', '1', 'Р Р°Р·СЂРµС€РµРЅРёРµ РЅР° С‚СЂР°РЅР·РёС‚ С‚РѕРІР°СЂРѕРІ, РїРѕРґР»РµР¶Р°С‰РёС… СЌРєСЃРїРѕСЂС‚РЅРѕРјСѓ РєРѕРЅС‚СЂРѕР»СЋ, РІС‹РґР°РЅРЅРѕРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Рј РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РІ РѕР±Р»Р°СЃС‚Рё СЌРєСЃРїРѕСЂС‚РЅРѕРіРѕ РєРѕРЅС‚СЂРѕР»СЏ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (21, '01153', '1', 'Р Р°Р·СЂРµС€РµРЅРёРµ (РїРѕРґС‚РІРµСЂР¶РґРµРЅРёРµ) РЅР° РІРІРѕР· (РІС‹РІРѕР·) С‚РѕРІР°СЂРѕРІ, РїРѕРґР»РµР¶Р°С‰РёС… СЌРєСЃРїРѕСЂС‚РЅРѕРјСѓ РєРѕРЅС‚СЂРѕР»СЋ, РІС‹РґР°РЅРЅРѕРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Рј РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РІ РѕР±Р»Р°СЃС‚Рё СЌРєСЃРїРѕСЂС‚РЅРѕРіРѕ РєРѕРЅС‚СЂРѕР»СЏ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (22, '01154', '1', 'Р—Р°РєР»СЋС‡РµРЅРёРµ (РёРґРµРЅС‚РёС„РёРєР°С†РёРѕРЅРЅРѕРµ), РІС‹РґР°РІР°РµРјРѕРµ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј РІ РѕР±Р»Р°СЃС‚Рё СЌРєСЃРїРѕСЂС‚РЅРѕРіРѕ РєРѕРЅС‚СЂРѕР»СЏ РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, Рѕ РЅРµРїСЂРёРЅР°РґР»РµР¶РЅРѕСЃС‚Рё С‚РѕРІР°СЂРѕРІ Рє С‚РѕРІР°СЂР°Рј, РІРєР»СЋС‡РµРЅРЅС‹Рј РІ РµРґРёРЅС‹Рµ СЃРїРёСЃРєРё РєРѕРЅС‚СЂРѕР»РёСЂСѓРµРјС‹С… С‚РѕРІР°СЂРѕРІ Рё С‚РµС…РЅРѕР»РѕРіРёР№', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (23, '01161', '1', 'Р›РёС†РµРЅР·РёСЏ, РїРµСЂРµС‡РµРЅСЊ (РїСЂРёР»РѕР¶РµРЅРёРµ) Рє Р»РёС†РµРЅР·РёРё РЅР° РІРІРѕР· (РІС‹РІРѕР·) РїСЂРѕРґСѓРєС†РёРё РІРѕРµРЅРЅРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ, РІС‹РґР°РЅРЅС‹Рµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Рј РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (24, '01162', '1', 'Р Р°Р·СЂРµС€РµРЅРёРµ РЅР° С‚СЂР°РЅР·РёС‚ РїСЂРѕРґСѓРєС†РёРё РІРѕРµРЅРЅРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ, РІС‹РґР°РЅРЅРѕРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Рј РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (25, '01163', '1', 'Р—Р°РєР»СЋС‡РµРЅРёРµ (РёРґРµРЅС‚РёС„РёРєР°С†РёРѕРЅРЅРѕРµ) СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° Рѕ РЅРµРїСЂРёРЅР°РґР»РµР¶РЅРѕСЃС‚Рё С‚РѕРІР°СЂРѕРІ Рє РїСЂРѕРґСѓРєС†РёРё РІРѕРµРЅРЅРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (26, '01171', '1', 'Р’РѕРёРЅСЃРєРёР№ РїСЂРѕРїСѓСЃРє', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (27, '01181', '1', 'РџРµСЂРµС‡РµРЅСЊ РїСЂРѕРґСѓРєС†РёРё, РІРІРѕР·РёРјРѕР№ (РІС‹РІРѕР·РёРјРѕР№) РІ СЂР°РјРєР°С… РњРµР¶РїСЂР°РІРёС‚РµР»СЊСЃС‚РІРµРЅРЅС‹С… РЎРѕРіР»Р°С€РµРЅРёР№ Рѕ РїСЂРѕРёР·РІРѕРґСЃС‚РІРµРЅРЅРѕР№ Рё РЅР°СѓС‡РЅРѕ-С‚РµС…РЅРёС‡РµСЃРєРѕР№ РєРѕРѕРїРµСЂР°С†РёРё РїСЂРµРґРїСЂРёСЏС‚РёР№ РѕР±РѕСЂРѕРЅРЅС‹С… РѕС‚СЂР°СЃР»РµР№ РїСЂРѕРјС‹С€Р»РµРЅРЅРѕСЃС‚Рё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (28, '01191', '1', 'Р”РѕРєСѓРјРµРЅС‚ РѕР± РѕС†РµРЅРєРµ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёСЏ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Р№ С‚РµС…РЅРёС‡РµСЃРєРёРјРё СЂРµРіР»Р°РјРµРЅС‚Р°РјРё Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° (С‚РµС…РЅРёС‡РµСЃРєРёРјРё СЂРµРіР»Р°РјРµРЅС‚Р°РјРё РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р°), Р»РёР±Рѕ СЃРµСЂС‚РёС„РёРєР°С‚ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёСЏ РёР»Рё РґРµРєР»Р°СЂР°С†РёСЏ Рѕ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё, РѕС„РѕСЂРјР»РµРЅРЅС‹Рµ РїРѕ РµРґРёРЅРѕР№ С„РѕСЂРјРµ, РЅР° РїСЂРѕРґСѓРєС†РёСЋ (С‚РѕРІР°СЂС‹), РІРєР»СЋС‡РµРЅРЅСѓСЋ РІ РµРґРёРЅС‹Р№ РїРµСЂРµС‡РµРЅСЊ РїСЂРѕРґСѓРєС†РёРё, РїРѕРґР»РµР¶Р°С‰РµР№ РѕР±СЏР·Р°С‚РµР»СЊРЅРѕРјСѓ РїРѕРґС‚РІРµСЂР¶РґРµРЅРёСЋ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёСЏ СЃ РІС‹РґР°С‡РµР№ СЃРµСЂС‚РёС„РёРєР°С‚РѕРІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёСЏ Рё РґРµРєР»Р°СЂР°С†РёР№ Рѕ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё РїРѕ РµРґРёРЅРѕР№ С„РѕСЂРјРµ, Р»РёР±Рѕ РґРѕРєСѓРјРµРЅС‚ РѕР± РѕС†РµРЅРєРµ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёСЏ РїСЂРѕРґСѓРєС†РёРё (С‚РѕРІР°СЂР°), РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Р№ Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РЅР° С‚РµСЂСЂРёС‚РѕСЂРёРё РєРѕС‚РѕСЂРѕРіРѕ РїСЂРѕРґСѓРєС†РёСЏ (С‚РѕРІР°СЂ) РїРѕРјРµС‰Р°РµС‚СЃСЏ РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РїСЂРѕС†РµРґСѓСЂС‹', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (29, '01194', '1', 'РЎРїСЂР°РІРєР° СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР°, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰Р°СЏ РїСЂРёРЅР°РґР»РµР¶РЅРѕСЃС‚СЊ РїСЂРѕРґСѓРєС†РёРё Рє Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹Рј СЃСЂРµРґСЃС‚РІР°Рј, С‚РѕРІР°СЂР°Рј РјРµРґРёС†РёРЅСЃРєРѕРіРѕ Рё РІРµС‚РµСЂРёРЅР°СЂРЅРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ РїСЂРё СѓСЃР»РѕРІРёРё РёС… СЂР°Р·РјРµС‰РµРЅРёСЏ РЅР° Р°РїС‚РµС‡РЅС‹С… СЃРєР»Р°РґР°С… РїРѕР»СѓС‡Р°С‚РµР»СЏ, РѕСЃСѓС‰РµСЃС‚РІР»СЏСЋС‰РµРіРѕ РїСЂРёРµРјРєСѓ, С…СЂР°РЅРµРЅРёРµ, Р° РїРѕСЃР»Рµ РїСЂРѕС…РѕР¶РґРµРЅРёСЏ РїСЂРѕС†РµРґСѓСЂС‹ РїРѕРґС‚РІРµСЂР¶РґРµРЅРёСЏ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёСЏ вЂ“ РѕС‚РїСѓСЃРє Рё СЂРµР°Р»РёР·Р°С†РёСЋ Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ, С‚РѕРІР°СЂРѕРІ РјРµРґРёС†РёРЅСЃРєРѕРіРѕ Рё РІРµС‚РµСЂРёРЅР°СЂРЅРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ, Рё РіР°СЂР°РЅС‚РёСЋ Р·Р°СЏРІРёС‚РµР»СЏ Рѕ РµРіРѕ РѕС‚РІРµС‚СЃС‚РІРµРЅРЅРѕСЃС‚Рё (РґР»СЏ РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРё)', 'KG', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (30, '01201', '1', 'Р’РµС‚РµСЂРёРЅР°СЂРЅС‹Р№ СЃРµСЂС‚РёС„РёРєР°С‚', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (31, '01202', '1', 'Р Р°Р·СЂРµС€РµРЅРёРµ РЅР° РІРІРѕР· РїРѕРґРєРѕРЅС‚СЂРѕР»СЊРЅС‹С… С‚РѕРІР°СЂРѕРІ, РёСЃС…РѕРґСЏ РёР· СЌРїРёР·РѕРѕС‚РёС‡РµСЃРєРѕРіРѕ СЃРѕСЃС‚РѕСЏРЅРёСЏ СЃС‚СЂР°РЅ-СЌРєСЃРїРѕСЂС‚РµСЂРѕРІ, РІС‹РґР°РЅРЅРѕРµ РґРѕР»Р¶РЅРѕСЃС‚РЅС‹Рј Р»РёС†РѕРј СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РіРѕСЃСѓРґР°СЂСЃС‚РІР° - С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РІ РѕР±Р»Р°СЃС‚Рё РІРµС‚РµСЂРёРЅР°СЂРёРё', 'KZ', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (32, '01203', '1', 'Р Р°Р·СЂРµС€РµРЅРёРµ РЅР° РІС‹РІРѕР· РїРѕРґРєРѕРЅС‚СЂРѕР»СЊРЅС‹С… С‚РѕРІР°СЂРѕРІ, РІС‹РґР°РЅРЅРѕРµ РґРѕР»Р¶РЅРѕСЃС‚РЅС‹Рј Р»РёС†РѕРј СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РІ РѕР±Р»Р°СЃС‚Рё РІРµС‚РµСЂРёРЅР°СЂРёРё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (33, '01204', '1', 'Р Р°Р·СЂРµС€РµРЅРёРµ РЅР° С‚СЂР°РЅР·РёС‚ РїРѕРґРєРѕРЅС‚СЂРѕР»СЊРЅС‹С… С‚РѕРІР°СЂРѕРІ, РёСЃС…РѕРґСЏ РёР· СЌРїРёР·РѕРѕС‚РёС‡РµСЃРєРѕРіРѕ СЃРѕСЃС‚РѕСЏРЅРёСЏ СЃС‚СЂР°РЅ-СЌРєСЃРїРѕСЂС‚РµСЂРѕРІ, РІС‹РґР°РЅРЅРѕРµ РґРѕР»Р¶РЅРѕСЃС‚РЅС‹Рј Р»РёС†РѕРј СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РІ РѕР±Р»Р°СЃС‚Рё РІРµС‚РµСЂРёРЅР°СЂРёРё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (34, '01205', '1', 'РЎР°РЅРёС‚Р°СЂРЅРѕ-СЌРїРёРґРµРјРёРѕР»РѕРіРёС‡РµСЃРєРѕРµ Р·Р°РєР»СЋС‡РµРЅРёРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° (РґР»СЏ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ Рё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё)', 'KZ', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (35, '01206', '1', 'РЎРІРёРґРµС‚РµР»СЊСЃС‚РІРѕ Рѕ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕР№ СЂРµРіРёСЃС‚СЂР°С†РёРё, РІС‹РґР°РЅРЅРѕРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РІ РѕР±Р»Р°СЃС‚Рё СЃР°РЅРёС‚Р°СЂРЅРѕ-СЌРїРёРґРµРјРёРѕР»РѕРіРёС‡РµСЃРєРѕРіРѕ Р±Р»Р°РіРѕРїРѕР»СѓС‡РёСЏ РЅР°СЃРµР»РµРЅРёСЏ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (36, '01207', '1', 'Р¤РёС‚РѕСЃР°РЅРёС‚Р°СЂРЅС‹Р№ СЃРµСЂС‚РёС„РёРєР°С‚', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (37, '01209', '1', 'Р Р°Р·СЂРµС€РµРЅРёРµ РЅР° РІРІРѕР· РєР°СЂР°РЅС‚РёРЅРЅС‹С… РѕР±СЉРµРєС‚РѕРІ (РєР°СЂР°РЅС‚РёРЅРЅС‹С… РІСЂРµРґРЅС‹С… РѕСЂРіР°РЅРёР·РјРѕРІ) РІ РЅР°СѓС‡РЅРѕ-РёСЃСЃР»РµРґРѕРІР°С‚РµР»СЊСЃРєРёС… С†РµР»СЏС…, РІС‹РґР°РЅРЅРѕРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Рј РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (38, '01210', '1', 'Р”РѕРєСѓРјРµРЅС‚С‹, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёРµ СЃРѕР±Р»СЋРґРµРЅРёРµ Р·Р°РїСЂРµС‚РѕРІ Рё РѕРіСЂР°РЅРёС‡РµРЅРёР№ (РІСЂРµРјРµРЅРЅС‹С… РјРµСЂ), РІРІРµРґРµРЅРЅС‹С… РІ Р РµСЃРїСѓР±Р»РёРєРµ РђСЂРјРµРЅРёСЏ РІ РѕРґРЅРѕСЃС‚РѕСЂРѕРЅРЅРµРј РїРѕСЂСЏРґРєРµ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (39, '01211', '1', 'Р”РѕРєСѓРјРµРЅС‚С‹, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёРµ СЃРѕР±Р»СЋРґРµРЅРёРµ Р·Р°РїСЂРµС‚РѕРІ Рё РѕРіСЂР°РЅРёС‡РµРЅРёР№ (РІСЂРµРјРµРЅРЅС‹С… РјРµСЂ), РІРІРµРґС‘РЅРЅС‹С… РІ Р РµСЃРїСѓР±Р»РёРєРµ Р‘РµР»Р°СЂСѓСЃСЊ РІ РѕРґРЅРѕСЃС‚РѕСЂРѕРЅРЅРµРј РїРѕСЂСЏРґРєРµ', 'BY', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (40, '01221', '1', 'Р”РѕРєСѓРјРµРЅС‚С‹, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёРµ СЃРѕР±Р»СЋРґРµРЅРёРµ Р·Р°РїСЂРµС‚РѕРІ Рё РѕРіСЂР°РЅРёС‡РµРЅРёР№ (РІСЂРµРјРµРЅРЅС‹С… РјРµСЂ), РІРІРµРґС‘РЅРЅС‹С… РІ Р РµСЃРїСѓР±Р»РёРєРµ РљР°Р·Р°С…СЃС‚Р°РЅ РІ РѕРґРЅРѕСЃС‚РѕСЂРѕРЅРЅРµРј РїРѕСЂСЏРґРєРµ', 'KZ', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (41, '01225', '1', 'Р”РѕРєСѓРјРµРЅС‚С‹, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёРµ СЃРѕР±Р»СЋРґРµРЅРёРµ Р·Р°РїСЂРµС‚РѕРІ Рё РѕРіСЂР°РЅРёС‡РµРЅРёР№ (РІСЂРµРјРµРЅРЅС‹С… РјРµСЂ), РІРІРµРґРµРЅРЅС‹С… РІ РљС‹СЂРіС‹Р·СЃРєРѕР№ Р РµСЃРїСѓР±Р»РёРєРµ РІ РѕРґРЅРѕСЃС‚РѕСЂРѕРЅРЅРµРј РїРѕСЂСЏРґРєРµ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (42, '01231', '1', 'Р”РѕРєСѓРјРµРЅС‚С‹, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёРµ СЃРѕР±Р»СЋРґРµРЅРёРµ Р·Р°РїСЂРµС‚РѕРІ Рё РѕРіСЂР°РЅРёС‡РµРЅРёР№ (РІСЂРµРјРµРЅРЅС‹С… РјРµСЂ), РІРІРµРґС‘РЅРЅС‹С… РІ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РІ РѕРґРЅРѕСЃС‚РѕСЂРѕРЅРЅРµРј РїРѕСЂСЏРґРєРµ', 'RU', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (43, '01241', '1', 'РЎРµСЂС‚РёС„РёРєР°С‚ (СЃРІРµРґРµРЅРёСЏ Рѕ СЃРµСЂС‚РёС„РёРєР°С‚Рµ) РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕР№ СЃС…РµРјС‹ СЃРµСЂС‚РёС„РёРєР°С†РёРё РЅРµРѕР±СЂР°Р±РѕС‚Р°РЅРЅС‹С… РїСЂРёСЂРѕРґРЅС‹С… Р°Р»РјР°Р·РѕРІ (СЃРµСЂС‚РёС„РёРєР°С‚ РљРёРјР±РµСЂР»РёР№СЃРєРѕРіРѕ РїСЂРѕС†РµСЃСЃР°)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (44, '01242', '1', 'Р”РѕРєСѓРјРµРЅС‚С‹, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёРµ СЃРІРµРґРµРЅРёСЏ Рѕ РїСЂРѕРёР·РІРѕРґРёС‚РµР»Рµ С‚РѕРІР°СЂРѕРІ, РґР»СЏ С†РµР»РµР№ РєРѕРЅС‚СЂРѕР»СЏ Р·Р° РїСЂРёРјРµРЅРµРЅРёРµРј СЃРїРµС†РёР°Р»СЊРЅС‹С… Р·Р°С‰РёС‚РЅС‹С…, Р°РЅС‚РёРґРµРјРїРёРЅРіРѕРІС‹С… Рё РєРѕРјРїРµРЅСЃР°С†РёРѕРЅРЅС‹С… РјРµСЂ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (45, '01243', '1', 'Р­РєСЃРїРѕСЂС‚РЅС‹Р№ СЃРµСЂС‚РёС„РёРєР°С‚ РЅР° СЃРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅСѓСЋ РїСЂРѕРґСѓРєС†РёСЋ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (46, '01251', '1', 'Р›РёС†РµРЅР·РёСЏ РЅР° РІРёРґС‹ РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё РІ РѕС‚РЅРѕС€РµРЅРёРё РѕС‚РґРµР»СЊРЅС‹С… РєР°С‚РµРіРѕСЂРёР№ С‚РѕРІР°СЂРѕРІ (РґР»СЏ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё)', 'RU', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (47, '01261', '1', 'Р”РѕРєСѓРјРµРЅС‚ (РєРІРёС‚Р°РЅС†РёСЏ) РЅР° РїРѕР»СѓС‡РµРЅРёРµ Р°РєС†РёР·РЅС‹С… РјР°СЂРѕРє (СѓС‡РµС‚РЅРѕ-РєРѕРЅС‚СЂРѕР»СЊРЅС‹С… Р·РЅР°РєРѕРІ, Р·РЅР°РєРѕРІ) (РґР»СЏ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё)', 'RU', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (48, '01271', '1', 'Р”РѕРєСѓРјРµРЅС‚, РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РєРѕС‚РѕСЂС‹Рј РїРѕРґР°РєС†РёР·РЅС‹Рµ С‚РѕРІР°СЂС‹, РїРѕРґР»РµР¶Р°С‰РёРµ РјР°СЂРєРёСЂРѕРІРєРµ Р°РєС†РёР·РЅС‹РјРё РјР°СЂРєР°РјРё (СѓС‡РµС‚РЅРѕ-РєРѕРЅС‚СЂРѕР»СЊРЅС‹РјРё Р·РЅР°РєР°РјРё, Р·РЅР°РєР°РјРё), РЅРµ РјР°СЂРєРёСЂСѓСЋС‚СЃСЏ (РґР»СЏ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё)', 'RU', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (49, '01281', '1', 'РџРѕРґС‚РІРµСЂР¶РґРµРЅРёРµ Рѕ С„РёРєСЃР°С†РёРё РїСЂРѕРґСѓРєС†РёРё РІ РµРґРёРЅРѕР№ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕР№ Р°РІС‚РѕРјР°С‚РёР·РёСЂРѕРІР°РЅРЅРѕР№ РёРЅС„РѕСЂРјР°С†РёРѕРЅРЅРѕР№ СЃРёСЃС‚РµРјРµ СѓС‡РµС‚Р° РѕР±СЉРµРјР° РїСЂРѕРёР·РІРѕРґСЃС‚РІР° Рё РѕР±РѕСЂРѕС‚Р° СЌС‚РёР»РѕРІРѕРіРѕ СЃРїРёСЂС‚Р°, Р°Р»РєРѕРіРѕР»СЊРЅРѕР№ Рё СЃРїРёСЂС‚РѕСЃРѕРґРµСЂР¶Р°С‰РµР№ РїСЂРѕРґСѓРєС†РёРё (РґР»СЏ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё)', 'RU', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (50, '01291', '1', 'Р Р°Р·СЂРµС€РµРЅРёРµ, РІС‹РґР°РЅРЅРѕРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Рј РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё РІР·СЂС‹РІС‡Р°С‚С‹С… РІРµС‰РµСЃС‚РІ РїСЂРѕРјС‹С€Р»РµРЅРЅРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ, РёСЃС‚РѕС‡РЅРёРєРѕРІ РёРѕРЅРёР·РёСЂСѓСЋС‰РµРіРѕ РёР·Р»СѓС‡РµРЅРёСЏ (РґР»СЏ Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ)', 'BY', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (51, '01301', '1', 'Р Р°Р·СЂРµС€РµРЅРёРµ, РІС‹РґР°РЅРЅРѕРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Рј РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РІ РѕС‚РЅРѕС€РµРЅРёРё СѓСЃР»РѕРІРЅРѕ РїР°С‚РѕРіРµРЅРЅС‹С… Рё РїР°С‚РѕРіРµРЅРЅС‹С… РіРµРЅРЅРѕ-РёРЅР¶РµРЅРµСЂРЅС‹С… РѕСЂРіР°РЅРёР·РјРѕРІ (РґР»СЏ Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ)', 'BY', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (52, '01311', '1', 'Р—Р°РєР»СЋС‡РµРЅРёРµ (СЂР°Р·СЂРµС€РёС‚РµР»СЊРЅС‹Р№ РґРѕРєСѓРјРµРЅС‚) РЅР° РІС‹РІРѕР· РјРёРЅРµСЂР°Р»СЊРЅРѕРіРѕ СЃС‹СЂСЊСЏ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (53, '01321', '1', 'Р—Р°РєР»СЋС‡РµРЅРёРµ (СЂР°Р·СЂРµС€РёС‚РµР»СЊРЅС‹Р№ РґРѕРєСѓРјРµРЅС‚) РЅР° РІРІРѕР· Рё (РёР»Рё) РІС‹РІРѕР· РѕРїР°СЃРЅС‹С… РѕС‚С…РѕРґРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (54, '01332', '1', 'Р Р°Р·СЂРµС€РµРЅРёРµ РєРѕРјРїРµС‚РµРЅС‚РЅРѕРіРѕ РѕСЂРіР°РЅР° РіРѕСЃСѓРґР°СЂСЃС‚РІР°-СЌРєСЃРїРѕСЂС‚РµСЂР° РЅР° РІС‹РІРѕР· РєРѕРЅРєСЂРµС‚РЅРѕР№ РїР°СЂС‚РёРё РЅР°СЂРєРѕС‚РёС‡РµСЃРєРёС… СЃСЂРµРґСЃС‚РІ, РїСЃРёС…РѕС‚СЂРѕРїРЅС‹С… РІРµС‰РµСЃС‚РІ Рё РёС… РїСЂРµРєСѓСЂСЃРѕСЂРѕРІ Р»РёР±Рѕ РѕС„РёС†РёР°Р»СЊРЅРѕРµ СѓРІРµРґРѕРјР»РµРЅРёРµ СЌС‚РѕРіРѕ РѕСЂРіР°РЅР° Рѕ С‚РѕРј, С‡С‚Рѕ СѓРєР°Р·Р°РЅРЅРѕРµ СЂР°Р·СЂРµС€РµРЅРёРµ РЅРµ С‚СЂРµР±СѓРµС‚СЃСЏ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (55, '01341', '1', 'Р—Р°РєР»СЋС‡РµРЅРёРµ (СЂР°Р·СЂРµС€РёС‚РµР»СЊРЅС‹Р№ РґРѕРєСѓРјРµРЅС‚) РЅР° РІРІРѕР· Рё (РёР»Рё) РІС‹РІРѕР· РѕР·РѕРЅРѕСЂР°Р·СЂСѓС€Р°СЋС‰РёС… РІРµС‰РµСЃС‚РІ Рё РїСЂРѕРґСѓРєС†РёРё, СЃРѕРґРµСЂР¶Р°С‰РµР№ РѕР·РѕРЅРѕСЂР°Р·СЂСѓС€Р°СЋС‰РёРµ РІРµС‰РµСЃС‚РІР°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (56, '01999', '1', 'Р�РЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёРµ СЃРѕР±Р»СЋРґРµРЅРёРµ Р·Р°РїСЂРµС‚РѕРІ Рё РѕРіСЂР°РЅРёС‡РµРЅРёР№', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (57, '02011', '2', 'РљРѕРЅРѕСЃР°РјРµРЅС‚', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (58, '02012', '2', 'РўСЂР°РЅСЃРїРѕСЂС‚РЅР°СЏ РЅР°РєР»Р°РґРЅР°СЏ РїСЂРё РїРµСЂРµРІРѕР·РєРµ С‚РѕРІР°СЂРѕРІ РІРѕРґРЅС‹Рј С‚СЂР°РЅСЃРїРѕСЂС‚РѕРј', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (59, '02013', '2', 'Р–РµР»РµР·РЅРѕРґРѕСЂРѕР¶РЅР°СЏ РЅР°РєР»Р°РґРЅР°СЏ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (60, '02024', '2', 'РљРЅРёР¶РєР° РњР”Рџ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (61, '02025', '2', 'РљР°СЂРЅРµС‚ РђРўРђ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (62, '02022', '2', 'Р‘Р°РіР°Р¶РЅР°СЏ РєРІРёС‚Р°РЅС†РёСЏ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (63, '02014', '2', 'Р�РЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ РїСЂР°РІРёР»Р°РјРё РїРµСЂРµРІРѕР·РєРё РїРѕ Р¶РµР»РµР·РЅРѕР№ РґРѕСЂРѕРіРµ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (64, '02015', '2', 'РўСЂР°РЅСЃРїРѕСЂС‚РЅР°СЏ РЅР°РєР»Р°РґРЅР°СЏ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅР°СЏ РљРѕРЅРІРµРЅС†РёРµР№ Рѕ РґРѕРіРѕРІРѕСЂРµ РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕР№ РґРѕСЂРѕР¶РЅРѕР№ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ 1956 РіРѕРґР°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (65, '02016', '2', 'Р�РЅР°СЏ С‚СЂР°РЅСЃРїРѕСЂС‚РЅР°СЏ РЅР°РєР»Р°РґРЅР°СЏ, РёСЃРїРѕР»СЊР·СѓРµРјР°СЏ РїСЂРё РїРµСЂРµРІРѕР·РєРµ С‚РѕРІР°СЂРѕРІ Р°РІС‚РѕРґРѕСЂРѕР¶РЅС‹Рј С‚СЂР°РЅСЃРїРѕСЂС‚РѕРј', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (66, '02017', '2', 'РђРІРёР°РЅР°РєР»Р°РґРЅР°СЏ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (67, '02018', '2', 'РўСЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РїСЂРё РїРµСЂРµРјРµС‰РµРЅРёРё С‚РѕРІР°СЂРѕРІ С‚СЂСѓР±РѕРїСЂРѕРІРѕРґРЅС‹Рј С‚СЂР°РЅСЃРїРѕСЂС‚РѕРј РёР»Рё РїРѕ Р»РёРЅРёСЏРј СЌР»РµРєС‚СЂРѕРїРµСЂРµРґР°С‡Рё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (68, '02019', '2', 'РџРѕС‡С‚РѕРІР°СЏ РЅР°РєР»Р°РґРЅР°СЏ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (69, '02020', '2', 'РћР±С‰Р°СЏ РЅР°РєР»Р°РґРЅР°СЏ РїСЂРё СЌРєСЃРїСЂРµСЃСЃ-РґРѕСЃС‚Р°РІРєРµ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (70, '02021', '2', 'Р�РЅРґРёРІРёРґСѓР°Р»СЊРЅР°СЏ РЅР°РєР»Р°РґРЅР°СЏ РїСЂРё СЌРєСЃРїСЂРµСЃСЃ-РґРѕСЃС‚Р°РІРєРµ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (71, '02026', '2', 'РЈРїР°РєРѕРІРѕС‡РЅС‹Р№ Р»РёСЃС‚', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (72, '02099', '2', 'Р�РЅС‹Рµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ (РїРµСЂРµРІРѕР·РѕС‡РЅС‹Рµ) РґРѕРєСѓРјРµРЅС‚С‹', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (73, '03011', '3', 'Р”РѕРіРѕРІРѕСЂ (РєРѕРЅС‚СЂР°РєС‚), Р·Р°РєР»СЋС‡РµРЅРЅС‹Р№ РїСЂРё СЃРѕРІРµСЂС€РµРЅРёРё РІРЅРµС€РЅРµСЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ СЃРґРµР»РєРё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (74, '03012', '3', 'Р”РѕРєСѓРјРµРЅС‚С‹, РІРЅРѕСЃСЏС‰РёРµ РёР·РјРµРЅРµРЅРёСЏ Рё (РёР»Рё) РґРѕРїРѕР»РЅРµРЅРёСЏ Рє РґРѕРєСѓРјРµРЅС‚Сѓ, СЃРІРµРґРµРЅРёСЏ Рѕ РєРѕС‚РѕСЂРѕРј СѓРєР°Р·Р°РЅС‹ РїРѕРґ РєРѕРґРѕРј 03011', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (75, '03013', '3', 'Р”РѕРєСѓРјРµРЅС‚, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёР№ СЃРѕРІРµСЂС€РµРЅРёРµ РѕРґРЅРѕСЃС‚РѕСЂРѕРЅРЅРµР№ РІРЅРµС€РЅРµСЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ СЃРґРµР»РєРё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (76, '03014', '3', 'Р”РѕРєСѓРјРµРЅС‚С‹, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёРµ РїСЂР°РІРѕ РІР»Р°РґРµРЅРёСЏ, РїРѕР»СЊР·РѕРІР°РЅРёСЏ Рё (РёР»Рё) СЂР°СЃРїРѕСЂСЏР¶РµРЅРёСЏ С‚РѕРІР°СЂР°РјРё РїСЂРё РѕС‚СЃСѓС‚СЃС‚РІРёРё РєР°РєРѕР№-Р»РёР±Рѕ СЃРґРµР»РєРё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (77, '03021', '3', 'Р”РѕРєСѓРјРµРЅС‚С‹, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёРµ РїРµСЂРµРґР°С‡Сѓ РїСЂР°РІ РЅР° РѕР±СЉРµРєС‚С‹ РёРЅС‚РµР»Р»РµРєС‚СѓР°Р»СЊРЅРѕР№ СЃРѕР±СЃС‚РІРµРЅРЅРѕСЃС‚Рё (Р°РІС‚РѕСЂСЃРєРёР№, Р»РёС†РµРЅР·РёРѕРЅРЅС‹Р№ РґРѕРіРѕРІРѕСЂ, СЃРІРёРґРµС‚РµР»СЊСЃС‚РІРѕ Рѕ СЂРµРіРёСЃС‚СЂР°С†РёРё РѕР±СЉРµРєС‚Р° РёРЅС‚РµР»Р»РµРєС‚СѓР°Р»СЊРЅРѕР№ СЃРѕР±СЃС‚РІРµРЅРЅРѕСЃС‚Рё, РґРѕРіРѕРІРѕСЂ РЅР° РёСЃРїРѕР»СЊР·РѕРІР°РЅРёРµ С‚РѕРІР°СЂРЅРѕРіРѕ Р·РЅР°РєР° Рё С‚РѕРјСѓ РїРѕРґРѕР±РЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (78, '03022', '3', 'Р”РѕРєСѓРјРµРЅС‚С‹, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёРµ РІРІРµРґРµРЅРёРµ РІ РіСЂР°Р¶РґР°РЅСЃРєРёР№ РѕР±РѕСЂРѕС‚ РЅР° С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° С‚РѕРІР°СЂРѕРІ, РѕР±РѕР·РЅР°С‡РµРЅРЅС‹С… С‚РѕРІР°СЂРЅС‹Рј Р·РЅР°РєРѕРј, СЃ СЃРѕРіР»Р°СЃРёСЏ РїСЂР°РІРѕРѕР±Р»Р°РґР°С‚РµР»СЏ (РґРёР»РµСЂСЃРєРёР№, РґРёСЃС‚СЂРёР±СЊСЋС‚РµСЂСЃРєРёР№ РґРѕРіРѕРІРѕСЂ, РїРёСЃСЊРјРµРЅРЅРѕРµ СЃРѕРіР»Р°СЃРёРµ Рё С‚РѕРјСѓ РїРѕРґРѕР±РЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (79, '08036', '8', 'Р”РѕРіРѕРІРѕСЂ РѕР± РѕРєР°Р·Р°РЅРёРё СѓСЃР»СѓРі РїРѕ СЃРєР»Р°РґРёСЂРѕРІР°РЅРёСЋ (С…СЂР°РЅРµРЅРёСЋ), РїРѕРіСЂСѓР·РєРµ (СЂР°Р·РіСЂСѓР·РєРµ) С‚РѕРІР°СЂРѕРІ Рё РёРЅС‹Рј РіСЂСѓР·РѕРІС‹Рј РѕРїРµСЂР°С†РёСЏРј, СЃРІСЏР·Р°РЅРЅС‹Рј СЃ С…СЂР°РЅРµРЅРёРµРј Рё РїРѕРґРіРѕС‚РѕРІРєРѕР№ С‚РѕРІР°СЂРѕРІ Рє С‚СЂР°РЅСЃРїРѕСЂС‚РёСЂРѕРІРєРµ, Р·Р°РєР»СЋС‡РµРЅРЅС‹Р№ РјРµР¶РґСѓ РІР»Р°РґРµР»СЊС†РµРј РґРµРєР»Р°СЂРёСЂСѓРµРјРѕРіРѕ С‚РѕРІР°СЂР° Рё СЂРµР·РёРґРµРЅС‚РѕРј РїРѕСЂС‚РѕРІРѕР№ РёР»Рё Р»РѕРіРёСЃС‚РёС‡РµСЃРєРѕР№ СЃРІРѕР±РѕРґРЅРѕР№ (СЃРїРµС†РёР°Р»СЊРЅРѕР№, РѕСЃРѕР±РѕР№) СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ Р·РѕРЅС‹', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (80, '08999', '8', 'Р�РЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹ РѕР± РѕР±СЏР·Р°С‚РµР»СЊСЃС‚РІР°С…, РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРµ РєРѕС‚РѕСЂС‹С… РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРѕ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ СѓСЃР»РѕРІРёСЏРјРё С‚Р°РјРѕР¶РµРЅРЅС‹С… РїСЂРѕС†РµРґСѓСЂ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (81, '09001', '9', 'РњРµР¶РґСѓРЅР°СЂРѕРґРЅС‹Р№ РІРµСЃРѕРІРѕР№ СЃРµСЂС‚РёС„РёРєР°С‚ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°, РІС‹РґР°РІР°РµРјС‹Р№ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РњРµР¶РґСѓРЅР°СЂРѕРґРЅРѕР№ РєРѕРЅРІРµРЅС†РёРµР№ Рѕ СЃРѕРіР»Р°СЃРѕРІР°РЅРёРё СѓСЃР»РѕРІРёР№ РїСЂРѕРІРµРґРµРЅРёСЏ РєРѕРЅС‚СЂРѕР»СЏ РіСЂСѓР·РѕРІ РЅР° РіСЂР°РЅРёС†Р°С…, РїСЂРёРЅСЏС‚РѕР№ РІ Рі. Р–РµРЅРµРІРµ 21 РѕРєС‚СЏР±СЂСЏ 1982 РіРѕРґР°, РёР»Рё РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹Р№ СЃРµСЂС‚РёС„РёРєР°С‚ РІР·РІРµС€РёРІР°РЅРёСЏ РіСЂСѓР·РѕРІС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ, РІС‹РґР°РІР°РµРјС‹Р№ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РЎРѕРіР»Р°С€РµРЅРёРµРј Рѕ РІРІРµРґРµРЅРёРё РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕРіРѕ СЃРµСЂС‚РёС„РёРєР°С‚Р° РІР·РІРµС€РёРІР°РЅРёСЏ РіСЂСѓР·РѕРІС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЏС… РіРѕСЃСѓРґР°СЂСЃС‚РІ-СѓС‡Р°СЃС‚РЅРёРєРѕРІ РЎРѕРґСЂСѓР¶РµСЃС‚РІР° РќРµР·Р°РІРёСЃРёРјС‹С… Р“РѕСЃСѓРґР°СЂСЃС‚РІ, РїСЂРёРЅСЏС‚С‹Рј РІ Рі. Р§РѕР»РїРѕРЅ-РђС‚Рµ 16 Р°РїСЂРµР»СЏ 2004 РіРѕРґР°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (82, '09002', '9', 'Р Р°Р·СЂРµС€РµРЅРёРµ РЅР° РїСЂРѕРµР·Рґ Р°РІС‚РѕРјРѕР±РёР»СЊРЅРѕРіРѕ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° РёРЅРѕСЃС‚СЂР°РЅРЅРѕРіРѕ РіРѕСЃСѓРґР°СЂСЃС‚РІР° РїРѕ С‚РµСЂСЂРёС‚РѕСЂРёРё РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІС‹РґР°РЅРЅРѕРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РїРѕ С‚РµСЂСЂРёС‚РѕСЂРёРё РєРѕС‚РѕСЂРѕРіРѕ Р±СѓРґРµС‚ РѕСЃСѓС‰РµСЃС‚РІР»СЏС‚СЊСЃСЏ РїСЂРѕРµР·Рґ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (83, '09003', '9', 'Р Р°Р·СЂРµС€РµРЅРёРµ РЅР° РїСЂРѕРµР·Рґ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°, РјР°РєСЃРёРјР°Р»СЊРЅС‹Рµ РІРµСЃРѕРІС‹Рµ Рё (РёР»Рё) РіР°Р±Р°СЂРёС‚РЅС‹Рµ СЂР°Р·РјРµСЂС‹ РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРІС‹С€Р°СЋС‚ РґРѕРїСѓСЃС‚РёРјС‹Рµ РїР°СЂР°РјРµС‚СЂС‹, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅС‹Рµ РґР»СЏ РїСЂРѕРµР·РґР° РїРѕ Р°РІС‚РѕРјРѕР±РёР»СЊРЅС‹Рј РґРѕСЂРѕРіР°Рј РѕР±С‰РµРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ (СЃРїРµС†РёР°Р»СЊРЅРѕРµ СЂР°Р·СЂРµС€РµРЅРёРµ), РІС‹РґР°РЅРЅРѕРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РїРѕ С‚РµСЂСЂРёС‚РѕСЂРёРё РєРѕС‚РѕСЂРѕРіРѕ Р±СѓРґРµС‚ РѕСЃСѓС‰РµСЃС‚РІР»СЏС‚СЊСЃСЏ РїСЂРѕРµР·Рґ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (84, '09004', '9', 'РњРЅРѕРіРѕСЃС‚РѕСЂРѕРЅРЅРµРµ СЂР°Р·СЂРµС€РµРЅРёРµ РЅР° РїСЂРѕРµР·Рґ Р°РІС‚РѕРјРѕР±РёР»СЊРЅРѕРіРѕ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° РёРЅРѕСЃС‚СЂР°РЅРЅРѕРіРѕ РіРѕСЃСѓРґР°СЂСЃС‚РІР° РїРѕ С‚РµСЂСЂРёС‚РѕСЂРёРё РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІС‹РґР°РЅРЅРѕРµ РІ СЂР°РјРєР°С… СЃРёСЃС‚РµРјС‹ СЂР°Р·СЂРµС€РµРЅРёР№ Р•РІСЂРѕРїРµР№СЃРєРѕР№ РєРѕРЅС„РµСЂРµРЅС†РёРё РјРёРЅРёСЃС‚СЂРѕРІ С‚СЂР°РЅСЃРїРѕСЂС‚Р°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (85, '09005', '9', 'Р Р°Р·СЂРµС€РµРЅРёРµ (СЃРїРµС†РёР°Р»СЊРЅРѕРµ СЂР°Р·СЂРµС€РµРЅРёРµ) РЅР° РїСЂРѕРµР·Рґ Р°РІС‚РѕРјРѕР±РёР»СЊРЅРѕРіРѕ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° РёРЅРѕСЃС‚СЂР°РЅРЅРѕРіРѕ РіРѕСЃСѓРґР°СЂСЃС‚РІР° РїРѕ С‚РµСЂСЂРёС‚РѕСЂРёРё РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° СЃ С‚РµСЂСЂРёС‚РѕСЂРёРё РёР»Рё РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ РіРѕСЃСѓРґР°СЂСЃС‚РІР°, РЅРµ СЏРІР»СЏСЋС‰РµРіРѕСЃСЏ С‡Р»РµРЅРѕРј Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° Рё РЅРµ СЏРІР»СЏСЋС‰РµРіРѕСЃСЏ РіРѕСЃСѓРґР°СЂСЃС‚РІРѕРј, РІ РєРѕС‚РѕСЂРѕРј Р·Р°СЂРµРіРёСЃС‚СЂРёСЂРѕРІР°РЅРѕ СЌС‚Рѕ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ, РІС‹РґР°РЅРЅРѕРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РїРѕ С‚РµСЂСЂРёС‚РѕСЂРёРё РєРѕС‚РѕСЂРѕРіРѕ Р±СѓРґРµС‚ РѕСЃСѓС‰РµСЃС‚РІР»СЏС‚СЊСЃСЏ РїСЂРѕРµР·Рґ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (86, '09006', '9', 'Р Р°Р·СЂРµС€РµРЅРёРµ (СЃРїРµС†РёР°Р»СЊРЅРѕРµ СЂР°Р·СЂРµС€РµРЅРёРµ) РЅР° РїСЂРѕРµР·Рґ Р°РІС‚РѕРјРѕР±РёР»СЊРЅРѕРіРѕ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° РёРЅРѕСЃС‚СЂР°РЅРЅРѕРіРѕ РіРѕСЃСѓРґР°СЂСЃС‚РІР° СЃ РѕРїР°СЃРЅС‹Рј РіСЂСѓР·РѕРј РїРѕ С‚РµСЂСЂРёС‚РѕСЂРёРё РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІС‹РґР°РЅРЅРѕРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РїРѕ С‚РµСЂСЂРёС‚РѕСЂРёРё РєРѕС‚РѕСЂРѕРіРѕ Р±СѓРґРµС‚ РѕСЃСѓС‰РµСЃС‚РІР»СЏС‚СЊСЃСЏ РїСЂРѕРµР·Рґ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (87, '09011', '9', 'Р”РѕРєСѓРјРµРЅС‚, СЃРІРёРґРµС‚РµР»СЊСЃС‚РІСѓСЋС‰РёР№ Рѕ РІРєР»СЋС‡РµРЅРёРё Р»РёС†Р° РІ Р РµРµСЃС‚СЂ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹С… СЌРєРѕРЅРѕРјРёС‡РµСЃРєРёС… РѕРїРµСЂР°С‚РѕСЂРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (88, '09013', '9', 'РўСЂР°РЅР·РёС‚РЅР°СЏ РґРµРєР»Р°СЂР°С†РёСЏ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (89, '09015', '9', 'РўР°РјРѕР¶РµРЅРЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹ РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… РіРѕСЃСѓРґР°СЂСЃС‚РІ, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РґР»СЏ С‚Р°РјРѕР¶РµРЅРЅС‹С… С†РµР»РµР№ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё РІ СЂР°РјРєР°С… Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° Рё РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° СЃ С‚СЂРµС‚СЊРµР№ СЃС‚РѕСЂРѕРЅРѕР№', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (90, '09016', '9', 'Р”РѕРєСѓРјРµРЅС‚, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёР№ РїСЂРёРѕР±СЂРµС‚РµРЅРёРµ Р°РєС†РёР·РЅС‹С… (СЃРїРµС†РёР°Р»СЊРЅС‹С…) РјР°СЂРѕРє РґР»СЏ РјР°СЂРєРёСЂРѕРІРєРё РїРѕРґР°РєС†РёР·РЅС‹С… (РјР°СЂРєРёСЂСѓРµРјС‹С…) С‚РѕРІР°СЂРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (91, '09017', '9', 'Р�СЃС‚РѕС‡РЅРёРєРё С†РµРЅРѕРІРѕР№ РёРЅС„РѕСЂРјР°С†РёРё, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РґР»СЏ СЂР°СЃС‡РµС‚Р° СЃРєРѕСЂСЂРµРєС‚РёСЂРѕРІР°РЅРЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ СЃС‚РѕРёРјРѕСЃС‚Рё С‚РѕРІР°СЂРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (92, '09018', '9', 'Р”РµРєР»Р°СЂР°С†РёСЏ С‚Р°РјРѕР¶РµРЅРЅРѕР№ СЃС‚РѕРёРјРѕСЃС‚Рё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (93, '09019', '9', 'Р РµРіРёСЃС‚СЂР°С†РёРѕРЅРЅС‹Р№ РЅРѕРјРµСЂ СѓРІРµРґРѕРјР»РµРЅРёСЏ Рѕ СЂР°Р·РјРµС‰РµРЅРёРё С‚РѕРІР°СЂРѕРІ РІ Р·РѕРЅРµ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РєРѕРЅС‚СЂРѕР»СЏ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (94, '09020', '9', 'Р“СЂР°С„РёС‡РµСЃРєРёРµ РјР°С‚РµСЂРёР°Р»С‹: С„РѕС‚РѕРіСЂР°С„РёРё С‚РѕРІР°СЂРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (95, '09021', '9', 'Р“СЂР°С„РёС‡РµСЃРєРёРµ РјР°С‚РµСЂРёР°Р»С‹: СЃС…РµРјС‹, С‡РµСЂС‚РµР¶Рё, СЂРёСЃСѓРЅРєРё С‚РѕРІР°СЂРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (96, '09022', '9', 'Р“СЂР°С„РёС‡РµСЃРєРёРµ РјР°С‚РµСЂРёР°Р»С‹: С‚РµС…РЅРёС‡РµСЃРєРёРµ Рё С‚РµС…РЅРѕР»РѕРіРёС‡РµСЃРєРёРµ РґРѕРєСѓРјРµРЅС‚С‹, РєР°С‚Р°Р»РѕРіРё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (97, '09023', '9', 'Р�РЅС‹Рµ РіСЂР°С„РёС‡РµСЃРєРёРµ РјР°С‚РµСЂРёР°Р»С‹', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (98, '09024', '9', 'РЎРІРёРґРµС‚РµР»СЊСЃС‚РІРѕ Рѕ РґРѕРїСѓС‰РµРЅРёРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕР№ РїРµСЂРµРІРѕР·РєРё Рє РїРµСЂРµРІРѕР·РєРµ С‚РѕРІР°СЂРѕРІ РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅС‹РјРё РїР»РѕРјР±Р°РјРё Рё РїРµС‡Р°С‚СЏРјРё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (99, '09025', '9', 'РЎРІРµРґРµРЅРёСЏ Рѕ Р·Р°РІРµСЂС€РµРЅРёРё РїСЂРѕС†РµРґСѓСЂС‹ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ С‚СЂР°РЅР·РёС‚Р°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (100, '09026', '9', 'РЎРІРµРґРµРЅРёСЏ Рѕ СЂР°Р·РјРµС‰РµРЅРёРё С‚РѕРІР°СЂРѕРІ РЅР° РІСЂРµРјРµРЅРЅРѕРµ С…СЂР°РЅРµРЅРёРµ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (131, '05012', '5', 'Р РµС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РїРѕ РєР»Р°СЃСЃРёС„РёРєР°С†РёРё С‚РѕРІР°СЂР° РІ РЅРµСЃРѕР±СЂР°РЅРЅРѕРј РёР»Рё СЂР°Р·РѕР±СЂР°РЅРЅРѕРј РІРёРґРµ, РІ С‚РѕРј С‡РёСЃР»Рµ РІ РЅРµРєРѕРјРїР»РµРєС‚РЅРѕРј РёР»Рё РЅРµР·Р°РІРµСЂС€РµРЅРЅРѕРј РІРёРґРµ, РІРІРѕР·РёРјРѕРіРѕ РёР»Рё РІС‹РІРѕР·РёРјРѕРіРѕ РІ С‚РµС‡РµРЅРёРµ СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅРѕРіРѕ РїРµСЂРёРѕРґР° РІСЂРµРјРµРЅРё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (101, '03031', '3', '"Р”РѕРєСѓРјРµРЅС‚, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёР№ СЃРѕР±Р»СЋРґРµРЅРёРµ С‚СЂРµР±РѕРІР°РЅРёР№ РІ РѕР±Р»Р°СЃС‚Рё РІР°Р»СЋС‚РЅРѕРіРѕ РєРѕРЅС‚СЂРѕР»СЏ: - СЂРµРіРёСЃС‚СЂР°С†РёРѕРЅРЅС‹Р№ РЅРѕРјРµСЂ СЃРґРµР»РєРё (РґР»СЏ Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ), - СѓС‡РµС‚РЅС‹Р№ РЅРѕРјРµСЂ РєРѕРЅС‚СЂР°РєС‚Р° (СЂРµРіРёСЃС‚СЂР°С†РёРѕРЅРЅС‹Р№ РЅРѕРјРµСЂ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Р№ РґР»СЏ РѕР±РµСЃРїРµС‡РµРЅРёСЏ СѓС‡РµС‚Р° Рё РѕС‚С‡РµС‚РЅРѕСЃС‚Рё РїРѕ РІР°Р»СЋС‚РЅС‹Рј РѕРїРµСЂР°С†РёСЏРј, РїСЂРёСЃРІР°РёРІР°РµРјС‹Р№ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Рј Р±Р°РЅРєРѕРј РІР°Р»СЋС‚РЅРѕРјСѓ РґРѕРіРѕРІРѕСЂСѓ, РїСЂРµРґСѓСЃРјР°С‚СЂРёРІР°СЋС‰РµРјСѓ СЌРєСЃРїРѕСЂС‚/РёРјРїРѕСЂС‚) Р»РёР±Рѕ РЅРѕРјРµСЂ РїР°СЃРїРѕСЂС‚Р° СЃРґРµР»РєРё (РґР»СЏ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ), - РЅРѕРјРµСЂ РїР°СЃРїРѕСЂС‚Р° СЃРґРµР»РєРё РїРѕ РІРЅРµС€РЅРµС‚РѕСЂРіРѕРІРѕРјСѓ РґРѕРіРѕРІРѕСЂСѓ (РєРѕРЅС‚СЂР°РєС‚Сѓ) (РґР»СЏ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё)"', 'BY', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (102, '03998', '3', 'Р”РѕРєСѓРјРµРЅС‚ (РєРѕРЅС‚СЂР°РєС‚) РЅР° РЅРµРґСЂРѕРїРѕР»СЊР·РѕРІР°РЅРёРµ (РґР»СЏ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ)', 'KZ', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (103, '03999', '3', 'Р�РЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёРµ РїСЂР°РІРѕ РІР»Р°РґРµРЅРёСЏ, РїРѕР»СЊР·РѕРІР°РЅРёСЏ Рё (РёР»Рё) СЂР°СЃРїРѕСЂСЏР¶РµРЅРёСЏ С‚РѕРІР°СЂР°РјРё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (104, '04011', '4', 'РЈС‡СЂРµРґРёС‚РµР»СЊРЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (105, '04021', '4', 'РЎС‡РµС‚-С„Р°РєС‚СѓСЂР° (РёРЅРІРѕР№СЃ) Рє РґРѕРіРѕРІРѕСЂСѓ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (106, '04022', '4', 'Р�РЅС‹Рµ СЂР°СЃС‡РµС‚РЅС‹Рµ РёР»Рё РєРѕРјРјРµСЂС‡РµСЃРєРёРµ РґРѕРєСѓРјРµРЅС‚С‹ (РІ С‚РѕРј С‡РёСЃР»Рµ РєР°СЃСЃРѕРІС‹Р№ РёР»Рё С‚РѕРІР°СЂРЅС‹Р№ С‡РµРє РЅР° РїСЂРёРѕР±СЂРµС‚РµРЅРёРµ С‚РѕРІР°СЂРѕРІ РІ СЂРѕР·РЅРёС‡РЅРѕР№ СЃРµС‚Рё)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (107, '04023', '4', 'Р‘Р°РЅРєРѕРІСЃРєРёРµ РґРѕРєСѓРјРµРЅС‚С‹ (РµСЃР»Рё СЃС‡РµС‚-С„Р°РєС‚СѓСЂР° РѕРїР»Р°С‡РµРЅ РІ Р·Р°РІРёСЃРёРјРѕСЃС‚Рё РѕС‚ СѓСЃР»РѕРІРёР№ РІРЅРµС€РЅРµС‚РѕСЂРіРѕРІРѕРіРѕ РєРѕРЅС‚СЂР°РєС‚Р°), Р° С‚Р°РєР¶Рµ РґСЂСѓРіРёРµ РїР»Р°С‚РµР¶РЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹, РѕС‚СЂР°Р¶Р°СЋС‰РёРµ СЃС‚РѕРёРјРѕСЃС‚СЊ С‚РѕРІР°СЂР°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (108, '4025', '4', 'РЎС‡РµС‚-РїСЂРѕС„РѕСЂРјР° Рє РґРѕРіРѕРІРѕСЂСѓ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (109, '04031', '4', 'РЎС‡РµС‚-С„Р°РєС‚СѓСЂР° (РёРЅРІРѕР№СЃ) Р·Р° РїРµСЂРµРІРѕР·РєСѓ (С‚СЂР°РЅСЃРїРѕСЂС‚РёСЂРѕРІРєСѓ), РїРѕРіСЂСѓР·РєСѓ, СЂР°Р·РіСЂСѓР·РєСѓ РёР»Рё РїРµСЂРµРіСЂСѓР·РєСѓ С‚РѕРІР°СЂРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (110, '04032', '4', 'Р‘Р°РЅРєРѕРІСЃРєРёРµ РёР»Рё РёРЅС‹Рµ РїР»Р°С‚РµР¶РЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹ РїРѕ РѕРїР»Р°С‚Рµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЂР°СЃС…РѕРґРѕРІ, РѕС‚СЂР°Р¶Р°СЋС‰РёРµ СЃС‚РѕРёРјРѕСЃС‚СЊ РїРµСЂРµРІРѕР·РєРё (С‚СЂР°РЅСЃРїРѕСЂС‚РёСЂРѕРІРєРё), РїРѕРіСЂСѓР·РєСѓ, СЂР°Р·РіСЂСѓР·РєСѓ РёР»Рё РїРµСЂРµРіСЂСѓР·РєСѓ С‚РѕРІР°СЂРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (111, '04033', '4', 'Р”РѕРіРѕРІРѕСЂ РїРѕ РїРµСЂРµРІРѕР·РєРµ, РїРѕРіСЂСѓР·РєРµ, СЂР°Р·РіСЂСѓР·РєРµ РёР»Рё РїРµСЂРµРіСЂСѓР·РєРµ С‚РѕРІР°СЂРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (112, '04041', '4', 'РЎС‡РµС‚Р°-С„Р°РєС‚СѓСЂС‹ (РёРЅРІРѕР№СЃС‹) Р·Р° РѕРєР°Р·Р°РЅРёРµ РїРѕСЃСЂРµРґРЅРёС‡РµСЃРєРёС… СѓСЃР»СѓРі', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (113, '04042', '4', 'Р‘Р°РЅРєРѕРІСЃРєРёРµ РёР»Рё РёРЅС‹Рµ РїР»Р°С‚РµР¶РЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹ Р·Р° РѕРєР°Р·Р°РЅРёРµ РїРѕСЃСЂРµРґРЅРёС‡РµСЃРєРёС… СѓСЃР»СѓРі', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (114, '04043', '4', 'Р”РѕРіРѕРІРѕСЂ РѕР± РѕРєР°Р·Р°РЅРёРё РїРѕСЃСЂРµРґРЅРёС‡РµСЃРєРёС… СѓСЃР»СѓРі', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (115, '04051', '4', 'Р”РѕРєСѓРјРµРЅС‚С‹ Рѕ СЃС‚РѕРёРјРѕСЃС‚Рё С‚РѕРІР°СЂРѕРІ Рё СѓСЃР»СѓРі, РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРЅС‹С… РїРѕРєСѓРїР°С‚РµР»РµРј Р±РµСЃРїР»Р°С‚РЅРѕ РёР»Рё РїРѕ СЃРЅРёР¶РµРЅРЅС‹Рј С†РµРЅР°Рј РґР»СЏ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ РІ СЃРІСЏР·Рё СЃ РїСЂРѕРёР·РІРѕРґСЃС‚РІРѕРј Рё РїСЂРѕРґР°Р¶РµР№', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (116, '04061', '4', 'РЎС‡РµС‚-С„Р°РєС‚СѓСЂР° (РёРЅРІРѕР№СЃ), СЃРѕРґРµСЂР¶Р°С‰РёРµ СЃРІРµРґРµРЅРёСЏ Рѕ РїР»Р°С‚РµР¶Р°С… Р·Р° РёСЃРїРѕР»СЊР·РѕРІР°РЅРёРµ РѕР±СЉРµРєС‚РѕРІ РёРЅС‚РµР»Р»РµРєС‚СѓР°Р»СЊРЅРѕР№ СЃРѕР±СЃС‚РІРµРЅРЅРѕСЃС‚Рё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (117, '04062', '4', 'Р‘Р°РЅРєРѕРІСЃРєРёРµ РїР»Р°С‚РµР¶РЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹, Р±СѓС…РіР°Р»С‚РµСЂСЃРєРёРµ Рё РґСЂСѓРіРёРµ РґРѕРєСѓРјРµРЅС‚С‹, СЃРѕРґРµСЂР¶Р°С‰РёРµ СЃРІРµРґРµРЅРёСЏ Рѕ РїР»Р°С‚РµР¶Р°С… Р·Р° РёСЃРїРѕР»СЊР·РѕРІР°РЅРёРµ РѕР±СЉРµРєС‚РѕРІ РёРЅС‚РµР»Р»РµРєС‚СѓР°Р»СЊРЅРѕР№ СЃРѕР±СЃС‚РІРµРЅРЅРѕСЃС‚Рё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (118, '04071', '4', 'Р”РѕРєСѓРјРµРЅС‚С‹ (РІ С‚РѕРј С‡РёСЃР»Рµ Р±СѓС…РіР°Р»С‚РµСЂСЃРєРёРµ) Рё СЃРІРµРґРµРЅРёСЏ, СЃРѕРґРµСЂР¶Р°С‰РёРµ РґР°РЅРЅС‹Рµ Рѕ С‡Р°СЃС‚Рё РґРѕС…РѕРґР° (РІС‹СЂСѓС‡РєРё), РєРѕС‚РѕСЂР°СЏ РїСЂСЏРјРѕ РёР»Рё РєРѕСЃРІРµРЅРЅРѕ РїСЂРёС‡РёС‚Р°РµС‚СЃСЏ РїСЂРѕРґР°РІС†Сѓ РІ СЂРµР·СѓР»СЊС‚Р°С‚Рµ РїРѕСЃР»РµРґСѓСЋС‰РµР№ РїСЂРѕРґР°Р¶Рё, СЂР°СЃРїРѕСЂСЏР¶РµРЅРёСЏ РёРЅС‹Рј СЃРїРѕСЃРѕР±РѕРј РёР»Рё РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ С‚РѕРІР°СЂРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (119, '04081', '4', 'РЎС‡РµС‚-С„Р°РєС‚СѓСЂР° (РёРЅРІРѕР№СЃ), СЃРѕРґРµСЂР¶Р°С‰РёРµ СЃРІРµРґРµРЅРёСЏ Рѕ СЃС‚РѕРёРјРѕСЃС‚Рё СѓРїР°РєРѕРІРѕС‡РЅС‹С… РјР°С‚РµСЂРёР°Р»РѕРІ Рё/РёР»Рё СЂР°Р±РѕС‚ РїРѕ СѓРїР°РєРѕРІРєРµ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (120, '04082', '4', 'Р‘Р°РЅРєРѕРІСЃРєРёРµ РёР»Рё РёРЅС‹Рµ РїР»Р°С‚РµР¶РЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹ Рѕ СЃС‚РѕРёРјРѕСЃС‚Рё СѓРїР°РєРѕРІРѕС‡РЅС‹С… РјР°С‚РµСЂРёР°Р»РѕРІ Рё/РёР»Рё СЂР°Р±РѕС‚ РїРѕ СѓРїР°РєРѕРІРєРµ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (121, '04083', '4', 'Р”РѕРіРѕРІРѕСЂ Рѕ СЃС‚РѕРёРјРѕСЃС‚Рё С‚Р°СЂС‹, СѓРїР°РєРѕРІРєРё, СѓРїР°РєРѕРІРѕС‡РЅС‹С… РјР°С‚РµСЂРёР°Р»РѕРІ Рё СЂР°Р±РѕС‚ РїРѕ СѓРїР°РєРѕРІРєРµ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (122, '04091', '4', 'Р‘СѓС…РіР°Р»С‚РµСЂСЃРєР°СЏ РґРѕРєСѓРјРµРЅС‚Р°С†РёСЏ РїСЂРѕРёР·РІРѕРґРёС‚РµР»СЏ РѕС†РµРЅРёРІР°РµРјС‹С… С‚РѕРІР°СЂРѕРІ, СЃРѕРґРµСЂР¶Р°С‰Р°СЏ СЃРІРµРґРµРЅРёСЏ Рѕ СЂР°СЃС…РѕРґР°С… РїРѕ РёР·РіРѕС‚РѕРІР»РµРЅРёСЋ РёР»Рё РїСЂРёРѕР±СЂРµС‚РµРЅРёСЋ РјР°С‚РµСЂРёР°Р»РѕРІ, Рѕ СЂР°СЃС…РѕРґР°С… РЅР° РїСЂРѕРёР·РІРѕРґСЃС‚РІРѕ, Р° С‚Р°РєР¶Рµ РЅР° РёРЅС‹Рµ РѕРїРµСЂР°С†РёРё, СЃРІСЏР·Р°РЅРЅС‹Рµ СЃ РїСЂРѕРёР·РІРѕРґСЃС‚РІРѕРј РІРІРѕР·РёРјС‹С… (РІРІРµР·РµРЅРЅС‹С…) С‚РѕРІР°СЂРѕРІ, РєРѕРјРјРµСЂС‡РµСЃРєРёРµ СЃС‡РµС‚Р° РїСЂРѕРёР·РІРѕРґРёС‚РµР»СЏ РѕС†РµРЅРёРІР°РµРјС‹С… С‚РѕРІР°СЂРѕРІ, СЃРѕСЃС‚Р°РІР»РµРЅРЅС‹Рµ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РѕР±С‰РµРїСЂРёРЅСЏС‚С‹РјРё РїСЂРёРЅС†РёРїР°РјРё Р±СѓС…РіР°Р»С‚РµСЂСЃРєРѕРіРѕ СѓС‡РµС‚Р°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (123, '04101', '4', 'РЎС‡РµС‚ вЂ“ С„Р°РєС‚СѓСЂР° (РёРЅРІРѕР№СЃ) РЅР° СЃС‚РѕРёРјРѕСЃС‚СЊ РїСЂРѕРµРєС‚РёСЂРѕРІР°РЅРёСЏ, СЂР°Р·СЂР°Р±РѕС‚РєРё, РёРЅР¶РµРЅРµСЂРЅРѕР№, РєРѕРЅСЃС‚СЂСѓРєС‚РѕСЂСЃРєРѕР№ СЂР°Р±РѕС‚С‹, РґРёР·Р°Р№РЅР°, С…СѓРґРѕР¶РµСЃС‚РІРµРЅРЅРѕРіРѕ РѕС„РѕСЂРјР»РµРЅРёСЏ, С‡РµСЂС‚РµР¶РµР№ Рё СЌСЃРєРёР·РѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (124, '04102', '4', 'Р‘Р°РЅРєРѕРІСЃРєРёРµ РёР»Рё РёРЅС‹Рµ РїР»Р°С‚РµР¶РЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹ Рѕ СЃС‚РѕРёРјРѕСЃС‚Рё РїСЂРѕРµРєС‚РёСЂРѕРІР°РЅРёСЏ, СЂР°Р·СЂР°Р±РѕС‚РєРё, РёРЅР¶РµРЅРµСЂРЅРѕР№, РєРѕРЅСЃС‚СЂСѓРєС‚РѕСЂСЃРєРѕР№ СЂР°Р±РѕС‚С‹, РґРёР·Р°Р№РЅР°, С…СѓРґРѕР¶РµСЃС‚РІРµРЅРЅРѕРіРѕ РѕС„РѕСЂРјР»РµРЅРёСЏ, С‡РµСЂС‚РµР¶РµР№ Рё СЌСЃРєРёР·РѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (125, '04111', '4', 'РЎС‡РµС‚ вЂ“ С„Р°РєС‚СѓСЂР° (РёРЅРІРѕР№СЃ) РїРѕ РѕРєР°Р·Р°РЅРёСЋ СЃС‚СЂР°С…РѕРІС‹С… СѓСЃР»СѓРі', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (126, '04112', '4', 'Р‘Р°РЅРєРѕРІСЃРєРёРµ РёР»Рё РёРЅС‹Рµ РїР»Р°С‚РµР¶РЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹ Рѕ СЃС‚РѕРёРјРѕСЃС‚Рё СЃС‚СЂР°С…РѕРІС‹С… СѓСЃР»СѓРі', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (127, '04113', '4', 'РЎС‚СЂР°С…РѕРІРѕР№ РїРѕР»РёСЃ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (128, '04115', '4', 'Р”РѕРіРѕРІРѕСЂ СЃС‚СЂР°С…РѕРІР°РЅРёСЏ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (129, '04121', '4', 'РљРѕС‚РёСЂРѕРІРєРё РјРёСЂРѕРІС‹С… Р±РёСЂР¶', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (130, '04999', '4', 'Р�РЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹ Рё СЃРІРµРґРµРЅРёСЏ, РєРѕС‚РѕСЂС‹Рµ РґРµРєР»Р°СЂР°РЅС‚ РјРѕР¶РµС‚ РїСЂРµРґСЃС‚Р°РІРёС‚СЊ РІ РїРѕРґС‚РІРµСЂР¶РґРµРЅРёРµ Р·Р°СЏРІР»РµРЅРЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ СЃС‚РѕРёРјРѕСЃС‚Рё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (132, '05013', '5', 'РџСЂРµРґРІР°СЂРёС‚РµР»СЊРЅРѕРµ СЂРµС€РµРЅРёРµ РїРѕ РєР»Р°СЃСЃРёС„РёРєР°С†РёРё С‚РѕРІР°СЂР° РїРѕ РўРќ Р’Р­Р” Р•РђР­РЎ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (133, '05014', '5', 'Р РµС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РѕР± РёР·РјРµРЅРµРЅРёРё РїСЂРµРґРІР°СЂРёС‚РµР»СЊРЅРѕРіРѕ СЂРµС€РµРЅРёСЏ РїРѕ РєР»Р°СЃСЃРёС„РёРєР°С†РёРё С‚РѕРІР°СЂР° Рё/РёР»Рё СЂРµС€РµРЅРёСЏ РїРѕ РєР»Р°СЃСЃРёС„РёРєР°С†РёРё С‚РѕРІР°СЂР° РІ РЅРµСЃРѕР±СЂР°РЅРЅРѕРј РёР»Рё СЂР°Р·РѕР±СЂР°РЅРЅРѕРј РІРёРґРµ, РІ С‚РѕРј С‡РёСЃР»Рµ РЅРµРєРѕРјРїР»РµРєС‚РЅРѕРј РёР»Рё РЅРµР·Р°РІРµСЂС€РµРЅРЅРѕРј РІРёРґРµ, РІРІРѕР·РёРјРѕРіРѕ РёР»Рё РІС‹РІРѕР·РёРјРѕРіРѕ РІ С‚РµС‡РµРЅРёРµ СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅРѕРіРѕ РїРµСЂРёРѕРґР° РІСЂРµРјРµРЅРё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (134, '05019', '5', 'РџРѕРґС‚РІРµСЂР¶РґРµРЅРёРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РІ РѕР±Р»Р°СЃС‚Рё С‚СЂР°РЅСЃРїРѕСЂС‚Р° РѕСЂРіР°РЅР° РёСЃРїРѕР»РЅРёС‚РµР»СЊРЅРѕР№ РІР»Р°СЃС‚Рё РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° С†РµР»РµРІРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ РІРІРѕР·РёРјРѕРіРѕ С‚РѕРІР°СЂР° РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РїСЂРёРјРµС‡Р°РЅРёРµРј 3 Рє РўРќ Р’Р­Р” Р•РђР­РЎ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (135, '10020', '10', 'РџРѕСЃР»РµРґРЅРёР№ РґРµРЅСЊ СЃСЂРѕРєР° РїРѕР»РЅРѕРіРѕ СѓСЃР»РѕРІРЅРѕРіРѕ РѕСЃРІРѕР±РѕР¶РґРµРЅРёСЏ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ С‚РѕРІР°СЂРѕРІ, РїРѕРјРµС‰РµРЅРЅС‹С… (РїРѕРјРµС‰Р°РµРјС‹С…) РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° (РґРѕРїСѓСЃРєР°)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (136, '05020', '5', 'РџРѕРґС‚РІРµСЂР¶РґРµРЅРёРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РёСЃРїРѕР»РЅРёС‚РµР»СЊРЅРѕР№ РІР»Р°СЃС‚Рё, РѕСЃСѓС‰РµСЃС‚РІР»СЏСЋС‰РµРіРѕ С„СѓРЅРєС†РёРё РїРѕ РІС‹СЂР°Р±РѕС‚РєРµ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕР№ РїРѕР»РёС‚РёРєРё Рё РЅРѕСЂРјР°С‚РёРІРЅРѕ-РїСЂР°РІРѕРІРѕРјСѓ СЂРµРіСѓР»РёСЂРѕРІР°РЅРёСЋ РІ СЃС„РµСЂРµ Р·РґСЂР°РІРѕРѕС…СЂР°РЅРµРЅРёСЏ, РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° С†РµР»РµРІРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ РІРІРѕР·РёРјРѕРіРѕ С‚РѕРІР°СЂР° РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РїСЂРёРјРµС‡Р°РЅРёРµРј 4 Рє РўРќ Р’Р­Р” Р•РђР­РЎ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (137, '05022', '5', 'РџРѕРґС‚РІРµСЂР¶РґРµРЅРёРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РёСЃРїРѕР»РЅРёС‚РµР»СЊРЅРѕР№ РІР»Р°СЃС‚Рё, РѕСЃСѓС‰РµСЃС‚РІР»СЏСЋС‰РµРіРѕ С„СѓРЅРєС†РёРё РїРѕ РІС‹СЂР°Р±РѕС‚РєРµ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕР№ РїРѕР»РёС‚РёРєРё Рё РЅРѕСЂРјР°С‚РёРІРЅРѕ-РїСЂР°РІРѕРІРѕРјСѓ СЂРµРіСѓР»РёСЂРѕРІР°РЅРёСЋ РІ СЃС„РµСЂРµ РїСЂРѕРјС‹С€Р»РµРЅРЅРѕСЃС‚Рё, РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° С†РµР»РµРІРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ РІРІРѕР·РёРјРѕРіРѕ С‚РѕРІР°СЂР° РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РїСЂРёРјРµС‡Р°РЅРёРµРј 5 Рє РўРќ Р’Р­Р” Р•РђР­РЎ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (138, '05023', '5', 'Р”РѕРєСѓРјРµРЅС‚С‹ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РёСЃРїРѕР»РЅРёС‚РµР»СЊРЅРѕР№ РІР»Р°СЃС‚Рё РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РЅРµРѕР±С…РѕРґРёРјС‹Рµ РґР»СЏ РїРѕРґС‚РІРµСЂР¶РґРµРЅРёСЏ РєР»Р°СЃСЃРёС„РёРєР°С†РёРѕРЅРЅРѕРіРѕ РєРѕРґР° С‚РѕРІР°СЂР° РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РїСЂРёРјРµС‡Р°РЅРёСЏРјРё Рє РўРќ Р’Р­Р” Р•РђР­РЎ, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РґРѕРєСѓРјРµРЅС‚РѕРІ, СѓРєР°Р·Р°РЅРЅС‹С… РІ РїРѕР·РёС†РёСЏС… СЃ РєРѕРґР°РјРё 05019, 05020, 05022, 05024 вЂ“ 05028', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (139, '05024', '5', 'РџРѕРґС‚РІРµСЂР¶РґРµРЅРёРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РёСЃРїРѕР»РЅРёС‚РµР»СЊРЅРѕР№ РІР»Р°СЃС‚Рё, РѕСЃСѓС‰РµСЃС‚РІР»СЏСЋС‰РµРіРѕ С„СѓРЅРєС†РёРё РїРѕ РєРѕРЅС‚СЂРѕР»СЋ Рё РЅР°РґР·РѕСЂСѓ РІ СЃС„РµСЂРµ РІРµС‚РµСЂРёРЅР°СЂРёРё, РєР°СЂР°РЅС‚РёРЅР° Рё Р·Р°С‰РёС‚С‹ СЂР°СЃС‚РµРЅРёР№, РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° С†РµР»РµРІРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ РІРІРѕР·РёРјРѕРіРѕ С‚РѕРІР°СЂР° РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РїСЂРёРјРµС‡Р°РЅРёРµРј 6 Рє РўРќ Р’Р­Р” Р•РђР­РЎ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (140, '05025', '5', 'РџРѕРґС‚РІРµСЂР¶РґРµРЅРёРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РёСЃРїРѕР»РЅРёС‚РµР»СЊРЅРѕР№ РІР»Р°СЃС‚Рё, РѕСЃСѓС‰РµСЃС‚РІР»СЏСЋС‰РµРіРѕ С„СѓРЅРєС†РёРё РїРѕ РІС‹СЂР°Р±РѕС‚РєРµ Рё СЂРµР°Р»РёР·Р°С†РёРё РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕР№ РїРѕР»РёС‚РёРєРё Рё РЅРѕСЂРјР°С‚РёРІРЅРѕ-РїСЂР°РІРѕРІРѕРјСѓ СЂРµРіСѓР»РёСЂРѕРІР°РЅРёСЋ РІ СЃС„РµСЂРµ С‚РѕРїР»РёРІРЅРѕ-СЌРЅРµСЂРіРµС‚РёС‡РµСЃРєРѕРіРѕ РєРѕРјРїР»РµРєСЃР° РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, СЃРѕРІРјРµСЃС‚РЅРѕ СЃ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј РёСЃРїРѕР»РЅРёС‚РµР»СЊРЅРѕР№ РІР»Р°СЃС‚Рё, РѕСЃСѓС‰РµСЃС‚РІР»СЏСЋС‰РёРј С„СѓРЅРєС†РёРё РїРѕ РѕРєР°Р·Р°РЅРёСЋ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹С… СѓСЃР»СѓРі Рё СѓРїСЂР°РІР»РµРЅРёСЋ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рј РёРјСѓС‰РµСЃС‚РІРѕРј РІ СЃС„РµСЂРµ РЅРµРґСЂРѕРїРѕР»СЊР·РѕРІР°РЅРёСЏ РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, С„Р°РєС‚Р° РґРѕР±С‹С‡Рё РЅРµС„С‚Рё СЃС‹СЂРѕР№ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РїСЂРёРјРµС‡Р°РЅРёСЏРјРё 8 Рё 10 Рє РўРќ Р’Р­Р” Р•РђР­РЎ, С„Р°РєС‚Р° РІС‹СЂР°Р±РѕС‚РєРё СЃС‚Р°Р±РёР»СЊРЅРѕРіРѕ РіР°Р·РѕРІРѕРіРѕ РєРѕРЅРґРµРЅСЃР°С‚Р° РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РїСЂРёРјРµС‡Р°РЅРёРµРј 9 Рє РўРќ Р’Р­Р” Р•РђР­РЎ, РІС‹РїРёСЃРєР° РёР· РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕРіРѕ Р±Р°Р»Р°РЅСЃР° Р·Р°РїР°СЃРѕРІ РїРѕР»РµР·РЅС‹С… РёСЃРєРѕРїР°РµРјС‹С… РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РїСЂРёРјРµС‡Р°РЅРёРµРј 10 Рє РўРќ Р’Р­Р” Р•РђР­РЎ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (141, '05026', '5', 'РџРѕРґС‚РІРµСЂР¶РґРµРЅРёРµ РѕСЂРіР°РЅР° РёСЃРїРѕР»РЅРёС‚РµР»СЊРЅРѕР№ РІР»Р°СЃС‚Рё, СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РїСЂР°РІРёС‚РµР»СЊСЃС‚РІРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, С‚РѕРіРѕ, С‡С‚Рѕ РІРІРѕР·РёРјС‹Р№ С‚РѕРІР°СЂ РѕС‚РЅРѕСЃРёС‚СЃСЏ Рє РІС‹СЃРѕРєРѕРєР°С‡РµСЃС‚РІРµРЅРЅРѕР№ РіРѕРІСЏРґРёРЅРµ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РїСЂРёРјРµС‡Р°РЅРёРµРј 12 Рє РўРќ Р’Р­Р” Р•РђР­РЎ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (142, '05027', '5', 'РџРѕРґС‚РІРµСЂР¶РґРµРЅРёРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РёСЃРїРѕР»РЅРёС‚РµР»СЊРЅРѕР№ РІР»Р°СЃС‚Рё, РѕСЃСѓС‰РµСЃС‚РІР»СЏСЋС‰РµРіРѕ С„СѓРЅРєС†РёРё РїРѕ РІС‹СЂР°Р±РѕС‚РєРµ Рё СЂРµР°Р»РёР·Р°С†РёРё РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕР№ РїРѕР»РёС‚РёРєРё Рё РЅРѕСЂРјР°С‚РёРІРЅРѕ-РїСЂР°РІРѕРІРѕРјСѓ СЂРµРіСѓР»РёСЂРѕРІР°РЅРёСЋ РІ СЃС„РµСЂРµ РѕР±РѕСЂРѕРЅС‹ РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, С†РµР»РµРІРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ РІРІРѕР·РёРјРѕРіРѕ С‚РѕРІР°СЂР° РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РїСЂРёРјРµС‡Р°РЅРёРµРј 14 Рє РўРќ Р’Р­Р” Р•РђР­РЎ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (143, '05028', '5', 'РџРѕРґС‚РІРµСЂР¶РґРµРЅРёРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РёСЃРїРѕР»РЅРёС‚РµР»СЊРЅРѕР№ РІР»Р°СЃС‚Рё, РѕСЃСѓС‰РµСЃС‚РІР»СЏСЋС‰РµРіРѕ С„СѓРЅРєС†РёРё РїРѕ РѕР±РµСЃРїРµС‡РµРЅРёСЋ СЂРµР°Р»РёР·Р°С†РёРё РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕР№ РїРѕР»РёС‚РёРєРё Рё РЅРѕСЂРјР°С‚РёРІРЅРѕ-РїСЂР°РІРѕРІРѕРјСѓ СЂРµРіСѓР»РёСЂРѕРІР°РЅРёСЋ РІ СЃС„РµСЂРµ РєРѕСЃРјРёС‡РµСЃРєРѕР№ РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё, РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, С†РµР»РµРІРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ РІРІРѕР·РёРјРѕРіРѕ С‚РѕРІР°СЂР° РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РїСЂРёРјРµС‡Р°РЅРёРµРј 13 Рє РўРќ Р’Р­Р” Р•РђР­РЎ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (144, '05031', '5', 'РЈРІРµРґРѕРјР»РµРЅРёРµ Рѕ РїР»Р°РЅРёСЂСѓРµРјС‹С… РїРѕСЃС‚Р°РІРєР°С… (СЂР°Р·СЂРµС€РµРЅРёРµ РЅР° РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРµ) С‚РѕРІР°СЂР° РІ РЅРµСЃРѕР±СЂР°РЅРЅРѕРј РёР»Рё СЂР°Р·РѕР±СЂР°РЅРЅРѕРј РІРёРґРµ, РІ С‚РѕРј С‡РёСЃР»Рµ РЅРµРєРѕРјРїР»РµРєС‚РЅРѕРј РёР»Рё РЅРµР·Р°РІРµСЂС€РµРЅРЅРѕРј РІРёРґРµ, РїРѕСЃС‚Р°РІРєР° РєРѕРјРїРѕРЅРµРЅС‚РѕРІ РєРѕС‚РѕСЂРѕРіРѕ РѕСЃСѓС‰РµСЃС‚РІР»СЏРµС‚СЃСЏ (РїСЂРµРґРїРѕР»Р°РіР°РµС‚СЃСЏ) СЂР°Р·Р»РёС‡РЅС‹РјРё С‚РѕРІР°СЂРЅС‹РјРё РїР°СЂС‚РёСЏРјРё РІ С‚РµС‡РµРЅРёРµ РѕРїСЂРµРґРµР»РµРЅРЅРѕРіРѕ РїРµСЂРёРѕРґР° РІСЂРµРјРµРЅРё, СЃ СѓРєР°Р·Р°РЅРёРµРј РµРґРёРЅРѕРіРѕ РєРѕРґР° РїРѕ РўРќ Р’Р­Р” Р•РђР­РЎ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (145, '05996', '5', 'РЎРѕРіР»Р°С€РµРЅРёРµ, Р·Р°РєР»СЋС‡РµРЅРЅРѕРµ РњРёРЅРёСЃС‚РµСЂСЃС‚РІРѕРј СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЂР°Р·РІРёС‚РёСЏ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё СЂРѕСЃСЃРёР№СЃРєРёРј СЋСЂРёРґРёС‡РµСЃРєРёРј Р»РёС†РѕРј, Рѕ РІРІРѕР·Рµ С‚РѕРІР°СЂРѕРІ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РїСЂРѕРјС‹С€Р»РµРЅРЅРѕР№ СЃР±РѕСЂРєРё РјРѕС‚РѕСЂРЅС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ С‚РѕРІР°СЂРЅС‹С… РїРѕР·РёС†РёР№ 8701В вЂ“В 8705 РўРќ Р’Р­Р” Р•РђР­РЎ, РёС… СѓР·Р»РѕРІ Рё Р°РіСЂРµРіР°С‚РѕРІ (РґР»СЏ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё)', 'RU', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (146, '05997', '5', 'Р”РѕРїРѕР»РЅРёС‚РµР»СЊРЅРѕРµ СЃРѕРіР»Р°С€РµРЅРёРµ Рє СЃРѕРіР»Р°С€РµРЅРёСЋ, Р·Р°РєР»СЋС‡РµРЅРЅРѕРјСѓ РњРёРЅРёСЃС‚РµСЂСЃС‚РІРѕРј СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЂР°Р·РІРёС‚РёСЏ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё СЂРѕСЃСЃРёР№СЃРєРёРј СЋСЂРёРґРёС‡РµСЃРєРёРј Р»РёС†РѕРј, Рѕ РІРІРѕР·Рµ С‚РѕРІР°СЂРѕРІ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РїСЂРѕРјС‹С€Р»РµРЅРЅРѕР№ СЃР±РѕСЂРєРё РјРѕС‚РѕСЂРЅС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ С‚РѕРІР°СЂРЅС‹С… РїРѕР·РёС†РёР№ 8701 вЂ“ 8705 РўРќ Р’Р­Р” Р•РђР­РЎ, РёС… СѓР·Р»РѕРІ Рё Р°РіСЂРµРіР°С‚РѕРІ (РґР»СЏ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё)', 'RU', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (147, '05998', '5', 'РџСЂРѕС‚РѕРєРѕР» Рѕ РІРЅРµСЃРµРЅРёРё РёР·РјРµРЅРµРЅРёР№ РІ СЃРѕРіР»Р°С€РµРЅРёРµ, Р·Р°РєР»СЋС‡РµРЅРЅРѕРµ РњРёРЅРёСЃС‚РµСЂСЃС‚РІРѕРј СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЂР°Р·РІРёС‚РёСЏ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё Рё СЂРѕСЃСЃРёР№СЃРєРёРј СЋСЂРёРґРёС‡РµСЃРєРёРј Р»РёС†РѕРј, Рѕ РІРІРѕР·Рµ С‚РѕРІР°СЂРѕРІ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РїСЂРѕРјС‹С€Р»РµРЅРЅРѕР№ СЃР±РѕСЂРєРё РјРѕС‚РѕСЂРЅС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ С‚РѕРІР°СЂРЅС‹С… РїРѕР·РёС†РёР№ 8701В вЂ“В 8705 РўРќ Р’Р­Р” Р•РђР­РЎ, РёС… СѓР·Р»РѕРІ Рё Р°РіСЂРµРіР°С‚РѕРІ (РґР»СЏ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё)', 'RU', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (148, '05999', '5', 'Р�РЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹, СЃРІРµРґРµРЅРёСЏ, РЅРµРѕР±С…РѕРґРёРјС‹Рµ РґР»СЏ С†РµР»РµР№ РєР»Р°СЃСЃРёС„РёРєР°С†РёРё С‚РѕРІР°СЂР°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (149, '06011', '6', 'РЎРµСЂС‚РёС„РёРєР°С‚ Рѕ РїСЂРѕРёСЃС…РѕР¶РґРµРЅРёРё С‚РѕРІР°СЂРѕРІ С„РѕСЂРјС‹ РЎРў-1', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (150, '06013', '6', 'Р”РµРєР»Р°СЂР°С†РёСЏ-СЃРµСЂС‚РёС„РёРєР°С‚ Рѕ РїСЂРѕРёСЃС…РѕР¶РґРµРЅРёРё С‚РѕРІР°СЂР° РїРѕ С„РѕСЂРјРµ В«РђВ»', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (151, '06014', '6', 'РќРµРїСЂРµС„РµСЂРµРЅС†РёР°Р»СЊРЅС‹Р№ СЃРµСЂС‚РёС„РёРєР°С‚ Рѕ РїСЂРѕРёСЃС…РѕР¶РґРµРЅРёРё С‚РѕРІР°СЂР° РѕР±С‰РµР№ С„РѕСЂРјС‹', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (152, '06015', '6', 'РџСЂРµРґРІР°СЂРёС‚РµР»СЊРЅРѕРµ СЂРµС€РµРЅРёРµ Рѕ СЃС‚СЂР°РЅРµ РїСЂРѕРёСЃС…РѕР¶РґРµРЅРёСЏ С‚РѕРІР°СЂР°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (153, '06016', '6', 'Р”РµРєР»Р°СЂР°С†РёСЏ Рѕ РїСЂРѕРёСЃС…РѕР¶РґРµРЅРёРё С‚РѕРІР°СЂР°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (154, '06017', '6', 'РЎРµСЂС‚РёС„РёРєР°С‚ Рѕ РїСЂРѕРёСЃС…РѕР¶РґРµРЅРёРё С‚РѕРІР°СЂР° С„РѕСЂРјС‹ РЎРў-2', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (155, '06018', '6', 'РЎРµСЂС‚РёС„РёРєР°С‚ Рѕ РїСЂРѕРёСЃС…РѕР¶РґРµРЅРёРё С‚РѕРІР°СЂР° С„РѕСЂРјС‹ EAV', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (156, '06999', '6', 'Р�РЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёРµ РїСЂРѕРёСЃС…РѕР¶РґРµРЅРёРµ С‚РѕРІР°СЂР°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (157, '07011', '7', 'Р”РѕРєСѓРјРµРЅС‚С‹, РєРѕС‚РѕСЂС‹РјРё СѓСЃС‚Р°РЅРѕРІР»РµРЅС‹ РїСЂР°РІРѕ РЅР° Р»СЊРіРѕС‚С‹ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїР»Р°С‚РµР¶РµР№ РёР»Рё РёРЅС‹Рµ РѕСЃРЅРѕРІР°РЅРёСЏ РґР»СЏ РёС… РЅРµСѓРїР»Р°С‚С‹, Р»РёР±Рѕ РїРѕР»РЅРѕРµ РёР»Рё С‡Р°СЃС‚РёС‡РЅРѕРµ РѕСЃРІРѕР±РѕР¶РґРµРЅРёРµ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ С‚Р°РјРѕР¶РµРЅРЅС‹РјРё РїСЂРѕС†РµРґСѓСЂР°РјРё, Р»РёР±Рѕ СѓРјРµРЅСЊС€РµРЅРёРµ Р±Р°Р·С‹ (РЅР°Р»РѕРіРѕРІРѕР№ Р±Р°Р·С‹) РґР»СЏ РёСЃС‡РёСЃР»РµРЅРёСЏ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (158, '07012', '7', 'Р”РѕРєСѓРјРµРЅС‚С‹, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёРµ СЃРѕР±Р»СЋРґРµРЅРёРµ СѓСЃР»РѕРІРёР№ РґР»СЏ РїСЂРёРјРµРЅРµРЅРёСЏ Р»СЊРіРѕС‚ РїРѕ СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїР»Р°С‚РµР¶РµР№ РёР»Рё РёРЅС‹С… РѕСЃРЅРѕРІР°РЅРёР№ РґР»СЏ РёС… РЅРµСѓРїР»Р°С‚С‹, Р»РёР±Рѕ РїРѕР»РЅРѕРіРѕ РёР»Рё С‡Р°СЃС‚РёС‡РЅРѕРіРѕ РѕСЃРІРѕР±РѕР¶РґРµРЅРёСЏ РѕС‚ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ С‚Р°РјРѕР¶РµРЅРЅС‹РјРё РїСЂРѕС†РµРґСѓСЂР°РјРё, Р»РёР±Рѕ РЅР° СѓРјРµРЅСЊС€РµРЅРёРµ Р±Р°Р·С‹ (РЅР°Р»РѕРіРѕРІРѕР№ Р±Р°Р·С‹) РґР»СЏ РёСЃС‡РёСЃР»РµРЅРёСЏ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (159, '07013', '7', 'РЎРѕРіР»Р°С€РµРЅРёРµ Рѕ РїСЂРёРјРµРЅРµРЅРёРё С†РµРЅС‚СЂР°Р»РёР·РѕРІР°РЅРЅРѕРіРѕ РїРѕСЂСЏРґРєР° СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (160, '07021', '7', 'Р РµС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° Рѕ РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРё РѕС‚СЃСЂРѕС‡РєРё РёР»Рё СЂР°СЃСЃСЂРѕС‡РєРё СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (161, '07022', '7', 'Р РµС€РµРЅРёРµ РѕР± РёР·РјРµРЅРµРЅРёРё СЃСЂРѕРєР° СѓРїР»Р°С‚С‹ РЅР°Р»РѕРіРѕРІ, РІР·РёРјР°РµРјС‹С… РїСЂРё РІРІРѕР·Рµ С‚РѕРІР°СЂРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (162, '07031', '7', 'Р”РѕРєСѓРјРµРЅС‚, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёР№ РІРЅРµСЃРµРЅРёРµ РґРµРЅРµР¶РЅС‹С… СЃСЂРµРґСЃС‚РІ (РґРµРЅРµРі) РІ РєР°С‡РµСЃС‚РІРµ РѕР±РµСЃРїРµС‡РµРЅРёСЏ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїР»Р°С‚РµР¶РµР№', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (163, '07032', '7', 'Р‘Р°РЅРєРѕРІСЃРєР°СЏ РіР°СЂР°РЅС‚РёСЏ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (164, '07033', '7', 'Р”РѕРіРѕРІРѕСЂ РїРѕСЂСѓС‡РёС‚РµР»СЊСЃС‚РІР°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (165, '07034', '7', 'Р”РѕРіРѕРІРѕСЂ Р·Р°Р»РѕРіР° РёРјСѓС‰РµСЃС‚РІР°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (166, '07035', '7', 'Р”РѕРєСѓРјРµРЅС‚, РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёР№ РІРЅРµСЃРµРЅРёРµ РѕР±РµСЃРїРµС‡РµРЅРёСЏ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ РёРЅС‹Рј СЃРїРѕСЃРѕР±РѕРј, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅС‹Рј Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (167, '08011', '8', 'Р”РѕРєСѓРјРµРЅС‚ РѕР± СѓСЃР»РѕРІРёСЏС… РїРµСЂРµСЂР°Р±РѕС‚РєРё РЅР° С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (168, '08012', '8', 'Р”РѕРєСѓРјРµРЅС‚ РѕР± СѓСЃР»РѕРІРёСЏС… РїРµСЂРµСЂР°Р±РѕС‚РєРё РІРЅРµ С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (169, '08013', '8', 'Р”РѕРєСѓРјРµРЅС‚ РѕР± СѓСЃР»РѕРІРёСЏС… РїРµСЂРµСЂР°Р±РѕС‚РєРё РґР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ РїРѕС‚СЂРµР±Р»РµРЅРёСЏ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (170, '10021', '10', 'Р�РЅС‹Рµ СЃРІРµРґРµРЅРёСЏ, Р·Р°СЏРІР»СЏРµРјС‹Рµ РїСЂРё С‚Р°РјРѕР¶РµРЅРЅРѕРј РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРё, РµСЃР»Рё СЌС‚Рѕ РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРѕ С‚Р°РјРѕР¶РµРЅРЅС‹Рј Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ', 'BY', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (171, '10022', '10', 'Р�РЅС‹Рµ СЃРІРµРґРµРЅРёСЏ, Р·Р°СЏРІР»СЏРµРјС‹Рµ РїСЂРё С‚Р°РјРѕР¶РµРЅРЅРѕРј РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРё, РµСЃР»Рё СЌС‚Рѕ РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРѕ С‚Р°РјРѕР¶РµРЅРЅС‹Рј Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ', 'KZ', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (172, '10023', '10', 'Р�РЅС‹Рµ СЃРІРµРґРµРЅРёСЏ, Р·Р°СЏРІР»СЏРµРјС‹Рµ РїСЂРё С‚Р°РјРѕР¶РµРЅРЅРѕРј РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРё, РµСЃР»Рё СЌС‚Рѕ РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРѕ С‚Р°РјРѕР¶РµРЅРЅС‹Рј Р·Р°РєРѕРЅРѕРґР°С‚РµР»СЊСЃС‚РІРѕРј Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё', 'RU', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (190, '09028', '9', 'РђРєС‚ РІРµС‚РµСЂРёРЅР°СЂРЅРѕ-СЃР°РЅРёС‚Р°СЂРЅРѕРіРѕ РґРѕСЃРјРѕС‚СЂР°, РѕС„РѕСЂРјР»РµРЅРЅС‹Р№ РґРѕР»Р¶РЅРѕСЃС‚РЅС‹Рј Р»РёС†РѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РѕСЃСѓС‰РµСЃС‚РІР»СЏСЋС‰РёРј РІРµС‚РµСЂРёРЅР°СЂРЅРѕ-СЃР°РЅРёС‚Р°СЂРЅС‹Р№ РєРѕРЅС‚СЂРѕР»СЊ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (173, '10024', '10', 'РџРѕСЃС‚Р°РЅРѕРІР»РµРЅРёРµ РџСЂР°РІРёС‚РµР»СЊСЃС‚РІР° Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё РѕС‚ 05.05.2011 в„– 339 В«Рћ РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРё РёР· С„РµРґРµСЂР°Р»СЊРЅРѕРіРѕ Р±СЋРґР¶РµС‚Р° СЃСѓР±СЃРёРґРёР№ РЅР° РІРѕР·РјРµС‰РµРЅРёРµ Р·Р°С‚СЂР°С‚ РїРѕ СѓРїР»Р°С‚Рµ РІРІРѕР·РЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїРѕС€Р»РёРЅС‹ Рё РЅР°Р»РѕРіР° РЅР° РґРѕР±Р°РІР»РµРЅРЅСѓСЋ СЃС‚РѕРёРјРѕСЃС‚СЊ, РїРѕРЅРµСЃРµРЅРЅС‹С… СЋСЂРёРґРёС‡РµСЃРєРёРјРё Р»РёС†Р°РјРё, РёРЅРґРёРІРёРґСѓР°Р»СЊРЅС‹РјРё РїСЂРµРґРїСЂРёРЅРёРјР°С‚РµР»СЏРјРё, СЏРІР»СЏСЋС‰РёРјРёСЃСЏ Р»РёС†Р°РјРё, СѓС‡Р°СЃС‚РІСѓСЋС‰РёРјРё РІ СЂРµР°Р»РёР·Р°С†РёРё РїСЂРѕРµРєС‚Р° СЃРѕР·РґР°РЅРёСЏ Рё РѕР±РµСЃРїРµС‡РµРЅРёСЏ С„СѓРЅРєС†РёРѕРЅРёСЂРѕРІР°РЅРёСЏ С‚РµСЂСЂРёС‚РѕСЂРёР°Р»СЊРЅРѕ РѕР±РѕСЃРѕР±Р»РµРЅРЅРѕРіРѕ РєРѕРјРїР»РµРєСЃР° (РёРЅРЅРѕРІР°С†РёРѕРЅРЅРѕРіРѕ С†РµРЅС‚СЂР° В«РЎРєРѕР»РєРѕРІРѕВ»)В» (С‚РѕР»СЊРєРѕ РґР»СЏ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё)', 'RU', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (174, '10041', '10', 'Р—Р°СЏРІР»РµРЅРЅС‹Р№ СЃСЂРѕРє СѓРЅРёС‡С‚РѕР¶РµРЅРёСЏ С‚РѕРІР°СЂРѕРІ, РїРѕРјРµС‰РµРЅРЅС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ СѓРЅРёС‡С‚РѕР¶РµРЅРёСЏ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (175, '10042', '10', 'Р—Р°СЏРІР»РµРЅРЅС‹Р№ СЃСЂРѕРє С…СЂР°РЅРµРЅРёСЏ С‚РѕРІР°СЂРѕРІ РЅР° С‚Р°РјРѕР¶РµРЅРЅРѕРј СЃРєР»Р°РґРµ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (176, '10043', '10', 'РЎРІРµРґРµРЅРёСЏ Рѕ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕР№ СЂРµРіРёСЃС‚СЂР°С†РёРё СЃРїРµС†РёР°Р»РёР·РёСЂРѕРІР°РЅРЅРѕР№ РїРёС‰РµРІРѕР№ РїСЂРѕРґСѓРєС†РёРё РёР»Рё РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕР№ СЂРµРіРёСЃС‚СЂР°С†РёРё РїРёС‰РµРІРѕР№ РїСЂРѕРґСѓРєС†РёРё РЅРѕРІРѕРіРѕ РІРёРґР° РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ С‚РµС…РЅРёС‡РµСЃРєРёРј СЂРµРіР»Р°РјРµРЅС‚РѕРј РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° В«Рћ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё РїРёС‰РµРІРѕР№ РїСЂРѕРґСѓРєС†РёРёВ» (РўР  РўРЎ 021/2011), СѓС‚РІРµСЂР¶РґРµРЅРЅС‹Рј Р РµС€РµРЅРёРµРј РљРѕРјРёСЃСЃРёРё РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° РѕС‚ 9 РґРµРєР°Р±СЂСЏ 2011 Рі. в„– 880', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (177, '10044', '10', 'РЎРІРµРґРµРЅРёСЏ Рѕ СЂРµРіРёСЃС‚СЂР°С†РёРѕРЅРЅРѕРј РЅРѕРјРµСЂРµ РґРµРєР»Р°СЂР°С†РёРё РЅР° С‚РѕРІР°СЂС‹, РїРѕРґР°РЅРЅРѕР№ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃРѕ СЃС‚Р°С‚СЊРµР№ 193 РўР°РјРѕР¶РµРЅРЅРѕРіРѕ РєРѕРґРµРєСЃР° РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р°, Р·Р°СЏРІР»СЏРµРјС‹Рµ РІ СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅС‹С… СЃР»СѓС‡Р°СЏС… РІ С‚Р°РјРѕР¶РµРЅРЅС‹С… РґРѕРєСѓРјРµРЅС‚Р°С…, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РґРµРєР»Р°СЂР°С†РёРё РЅР° С‚РѕРІР°СЂС‹', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (178, '10050', '10', 'РЎРІРµРґРµРЅРёСЏ Рѕ РІРєР»СЋС‡РµРЅРёРё СЂР°РґРёРѕСЌР»РµРєС‚СЂРѕРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ Рё (РёР»Рё) РІС‹СЃРѕРєРѕС‡Р°СЃС‚РѕС‚РЅС‹С… СѓСЃС‚СЂРѕР№СЃС‚РІ РіСЂР°Р¶РґР°РЅСЃРєРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ, РІ С‚РѕРј С‡РёСЃР»Рµ РІСЃС‚СЂРѕРµРЅРЅС‹С… Р»РёР±Рѕ РІС…РѕРґСЏС‰РёС… РІ СЃРѕСЃС‚Р°РІ РґСЂСѓРіРёС… С‚РѕРІР°СЂРѕРІ, РІ РµРґРёРЅС‹Р№ СЂРµРµСЃС‚СЂ СЂР°РґРёРѕСЌР»РµРєС‚СЂРѕРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ Рё РІС‹СЃРѕРєРѕС‡Р°СЃС‚РѕС‚РЅС‹С… СѓСЃС‚СЂРѕР№СЃС‚РІ РіСЂР°Р¶РґР°РЅСЃРєРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ, РІ С‚РѕРј С‡РёСЃР»Рµ РІСЃС‚СЂРѕРµРЅРЅС‹С… Р»РёР±Рѕ РІС…РѕРґСЏС‰РёС… РІ СЃРѕСЃС‚Р°РІ РґСЂСѓРіРёС… С‚РѕРІР°СЂРѕРІ, РїСЂРё РІРІРѕР·Рµ РєРѕС‚РѕСЂС‹С… РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РЅРµ С‚СЂРµР±СѓРµС‚СЃСЏ РїСЂРµРґСЃС‚Р°РІР»РµРЅРёРµ Р»РёС†РµРЅР·РёРё РёР»Рё Р·Р°РєР»СЋС‡РµРЅРёСЏ (СЂР°Р·СЂРµС€РёС‚РµР»СЊРЅРѕРіРѕ РґРѕРєСѓРјРµРЅС‚Р°)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (179, '10051', '10', 'РЎРІРµРґРµРЅРёСЏ Рѕ РІРєР»СЋС‡РµРЅРёРё Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ РІ РµРґРёРЅС‹Р№ СЂРµРµСЃС‚СЂ Р·Р°СЂРµРіРёСЃС‚СЂРёСЂРѕРІР°РЅРЅС‹С… Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Р№ СЃС‚Р°С‚СЊРµР№ 14 РЎРѕРіР»Р°С€РµРЅРёСЏ Рѕ РµРґРёРЅС‹С… РїСЂРёРЅС†РёРїР°С… Рё РїСЂР°РІРёР»Р°С… РѕР±СЂР°С‰РµРЅРёСЏ Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ РІ СЂР°РјРєР°С… Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РѕС‚ 23 РґРµРєР°Р±СЂСЏ 2014 РіРѕРґР°, РёР»Рё РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІСѓСЋС‰РёР№ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Р№ СЂРµРµСЃС‚СЂ Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІ РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (180, '10052', '10', 'РЎРІРµРґРµРЅРёСЏ Рѕ РІРєР»СЋС‡РµРЅРёРё СЃРѕРѕС‚РІРµС‚СЃС‚РІСѓСЋС‰РµР№ РЅРѕС‚РёС„РёРєР°С†РёРё РІ РµРґРёРЅС‹Р№ СЂРµРµСЃС‚СЂ РЅРѕС‚РёС„РёРєР°С†РёР№ Рѕ С…Р°СЂР°РєС‚РµСЂРёСЃС‚РёРєР°С… С€РёС„СЂРѕРІР°Р»СЊРЅС‹С… (РєСЂРёРїС‚РѕРіСЂР°С„РёС‡РµСЃРєРёС…) СЃСЂРµРґСЃС‚РІ Рё С‚РѕРІР°СЂРѕРІ, РёС… СЃРѕРґРµСЂР¶Р°С‰РёС…', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (181, '10999', '10', 'Р�РЅС‹Рµ СЃРІРµРґРµРЅРёСЏ, РїРѕРґР»РµР¶Р°С‰РёРµ СѓРєР°Р·Р°РЅРёСЋ РІ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РґРµРєР»Р°СЂР°С†РёРё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (182, '08014', '8', 'Р—Р°СЏРІР»РµРЅРёРµ Рѕ РІС‹РІРѕР·Рµ С‚РѕРІР°СЂРѕРІ, РїРѕРјРµС‰РµРЅРЅС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ СЃРІРѕР±РѕРґРЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ Р·РѕРЅС‹ РІ РњР°РіР°РґР°РЅСЃРєРѕР№ РѕР±Р»Р°СЃС‚Рё Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ СЃРѕР±СЃС‚РІРµРЅРЅС‹С… РїСЂРѕРёР·РІРѕРґСЃС‚РІРµРЅРЅС‹С… Рё С‚РµС…РЅРѕР»РѕРіРёС‡РµСЃРєРёС… РЅСѓР¶Рґ, РЅР° РѕСЃС‚Р°Р»СЊРЅСѓСЋ С‡Р°СЃС‚СЊ С‚РµСЂСЂРёС‚РѕСЂРёРё РњР°РіР°РґР°РЅСЃРєРѕР№ РѕР±Р»Р°СЃС‚Рё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (183, '08021', '8', 'Р—Р°РєР»СЋС‡РµРЅРёРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РіРѕСЃСѓРґР°СЂСЃС‚РІ-С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° Рѕ РІРѕР·РјРѕР¶РЅРѕСЃС‚Рё, СЃРїРѕСЃРѕР±Рµ Рё РјРµСЃС‚Рµ СѓРЅРёС‡С‚РѕР¶РµРЅРёСЏ С‚РѕРІР°СЂРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (184, '08031', '8', 'Р—Р°РєР»СЋС‡РµРЅРёРµ Рѕ РїСЂРёР·РЅР°РЅРёРё С‚РѕРІР°СЂР°, РёР·РіРѕС‚РѕРІР»РµРЅРЅРѕРіРѕ (РїРѕР»СѓС‡РµРЅРЅРѕРіРѕ) СЃ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёРµРј РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… С‚РѕРІР°СЂРѕРІ, РїРѕРјРµС‰РµРЅРЅС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ СЃРІРѕР±РѕРґРЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ Р·РѕРЅС‹ РёР»Рё С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ СЃРІРѕР±РѕРґРЅРѕРіРѕ СЃРєР»Р°РґР°, С‚РѕРІР°СЂРѕРј Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (185, '08032', '8', 'Р—Р°РєР»СЋС‡РµРЅРёРµ Рѕ РїСЂРёР·РЅР°РЅРёРё С‚РѕРІР°СЂР°, РёР·РіРѕС‚РѕРІР»РµРЅРЅРѕРіРѕ (РїРѕР»СѓС‡РµРЅРЅРѕРіРѕ) СЃ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёРµРј РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… С‚РѕРІР°СЂРѕРІ, РїРѕРјРµС‰РµРЅРЅС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ СЃРІРѕР±РѕРґРЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ Р·РѕРЅС‹ РёР»Рё С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ СЃРІРѕР±РѕРґРЅРѕРіРѕ СЃРєР»Р°РґР°, РЅРµ СЏРІР»СЏСЋС‰РёРјСЃСЏ С‚РѕРІР°СЂРѕРј Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (186, '08033', '8', 'Р”РѕРєСѓРјРµРЅС‚, СЃРІРёРґРµС‚РµР»СЊСЃС‚РІСѓСЋС‰РёР№ Рѕ РІРєР»СЋС‡РµРЅРёРё Р»РёС†Р° РІ Р РµРµСЃС‚СЂ РІР»Р°РґРµР»СЊС†РµРІ СЃРІРѕР±РѕРґРЅС‹С… СЃРєР»Р°РґРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (187, '08034', '8', 'Р”РѕРєСѓРјРµРЅС‚, СѓРґРѕСЃС‚РѕРІРµСЂСЏСЋС‰РёР№ СЂРµРіРёСЃС‚СЂР°С†РёСЋ Р»РёС†Р° РІ РєР°С‡РµСЃС‚РІРµ СЂРµР·РёРґРµРЅС‚Р° (СѓС‡Р°СЃС‚РЅРёРєР°) СЃРІРѕР±РѕРґРЅРѕР№ (СЃРїРµС†РёР°Р»СЊРЅРѕР№, РѕСЃРѕР±РѕР№) СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ Р·РѕРЅС‹', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (188, '08035', '8', 'РЎРѕРіР»Р°С€РµРЅРёРµ РѕР± РѕСЃСѓС‰РµСЃС‚РІР»РµРЅРёРё (РІРµРґРµРЅРёРё) РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё РЅР° С‚РµСЂСЂРёС‚РѕСЂРёРё СЃРІРѕР±РѕРґРЅРѕР№ (СЃРїРµС†РёР°Р»СЊРЅРѕР№, РѕСЃРѕР±РѕР№) СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ Р·РѕРЅС‹ (РґРѕРіРѕРІРѕСЂ РѕР± СѓСЃР»РѕРІРёСЏС… РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё РІ СЃРІРѕР±РѕРґРЅРѕР№ (СЃРїРµС†РёР°Р»СЊРЅРѕР№, РѕСЃРѕР±РѕР№) СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ Р·РѕРЅРµ, РёРЅРІРµСЃС‚РёС†РёРѕРЅРЅР°СЏ РґРµРєР»Р°СЂР°С†РёСЏ)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (189, '09027', '9', 'РђРєС‚ РІРѕР·РІСЂР°С‚Р° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° Рё С‚РѕРІР°СЂР°, РѕС„РѕСЂРјР»РµРЅРЅС‹Р№ РґРѕР»Р¶РЅРѕСЃС‚РЅС‹РјРё Р»РёС†Р°РјРё РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹С… РѕСЂРіР°РЅРѕРІ РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РѕСЃСѓС‰РµСЃС‚РІР»СЏСЋС‰РёРјРё РєРѕРЅС‚СЂРѕР»СЊ РІ Р°РІС‚РѕРјРѕР±РёР»СЊРЅРѕРј РїСѓРЅРєС‚Рµ РїСЂРѕРїСѓСЃРєР° (РґР»СЏ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ)', 'KZ', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (191, '09029', '9', 'РђРєС‚ РєР°СЂР°РЅС‚РёРЅРЅРѕРіРѕ С„РёС‚РѕСЃР°РЅРёС‚Р°СЂРЅРѕРіРѕ РєРѕРЅС‚СЂРѕР»СЏ (РЅР°РґР·РѕСЂР°), РѕС„РѕСЂРјР»РµРЅРЅС‹Р№ РґРѕР»Р¶РЅРѕСЃС‚РЅС‹Рј Р»РёС†РѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РѕСЃСѓС‰РµСЃС‚РІР»СЏСЋС‰РёРј РєР°СЂР°РЅС‚РёРЅРЅС‹Р№ С„РёС‚РѕСЃР°РЅРёС‚Р°СЂРЅС‹Р№ РєРѕРЅС‚СЂРѕР»СЊ (РЅР°РґР·РѕСЂ)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (192, '09030', '9', 'РђРєС‚ СЃР°РЅРёС‚Р°СЂРЅРѕ-РєР°СЂР°РЅС‚РёРЅРЅРѕРіРѕ РѕСЃРјРѕС‚СЂР° (РґРѕСЃРјРѕС‚СЂР°), РѕС„РѕСЂРјР»РµРЅРЅС‹Р№ РґРѕР»Р¶РЅРѕСЃС‚РЅС‹Рј Р»РёС†РѕРј РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РѕСЃСѓС‰РµСЃС‚РІР»СЏСЋС‰РёРј СЃР°РЅРёС‚Р°СЂРЅРѕ-РєР°СЂР°РЅС‚РёРЅРЅС‹Р№ РєРѕРЅС‚СЂРѕР»СЊ (РґР»СЏ Р РµСЃРїСѓР±Р»РёРєРё РљР°Р·Р°С…СЃС‚Р°РЅ)', 'KZ', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (193, '09031', '9', 'Р”РµРєР»Р°СЂР°С†РёСЏ РЅР° С‚РѕРІР°СЂС‹ РІ РѕС‚РЅРѕС€РµРЅРёРё СЂР°РЅРµРµ РІРІРµР·РµРЅРЅС‹С… С‚РѕРІР°СЂРѕРІ, РёРґРµРЅС‚РёС‡РЅС‹С… РґРµРєР»Р°СЂРёСЂСѓРµРјС‹Рј С‚РѕРІР°СЂР°Рј, Р·Р°СЏРІР»РµРЅРЅР°СЏ С‚Р°РјРѕР¶РµРЅРЅР°СЏ СЃС‚РѕРёРјРѕСЃС‚СЊ РєРѕС‚РѕСЂС‹С… РїСЂРёРЅСЏС‚Р° С‚Р°РјРѕР¶РµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј РїРѕ СЂРµР·СѓР»СЊС‚Р°С‚Р°Рј РґРѕРїРѕР»РЅРёС‚РµР»СЊРЅРѕР№ РїСЂРѕРІРµСЂРєРё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (194, '09032', '9', 'Р”РµРєР»Р°СЂР°С†РёСЏ Рѕ СЃРґРµР»РєР°С… СЃ РґСЂРµРІРµСЃРёРЅРѕР№ (РґР»СЏ Р РѕСЃСЃРёР№СЃРєРѕР№ Р¤РµРґРµСЂР°С†РёРё)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (195, '09033', '9', 'Р РµС€РµРЅРёРµ Рѕ РІРЅРµСЃРµРЅРёРё РёР·РјРµРЅРµРЅРёР№ (РґРѕРїРѕР»РЅРµРЅРёР№) РІ РґРµРєР»Р°СЂР°С†РёСЋ РЅР° С‚РѕРІР°СЂС‹ (СЂРµС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° Рѕ РІРЅРµСЃРµРЅРёРё РёР·РјРµРЅРµРЅРёР№ Рё (РёР»Рё) РґРѕРїРѕР»РЅРµРЅРёР№ РІ СЃРІРµРґРµРЅРёСЏ, СѓРєР°Р·Р°РЅРЅС‹Рµ РІ РґРµРєР»Р°СЂР°С†РёРё РЅР° С‚РѕРІР°СЂС‹, РїРѕ С„РѕСЂРјРµ, СѓС‚РІРµСЂР¶РґРµРЅРЅРѕР№ Р•РІСЂР°Р·РёР№СЃРєРѕР№ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ РєРѕРјРёСЃСЃРёРµР№, СЂРµС€РµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° Рѕ РІР·С‹СЃРєР°РЅРёРё С‚Р°РјРѕР¶РµРЅРЅС‹С… РїР»Р°С‚РµР¶РµР№, РїСЂРѕС†РµРЅС‚РѕРІ, РїРµРЅРµР№, Р°РєС‚ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїСЂРѕРІРµСЂРєРё) (РґР»СЏ Р РµСЃРїСѓР±Р»РёРєРё Р‘РµР»Р°СЂСѓСЃСЊ)', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (196, '09041', '9', 'РЎРїРёСЃРѕРє РІРІРѕР·РёРјС‹С… Р±РµР· РјР°СЂРєРёСЂРѕРІРєРё С‚РѕРІР°СЂРѕРІ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Р№ РїРѕСЂСЏРґРєРѕРј СЃРѕРіР»Р°СЃРѕРІР°РЅРёСЏ С‚Р°РјРѕР¶РµРЅРЅС‹Рј РѕСЂРіР°РЅРѕРј РІРІРѕР·Р° Р±РµР· РјР°СЂРєРёСЂРѕРІРєРё С‚РѕРІР°СЂРѕРІ, РїРѕРґР»РµР¶Р°С‰РёС… РјР°СЂРєРёСЂРѕРІРєРµ, Р°РєРєСЂРµРґРёС‚РѕРІР°РЅРЅС‹РјРё РІ Р РµСЃРїСѓР±Р»РёРєРµ РђСЂРјРµРЅРёСЏ РґРёРїР»РѕРјР°С‚РёС‡РµСЃРєРёРјРё РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІР°РјРё Рё РєРѕРЅСЃСѓР»СЊСЃРєРёРјРё СѓС‡СЂРµР¶РґРµРЅРёСЏРјРё, Р° С‚Р°РєР¶Рµ РїСЂРёСЂР°РІРЅРµРЅРЅС‹РјРё Рє РЅРёРј РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅС‹Рј РїРѕСЃС‚Р°РЅРѕРІР»РµРЅРёРµРј РџСЂР°РІРёС‚РµР»СЊСЃС‚РІР° Р РµСЃРїСѓР±Р»РёРєРё РђСЂРјРµРЅРёСЏ РѕС‚ 13 РёСЋР»СЏ 2017 Рі. N 822-РЅ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (197, '09999', '9', 'Р�РЅС‹Рµ РґРѕРєСѓРјРµРЅС‚С‹, РїСЂРµРґСЃС‚Р°РІР»СЏРµРјС‹Рµ РїСЂРё С‚Р°РјРѕР¶РµРЅРЅРѕРј РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРё С‚РѕРІР°СЂРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (198, '10011', '10', '"Р”Р°С‚Р° РѕРєРѕРЅС‡Р°РЅРёСЏ Р·Р°СЏРІР»РµРЅРЅРѕРіРѕ СЃСЂРѕРєР° РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° С‚РѕРІР°СЂРѕРІ Рё РїСЂРёР·РЅР°Рє РїСЂРѕРґРѕР»Р¶РёС‚РµР»СЊРЅРѕСЃС‚Рё РґРµР№СЃС‚РІРёСЏ Р·Р°СЏРІР»РµРЅРЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїСЂРѕС†РµРґСѓСЂС‹ РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° (РґРѕРїСѓСЃРєР°) (С†РёС„СЂР° ""1"", РµСЃР»Рё СЃСЂРѕРє РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° СЃРѕСЃС‚Р°РІР»СЏРµС‚ РјРµРЅРµРµ РѕРґРЅРѕРіРѕ РіРѕРґР°, РёР»Рё С†РёС„СЂР° ""2"", РµСЃР»Рё СЃСЂРѕРє РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° СЃРѕСЃС‚Р°РІР»СЏРµС‚ РѕРґРёРЅ РіРѕРґ Рё Р±РѕР»РµРµ)"', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (199, '10012', '10', '"Р”Р°С‚Р° РѕРєРѕРЅС‡Р°РЅРёСЏ Р·Р°СЏРІР»РµРЅРЅРѕРіРѕ СЃСЂРѕРєР° РІСЂРµРјРµРЅРЅРѕРіРѕ РІС‹РІРѕР·Р° С‚РѕРІР°СЂРѕРІ Рё РїСЂРёР·РЅР°Рє РїСЂРѕРґРѕР»Р¶РёС‚РµР»СЊРЅРѕСЃС‚Рё РґРµР№СЃС‚РІРёСЏ Р·Р°СЏРІР»РµРЅРЅРѕР№ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїСЂРѕС†РµРґСѓСЂС‹ РІСЂРµРјРµРЅРЅРѕРіРѕ РІС‹РІРѕР·Р° (С†РёС„СЂР° ""1"", РµСЃР»Рё СЃСЂРѕРє РІСЂРµРјРµРЅРЅРѕРіРѕ РІС‹РІРѕР·Р° СЃРѕСЃС‚Р°РІР»СЏРµС‚ РјРµРЅРµРµ РѕРґРЅРѕРіРѕ РіРѕРґР°, РёР»Рё С†РёС„СЂР° ""2"", РµСЃР»Рё СЃСЂРѕРє РІСЂРµРјРµРЅРЅРѕРіРѕ РІС‹РІРѕР·Р° СЃРѕСЃС‚Р°РІР»СЏРµС‚ РѕРґРёРЅ РіРѕРґ Рё Р±РѕР»РµРµ)"', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (200, '10013', '10', 'Р—Р°СЏРІР»РµРЅРЅС‹Р№ СЃСЂРѕРє РїРµСЂРµСЂР°Р±РѕС‚РєРё С‚РѕРІР°СЂРѕРІ, РµСЃР»Рё РґРµРєР»Р°СЂР°С†РёСЏ РЅР° С‚РѕРІР°СЂС‹ РёСЃРїРѕР»СЊР·СѓРµС‚СЃСЏ РІ РєР°С‡РµСЃС‚РІРµ РґРѕРєСѓРјРµРЅС‚Р° РѕР± СѓСЃР»РѕРІРёСЏС… РїРµСЂРµСЂР°Р±РѕС‚РєРё С‚РѕРІР°СЂРѕРІ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (201, '10014', '10', 'РЎС‚РѕРёРјРѕСЃС‚СЊ РѕРїРµСЂР°С†РёР№ РїРµСЂРµСЂР°Р±РѕС‚РєРё С‚РѕРІР°СЂРѕРІ, РїРѕРјРµС‰РµРЅРЅС‹С… РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ РїРµСЂРµСЂР°Р±РѕС‚РєРё С‚РѕРІР°СЂРѕРІ РІРЅРµ С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё, РІ РІР°Р»СЋС‚Рµ РіРѕСЃСѓРґР°СЂСЃС‚РІР°-С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РЅР° С‚РµСЂСЂРёС‚РѕСЂРёРё РєРѕС‚РѕСЂРѕРіРѕ РґРµРєР»Р°СЂРёСЂСѓСЋС‚СЃСЏ РїСЂРѕРґСѓРєС‚С‹ РїРµСЂРµСЂР°Р±РѕС‚РєРё СЌС‚РёС… С‚РѕРІР°СЂРѕРІ РґР»СЏ РёС… РїРѕРјРµС‰РµРЅРёСЏ РїРѕРґ С‚Р°РјРѕР¶РµРЅРЅСѓСЋ РїСЂРѕС†РµРґСѓСЂСѓ РІС‹РїСѓСЃРєР° РґР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ РїРѕС‚СЂРµР±Р»РµРЅРёСЏ', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (202, '10015', '10', 'Р—Р°СЏРІР»РµРЅРЅС‹Р№ СЃСЂРѕРє РїРµСЂРµСЂР°Р±РѕС‚РєРё РЅР° С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё, РІРЅРµ С‚Р°РјРѕР¶РµРЅРЅРѕР№ С‚РµСЂСЂРёС‚РѕСЂРёРё РёР»Рё РґР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ РїРѕС‚СЂРµР±Р»РµРЅРёСЏ, РµСЃР»Рё С‚Р°РєР°СЏ РїРµСЂРµСЂР°Р±РѕС‚РєР° РѕСЃСѓС‰РµСЃС‚РІР»СЏРµС‚СЃСЏ РЅР° РѕСЃРЅРѕРІР°РЅРёРё РґРѕРєСѓРјРµРЅС‚Р° РѕР± СѓСЃР»РѕРІРёСЏС… РїРµСЂРµСЂР°Р±РѕС‚РєРё', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (203, '10017', '10', '"РџСЂРёР·РЅР°Рє С„Р°РєС‚РёС‡РµСЃРєРѕР№ РїСЂРѕРґРѕР»Р¶РёС‚РµР»СЊРЅРѕСЃС‚Рё РґРµР№СЃС‚РІРёСЏ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїСЂРѕС†РµРґСѓСЂС‹ РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° (РґРѕРїСѓСЃРєР°) (С†РёС„СЂР° ""1"", РµСЃР»Рё СЃСЂРѕРє РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° СЃРѕСЃС‚Р°РІР»СЏРµС‚ РјРµРЅРµРµ РѕРґРЅРѕРіРѕ РіРѕРґР°, РёР»Рё С†РёС„СЂР° ""2"", РµСЃР»Рё СЃСЂРѕРє РІСЂРµРјРµРЅРЅРѕРіРѕ РІРІРѕР·Р° СЃРѕСЃС‚Р°РІР»СЏРµС‚ РѕРґРёРЅ РіРѕРґ Рё Р±РѕР»РµРµ)"', '', NULL);
INSERT INTO kindofdocumentsforcustomsdeclarationclassifier VALUES (204, '10018', '10', '"РџСЂРёР·РЅР°Рє С„Р°РєС‚РёС‡РµСЃРєРѕР№ РїСЂРѕРґРѕР»Р¶РёС‚РµР»СЊРЅРѕСЃС‚Рё РґРµР№СЃС‚РІРёСЏ С‚Р°РјРѕР¶РµРЅРЅРѕР№ РїСЂРѕС†РµРґСѓСЂС‹ РІСЂРµРјРµРЅРЅРѕРіРѕ РІС‹РІРѕР·Р° (С†РёС„СЂР° ""1"", РµСЃР»Рё СЃСЂРѕРє РІСЂРµРјРµРЅРЅРѕРіРѕ РІС‹РІРѕР·Р° СЃРѕСЃС‚Р°РІР»СЏРµС‚ РјРµРЅРµРµ РѕРґРЅРѕРіРѕ РіРѕРґР°, РёР»Рё С†РёС„СЂР° ""2"", РµСЃР»Рё СЃСЂРѕРє РІСЂРµРјРµРЅРЅРѕРіРѕ РІС‹РІРѕР·Р° СЃРѕСЃС‚Р°РІР»СЏРµС‚ РѕРґРёРЅ РіРѕРґ Рё Р±РѕР»РµРµ)"', '', NULL);


--
-- TOC entry 4593 (class 0 OID 19031)
-- Dependencies: 287
-- Data for Name: kindoftransportandtransportationgoodsclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (1, '99', 'РџСЂРѕС‡РёРµ');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (2, '90', 'РўСЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ, РїРµСЂРµРјРµС‰Р°СЋС‰РµРµСЃСЏ РІ РєР°С‡РµСЃС‚РІРµ С‚РѕРІР°СЂР° СЃРІРѕРёРј С…РѕРґРѕРј');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (3, '80', 'Р’РЅСѓС‚СЂРµРЅРЅРёР№ РІРѕРґРЅС‹Р№ С‚СЂР°РЅСЃРїРѕСЂС‚');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (4, '71', 'РўСЂСѓР±РѕРїСЂРѕРІРѕРґРЅС‹Р№ С‚СЂР°РЅСЃРїРѕСЂС‚');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (5, '50', 'РџРѕС‡С‚РѕРІРѕРµ РѕС‚РїСЂР°РІР»РµРЅРёРµ');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (6, '72', 'Р›РёРЅРёРё СЌР»РµРєС‚СЂРѕРїРµСЂРµРґР°С‡Рё');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (7, '40', 'Р’РѕР·РґСѓС€РЅС‹Р№ С‚СЂР°РЅСЃРїРѕСЂС‚');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (8, '30', 'РђРІС‚РѕРґРѕСЂРѕР¶РЅС‹Р№ С‚СЂР°РЅСЃРїРѕСЂС‚, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ, СѓРєР°Р·Р°РЅРЅС‹С… РїРѕРґ РєРѕРґР°РјРё 31, 32');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (9, '20', 'Р–РµР»РµР·РЅРѕРґРѕСЂРѕР¶РЅС‹Р№ С‚СЂР°РЅСЃРїРѕСЂС‚');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (10, '31', 'РЎРѕСЃС‚Р°РІ С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ (С‚СЏРіР°С‡ СЃ РїРѕР»СѓРїСЂРёС†РµРїРѕРј РёР»Рё РїСЂРёС†РµРїРѕРј)');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (11, '10', 'РњРѕСЂСЃРєРѕР№/СЂРµС‡РЅРѕР№ С‚СЂР°РЅСЃРїРѕСЂС‚');
INSERT INTO kindoftransportandtransportationgoodsclassifier VALUES (12, '32', 'РЎРѕСЃС‚Р°РІ С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ (С‚СЏРіР°С‡ СЃ РїСЂРёС†РµРїРѕРј(-Р°РјРё) Рё РїРѕР»СѓРїСЂРёС†РµРїРѕРј(-Р°РјРё)');


--
-- TOC entry 4595 (class 0 OID 19039)
-- Dependencies: 289
-- Data for Name: languagecodeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO languagecodeclassifier VALUES (1, 'aa', 'РђС„Р°СЂСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (2, 'ab', 'РђР±С…Р°Р·СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (3, 'ae', 'РђРІРµСЃС‚РёР№СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (4, 'af', 'РђС„СЂРёРєР°Р°РЅСЃ');
INSERT INTO languagecodeclassifier VALUES (5, 'ak', 'РђРєР°РЅ');
INSERT INTO languagecodeclassifier VALUES (6, 'am', 'РђРјС…Р°СЂСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (7, 'ar', 'РђСЂР°Р±СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (8, 'as', 'РђСЃСЃР°РјСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (9, 'av', 'РђРІР°СЂСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (10, 'ay', 'РђР№РјР°СЂР°');
INSERT INTO languagecodeclassifier VALUES (11, 'az', 'РђР·РµСЂР±Р°Р№РґР¶Р°РЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (12, 'ba', 'Р‘Р°С€РєРёСЂСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (13, 'be', 'Р‘РµР»РѕСЂСѓСЃСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (14, 'bg', 'Р‘РѕР»РіР°СЂСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (15, 'bi', 'Р‘РёСЃР»Р°РјР°');
INSERT INTO languagecodeclassifier VALUES (16, 'bm', 'Р‘Р°РјР±Р°СЂР°');
INSERT INTO languagecodeclassifier VALUES (17, 'bn', 'Р‘РµРЅРіР°Р»СЊСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (18, 'bo', 'РўРёР±РµС‚СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (19, 'br', 'Р‘СЂРµС‚РѕРЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (20, 'bs', 'Р‘РѕСЃРЅРёР№СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (21, 'ca', 'РљР°С‚Р°Р»Р°РЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (22, 'ce', 'Р§РµС‡РµРЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (23, 'ch', 'Р§Р°РјРѕСЂСЂРѕ');
INSERT INTO languagecodeclassifier VALUES (24, 'co', 'РљРѕСЂСЃРёРєР°РЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (25, 'cs', 'Р§РµС€СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (26, 'cu', 'Р¦РµСЂРєРѕРІРЅРѕСЃР»Р°РІСЏРЅСЃРєРёР№В (РЎС‚Р°СЂРѕСЃР»Р°РІСЏРЅСЃРєРёР№)');
INSERT INTO languagecodeclassifier VALUES (27, 'cv', 'Р§СѓРІР°С€СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (28, 'cy', 'Р’Р°Р»Р»РёР№СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (29, 'da', 'Р”Р°С‚СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (30, 'de', 'РќРµРјРµС†РєРёР№');
INSERT INTO languagecodeclassifier VALUES (31, 'dv', 'Р”РёРІРµС…Рё (РњР°Р»СЊРґРёРІСЃРєРёР№)');
INSERT INTO languagecodeclassifier VALUES (32, 'dz', 'Р”Р·РѕРЅРі-РєСЌ');
INSERT INTO languagecodeclassifier VALUES (33, 'ee', 'Р­РІРµ');
INSERT INTO languagecodeclassifier VALUES (34, 'el', 'Р“СЂРµС‡РµСЃРєРёР№ (РЅРѕРІРѕРіСЂРµС‡РµСЃРєРёР№)');
INSERT INTO languagecodeclassifier VALUES (35, 'en', 'РђРЅРіР»РёР№СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (36, 'eo', 'Р­СЃРїРµСЂР°РЅС‚Рѕ');
INSERT INTO languagecodeclassifier VALUES (37, 'es', 'Р�СЃРїР°РЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (38, 'et', 'Р­СЃС‚РѕРЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (39, 'eu', 'Р‘Р°СЃРєСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (40, 'fa', 'РџРµСЂСЃРёРґСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (41, 'ff', 'Р¤СѓР»Р°С…');
INSERT INTO languagecodeclassifier VALUES (42, 'fi', 'Р¤РёРЅСЃРєРёР№В (Suomi)');
INSERT INTO languagecodeclassifier VALUES (43, 'fj', 'Р¤РёРґР¶Рё');
INSERT INTO languagecodeclassifier VALUES (44, 'fo', 'Р¤Р°СЂРµСЂСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (45, 'fr', 'Р¤СЂР°РЅС†СѓР·СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (46, 'fy', 'Р¤СЂРёР·СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (47, 'ga', 'Р�СЂР»Р°РЅРґСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (48, 'gd', 'Р“СЌР»СЊСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (49, 'gl', 'Р“Р°Р»РёСЃРёР№СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (50, 'gn', 'Р“СѓР°СЂР°РЅРё');
INSERT INTO languagecodeclassifier VALUES (51, 'gu', 'Р“СѓРґР¶Р°СЂР°С‚Рё');
INSERT INTO languagecodeclassifier VALUES (52, 'gv', 'РњСЌРЅСЃРєРёР№ (РњСЌРЅРєСЃРєРёР№)');
INSERT INTO languagecodeclassifier VALUES (53, 'ha', 'РҐР°СѓСЃР°');
INSERT INTO languagecodeclassifier VALUES (54, 'he', 'Р�РІСЂРёС‚');
INSERT INTO languagecodeclassifier VALUES (55, 'hi', 'РҐРёРЅРґРё');
INSERT INTO languagecodeclassifier VALUES (56, 'ho', 'РҐРёСЂРёРјРѕС‚Сѓ');
INSERT INTO languagecodeclassifier VALUES (57, 'hr', 'РҐРѕСЂРІР°С‚СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (58, 'hu', 'Р’РµРЅРіРµСЂСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (59, 'hy', 'РђСЂРјСЏРЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (60, 'hz', 'Р“РµСЂРµСЂРѕ');
INSERT INTO languagecodeclassifier VALUES (61, 'ia', 'Р�РЅС‚РµСЂР»РёРЅРіРІР°');
INSERT INTO languagecodeclassifier VALUES (62, 'id', 'Р�РЅРґРѕРЅРµР·РёР№СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (63, 'ie', 'Р�РЅС‚РµСЂР»РёРЅРіРІРµ');
INSERT INTO languagecodeclassifier VALUES (64, 'ig', 'Р�РіР±Рѕ');
INSERT INTO languagecodeclassifier VALUES (65, 'ik', 'Р�РЅСѓРїРёР°Рє');
INSERT INTO languagecodeclassifier VALUES (66, 'is', 'Р�СЃР»Р°РЅРґСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (67, 'it', 'Р�С‚Р°Р»СЊСЏРЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (68, 'iu', 'Р�РЅСѓРєС‚РёС‚СѓС‚');
INSERT INTO languagecodeclassifier VALUES (69, 'ja', 'РЇРїРѕРЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (70, 'jv', 'РЇРІР°РЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (71, 'ka', 'Р“СЂСѓР·РёРЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (72, 'kg', 'РљРѕРЅРіРѕ');
INSERT INTO languagecodeclassifier VALUES (73, 'ki', 'РљРёРєСѓР№СЋ');
INSERT INTO languagecodeclassifier VALUES (74, 'kj', 'РљРёРЅСЊСЏРјР°');
INSERT INTO languagecodeclassifier VALUES (75, 'kk', 'РљР°Р·Р°С…СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (76, 'kl', 'Р“СЂРµРЅР»Р°РЅРґСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (77, 'km', 'РљС…РјРµСЂСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (78, 'kn', 'РљР°РЅРЅР°РґР°');
INSERT INTO languagecodeclassifier VALUES (79, 'ko', 'РљРѕСЂРµР№СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (80, 'kr', 'РљР°РЅСѓСЂРё');
INSERT INTO languagecodeclassifier VALUES (81, 'ks', 'РљР°С€РјРёСЂРё');
INSERT INTO languagecodeclassifier VALUES (82, 'ku', 'РљСѓСЂРґСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (83, 'kv', 'РљРѕРјРё');
INSERT INTO languagecodeclassifier VALUES (84, 'kw', 'РљРѕСЂРЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (85, 'ky', 'РљРёСЂРіРёР·СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (86, 'la', 'Р›Р°С‚РёРЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (87, 'lb', 'Р›СЋРєСЃРµРјР±СѓСЂРіСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (88, 'lg', 'Р“Р°РЅРґР°');
INSERT INTO languagecodeclassifier VALUES (89, 'ln', 'Р›РёРЅРіР°Р»Р°');
INSERT INTO languagecodeclassifier VALUES (90, 'lo', 'Р›Р°РѕСЃСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (91, 'lt', 'Р›РёС‚РѕРІСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (92, 'lu', 'Р›СѓР±Р°-РєР°С‚Р°РЅРіР°');
INSERT INTO languagecodeclassifier VALUES (93, 'lv', 'Р›Р°С‚С‹С€СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (94, 'mg', 'РњР°Р»Р°РіР°СЃРёР№СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (95, 'mh', 'РњР°СЂС€Р°Р»Р»СЊСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (96, 'mi', 'РњР°РѕСЂРё');
INSERT INTO languagecodeclassifier VALUES (97, 'mk', 'РњР°РєРµРґРѕРЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (98, 'ml', 'РњР°Р»Р°СЏР»Р°Рј');
INSERT INTO languagecodeclassifier VALUES (99, 'mn', 'РњРѕРЅРіРѕР»СЊСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (100, 'mr', 'РњР°СЂР°С‚С…Рё');
INSERT INTO languagecodeclassifier VALUES (101, 'ms', 'РњР°Р»Р°Р№СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (102, 'mt', 'РњР°Р»СЊС‚РёР№СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (103, 'my', 'Р‘РёСЂРјР°РЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (104, 'na', 'РќР°СѓСЂСѓ');
INSERT INTO languagecodeclassifier VALUES (105, 'nd', 'РќРґРµР±РµР»Рµ СЃРµРІРµСЂРЅС‹Р№');
INSERT INTO languagecodeclassifier VALUES (106, 'ne', 'РќРµРїР°Р»СЊСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (107, 'ng', 'РќРґСѓРЅРіР°');
INSERT INTO languagecodeclassifier VALUES (108, 'nl', 'РќРёРґРµСЂР»Р°РЅРґСЃРєРёР№ (Р“РѕР»Р»Р°РЅРґСЃРєРёР№)');
INSERT INTO languagecodeclassifier VALUES (109, 'nn', 'РќСЋРЅРѕСЂСЃРє (РЅРѕРІРѕРЅРѕСЂРІРµР¶СЃРєРёР№)');
INSERT INTO languagecodeclassifier VALUES (110, 'no', 'РќРѕСЂРІРµР¶СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (111, 'nr', 'РќРґРµР±РµР»Рµ СЋР¶РЅС‹Р№');
INSERT INTO languagecodeclassifier VALUES (112, 'nv', 'РќР°РІР°С…Рѕ');
INSERT INTO languagecodeclassifier VALUES (113, 'ny', 'РќСЊСЏРЅРґР¶Р°');
INSERT INTO languagecodeclassifier VALUES (114, 'oc', 'РћРєСЃРёС‚Р°РЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (115, 'oj', 'РћРґР¶РёР±РІРµ');
INSERT INTO languagecodeclassifier VALUES (116, 'om', 'РћСЂРѕРјРѕ');
INSERT INTO languagecodeclassifier VALUES (117, 'or', 'РћСЂРёСЏ');
INSERT INTO languagecodeclassifier VALUES (118, 'os', 'РћСЃРµС‚РёРЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (119, 'pa', 'РџРµРЅРґР¶Р°Р±СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (120, 'pi', 'РџР°Р»Рё');
INSERT INTO languagecodeclassifier VALUES (121, 'pl', 'РџРѕР»СЊСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (122, 'ps', 'РџСѓС€С‚Сѓ');
INSERT INTO languagecodeclassifier VALUES (123, 'pt', 'РџРѕСЂС‚СѓРіР°Р»СЊСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (124, 'qu', 'РљРµС‡СѓР°');
INSERT INTO languagecodeclassifier VALUES (125, 'rm', 'Р РµС‚РѕСЂРѕРјР°РЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (126, 'rn', 'Р СѓРЅРґРё');
INSERT INTO languagecodeclassifier VALUES (127, 'ro', 'Р СѓРјС‹РЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (128, 'ru', 'Р СѓСЃСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (129, 'rw', 'Р СѓР°РЅРґР°');
INSERT INTO languagecodeclassifier VALUES (130, 'sa', 'РЎР°РЅСЃРєСЂРёС‚');
INSERT INTO languagecodeclassifier VALUES (131, 'sc', 'РЎР°СЂРґРёРЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (132, 'sd', 'РЎРёРЅРґС…Рё');
INSERT INTO languagecodeclassifier VALUES (133, 'sg', 'РЎР°РЅРіРѕ');
INSERT INTO languagecodeclassifier VALUES (134, 'si', 'РЎРёРЅРіР°Р»СЊСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (135, 'sk', 'РЎР»РѕРІР°С†РєРёР№');
INSERT INTO languagecodeclassifier VALUES (136, 'sl', 'РЎР»РѕРІРµРЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (137, 'sm', 'РЎР°РјРѕР°РЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (138, 'sn', 'РЁРѕРЅР°');
INSERT INTO languagecodeclassifier VALUES (139, 'so', 'РЎРѕРјР°Р»Рё');
INSERT INTO languagecodeclassifier VALUES (140, 'sq', 'РђР»Р±Р°РЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (141, 'sr', 'РЎРµСЂР±СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (142, 'ss', 'РЎРІР°Р·Рё');
INSERT INTO languagecodeclassifier VALUES (143, 'st', 'РЎРѕС‚Рѕ СЋР¶РЅС‹Р№');
INSERT INTO languagecodeclassifier VALUES (144, 'su', 'РЎСѓРЅРґР°РЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (145, 'sv', 'РЁРІРµРґСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (146, 'sw', 'РЎСѓР°С…РёР»Рё');
INSERT INTO languagecodeclassifier VALUES (147, 'ta', 'РўР°РјРёР»СЊСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (148, 'te', 'РўРµР»СѓРіСѓ');
INSERT INTO languagecodeclassifier VALUES (149, 'tg', 'РўР°РґР¶РёРєСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (150, 'th', 'РўР°Р№СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (151, 'ti', 'РўРёРіСЂРёРЅСЊСЏ');
INSERT INTO languagecodeclassifier VALUES (152, 'tk', 'РўСѓСЂРєРјРµРЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (153, 'tl', 'РўР°РіР°Р»СЊСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (154, 'tn', 'РўСЃРІР°РЅР°');
INSERT INTO languagecodeclassifier VALUES (155, 'to', 'РўРѕРЅРіР°РЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (156, 'tr', 'РўСѓСЂРµС†РєРёР№');
INSERT INTO languagecodeclassifier VALUES (157, 'ts', 'РўСЃРѕРЅРіР°');
INSERT INTO languagecodeclassifier VALUES (158, 'tt', 'РўР°С‚Р°СЂСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (159, 'tw', 'РўРІРё');
INSERT INTO languagecodeclassifier VALUES (160, 'ty', 'РўР°РёС‚СЏРЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (161, 'ug', 'РЈР№РіСѓСЂСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (162, 'uk', 'РЈРєСЂР°РёРЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (163, 'ur', 'РЈСЂРґСѓ');
INSERT INTO languagecodeclassifier VALUES (164, 'uz', 'РЈР·Р±РµРєСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (165, 've', 'Р’РµРЅРґР°');
INSERT INTO languagecodeclassifier VALUES (166, 'vi', 'Р’СЊРµС‚РЅР°РјСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (167, 'vo', 'Р’РѕР»Р°РїСЋРє');
INSERT INTO languagecodeclassifier VALUES (168, 'wo', 'Р’РѕР»РѕС„');
INSERT INTO languagecodeclassifier VALUES (169, 'xh', 'РљРѕСЃР°');
INSERT INTO languagecodeclassifier VALUES (170, 'yi', 'Р�РґРёС€');
INSERT INTO languagecodeclassifier VALUES (171, 'yo', 'Р™РѕСЂСѓР±Р°');
INSERT INTO languagecodeclassifier VALUES (172, 'za', 'Р§Р¶СѓР°РЅСЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (173, 'zh', 'РљРёС‚Р°Р№СЃРєРёР№');
INSERT INTO languagecodeclassifier VALUES (174, 'zu', 'Р—СѓР»Сѓ');


--
-- TOC entry 4597 (class 0 OID 19047)
-- Dependencies: 291
-- Data for Name: measurementunitclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO measurementunitclassifier VALUES (1, '166', 'РљР�Р›РћР“Р РђРњРњ', 'РљР“', '');
INSERT INTO measurementunitclassifier VALUES (2, '797', 'РЎРўРћ РЁРўРЈРљ', '100 РЁРў', '');
INSERT INTO measurementunitclassifier VALUES (3, '246', '1000 РљР�Р›РћР’РђРўРў-Р§РђРЎ', '1000 РљР’Рў*Р§', '');
INSERT INTO measurementunitclassifier VALUES (4, '130', '1000 Р›Р�РўР РћР’', '1000 Р›', '');
INSERT INTO measurementunitclassifier VALUES (5, '114', '1000 РљРЈР‘Р�Р§Р•РЎРљР�РҐ РњР•РўР РћР’', '1000 Рњ3', '');
INSERT INTO measurementunitclassifier VALUES (6, '798', 'РўР«РЎРЇР§Рђ РЁРўРЈРљ', '1000 РЁРў', '');
INSERT INTO measurementunitclassifier VALUES (7, '163', 'Р“Р РђРњРњ', 'Р“', '');
INSERT INTO measurementunitclassifier VALUES (8, '306', 'Р“Р РђРњРњ Р”Р•Р›РЇР©Р�РҐРЎРЇ Р�Р—РћРўРћРџРћР’', 'Р“ Р”/Р�', '');
INSERT INTO measurementunitclassifier VALUES (9, '162', 'РњР•РўР Р�Р§Р•РЎРљР�Р™ РљРђР РђРў(1РљРђР РђРў=2*10(-4)РљР“', 'РљРђР ', '');
INSERT INTO measurementunitclassifier VALUES (10, '845', 'РљР�Р›РћР“Р РђРњРњ РЎРЈРҐРћР“Рћ РќРђ 90 % Р’Р•Р©Р•РЎРўР’Рђ', 'РљР“ 90% РЎ/Р’', '');
INSERT INTO measurementunitclassifier VALUES (11, '841', 'РљР�Р›РћР“Р РђРњРњ РџР•Р РћРљРЎР�Р”Рђ Р’РћР”РћР РћР”Рђ', 'РљР“ H2O2', '');
INSERT INTO measurementunitclassifier VALUES (12, '852', 'РљР�Р›РћР“Р РђРњРњ РћРљРЎР�Р”Рђ РљРђР›Р�РЇ', 'РљР“ K2O', '');
INSERT INTO measurementunitclassifier VALUES (13, '859', 'РљР�Р›РћР“Р РђРњРњ Р“Р�Р”Р РћРљРЎР�Р”Рђ РљРђР›Р�РЇ', 'РљР“ KOH', '');
INSERT INTO measurementunitclassifier VALUES (14, '861', 'РљР�Р›РћР“Р РђРњРњ РђР—РћРўРђ', 'РљР“ N', '');
INSERT INTO measurementunitclassifier VALUES (15, '863', 'РљР�Р›РћР“Р РђРњРњ Р“Р�Р”Р РћРљРЎР�Р”Рђ РќРђРўР Р�РЇ', 'РљР“ NAOH', '');
INSERT INTO measurementunitclassifier VALUES (16, '865', 'РљР�Р›РћР“Р РђРњРњ РџРЇРўР�РћРљР�РЎР� Р¤РћРЎР¤РћР Рђ', 'РљР“ P2O5', '');
INSERT INTO measurementunitclassifier VALUES (17, '867', 'РљР�Р›РћР“Р РђРњРњ РЈР РђРќРђ', 'РљР“ U', '');
INSERT INTO measurementunitclassifier VALUES (18, '305', 'РљР®Р Р�', 'РљР�', '');
INSERT INTO measurementunitclassifier VALUES (19, '112', 'Р›Р�РўР ', 'Р›', '');
INSERT INTO measurementunitclassifier VALUES (20, '831', 'Р›Р�РўР  Р§Р�РЎРўРћР“Рћ (100%) РЎРџР�Р РўРђ', 'Р› 100% РЎРџР�Р РўРђ', '');
INSERT INTO measurementunitclassifier VALUES (21, '6', 'РњР•РўР ', 'Рњ', '');
INSERT INTO measurementunitclassifier VALUES (22, '55', 'РљР’РђР”Р РђРўРќР«Р™ РњР•РўР ', 'Рњ2', '');
INSERT INTO measurementunitclassifier VALUES (23, '113', 'РљРЈР‘Р�Р§Р•РЎРљР�Р™ РњР•РўР ', 'Рњ3', '');
INSERT INTO measurementunitclassifier VALUES (24, '715', 'РџРђР Рђ', 'РџРђР ', '');
INSERT INTO measurementunitclassifier VALUES (25, '185', 'Р“Р РЈР—РћРџРћР”РЄР•РњРќРћРЎРўР¬ Р’ РўРћРќРќРђРҐ', 'Рў Р“Р Рџ', '');
INSERT INTO measurementunitclassifier VALUES (26, '796', 'РЁРўРЈРљРђ', 'РЁРў', '');


--
-- TOC entry 4599 (class 0 OID 19055)
-- Dependencies: 293
-- Data for Name: measurementunitcodeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO measurementunitcodeclassifier VALUES (1, '111', 'РЎРњ3');
INSERT INTO measurementunitcodeclassifier VALUES (2, '4', 'РЎРњ');
INSERT INTO measurementunitcodeclassifier VALUES (3, '112a', 'Р”Рњ3');
INSERT INTO measurementunitcodeclassifier VALUES (4, '5', 'Р”Рњ');
INSERT INTO measurementunitcodeclassifier VALUES (5, '163', 'Р“');
INSERT INTO measurementunitcodeclassifier VALUES (6, '166', 'РљР“');
INSERT INTO measurementunitcodeclassifier VALUES (7, '8', 'РљРњ');
INSERT INTO measurementunitcodeclassifier VALUES (8, '112', 'Р›');
INSERT INTO measurementunitcodeclassifier VALUES (9, '161', 'РњР“');
INSERT INTO measurementunitcodeclassifier VALUES (10, '111a', 'РњР›');
INSERT INTO measurementunitcodeclassifier VALUES (11, '110', 'РњРњ3');
INSERT INTO measurementunitcodeclassifier VALUES (12, '3', 'РњРњ');
INSERT INTO measurementunitcodeclassifier VALUES (13, '113', 'Рњ3');
INSERT INTO measurementunitcodeclassifier VALUES (14, '6', 'Рњ');
INSERT INTO measurementunitcodeclassifier VALUES (15, '796', 'РЁРў');


--
-- TOC entry 4601 (class 0 OID 19063)
-- Dependencies: 295
-- Data for Name: measuresensurecompliancecustomstransitprocedure; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (1, '00', 'Р‘РµР· РїСЂРёРјРµРЅРµРЅРёСЏ РјРµСЂС‹ РѕР±РµСЃРїРµС‡РµРЅРёСЏ СЃРѕР±Р»СЋРґРµРЅРёСЏ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ С‚СЂР°РЅР·РёС‚Р°, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј СЃР»СѓС‡Р°РµРІ, СѓРєР°Р·Р°РЅРЅС‹С… РІ РїРѕР·РёС†РёСЏС… СЃ РєРѕРґР°РјРё 07, 08, 60 вЂ“ 63', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (2, '01', 'РћР±РµСЃРїРµС‡РµРЅРёРµ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ РґРµРЅРµР¶РЅС‹РјРё СЃСЂРµРґСЃС‚РІР°РјРё (РґРµРЅСЊРіР°РјРё)', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (3, '02', 'РћР±РµСЃРїРµС‡РµРЅРёРµ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ Р±Р°РЅРєРѕРІСЃРєРѕР№ РіР°СЂР°РЅС‚РёРµР№', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (4, '03', 'РћР±РµСЃРїРµС‡РµРЅРёРµ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ РїРѕСЂСѓС‡РёС‚РµР»СЊСЃС‚РІРѕРј', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (5, '04', 'РћР±РµСЃРїРµС‡РµРЅРёРµ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ Р·Р°Р»РѕРіРѕРј РёРјСѓС‰РµСЃС‚РІР°', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (6, '05', 'РўР°РјРѕР¶РµРЅРЅРѕРµ СЃРѕРїСЂРѕРІРѕР¶РґРµРЅРёРµ РґРѕР»Р¶РЅРѕСЃС‚РЅС‹РјРё Р»РёС†Р°РјРё С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕСЂРіР°РЅРѕРІ', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (7, '06', 'РўР°РјРѕР¶РµРЅРЅРѕРµ СЃРѕРїСЂРѕРІРѕР¶РґРµРЅРёРµ РёРЅС‹РјРё РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (8, '07', 'РџРµСЂРµРІРѕР·РєР° С‚РѕРІР°СЂРѕРІ РїСЂРё С‚Р°РјРѕР¶РµРЅРЅРѕРј РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРё СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Рј СЌРєРѕРЅРѕРјРёС‡РµСЃРєРёРј РѕРїРµСЂР°С‚РѕСЂРѕРј', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (9, '08', 'РџРµСЂРµРІРѕР·РєР° С‚РѕРІР°СЂРѕРІ РїСЂРё С‚Р°РјРѕР¶РµРЅРЅРѕРј РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРё С‚Р°РјРѕР¶РµРЅРЅС‹Рј РїРµСЂРµРІРѕР·С‡РёРєРѕРј', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (10, '09', 'РЈСЃС‚Р°РЅРѕРІР»РµРЅРёРµ РјР°СЂС€СЂСѓС‚Р° РїРµСЂРµРІРѕР·РєРё', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (11, '60', 'РџРµСЂРµРІРѕР·РєР° С‚РѕРІР°СЂРѕРІ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РѕС„РёС†РёР°Р»СЊРЅРѕРіРѕ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ РґРёРїР»РѕРјР°С‚РёС‡РµСЃРєРёРјРё РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІР°РјРё Рё РєРѕРЅСЃСѓР»СЊСЃРєРёРјРё СѓС‡СЂРµР¶РґРµРЅРёСЏРјРё РёРЅРѕСЃС‚СЂР°РЅРЅС‹С… РіРѕСЃСѓРґР°СЂСЃС‚РІ, Р° С‚Р°РєР¶Рµ РїСЂРёСЂР°РІРЅРµРЅРЅС‹РјРё Рє РЅРёРј РїРѕ РѕР±СЉРµРјСѓ РїСЂРёРІРёР»РµРіРёР№ РѕСЂРіР°РЅР°РјРё Рё (РёР»Рё) РјРёСЃСЃРёСЏРјРё РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (12, '61', 'РџРµСЂРµРІРѕР·РєР° С‚РѕРІР°СЂРѕРІ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ Р»РёС‡РЅРѕРіРѕ РїРѕР»СЊР·РѕРІР°РЅРёСЏ, РІРєР»СЋС‡Р°СЏ С‚РѕРІР°СЂС‹ РґР»СЏ РїРµСЂРІРѕРЅР°С‡Р°Р»СЊРЅРѕРіРѕ РѕР±Р·Р°РІРµРґРµРЅРёСЏ, С‡Р»РµРЅРѕРІ РїРµСЂСЃРѕРЅР°Р»Р° РґРёРїР»РѕРјР°С‚РёС‡РµСЃРєРѕРіРѕ РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІР°, СЂР°Р±РѕС‚РЅРёРєРѕРІ РєРѕРЅСЃСѓР»СЊСЃРєРѕРіРѕ СѓС‡СЂРµР¶РґРµРЅРёСЏ РёРЅРѕСЃС‚СЂР°РЅРЅРѕРіРѕ РіРѕСЃСѓРґР°СЂСЃС‚РІР° РёР»Рё РїРµСЂСЃРѕРЅР°Р»Р° РїСЂРёСЂР°РІРЅРµРЅРЅС‹С… Рє РЅРёРј РїРѕ РѕР±СЉРµРјСѓ РїСЂРёРІРёР»РµРіРёР№ РѕСЂРіР°РЅРѕРІ Рё (РёР»Рё) РјРёСЃСЃРёР№ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹С… РѕСЂРіР°РЅРёР·Р°С†РёР№, Р° С‚Р°РєР¶Рµ РїСЂРѕР¶РёРІР°СЋС‰РёС… РІРјРµСЃС‚Рµ СЃ РЅРёРјРё С‡Р»РµРЅРѕРІ РёС… СЃРµРјРµР№, РµСЃР»Рё РѕРЅРё РЅРµ РїСЂРѕР¶РёРІР°СЋС‚ РІ РіРѕСЃСѓРґР°СЂСЃС‚РІРµ РїСЂРµР±С‹РІР°РЅРёСЏ РїРѕСЃС‚РѕСЏРЅРЅРѕ Рё РЅРµ СЏРІР»СЏСЋС‚СЃСЏ РіСЂР°Р¶РґР°РЅР°РјРё РіРѕСЃСѓРґР°СЂСЃС‚РІР° РїСЂРµР±С‹РІР°РЅРёСЏ', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (13, '62', 'РџРµСЂРµРІРѕР·РєР° С‚РѕРІР°СЂРѕРІ, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹С… РґР»СЏ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ РІ РєСѓР»СЊС‚СѓСЂРЅС‹С…, РЅР°СѓС‡РЅРѕ-РёСЃСЃР»РµРґРѕРІР°С‚РµР»СЊСЃРєРёС… С†РµР»СЏС…, РїСЂРѕРІРµРґРµРЅРёСЏ СЃРїРѕСЂС‚РёРІРЅС‹С… СЃРѕСЂРµРІРЅРѕРІР°РЅРёР№ Р»РёР±Рѕ РїРѕРґРіРѕС‚РѕРІРєРё Рє РЅРёРј, Р»РёРєРІРёРґР°С†РёРё РїРѕСЃР»РµРґСЃС‚РІРёР№ СЃС‚РёС…РёР№РЅС‹С… Р±РµРґСЃС‚РІРёР№, Р°РІР°СЂРёР№, РєР°С‚Р°СЃС‚СЂРѕС„, РѕР±РµСЃРїРµС‡РµРЅРёСЏ РѕР±РѕСЂРѕРЅРѕСЃРїРѕСЃРѕР±РЅРѕСЃС‚Рё Рё РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕР№ (РЅР°С†РёРѕРЅР°Р»СЊРЅРѕР№) Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё РіРѕСЃСѓРґР°СЂСЃС‚РІ вЂ“ С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РїРµСЂРµРѕСЃРЅР°С‰РµРЅРёСЏ РёС… РІРѕРѕСЂСѓР¶РµРЅРЅС‹С… СЃРёР», Р·Р°С‰РёС‚С‹ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹С… РіСЂР°РЅРёС† РіРѕСЃСѓРґР°СЂСЃС‚РІ вЂ“ С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹РјРё РѕСЂРіР°РЅР°РјРё РіРѕСЃСѓРґР°СЂСЃС‚РІ вЂ“ С‡Р»РµРЅРѕРІ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (14, '63', 'Р‘РµР· РїСЂРёРјРµРЅРµРЅРёСЏ РјРµСЂС‹ РѕР±РµСЃРїРµС‡РµРЅРёСЏ СЃРѕР±Р»СЋРґРµРЅРёСЏ С‚Р°РјРѕР¶РµРЅРЅРѕРіРѕ С‚СЂР°РЅР·РёС‚Р°, РµСЃР»Рё СЃСѓРјРјР° РїРѕРґР»РµР¶Р°С‰РёС… СѓРїР»Р°С‚Рµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ Рё РїСЂРѕС†РµРЅС‚РѕРІ РЅРµ РїСЂРµРІС‹С€Р°РµС‚ СЃСѓРјРјСѓ, СЌРєРІРёРІР°Р»РµРЅС‚РЅСѓСЋ 500 (РїСЏС‚РёСЃС‚Р°Рј) РµРІСЂРѕ РїРѕ РєСѓСЂСЃСѓ РІР°Р»СЋС‚, РґРµР№СЃС‚РІСѓСЋС‰РµРјСѓ РЅР° РґРµРЅСЊ СЂРµРіРёСЃС‚СЂР°С†РёРё С‚СЂР°РЅР·РёС‚РЅРѕР№ РґРµРєР»Р°СЂР°С†РёРё', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (15, '91', 'РћР±РµСЃРїРµС‡РµРЅРёРµ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ РґРµРЅРµР¶РЅС‹РјРё СЃСЂРµРґСЃС‚РІР°РјРё (РґРµРЅСЊРіР°РјРё) СЃ СѓСЃС‚Р°РЅРѕРІР»РµРЅРёРµРј РјР°СЂС€СЂСѓС‚Р° РїРµСЂРµРІРѕР·РєРё', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (16, '92', 'РћР±РµСЃРїРµС‡РµРЅРёРµ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ Р±Р°РЅРєРѕРІСЃРєРѕР№ РіР°СЂР°РЅС‚РёРµР№ СЃ СѓСЃС‚Р°РЅРѕРІР»РµРЅРёРµРј РјР°СЂС€СЂСѓС‚Р° РїРµСЂРµРІРѕР·РєРё', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (17, '93', 'РћР±РµСЃРїРµС‡РµРЅРёРµ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ РїРѕСЂСѓС‡РёС‚РµР»СЊСЃС‚РІРѕРј СЃ СѓСЃС‚Р°РЅРѕРІР»РµРЅРёРµРј РјР°СЂС€СЂСѓС‚Р° РїРµСЂРµРІРѕР·РєРё', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (18, '94', 'РћР±РµСЃРїРµС‡РµРЅРёРµ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ Р·Р°Р»РѕРіРѕРј РёРјСѓС‰РµСЃС‚РІР° СЃ СѓСЃС‚Р°РЅРѕРІР»РµРЅРёРµРј РјР°СЂС€СЂСѓС‚Р° РїРµСЂРµРІРѕР·РєРё', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (19, '95', 'РўР°РјРѕР¶РµРЅРЅРѕРµ СЃРѕРїСЂРѕРІРѕР¶РґРµРЅРёРµ РґРѕР»Р¶РЅРѕСЃС‚РЅС‹РјРё Р»РёС†Р°РјРё С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕСЂРіР°РЅРѕРІ СЃ СѓСЃС‚Р°РЅРѕРІР»РµРЅРёРµРј РјР°СЂС€СЂСѓС‚Р° РїРµСЂРµРІРѕР·РєРё', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (20, '96', 'РўР°РјРѕР¶РµРЅРЅРѕРµ СЃРѕРїСЂРѕРІРѕР¶РґРµРЅРёРµ РёРЅС‹РјРё РѕСЂРіР°РЅРёР·Р°С†РёСЏРјРё СЃ СѓСЃС‚Р°РЅРѕРІР»РµРЅРёРµРј РјР°СЂС€СЂСѓС‚Р° РїРµСЂРµРІРѕР·РєРё', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (21, '97', 'РџРµСЂРµРІРѕР·РєР° С‚РѕРІР°СЂРѕРІ РїСЂРё С‚Р°РјРѕР¶РµРЅРЅРѕРј РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРё СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Рј СЌРєРѕРЅРѕРјРёС‡РµСЃРєРёРј РѕРїРµСЂР°С‚РѕСЂРѕРј СЃ СѓСЃС‚Р°РЅРѕРІР»РµРЅРёРµРј РјР°СЂС€СЂСѓС‚Р° РїРµСЂРµРІРѕР·РєРё', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (22, '98', 'РџРµСЂРµРІРѕР·РєР° С‚РѕРІР°СЂРѕРІ РїСЂРё С‚Р°РјРѕР¶РµРЅРЅРѕРј РґРµРєР»Р°СЂРёСЂРѕРІР°РЅРёРё С‚Р°РјРѕР¶РµРЅРЅС‹Рј РїРµСЂРµРІРѕР·С‡РёРєРѕРј СЃ СѓСЃС‚Р°РЅРѕРІР»РµРЅРёРµРј РјР°СЂС€СЂСѓС‚Р° РїРµСЂРµРІРѕР·РєРё', '');
INSERT INTO measuresensurecompliancecustomstransitprocedure VALUES (23, 'РҐРҐ*', 'Р�РЅС‹Рµ СЃРїРѕСЃРѕР±С‹ РѕР±РµСЃРїРµС‡РµРЅРёСЏ СѓРїР»Р°С‚С‹ С‚Р°РјРѕР¶РµРЅРЅС‹С… РїРѕС€Р»РёРЅ, РЅР°Р»РѕРіРѕРІ', '');


--
-- TOC entry 4603 (class 0 OID 19071)
-- Dependencies: 297
-- Data for Name: nsicountry; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO nsicountry VALUES (1, 'AD', 'РђРЅРґРѕСЂСЂР°');
INSERT INTO nsicountry VALUES (2, 'AF', 'РђС„РіР°РЅРёСЃС‚Р°РЅ');
INSERT INTO nsicountry VALUES (3, 'AG', 'РђРЅС‚РёРіСѓР° Рё Р‘Р°СЂР±СѓРґР°');
INSERT INTO nsicountry VALUES (4, 'AI', 'РђРЅРіРёР»СЊСЏ');
INSERT INTO nsicountry VALUES (5, 'AL', 'РђР»Р±Р°РЅРёСЏ');
INSERT INTO nsicountry VALUES (6, 'AM', 'РђСЂРјРµРЅРёСЏ');
INSERT INTO nsicountry VALUES (7, 'AN', 'РќРёРґРµСЂР»Р°РЅРґСЃРєРёРµ РђРЅС‚РёР»СЊСЃРєРёРµ РѕСЃС‚СЂРѕРІР°');
INSERT INTO nsicountry VALUES (8, 'AO', 'РђРЅРіРѕР»Р°');
INSERT INTO nsicountry VALUES (9, 'AQ', 'РђРЅС‚Р°СЂРєС‚РёРґР°');
INSERT INTO nsicountry VALUES (10, 'AR', 'РђСЂРіРµРЅС‚РёРЅР°');
INSERT INTO nsicountry VALUES (11, 'AS', 'РђРјРµСЂРёРєР°РЅСЃРєРѕРµ РЎР°РјРѕР°');
INSERT INTO nsicountry VALUES (12, 'AT', 'РђРІСЃС‚СЂРёСЏ');
INSERT INTO nsicountry VALUES (13, 'AU', 'РђРІСЃС‚СЂР°Р»РёСЏ');
INSERT INTO nsicountry VALUES (14, 'AW', 'РђСЂСѓР±Р°');
INSERT INTO nsicountry VALUES (15, 'AX', 'Р­Р»Р°РЅРґСЃРєРёРµ РѕСЃС‚СЂРѕРІР°');
INSERT INTO nsicountry VALUES (16, 'AZ', 'РђР·РµСЂР±Р°Р№РґР¶Р°РЅ');
INSERT INTO nsicountry VALUES (17, 'BA', 'Р‘РѕСЃРЅРёСЏ Рё Р“РµСЂС†РµРіРѕРІРёРЅР°');
INSERT INTO nsicountry VALUES (18, 'BB', 'Р‘Р°СЂР±Р°РґРѕСЃ');
INSERT INTO nsicountry VALUES (19, 'BD', 'Р‘Р°РЅРіР»Р°РґРµС€');
INSERT INTO nsicountry VALUES (20, 'BE', 'Р‘РµР»СЊРіРёСЏ');
INSERT INTO nsicountry VALUES (21, 'BF', 'Р‘СѓСЂРєРёРЅР°-Р¤Р°СЃРѕ');
INSERT INTO nsicountry VALUES (22, 'BG', 'Р‘РѕР»РіР°СЂРёСЏ');
INSERT INTO nsicountry VALUES (23, 'BH', 'Р‘Р°С…СЂРµР№РЅ');
INSERT INTO nsicountry VALUES (24, 'BI', 'Р‘СѓСЂСѓРЅРґРё');
INSERT INTO nsicountry VALUES (25, 'BJ', 'Р‘РµРЅРёРЅ');
INSERT INTO nsicountry VALUES (26, 'BL', 'РЎРµРЅ-Р‘Р°СЂС‚РµР»РµРјРё');
INSERT INTO nsicountry VALUES (27, 'BM', 'Р‘РµСЂРјСѓРґС‹');
INSERT INTO nsicountry VALUES (28, 'BN', 'Р‘СЂСѓРЅРµР№-Р”Р°СЂСѓСЃСЃР°Р»Р°Рј');
INSERT INTO nsicountry VALUES (29, 'BO', 'Р‘РѕР»РёРІРёСЏ, РњРЅРѕРіРѕРЅР°С†РёРѕРЅР°Р»СЊРЅРѕРµ Р“РѕСЃСѓРґР°СЂСЃС‚РІРѕ');
INSERT INTO nsicountry VALUES (30, 'BQ', 'Р‘РѕРЅСЌР№СЂ, РЎРёРЅС‚-Р­СЃС‚Р°С‚РёСѓСЃ Рё РЎР°Р±Р°');
INSERT INTO nsicountry VALUES (31, 'BR', 'Р‘СЂР°Р·РёР»РёСЏ');
INSERT INTO nsicountry VALUES (32, 'BS', 'Р‘Р°РіР°РјС‹');
INSERT INTO nsicountry VALUES (33, 'BT', 'Р‘СѓС‚Р°РЅ');
INSERT INTO nsicountry VALUES (34, 'BV', 'РћСЃС‚СЂРѕРІ Р‘СѓРІРµ');
INSERT INTO nsicountry VALUES (35, 'BW', 'Р‘РѕС‚СЃРІР°РЅР°');
INSERT INTO nsicountry VALUES (36, 'BY', 'Р‘РµР»Р°СЂСѓСЃСЊ');
INSERT INTO nsicountry VALUES (37, 'BZ', 'Р‘РµР»РёР·');
INSERT INTO nsicountry VALUES (38, 'CA', 'РљР°РЅР°РґР°');
INSERT INTO nsicountry VALUES (39, 'CC', 'РљРѕРєРѕСЃРѕРІС‹Рµ (РљРёР»РёРЅРі) РѕСЃС‚СЂРѕРІР°');
INSERT INTO nsicountry VALUES (40, 'CD', 'РљРѕРЅРіРѕ, Р”РµРјРѕРєСЂР°С‚РёС‡РµСЃРєР°СЏ Р РµСЃРїСѓР±Р»РёРєР°');
INSERT INTO nsicountry VALUES (41, 'CF', 'Р¦РµРЅС‚СЂР°Р»СЊРЅРѕ-РђС„СЂРёРєР°РЅСЃРєР°СЏ Р РµСЃРїСѓР±Р»РёРєР°');
INSERT INTO nsicountry VALUES (42, 'CG', 'РљРѕРЅРіРѕ');
INSERT INTO nsicountry VALUES (43, 'CK', 'РћСЃС‚СЂРѕРІР° РљСѓРєР°');
INSERT INTO nsicountry VALUES (44, 'CL', 'Р§РёР»Рё');
INSERT INTO nsicountry VALUES (45, 'CM', 'РљР°РјРµСЂСѓРЅ');
INSERT INTO nsicountry VALUES (46, 'CN', 'РљРёС‚Р°Р№');
INSERT INTO nsicountry VALUES (47, 'CO', 'РљРѕР»СѓРјР±РёСЏ');
INSERT INTO nsicountry VALUES (48, 'CR', 'РљРѕСЃС‚Р°-Р РёРєР°');
INSERT INTO nsicountry VALUES (49, 'CS', 'РЎРµСЂР±РёСЏ Рё Р§РµСЂРЅРѕРіРѕСЂРёСЏ');
INSERT INTO nsicountry VALUES (50, 'CU', 'РљСѓР±Р°');
INSERT INTO nsicountry VALUES (51, 'CV', 'РљР°Р±Рѕ-Р’РµСЂРґРµ');
INSERT INTO nsicountry VALUES (52, 'CW', 'РљСЋСЂР°СЃР°Рѕ');
INSERT INTO nsicountry VALUES (53, 'CX', 'РћСЃС‚СЂРѕРІ Р РѕР¶РґРµСЃС‚РІР°');
INSERT INTO nsicountry VALUES (54, 'CY', 'РљРёРїСЂ');
INSERT INTO nsicountry VALUES (55, 'CZ', 'Р§РµС€СЃРєР°СЏ Р РµСЃРїСѓР±Р»РёРєР°');
INSERT INTO nsicountry VALUES (56, 'DE', 'Р“РµСЂРјР°РЅРёСЏ');
INSERT INTO nsicountry VALUES (57, 'DJ', 'Р”Р¶РёР±СѓС‚Рё');
INSERT INTO nsicountry VALUES (58, 'DK', 'Р”Р°РЅРёСЏ');
INSERT INTO nsicountry VALUES (59, 'DM', 'Р”РѕРјРёРЅРёРєР°');
INSERT INTO nsicountry VALUES (60, 'DO', 'Р”РѕРјРёРЅРёРєР°РЅСЃРєР°СЏ Р РµСЃРїСѓР±Р»РёРєР°');
INSERT INTO nsicountry VALUES (61, 'DZ', 'РђР»Р¶РёСЂ');
INSERT INTO nsicountry VALUES (62, 'EC', 'Р­РєРІР°РґРѕСЂ');
INSERT INTO nsicountry VALUES (63, 'EE', 'Р­СЃС‚РѕРЅРёСЏ');
INSERT INTO nsicountry VALUES (64, 'EG', 'Р•РіРёРїРµС‚');
INSERT INTO nsicountry VALUES (65, 'ER', 'Р­СЂРёС‚СЂРµСЏ');
INSERT INTO nsicountry VALUES (66, 'ET', 'Р­С„РёРѕРїРёСЏ');
INSERT INTO nsicountry VALUES (67, 'FI', 'Р¤РёРЅР»СЏРЅРґРёСЏ');
INSERT INTO nsicountry VALUES (68, 'FJ', 'Р¤РёРґР¶Рё');
INSERT INTO nsicountry VALUES (69, 'FK', 'Р¤РѕР»РєР»РµРЅРґСЃРєРёРµ РѕСЃС‚СЂРѕРІР° (РњР°Р»СЊРІРёРЅСЃРєРёРµ)');
INSERT INTO nsicountry VALUES (70, 'FM', 'РњРёРєСЂРѕРЅРµР·РёСЏ, Р¤РµРґРµСЂР°С‚РёРІРЅС‹Рµ РЁС‚Р°С‚С‹');
INSERT INTO nsicountry VALUES (71, 'FO', 'Р¤Р°СЂРµСЂСЃРєРёРµ РѕСЃС‚СЂРѕРІР°');
INSERT INTO nsicountry VALUES (72, 'FR', 'Р¤СЂР°РЅС†РёСЏ');
INSERT INTO nsicountry VALUES (73, 'GA', 'Р“Р°Р±РѕРЅ');
INSERT INTO nsicountry VALUES (74, 'GD', 'Р“СЂРµРЅР°РґР°');
INSERT INTO nsicountry VALUES (75, 'GE', 'Р“СЂСѓР·РёСЏ');
INSERT INTO nsicountry VALUES (76, 'GF', 'Р¤СЂР°РЅС†СѓР·СЃРєР°СЏ Р“РІРёР°РЅР°');
INSERT INTO nsicountry VALUES (77, 'GG', 'Р“РµСЂРЅСЃРё');
INSERT INTO nsicountry VALUES (78, 'GH', 'Р“Р°РЅР°');
INSERT INTO nsicountry VALUES (79, 'GI', 'Р“РёР±СЂР°Р»С‚Р°СЂ');
INSERT INTO nsicountry VALUES (80, 'GL', 'Р“СЂРµРЅР»Р°РЅРґРёСЏ');
INSERT INTO nsicountry VALUES (81, 'GM', 'Р“Р°РјР±РёСЏ');
INSERT INTO nsicountry VALUES (82, 'GN', 'Р“РІРёРЅРµСЏ');
INSERT INTO nsicountry VALUES (83, 'GP', 'Р“РІР°РґРµР»СѓРїР°');
INSERT INTO nsicountry VALUES (84, 'GQ', 'Р­РєРІР°С‚РѕСЂРёР°Р»СЊРЅР°СЏ Р“РІРёРЅРµСЏ');
INSERT INTO nsicountry VALUES (85, 'GR', 'Р“СЂРµС†РёСЏ');
INSERT INTO nsicountry VALUES (86, 'GT', 'Р“РІР°С‚РµРјР°Р»Р°');
INSERT INTO nsicountry VALUES (87, 'GU', 'Р“СѓР°Рј');
INSERT INTO nsicountry VALUES (88, 'GW', 'Р“РІРёРЅРµСЏ-Р‘РёСЃР°Сѓ');
INSERT INTO nsicountry VALUES (89, 'GY', 'Р“Р°Р№Р°РЅР°');
INSERT INTO nsicountry VALUES (90, 'HK', 'Р“РѕРЅРєРѕРЅРі');
INSERT INTO nsicountry VALUES (91, 'HM', 'РћСЃС‚СЂРѕРІ РҐРµСЂРґ Рё РѕСЃС‚СЂРѕРІР° РњР°РєРґРѕРЅР°Р»СЊРґ');
INSERT INTO nsicountry VALUES (92, 'HN', 'Р“РѕРЅРґСѓСЂР°СЃ');
INSERT INTO nsicountry VALUES (93, 'HR', 'РҐРѕСЂРІР°С‚РёСЏ');
INSERT INTO nsicountry VALUES (94, 'HT', 'Р“Р°РёС‚Рё');
INSERT INTO nsicountry VALUES (95, 'HU', 'Р’РµРЅРіСЂРёСЏ');
INSERT INTO nsicountry VALUES (96, 'ID', 'Р�РЅРґРѕРЅРµР·РёСЏ');
INSERT INTO nsicountry VALUES (97, 'IE', 'Р�СЂР»Р°РЅРґРёСЏ');
INSERT INTO nsicountry VALUES (98, 'IL', 'Р�Р·СЂР°РёР»СЊ');
INSERT INTO nsicountry VALUES (99, 'IM', 'РћСЃС‚СЂРѕРІ РњСЌРЅ');
INSERT INTO nsicountry VALUES (100, 'IN', 'Р�РЅРґРёСЏ');
INSERT INTO nsicountry VALUES (101, 'IO', 'Р‘СЂРёС‚Р°РЅСЃРєР°СЏ С‚РµСЂСЂРёС‚РѕСЂРёСЏ РІ Р�РЅРґРёР№СЃРєРѕРј РѕРєРµР°РЅРµ');
INSERT INTO nsicountry VALUES (102, 'IQ', 'Р�СЂР°Рє');
INSERT INTO nsicountry VALUES (103, 'IR', 'Р�СЂР°РЅ, Р�СЃР»Р°РјСЃРєР°СЏ Р РµСЃРїСѓР±Р»РёРєР°');
INSERT INTO nsicountry VALUES (104, 'IS', 'Р�СЃР»Р°РЅРґРёСЏ');
INSERT INTO nsicountry VALUES (105, 'IT', 'Р�С‚Р°Р»РёСЏ');
INSERT INTO nsicountry VALUES (106, 'JE', 'Р”Р¶РµСЂСЃРё');
INSERT INTO nsicountry VALUES (107, 'JM', 'РЇРјР°Р№РєР°');
INSERT INTO nsicountry VALUES (108, 'JO', 'Р�РѕСЂРґР°РЅРёСЏ');
INSERT INTO nsicountry VALUES (109, 'JP', 'РЇРїРѕРЅРёСЏ');
INSERT INTO nsicountry VALUES (110, 'KE', 'РљРµРЅРёСЏ');
INSERT INTO nsicountry VALUES (111, 'KG', 'РљРёСЂРіРёР·РёСЏ');
INSERT INTO nsicountry VALUES (112, 'KH', 'РљР°РјР±РѕРґР¶Р°');
INSERT INTO nsicountry VALUES (113, 'KI', 'РљРёСЂРёР±Р°С‚Рё');
INSERT INTO nsicountry VALUES (114, 'KM', 'РљРѕРјРѕСЂС‹');
INSERT INTO nsicountry VALUES (115, 'KN', 'РЎРµРЅС‚-РљРёС‚СЃ Рё РќРµРІРёСЃ');
INSERT INTO nsicountry VALUES (116, 'KP', 'РљРѕСЂРµСЏ, РќР°СЂРѕРґРЅРѕ-Р”РµРјРѕРєСЂР°С‚РёС‡. Р РµСЃРїСѓР±Р»РёРєР°');
INSERT INTO nsicountry VALUES (117, 'KR', 'РљРѕСЂРµСЏ, Р РµСЃРїСѓР±Р»РёРєР°');
INSERT INTO nsicountry VALUES (118, 'KW', 'РљСѓРІРµР№С‚');
INSERT INTO nsicountry VALUES (119, 'KY', 'РћСЃС‚СЂРѕРІР° РљР°Р№РјР°РЅ');
INSERT INTO nsicountry VALUES (120, 'KZ', 'РљР°Р·Р°С…СЃС‚Р°РЅ');
INSERT INTO nsicountry VALUES (121, 'LA', 'Р›Р°РѕСЃСЃРєР°СЏ РќР°СЂРѕРґРЅРѕ-Р”РµРјРѕРєСЂР°С‚РёС‡. Р РµСЃРїСѓР±Р»РёРєР°');
INSERT INTO nsicountry VALUES (122, 'LB', 'Р›РёРІР°РЅ');
INSERT INTO nsicountry VALUES (123, 'LC', 'РЎРµРЅС‚-Р›СЋСЃРёСЏ');
INSERT INTO nsicountry VALUES (124, 'LI', 'Р›РёС…С‚РµРЅС€С‚РµР№РЅ');
INSERT INTO nsicountry VALUES (125, 'LR', 'Р›РёР±РµСЂРёСЏ');
INSERT INTO nsicountry VALUES (126, 'LS', 'Р›РµСЃРѕС‚Рѕ');
INSERT INTO nsicountry VALUES (127, 'LT', 'Р›РёС‚РІР°');
INSERT INTO nsicountry VALUES (128, 'LU', 'Р›СЋРєСЃРµРјР±СѓСЂРі');
INSERT INTO nsicountry VALUES (129, 'LV', 'Р›Р°С‚РІРёСЏ');
INSERT INTO nsicountry VALUES (130, 'LY', 'Р›РёРІРёСЏ');
INSERT INTO nsicountry VALUES (131, 'MA', 'РњР°СЂРѕРєРєРѕ');
INSERT INTO nsicountry VALUES (132, 'MC', 'РњРѕРЅР°РєРѕ');
INSERT INTO nsicountry VALUES (133, 'MD', 'РњРѕР»РґРѕРІР°, Р РµСЃРїСѓР±Р»РёРєР°');
INSERT INTO nsicountry VALUES (134, 'ME', 'Р§РµСЂРЅРѕРіРѕСЂРёСЏ');
INSERT INTO nsicountry VALUES (135, 'MF', 'РЎРµРЅ-РњР°СЂС‚РµРЅ');
INSERT INTO nsicountry VALUES (136, 'MG', 'РњР°РґР°РіР°СЃРєР°СЂ');
INSERT INTO nsicountry VALUES (137, 'MH', 'РњР°СЂС€Р°Р»Р»РѕРІС‹ РћСЃС‚СЂРѕРІР°');
INSERT INTO nsicountry VALUES (138, 'MK', 'Р РµСЃРїСѓР±Р»РёРєР° РњР°РєРµРґРѕРЅРёСЏ');
INSERT INTO nsicountry VALUES (139, 'ML', 'РњР°Р»Рё');
INSERT INTO nsicountry VALUES (140, 'MM', 'РњСЊСЏРЅРјР°');
INSERT INTO nsicountry VALUES (141, 'MN', 'РњРѕРЅРіРѕР»РёСЏ');
INSERT INTO nsicountry VALUES (142, 'MO', 'РњР°РєР°Рѕ');
INSERT INTO nsicountry VALUES (143, 'MP', 'РЎРµРІРµСЂРЅС‹Рµ РњР°СЂРёР°РЅСЃРєРёРµ РѕСЃС‚СЂРѕРІР°');
INSERT INTO nsicountry VALUES (144, 'MQ', 'РњР°СЂС‚РёРЅРёРєР°');
INSERT INTO nsicountry VALUES (145, 'MR', 'РњР°РІСЂРёС‚Р°РЅРёСЏ');
INSERT INTO nsicountry VALUES (146, 'MS', 'РњРѕРЅС‚СЃРµСЂСЂР°С‚');
INSERT INTO nsicountry VALUES (147, 'MT', 'РњР°Р»СЊС‚Р°');
INSERT INTO nsicountry VALUES (148, 'MU', 'РњР°РІСЂРёРєРёР№');
INSERT INTO nsicountry VALUES (149, 'MV', 'РњР°Р»СЊРґРёРІС‹');
INSERT INTO nsicountry VALUES (150, 'MW', 'РњР°Р»Р°РІРё');
INSERT INTO nsicountry VALUES (151, 'MX', 'РњРµРєСЃРёРєР°');
INSERT INTO nsicountry VALUES (152, 'MY', 'РњР°Р»Р°Р№Р·РёСЏ');
INSERT INTO nsicountry VALUES (153, 'MZ', 'РњРѕР·Р°РјР±РёРє');
INSERT INTO nsicountry VALUES (154, 'NA', 'РќР°РјРёР±РёСЏ');
INSERT INTO nsicountry VALUES (155, 'NC', 'РќРѕРІР°СЏ РљР°Р»РµРґРѕРЅРёСЏ');
INSERT INTO nsicountry VALUES (156, 'NE', 'РќРёРіРµСЂ');
INSERT INTO nsicountry VALUES (157, 'NF', 'РћСЃС‚СЂРѕРІ РќРѕСЂС„РѕР»Рє');
INSERT INTO nsicountry VALUES (158, 'NG', 'РќРёРіРµСЂРёСЏ');
INSERT INTO nsicountry VALUES (159, 'NI', 'РќРёРєР°СЂР°РіСѓР°');
INSERT INTO nsicountry VALUES (160, 'NL', 'РќРёРґРµСЂР»Р°РЅРґС‹');
INSERT INTO nsicountry VALUES (161, 'NO', 'РќРѕСЂРІРµРіРёСЏ');
INSERT INTO nsicountry VALUES (162, 'NP', 'РќРµРїР°Р»');
INSERT INTO nsicountry VALUES (163, 'NR', 'РќР°СѓСЂСѓ');
INSERT INTO nsicountry VALUES (164, 'NU', 'РќРёСѓСЌ');
INSERT INTO nsicountry VALUES (165, 'NZ', 'РќРѕРІР°СЏ Р—РµР»Р°РЅРґРёСЏ');
INSERT INTO nsicountry VALUES (166, 'OM', 'РћРјР°РЅ');
INSERT INTO nsicountry VALUES (167, 'PA', 'РџР°РЅР°РјР°');
INSERT INTO nsicountry VALUES (168, 'PE', 'РџРµСЂСѓ');
INSERT INTO nsicountry VALUES (169, 'PF', 'Р¤СЂР°РЅС†СѓР·СЃРєР°СЏ РџРѕР»РёРЅРµР·РёСЏ');
INSERT INTO nsicountry VALUES (170, 'PG', 'РџР°РїСѓР° РќРѕРІР°СЏ Р“РІРёРЅРµСЏ');
INSERT INTO nsicountry VALUES (171, 'PH', 'Р¤РёР»РёРїРїРёРЅС‹');
INSERT INTO nsicountry VALUES (172, 'PK', 'РџР°РєРёСЃС‚Р°РЅ');
INSERT INTO nsicountry VALUES (173, 'PL', 'РџРѕР»СЊС€Р°');
INSERT INTO nsicountry VALUES (174, 'PM', 'РЎРµРЅС‚-РџСЊРµСЂ Рё РњРёРєРµР»РѕРЅ');
INSERT INTO nsicountry VALUES (175, 'PN', 'РџРёС‚РєСЌСЂРЅ');
INSERT INTO nsicountry VALUES (176, 'PR', 'РџСѓСЌСЂС‚Рѕ-Р РёРєРѕ');
INSERT INTO nsicountry VALUES (177, 'PS', 'РџР°Р»РµСЃС‚РёРЅР°, Р“РѕСЃСѓРґР°СЂСЃС‚РІРѕ');
INSERT INTO nsicountry VALUES (178, 'PT', 'РџРѕСЂС‚СѓРіР°Р»РёСЏ');
INSERT INTO nsicountry VALUES (179, 'PW', 'РџР°Р»Р°Сѓ');
INSERT INTO nsicountry VALUES (180, 'PY', 'РџР°СЂР°РіРІР°Р№');
INSERT INTO nsicountry VALUES (181, 'QA', 'РљР°С‚Р°СЂ');
INSERT INTO nsicountry VALUES (182, 'RE', 'Р РµСЋРЅСЊРѕРЅ');
INSERT INTO nsicountry VALUES (183, 'RO', 'Р СѓРјС‹РЅРёСЏ');
INSERT INTO nsicountry VALUES (184, 'RS', 'РЎРµСЂР±РёСЏ');
INSERT INTO nsicountry VALUES (185, 'RU', 'Р РѕСЃСЃРёСЏ');
INSERT INTO nsicountry VALUES (186, 'RW', 'Р СѓР°РЅРґР°');
INSERT INTO nsicountry VALUES (187, 'SA', 'РЎР°СѓРґРѕРІСЃРєР°СЏ РђСЂР°РІРёСЏ');
INSERT INTO nsicountry VALUES (188, 'SH', 'РЎРІ. Р•Р»РµРЅР°, Рѕ. Р’РѕР·РЅРµСЃРµРЅРёСЏ, РўСЂ.-РґР°-РљСѓРЅСЊСЏ');
INSERT INTO nsicountry VALUES (189, 'SM', 'РЎР°РЅ-РњР°СЂРёРЅРѕ');
INSERT INTO nsicountry VALUES (190, 'SN', 'РЎРµРЅРµРіР°Р»');
INSERT INTO nsicountry VALUES (191, 'ST', 'РЎР°РЅ-РўРѕРјРµ Рё РџСЂРёРЅСЃРёРїРё');
INSERT INTO nsicountry VALUES (192, 'SU', 'РЎРЎРЎР ');
INSERT INTO nsicountry VALUES (193, 'SV', 'Р­Р»СЊ-РЎР°Р»СЊРІР°РґРѕСЂ');
INSERT INTO nsicountry VALUES (194, 'TD', 'Р§Р°Рґ');
INSERT INTO nsicountry VALUES (195, 'TF', 'Р¤СЂР°РЅС†СѓР·СЃРєРёРµ Р®Р¶РЅС‹Рµ РўРµСЂСЂРёС‚РѕСЂРёРё');
INSERT INTO nsicountry VALUES (196, 'VA', 'РџР°РїСЃРєРёР№ РџСЂРµСЃС‚РѕР» (Р“РѕСЃ.-РіРѕСЂРѕРґ Р’Р°С‚РёРєР°РЅ)');
INSERT INTO nsicountry VALUES (197, 'VC', 'РЎРµРЅС‚-Р’РёРЅСЃРµРЅС‚ Рё Р“СЂРµРЅР°РґРёРЅС‹');
INSERT INTO nsicountry VALUES (198, 'WS', 'РЎР°РјРѕР°');
INSERT INTO nsicountry VALUES (199, 'YT', 'РњР°Р№РѕС‚С‚Р°');
INSERT INTO nsicountry VALUES (200, 'AE', 'РћР±СЉРµРґРёРЅРµРЅРЅС‹Рµ РђСЂР°Р±СЃРєРёРµ Р­РјРёСЂР°С‚С‹');
INSERT INTO nsicountry VALUES (201, 'CH', 'РЁРІРµР№С†Р°СЂРёСЏ');
INSERT INTO nsicountry VALUES (202, 'EH', 'Р—Р°РїР°РґРЅР°СЏ РЎР°С…Р°СЂР°');
INSERT INTO nsicountry VALUES (203, 'ES', 'Р�СЃРїР°РЅРёСЏ');
INSERT INTO nsicountry VALUES (204, 'GB', 'РЎРѕРµРґРёРЅРµРЅРЅРѕРµ РљРѕСЂРѕР»РµРІСЃС‚РІРѕ');
INSERT INTO nsicountry VALUES (205, 'GS', 'Р®Р¶РЅ. Р”Р¶РѕСЂРґР¶РёСЏ Рё Р®Р¶РЅ. РЎР°РЅРґРІРёС‡. РѕСЃС‚СЂРѕРІР°');
INSERT INTO nsicountry VALUES (206, 'LK', 'РЁСЂРё-Р›Р°РЅРєР°');
INSERT INTO nsicountry VALUES (207, 'SB', 'РЎРѕР»РѕРјРѕРЅРѕРІС‹ РћСЃС‚СЂРѕРІР°');
INSERT INTO nsicountry VALUES (208, 'SC', 'РЎРµР№С€РµР»С‹');
INSERT INTO nsicountry VALUES (209, 'SD', 'РЎСѓРґР°РЅ');
INSERT INTO nsicountry VALUES (210, 'SE', 'РЁРІРµС†РёСЏ');
INSERT INTO nsicountry VALUES (211, 'SG', 'РЎРёРЅРіР°РїСѓСЂ');
INSERT INTO nsicountry VALUES (212, 'SI', 'РЎР»РѕРІРµРЅРёСЏ');
INSERT INTO nsicountry VALUES (213, 'SJ', 'РЁРїРёС†Р±РµСЂРіРµРЅ Рё РЇРЅ РњР°Р№РµРЅ');
INSERT INTO nsicountry VALUES (214, 'SK', 'РЎР»РѕРІР°РєРёСЏ');
INSERT INTO nsicountry VALUES (215, 'SL', 'РЎСЊРµСЂСЂР°-Р›РµРѕРЅРµ');
INSERT INTO nsicountry VALUES (216, 'SO', 'РЎРѕРјР°Р»Рё');
INSERT INTO nsicountry VALUES (217, 'SR', 'РЎСѓСЂРёРЅР°Рј');
INSERT INTO nsicountry VALUES (218, 'SS', 'Р®Р¶РЅС‹Р№ РЎСѓРґР°РЅ');
INSERT INTO nsicountry VALUES (219, 'SX', 'РЎРµРЅ-РњР°СЂС‚РµРЅ (РЅРёРґРµСЂР»Р°РЅРґСЃРєР°СЏ С‡Р°СЃС‚СЊ)');
INSERT INTO nsicountry VALUES (220, 'SY', 'РЎРёСЂРёР№СЃРєР°СЏ РђСЂР°Р±СЃРєР°СЏ Р РµСЃРїСѓР±Р»РёРєР°');
INSERT INTO nsicountry VALUES (221, 'SZ', 'РЎРІР°Р·РёР»РµРЅРґ');
INSERT INTO nsicountry VALUES (222, 'TC', 'РћСЃС‚СЂРѕРІР° РўРµСЂРєСЃ Рё РљР°Р№РєРѕСЃ');
INSERT INTO nsicountry VALUES (223, 'TG', 'РўРѕРіРѕ');
INSERT INTO nsicountry VALUES (224, 'TH', 'РўР°РёР»Р°РЅРґ');
INSERT INTO nsicountry VALUES (225, 'TJ', 'РўР°РґР¶РёРєРёСЃС‚Р°РЅ');
INSERT INTO nsicountry VALUES (226, 'TK', 'РўРѕРєРµР»Р°Сѓ');
INSERT INTO nsicountry VALUES (227, 'TL', 'РўРёРјРѕСЂ-Р›РµСЃС‚Рµ');
INSERT INTO nsicountry VALUES (228, 'TM', 'РўСѓСЂРєРјРµРЅРёСЏ');
INSERT INTO nsicountry VALUES (229, 'TN', 'РўСѓРЅРёСЃ');
INSERT INTO nsicountry VALUES (230, 'TO', 'РўРѕРЅРіР°');
INSERT INTO nsicountry VALUES (231, 'TR', 'РўСѓСЂС†РёСЏ');
INSERT INTO nsicountry VALUES (232, 'TT', 'РўСЂРёРЅРёРґР°Рґ Рё РўРѕР±Р°РіРѕ');
INSERT INTO nsicountry VALUES (233, 'TV', 'РўСѓРІР°Р»Сѓ');
INSERT INTO nsicountry VALUES (234, 'TW', 'РўР°Р№РІР°РЅСЊ (РљРёС‚Р°Р№)');
INSERT INTO nsicountry VALUES (235, 'TZ', 'РўР°РЅР·Р°РЅРёСЏ, РћР±СЉРµРґРёРЅРµРЅРЅР°СЏ Р РµСЃРїСѓР±Р»РёРєР°');
INSERT INTO nsicountry VALUES (236, 'UA', 'РЈРєСЂР°РёРЅР°');
INSERT INTO nsicountry VALUES (237, 'UG', 'РЈРіР°РЅРґР°');
INSERT INTO nsicountry VALUES (238, 'UM', 'РњР°Р»С‹Рµ С‚РёС…РѕРѕРєРµР°РЅ. РѕС‚РґР°Р»РµРЅ. РѕСЃС‚-РІР° РЎ.РЁ.');
INSERT INTO nsicountry VALUES (239, 'US', 'РЎРѕРµРґРёРЅРµРЅРЅС‹Рµ РЁС‚Р°С‚С‹');
INSERT INTO nsicountry VALUES (240, 'UY', 'РЈСЂСѓРіРІР°Р№');
INSERT INTO nsicountry VALUES (241, 'UZ', 'РЈР·Р±РµРєРёСЃС‚Р°РЅ');
INSERT INTO nsicountry VALUES (242, 'VE', 'Р’РµРЅРµСЃСѓСЌР»Р°, Р‘РѕР»РёРІР°СЂРёР°РЅСЃРєР°СЏ Р РµСЃРїСѓР±Р»РёРєР°');
INSERT INTO nsicountry VALUES (243, 'VG', 'Р’РёСЂРіРёРЅСЃРєРёРµ РѕСЃС‚СЂРѕРІР°, Р‘СЂРёС‚Р°РЅСЃРєРёРµ');
INSERT INTO nsicountry VALUES (244, 'VI', 'Р’РёСЂРіРёРЅСЃРєРёРµ РѕСЃС‚СЂРѕРІР°, РЎРЁРђ');
INSERT INTO nsicountry VALUES (245, 'VN', 'Р’СЊРµС‚РЅР°Рј');
INSERT INTO nsicountry VALUES (246, 'VU', 'Р’Р°РЅСѓР°С‚Сѓ');
INSERT INTO nsicountry VALUES (247, 'WF', 'РЈРѕР»Р»РёСЃ Рё Р¤СѓС‚СѓРЅР°');
INSERT INTO nsicountry VALUES (248, 'YE', 'Р™РµРјРµРЅ');
INSERT INTO nsicountry VALUES (249, 'ZA', 'Р®Р¶РЅР°СЏ РђС„СЂРёРєР°');
INSERT INTO nsicountry VALUES (250, 'ZM', 'Р—Р°РјР±РёСЏ');
INSERT INTO nsicountry VALUES (251, 'ZW', 'Р—РёРјР±Р°Р±РІРµ');
INSERT INTO nsicountry VALUES (252, 'CI', 'РљРѕС‚ Рґ''Р�РІСѓР°СЂ');


--
-- TOC entry 4605 (class 0 OID 19079)
-- Dependencies: 299
-- Data for Name: objectpassedcustomcheckpointclssifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4607 (class 0 OID 19087)
-- Dependencies: 301
-- Data for Name: pharmaprodconsignmentlimitkindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4609 (class 0 OID 19095)
-- Dependencies: 303
-- Data for Name: pharmaproductregistrationdocelementkindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4611 (class 0 OID 19103)
-- Dependencies: 305
-- Data for Name: registrationproductdoccodeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO registrationproductdoccodeclassifier VALUES (1, '1', 'Р—Р°СЏРІР»РµРЅРёРµВ ');
INSERT INTO registrationproductdoccodeclassifier VALUES (2, '10', 'Р”Р°РЅРЅС‹Рµ Рѕ РјР°СЂРєРёСЂРѕРІРєРµ Рё СѓРїР°РєРѕРІРєРµ (РїРѕР»РЅРѕС†РІРµС‚РЅС‹Рµ РјР°РєРµС‚С‹ СѓРїР°РєРѕРІРѕРє Рё СЌС‚РёРєРµС‚РѕРє, С‚РµРєСЃС‚ РјР°СЂРєРёСЂРѕРІРєРё РЅР° СЂСѓСЃСЃРєРѕРјВ  Рё СЏР·С‹РєР°С… РіРѕСЃСѓРґР°СЂСЃС‚РІС‡Р»РµРЅРѕРІ РЎРѕСЋР·Р°)');
INSERT INTO registrationproductdoccodeclassifier VALUES (3, '11', 'Р�РЅС„РѕСЂРјР°С†РёСЏ Рѕ СЂР°Р·СЂР°Р±РѕС‚РєРµ Рё РїСЂРѕРёР·РІРѕРґСЃС‚РІРµ: СЃС…РµРјС‹ РїСЂРѕС†РµСЃСЃРѕРІ РїСЂРѕРёР·РІРѕРґСЃС‚РІР°, РѕСЃРЅРѕРІРЅС‹С… СЃС‚Р°РґРёР№ РїСЂРѕРёР·РІРѕРґСЃС‚РІР°, СѓРїР°РєРѕРІРєРё, РёСЃРїС‹С‚Р°РЅРёР№ Рё РїСЂРѕС†РµРґСѓСЂС‹ РІС‹РїСѓСЃРєР° РєРѕРЅРµС‡РЅРѕРіРѕ РїСЂРѕРґСѓРєС‚Р°');
INSERT INTO registrationproductdoccodeclassifier VALUES (4, '12', 'РЎРІРµРґРµРЅРёСЏ Рѕ РїСЂРѕРёР·РІРѕРґРёС‚РµР»Рµ: РЅР°РёРјРµРЅРѕРІР°РЅРёРµ, РІРёРґ РґРµСЏС‚РµР»СЊРЅРѕСЃС‚Рё, СЋСЂРёРґРёС‡РµСЃРєРёР№ Р°РґСЂРµСЃ, С„РѕСЂРјР° СЃРѕР±СЃС‚РІРµРЅРЅРѕСЃС‚Рё, СЃРѕСЃС‚Р°РІ СЂСѓРєРѕРІРѕРґСЃС‚РІР°, РїРµСЂРµС‡РµРЅСЊ РїРѕРґСЂР°Р·РґРµР»РµРЅРёР№ Рё РґРѕС‡РµСЂРЅРёС… РєРѕРјРїР°РЅРёР№ СЃВ  СѓРєР°Р·Р°РЅРёРµРјВ  РёС… СЃС‚Р°С‚СѓСЃР° Рё РїРѕР»РЅРѕРјРѕС‡РёР№');
INSERT INTO registrationproductdoccodeclassifier VALUES (5, '13', 'Р�РЅС„РѕСЂРјР°С†РёСЏ Рѕ РіР»РѕР±Р°Р»СЊРЅРѕРј РјР°СЂРєРµС‚РёРЅРіРµ (РёСЃС‚РѕСЂРёСЏ РёР·РґРµР»РёСЏ РЅР° РјРёСЂРѕРІРѕРј СЂС‹РЅРєРµ РїСЂРё СѓСЃР»РѕРІРёРё РµРіРѕ РѕР±СЂР°С‰РµРЅРёСЏ Р±РѕР»РµРµ РґРІСѓС… Р»РµС‚) Р°РєС‚СѓР°Р»СЊРЅР°СЏ РїРѕРґСЂРѕР±РЅР°СЏ РёРЅС„РѕСЂРјР°С†РёСЏ РѕР± РёСЃС‚РѕСЂРёРё РїСЂРѕРґР°Р¶, Рѕ СЂС‹РЅРєР°С… ( СЃ СѓРєР°Р·Р°РЅРёРµРј РІСЃРµС… СЃС‚СЂР°РЅ РёР»Рё СЋСЂРёСЃРґРёРєС†РёР№), РЅР° РєРѕС‚РѕСЂС‹С… РёР·РґРµР»РёРµ РѕРґРѕР±СЂРµРЅРѕ Рє РїСЂРѕРґР°Р¶Рµ, РІРєР»СЋС‡Р°СЏ РјРµСЃС‚Р°, РіРґРµ РёР·РґРµР»РёРµ РјРѕР¶РЅРѕ РїСЂРѕРґР°РІР°С‚СЊ РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РїСЂР°РІРёР»Р°РјРё РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ РЅРµР·Р°СЂРµРіРёСЃС‚СЂРёСЂРѕРІР°РЅРЅРѕРіРѕ РёР·РґРµР»РёСЏ. РЈРєР°Р·Р°С‚СЊ РґР°С‚Сѓ СЃР±РѕСЂР° РґР°РЅРЅС‹С… РѕР± РёСЃС‚РѕСЂРёРё РёР·РґРµР»РёСЏ РЅР° РјРёСЂРѕРІРѕРј СЂС‹РЅРєРµ');
INSERT INTO registrationproductdoccodeclassifier VALUES (6, '14', 'РЎРѕРѕР±С‰РµРЅРёСЏ Рѕ РЅРµСЃС‡Р°СЃС‚РЅС‹С… СЃР»СѓС‡Р°СЏС… Рё РѕС‚Р·С‹РІР°С…: СЃРїРёСЃРѕРє РЅРµР¶РµР»Р°С‚РµР»СЊРЅС‹С… СЃРѕР±С‹С‚РёР№/РЅРµСЃС‡Р°СЃС‚РЅС‹С… СЃР»СѓС‡Р°РµРІ, СЃРІСЏР·Р°РЅРЅС‹С… СЃ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёРµРј РёР·РґРµР»РёСЏ, Рё СѓРєР°Р·Р°РЅРёРµ РїРµСЂРёРѕРґР° РІСЂРµРјРµРЅРё, РЅР° РїСЂРѕС‚СЏР¶РµРЅРёРё РєРѕС‚РѕСЂРѕРіРѕ РІСЃРµ СЌС‚Рѕ РїСЂРѕРёСЃС…РѕРґРёР»Рѕ; РµСЃР»Рё РЅРµР¶РµР»Р°С‚РµР»СЊРЅС‹С… СЃРѕР±С‹С‚РёР№ СЃР»РёС€РєРѕРј РјРЅРѕРіРѕ, РЅРµРѕР±С…РѕРґРёРјРѕ РїСЂРµРґРѕСЃС‚Р°РІРёС‚СЊ РєСЂР°С‚РєРёРµ РѕР±Р·РѕСЂС‹ РїРѕ РєР°Р¶РґРѕРјСѓ РёР· С‚РёРїРѕРІ СЃРѕР±С‹С‚РёР№ Рё СѓРєР°Р·Р°С‚СЊ РѕР±С‰РµРµ РєРѕР»РёС‡РµСЃС‚РІРѕ СЃРѕР±С‹С‚РёР№ РєР°Р¶РґРѕРіРѕ С‚РёРїР°, Рѕ РєРѕС‚РѕСЂС‹С… РїРѕСЃС‚СѓРїР°Р»Рё РѕС‚С‡РµС‚С‹; СЃРїРёСЃРѕРє РѕС‚Р·С‹РІРѕРІ СЃ СЂС‹РЅРєР° РјРµРґРёС†РёРЅСЃРєРёС… РёР·РґРµР»РёР№ Рё/РёР»Рё РїРѕСЏСЃРЅРёС‚РµР»СЊРЅС‹С… СѓРІРµРґРѕРјР»РµРЅРёР№ Рё РѕРїРёСЃР°РЅРёРµ РїРѕРґС…РѕРґР° Рє СЂР°СЃСЃРјРѕС‚СЂРµРЅРёСЋ СЌС‚РёС… РїСЂРѕР±Р»РµРј Рё РёС… СЂРµС€РµРЅРёСЏ РїСЂРѕРёР·РІРѕРґРёС‚РµР»СЏРјРё РІ РєР°Р¶РґРѕРј РёР· С‚Р°РєРёС… СЃР»СѓС‡Р°РµРІ; РѕРїРёСЃР°РЅРёРµ Р°РЅР°Р»РёР·Р° Рё/РёР»Рё РєРѕСЂСЂРµРєС‚РёСЂСѓСЋС‰РёС… РґРµР№СЃС‚РІРёР№, РїСЂРµРґРїСЂРёРЅСЏС‚С‹С… РІ РѕС‚РІРµС‚ РЅР° РїРµСЂРµС‡РёСЃР»РµРЅРЅС‹Рµ РІС‹С€Рµ СЃР»СѓС‡Р°Рё.В  В ');
INSERT INTO registrationproductdoccodeclassifier VALUES (7, '15', 'РЎРїРёСЃРѕРє СЃС‚Р°РЅРґР°СЂС‚РѕРІ, РєРѕС‚РѕСЂС‹Рј СЃРѕРѕС‚РІРµС‚СЃС‚РІСѓРµС‚ РјРµРґРёС†РёРЅСЃРєРѕРµ РёР·РґРµР»РёРµ. Р’ СЃРїРёСЃРєРµ РґРѕР»Р¶РЅС‹ Р±С‹С‚СЊ СѓРєР°Р·Р°РЅС‹ СЂРµРєРІРёР·РёС‚С‹ В  РґРѕРєСѓРјРµРЅС‚Р°(РѕРІ): РЅР°РёРјРµРЅРѕРІР°РЅРёРµ, В В В В В В В В В  РЅРѕРјРµСЂ СЃС‚Р°РЅРґР°СЂС‚Р°, РіРѕРґ/РІРµСЂСЃРёСЏ, СЃС‚РµРїРµРЅСЊ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёСЏ (РїРѕР»РЅРѕРµ В В В В В В  РёР»Рё В В В  С‡Р°СЃС‚РёС‡РЅРѕРµ). В В В В В В В В В  Р’ РїРѕСЃР»РµРґРЅРµРј СЃР»СѓС‡Р°Рµ-СѓРєР°Р·Р°РЅРёРµ РїСѓРЅРєС‚РѕРІ, РєРѕС‚РѕСЂС‹Рµ РЅРµ РїСЂРёРјРµРЅРёРјС‹ Рє РёР·РґРµР»РёСЋ.В ');
INSERT INTO registrationproductdoccodeclassifier VALUES (8, '16', 'РљРѕРЅС‚СЂРѕР»СЊРЅС‹Р№ РїРµСЂРµС‡РµРЅСЊ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёСЏ С‚СЂРµР±РѕРІР°РЅРёСЏРј Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё Рё СЌС„С„РµРєС‚РёРІРЅРѕСЃС‚Рё');
INSERT INTO registrationproductdoccodeclassifier VALUES (9, '17', 'РЎРїРµС†РёС„РёРєР°С†РёРё РїСЂРѕРёР·РІРѕРґРёС‚РµР»СЏ РёР»Рё С‚РµС…РЅРёС‡РµСЃРєРёРµ СѓСЃР»РѕРІРёСЏ (РїСЂРё РЅР°Р»РёС‡РёРё), РєРѕС‚РѕСЂС‹Рј СЃРѕРѕС‚РІРµС‚СЃС‚РІСѓРµС‚ РјРµРґРёС†РёРЅСЃРєРѕРµ РёР·РґРµР»РёРµ');
INSERT INTO registrationproductdoccodeclassifier VALUES (10, '18', 'РџСЂРѕС‚РѕРєРѕР»С‹ С‚РµС…РЅРёС‡РµСЃРєРёС… РёСЃРїС‹С‚Р°РЅРёР№, РїСЂРѕРІРµРґРµРЅРЅС‹С… РІ С†РµР»СЏС… РґРѕРєР°Р·Р°С‚РµР»СЊСЃС‚РІР° СЃРѕРѕС‚РІРµС‚СЃС‚РІРёСЏ РћР±С‰РёРј С‚СЂРµР±РѕРІР°РЅРёСЏРј Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё Рё СЌС„С„РµРєС‚РёРІРЅРѕСЃС‚Рё РјРµРґРёС†РёРЅСЃРєРёС… РёР·РґРµР»РёР№');
INSERT INTO registrationproductdoccodeclassifier VALUES (11, '19', 'РџСЂРѕС‚РѕРєРѕР»С‹ РёСЃСЃР»РµРґРѕРІР°РЅРёР№ (РёСЃРїС‹С‚Р°РЅРёР№) РїРѕ РѕС†РµРЅРєРµ Р±РёРѕР»РѕРіРёС‡РµСЃРєРѕРіРѕ РґРµР№СЃС‚РІРёСЏ РјРµРґРёС†РёРЅСЃРєРѕРіРѕ РёР·РґРµР»РёСЏ, РїСЂРѕС‹РµРґРµРЅРЅС‹С… РІ С†РµР»СЏС… РґРѕРєР°Р·Р°С‚РµР»СЊСЃС‚РІР° СЃРѕРѕС‚РІРµС‚СЃС‚РІРёСЏ РћР±С‰РёРј С‚СЂРµР±РѕРІР°РЅРёСЏРј Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё Рё СЌС„С„РµРєС‚РёРІРЅРѕСЃС‚Рё РјРµРґРёС†РёРЅСЃРєРёС… РёР·РґРµР»РёР№ (РґР»СЏ РґРёР°РіРѕРЅРѕСЃС‚РёРєРё in vitro - РґР°РЅРЅС‹Рµ РїРѕ Р°РЅР°Р»РёС‚РёС‡РµСЃРєРѕР№ СЌС„С„РµРєС‚РёРІРЅРѕСЃС‚Рё)');
INSERT INTO registrationproductdoccodeclassifier VALUES (12, '2', 'Р”РѕРІРµСЂРµРЅРЅРѕСЃС‚СЊ РѕС‚ РїСЂРѕРёР·РІРѕРґРёС‚РµР»СЏ РЅР° РїСЂР°РІРѕ РїСЂРµРґСЃС‚Р°РІР»РµРЅРёСЏ РёРЅС‚РµСЂРµСЃРѕРІ РїСЂРё СЂРµРіРёСЃС‚СЂР°С†РёРё (РїСЂРё РЅРµРѕР±С…РѕРґРёРјРѕСЃС‚Рё)В ');
INSERT INTO registrationproductdoccodeclassifier VALUES (13, '20', 'Р”Р°РЅРЅС‹Рµ Рѕ РєР»РёРЅРёС‡РµСЃРєРёС… РёСЃСЃР»РµРґРѕРІР°РЅРёСЏС… СЃ Р°СѓС‚РµРЅС‚РёС‡РЅС‹Рј РїРµСЂРµРІРѕРґРѕРј РЅР° СЂСѓСЃСЃРєРёР№ СЏР·С‹Рє СЂРµР·СѓР»СЊС‚Р°С‚РѕРІ Рё РІС‹РІРѕРґРѕРІ РёСЃРїС‹С‚Р°РЅРёР№В ');
INSERT INTO registrationproductdoccodeclassifier VALUES (14, '21', 'РћС‚С‡РµС‚ РїРѕ Р°РЅР°Р»РёР·Сѓ СЂРёСЃРєРѕРІВ В ');
INSERT INTO registrationproductdoccodeclassifier VALUES (15, '22', 'Р”Р°РЅРЅС‹Рµ Рѕ Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІР°С… РІ СЃРѕСЃС‚Р°РІРµ РјРµРґРёС†РёРЅСЃРєРѕРіРѕ РёР·РґРµР»РёСЏ Р»РµРєР°СЂСЃС‚РІРµРЅРЅС‹С… СЃСЂРµРґСЃС‚РІР°С…: СЃРѕСЃС‚Р°РІ, РєРѕР»РёС‡РµСЃС‚РІРѕ, РґР°РЅРЅС‹Рµ Рѕ СЃРѕРІРјРµСЃС‚РёРјРѕСЃС‚Рё Р»РµРєР°СЂСЃС‚РІРµРЅРЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° СЃ РјРµРґРёС†РёРЅСЃРєРёРј РёР·РґРµР»РёРµРј. Р”Р°РЅРЅС‹Рµ РїРѕРґС‚РІРµСЂР¶РґР°СЋС‰РёРµ СЂРµРіРёСЃС‚СЂР°С†РёСЋ Р»РµРєР°СЂСЃС‚РІРµРЅРЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° РІ СЃС‚СЂР°РЅРµ РїСЂРѕРёР·РІРѕРґРёС‚РµР»СЏ Р»РµРєР°СЂСЃС‚РІРµРЅРЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° Рё РІ РіРѕСЃСѓРґР°СЂСЃС‚РІР°С… вЂ“ С‡Р»РµРЅР°С… РЎРѕСЋР·Р°');
INSERT INTO registrationproductdoccodeclassifier VALUES (16, '23', 'Р”Р°РЅРЅС‹Рµ Рѕ Р±РёРѕР»РѕРіРёС‡РµСЃРєРѕР№ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё (РїСЂРё РЅР°Р»РёС‡РёРё)');
INSERT INTO registrationproductdoccodeclassifier VALUES (17, '24', 'Р”Р°РЅРЅС‹Рµ Рѕ РїСЂРѕС†РµРґСѓСЂРµ СЃС‚РµСЂРёР»РёР·Р°С†РёРё, РІРєР»СЋС‡Р°СЏ РёРЅС„РѕСЂРјР°С†РёСЋ Рѕ РІР°Р»РёРґР°С†РёРё РїСЂРѕС†РµСЃСЃР°, СЂРµР·СѓР»СЊС‚Р°С‚С‹ С‚РµСЃС‚РёСЂРѕРІР°РЅРёСЏ РЅР° СЃРѕРґРµСЂР¶Р°РЅРёРµ РјРёРєСЂРѕРѕСЂРіР°РЅРёР·РјРѕРІ (СЃС‚РµРїРµРЅСЊ Р±РёРѕР»РѕРіРёС‡РµСЃРєРѕР№ РЅР°РіСЂСѓР·РєРё), РїРёСЂРѕРіРµРЅРЅРѕСЃС‚Рё, СЃС‚РµСЂРёР»СЊРЅРѕСЃС‚Рё (РїСЂРё РЅРµРѕР±С…РѕРґРёРјРѕСЃС‚Рё) СЃ СѓРєР°Р·Р°РЅРёРµРј РјРµС‚РѕРґРѕРІ РїСЂРѕРІРµРґРµРЅРёСЏ РёСЃРїС‹С‚Р°РЅРёР№ Рё РґР°РЅРЅС‹Рµ РѕВ  РІР°Р»РёРґР°С†РёРё СѓРїР°РєРѕРІРєРё');
INSERT INTO registrationproductdoccodeclassifier VALUES (18, '25', 'Р�РЅС„РѕСЂРјР°С†РёСЏ Рѕ РїСЂРѕРіСЂР°РјРјРЅРѕРј РѕР±РµСЃРїРµС‡РµРЅРёРё (РїСЂРё РµРіРѕ РЅР°Р»РёС‡РёРё): РЅР°РёРјРµРЅРѕРІР°РЅРёРµ, РІРµСЂСЃРёСЏ РїСЂРѕРіСЂР°РјРјРЅРѕРіРѕ РѕР±РµСЃРїРµС‡РµРЅРёСЏ, РґРѕРєР°Р·Р°С‚РµР»СЊСЃС‚РІР° С‚РѕРіРѕ, С‡С‚Рѕ РІРµСЂСЃРёСЏ РїСЂРѕС‚РµСЃС‚РёСЂРѕРІР°РЅР° Рё СЃРѕРѕС‚РІРµС‚СЃС‚РІСѓРµС‚ РѕРєРѕРЅС‡Р°С‚РµР»СЊРЅРѕР№ РїРѕСЃС‚Р°РІР»СЏРµРјРѕР№ РІРµСЂСЃРёРё РїСЂРѕРіСЂР°РјРјРЅРѕРіРѕ РѕР±РµСЃРїРµС‡РµРЅРёСЏ; РѕРїРёСЃР°РЅРёРµ РїСЂРѕРіСЂР°РјРјРЅРѕРіРѕ РѕР±РµСЃРїРµС‡РµРЅРёСЏ, РІРєР»СЋС‡Р°СЏ РѕРїСЂРµРґРµР»РµРЅРёРµ С‚РµС… С„СѓРЅРєС†РёРѕРЅР°Р»СЊРЅС‹С… С…Р°СЂР°РєС‚РµСЂРёСЃС‚РёРє РёР·РґРµР»РёСЏ, РєРѕС‚РѕСЂС‹Рµ РєРѕРЅС‚СЂРѕР»РёСЂСѓСЋС‚СЃСЏ СЃ РµРіРѕ РїРѕРјРѕС‰СЊСЋ , СЏР·С‹Рє РїСЂРѕРіСЂР°РјРјРёСЂРѕРІР°РЅРёСЏ, Р°РїРїР°СЂР°С‚РЅСѓСЋ РїР»Р°С‚С„РѕСЂРјСѓ, РѕРїРµСЂР°С†РёРѕРЅРЅСѓСЋ СЃРёСЃС‚РµРјСѓ (РµСЃР»Рё РїСЂРёРјРµРЅРёРјРѕ), РёСЃРїРѕР»СЊР·РѕРІР°РЅРёРµ РіРѕС‚РѕРІРѕРіРѕ СЃС‚Р°РЅРґР°СЂС‚РЅРѕРіРѕ РїСЂРѕРіСЂР°РјРјРЅРѕРіРѕ РѕР±РµСЃРїРµС‡РµРЅРёСЏ (РµСЃР»Рё РїСЂРёРјРµРЅРёРјРѕ). Р”Р°РЅРЅС‹Рµ РѕВ  РІР°Р»РёРґР°С†РёРё РїСЂРѕРіСЂР°РјРјРЅРѕРіРѕ РѕР±РµСЃРїРµС‡РµРЅРёСЏВ ');
INSERT INTO registrationproductdoccodeclassifier VALUES (19, '26', 'РћС‚С‡РµС‚ РѕР± РёСЃСЃР»РµРґРѕРІР°РЅРёСЏС… СЃС‚Р°Р±РёР»СЊРЅРѕСЃС‚РёВ  РґР»СЏ РёР·РґРµР»РёР№, РёРјРµСЋС‰РёС… СЃСЂРѕРє С…СЂР°РЅРµРЅРёСЏ, СЃ Р°СѓС‚РµРЅС‚РёС‡РЅС‹Рј РїРµСЂРµРІРѕРґРѕРј РЅР° СЂСѓСЃСЃРєРёР№ СЏР·С‹Рє СЂРµР·СѓР»СЊС‚Р°С‚РѕРІ Рё РІС‹РІРѕРґРѕРІ РёСЃРїС‹С‚Р°РЅРёР№В В ');
INSERT INTO registrationproductdoccodeclassifier VALUES (20, '27', 'Р­РєСЃРїР»СѓР°С‚Р°С†РёРѕРЅРЅС‹Р№ РґРѕРєСѓРјРµРЅС‚ РёР»Рё РёРЅСЃС‚СЂСѓРєС†РёСЏ РїРѕ РїСЂРёРјРµРЅРµРЅРёСЋ РјРµРґРёС†РёРЅСЃРєРѕРіРѕ РёР·РґРµР»РёСЏ РЅР° РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅРѕРј Рё СЂСѓСЃСЃРєРѕРј СЏР·С‹РєР°С…, РІ С‚РѕРј С‡РёСЃР»Рµ РёРЅСЃС‚СЂСѓРєС†РёСЏ РїРѕ РїСЂРёРјРµРЅРµРЅРёСЋ СЂР°СЃС…РѕРґРЅС‹С… РјР°С‚РµСЂРёР°Р»РѕРІ Рё РєРѕРјРїР»РµРєС‚СѓСЋС‰РёС…, СЏРІР»СЏСЋС‰РёС…СЃСЏ СЃР°РјРѕСЃС‚РѕСЏС‚РµР»СЊРЅС‹РјРё РјРµРґРёС†РёРЅСЃРєРёРјРё РёР·РґРµР»РёСЏРјРё.');
INSERT INTO registrationproductdoccodeclassifier VALUES (21, '28', 'Р СѓРєРѕРІРѕРґСЃС‚РІРѕ РїРѕ СЃРµСЂРІРёСЃРЅРѕРјСѓ РѕР±СЃР»СѓР¶РёРІР°РЅРёСЋ (РІ С‡Р°СЃС‚Рё РєРѕРјРїР»РµРєС‚СѓСЋС‰РёС… РјРµРґРёС†РёРЅСЃРєРѕРіРѕ РёР·РґРµР»РёСЏ) РІ СЃР»СѓС‡Р°РµВ  РѕС‚СЃСѓС‚СЃС‚РІРёСЏ РґР°РЅРЅС‹С… РІ СЌРєСЃРїР»СѓР°С‚Р°С†РёРѕРЅРЅРѕР№ РґРѕРєСѓРјРµРЅС‚Р°С†РёРё');
INSERT INTO registrationproductdoccodeclassifier VALUES (22, '3', 'РљРѕРїРёСЏ СЂР°Р·СЂРµС€РёС‚РµР»СЊРЅРѕРіРѕ РґРѕРєСѓРјРµРЅС‚Р° РЅР° РїСЂР°РІРѕ РїСЂРѕРёР·РІРѕРґСЃС‚РІР° РІ СЃС‚СЂР°РЅРµРїСЂРѕРёР·РІРѕРґРёС‚РµР»Рµ (РїСЂРё РЅР°Р»РёС‡РёРё) СЃ РїСЂРёР»РѕР¶РµРЅРёРµРјВ ');
INSERT INTO registrationproductdoccodeclassifier VALUES (23, '4', 'РЎРµСЂС‚РёС„РёРєР°С‚С‹ РЅР° СЃРёСЃС‚РµРјСѓ РјРµРЅРµРґР¶РјРµРЅС‚Р° РєР°С‡РµСЃС‚РІР° РјРµРґРёС†РёРЅСЃРєРёС… РёР·РґРµР»РёР№ РЅР° РІСЃРµ РїСЂРѕРёР·РІРѕРґСЃС‚РІРµРЅРЅС‹Рµ РїР»РѕС‰Р°РґРєРё, РїСЂРѕРёР·РІРѕРґСЏС‰РёРµ СЂРµРіРёСЃС‚СЂРёСЂСѓРµРјСѓСЋ РїСЂРѕРґСѓРєС†РёСЋ (Р�РЎРћ 13485, РґСЂСѓРіРёРµ СЃРїРµС†РёР°Р»СЊРЅС‹Рµ СЃРµСЂС‚РёС„РёРєР°С‚С‹ РЅР° СЃРёСЃС‚РµРјСѓ РєР°С‡РµСЃС‚РІР° РїСЂРё РїСЂРѕРёР·РІРѕРґСЃС‚РІРµ РјРµРґРёС†РёРЅСЃРєРёС… РёР·РґРµР»РёР№)');
INSERT INTO registrationproductdoccodeclassifier VALUES (24, '5', 'РЎРµСЂС‚РёС„РёРєР°С‚С‹ РЅР° СЃРёСЃС‚РµРјСѓ РјРµРЅРµРґР¶РјРµРЅС‚Р° РєР°С‡РµСЃС‚РІР° РЅР° РІСЃРµ РїСЂРѕРёР·РІРѕРґСЃС‚РІРµРЅРЅС‹Рµ РїР»РѕС‰Р°РґРєРё, РїСЂРѕРёР·РІРѕРґСЏС‰РёРµ СЂРµРіРёСЃС‚СЂРёСЂСѓРµРјСѓСЋ РїСЂРѕРґСѓРєС†РёСЋ (Р�РЎРћ 9001)В ');
INSERT INTO registrationproductdoccodeclassifier VALUES (25, '6', 'Р”РµРєР»Р°СЂР°С†РёСЏ Рѕ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё');
INSERT INTO registrationproductdoccodeclassifier VALUES (26, '7', 'В Р”РѕРєСѓРјРµРЅС‚, СѓРґРѕСЃС‚РѕРІРµСЂСЏСЋС‰РёР№ СЂРµРіРёСЃС‚СЂР°С†РёСЋ РІ СЃС‚СЂР°РЅРµРїСЂРѕРёР·РІРѕРґРёС‚РµР»Рµ (СЂРµРіРёСЃС‚СЂР°С†РёРѕРЅРЅРѕРµ СѓРґРѕСЃС‚РѕРІРµСЂРµРЅРёРµ Рё/РёР»Рё РЎРµСЂС‚РёС„РёРєР°С‚ СЃРІРѕР±РѕРґРЅРѕР№ РїСЂРѕРґР°Р¶РёВ  Рё/РёР»Рё РЎРµСЂС‚РёС„РёРєР°С‚ РЅР° СЌРєСЃРїРѕСЂС‚) (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРјВ  РјРµРґРёС†РёРЅСЃРєРёС… РёР·РґРµР»РёР№, РІРїРµСЂРІС‹Рµ РїСЂРѕРёР·РІРµРґРµРЅРЅС‹С… РІ РіРѕСЃСѓРґР°СЂСЃС‚РІР°С…-С‡Р»РµРЅР°С… РЎРѕСЋР·Р°) СЃ Р°СѓС‚РµРЅС‚РёС‡РЅС‹Рј РїРµСЂРµРІРѕРґРѕРј РЅР° СЂСѓСЃСЃРєРёР№ СЏР·С‹Рє');
INSERT INTO registrationproductdoccodeclassifier VALUES (27, '8', 'РљРѕРїРёСЏ РґРѕРєСѓРјРµРЅС‚Р°, СѓРґРѕСЃС‚РѕРІРµСЂСЏСЋС‰РµРіРѕ СЂРµРіРёСЃС‚СЂР°С†РёСЋ РІ РґСЂСѓРіРёС… СЃС‚СЂР°РЅР°С… (РїСЂРё РЅР°Р»РёС‡РёРё)В ');
INSERT INTO registrationproductdoccodeclassifier VALUES (28, '9', 'РЎРїСЂР°РІРєР° РЅР° РјРµРґРёС†РёРЅСЃРєРѕРµ РёР·РґРµР»РёРµ СЃ РѕРїРёСЃР°РЅРёРµРј РѕР±Р»Р°СЃС‚Рё РїСЂРёРјРµРЅРµРЅРёСЏ, РЅР°Р·РЅР°С‡РµРЅРёСЏ, РєСЂР°С‚РєРѕР№ С…Р°СЂР°РєС‚РµСЂРёСЃС‚РёРєРё РјРµРґРёС†РёРЅСЃРєРѕРіРѕ РёР·РґРµР»РёСЏ, РІР°СЂРёР°РЅС‚Р°РјРё РёСЃРїРѕР»РЅРµРЅРёСЏ Рё РєРѕРјРїР»РµРєС‚СѓСЋС‰РёРјРё (РїРѕ С„РѕСЂРјРµ)');


--
-- TOC entry 4613 (class 0 OID 19111)
-- Dependencies: 307
-- Data for Name: registrationproductfilecodeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO registrationproductfilecodeclassifier VALUES (1, '1', 'Р­РєСЃРїРµСЂС‚РЅРѕРµ Р·Р°РєР»СЋС‡РµРЅРёРµ РїРѕ РѕС†РµРЅРєРµ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё, СЌС„С„РµРєС‚РёРІРЅРѕСЃС‚Рё Рё РєР°С‡РµСЃС‚РІР° РјРµРґРёС†РёРЅСЃРєРѕРіРѕ РёР·РґРµР»РёСЏ РїСЂРё СЂРµРіРёСЃС‚СЂР°С†РёРё');
INSERT INTO registrationproductfilecodeclassifier VALUES (2, '10', 'Р—Р°СЏРІР»РµРЅРёРµ РЅР° РїСЂРѕРІРµРґРµРЅРёРµ СЌРєСЃРїРµСЂС‚РёР·С‹ РјРµРґРёС†РёРЅСЃРєРѕРіРѕ РёР·РґРµР»РёСЏ');
INSERT INTO registrationproductfilecodeclassifier VALUES (3, '11', 'Р—Р°СЏРІР»РµРЅРёРµ РЅР° РїСЂРѕРІРµРґРµРЅРёРµ СЂРµРіРёСЃС‚СЂР°С†РёРё РјРµРґРёС†РёРЅСЃРєРѕРіРѕ РёР·РґРµР»РёСЏ');
INSERT INTO registrationproductfilecodeclassifier VALUES (4, '12', 'Р—Р°СЏРІР»РµРЅРёРµ Рѕ РІРЅРµСЃРµРЅРёРё РёР·РјРµРЅРµРЅРёР№ РІ СЂРµРіРёСЃС‚СЂР°С†РёРѕРЅРЅРѕРµ РґРѕСЃСЊРµ РјРµРґРёС†РёРЅСЃРєРѕРіРѕ РёР·РґРµР»РёСЏ');
INSERT INTO registrationproductfilecodeclassifier VALUES (5, '13', 'Р—Р°СЏРІР»РµРЅРёРµ Рѕ РІС‹РґР°С‡Рµ РґСѓР±Р»РёРєР°С‚Р° СЂРµРіРёСЃС‚СЂР°С†РёРѕРЅРЅРѕРіРѕ СѓРґРѕСЃС‚РѕРІРµСЂРµРЅРёСЏ РЅР° РјРµРґРёС†РёРЅСЃРєРѕРµ РёР·РґРµР»РёРµ');
INSERT INTO registrationproductfilecodeclassifier VALUES (6, '14', 'Р—Р°СЏРІР»РµРЅРёРµ РѕР± РѕС‚РјРµРЅРµ (Р°РЅРЅСѓР»РёСЂРѕРІР°РЅРёРё) СЂРµРіРёСЃС‚СЂР°С†РёРѕРЅРЅРѕРіРѕ СѓРґРѕСЃС‚РѕРІРµСЂРµРЅРёСЏ РјРµРґРёС†РёРЅСЃРєРѕРіРѕ РёР·РґРµР»РёСЏ');
INSERT INTO registrationproductfilecodeclassifier VALUES (7, '15', 'РџРѕРґС‚РІРµСЂР¶РґРµРЅРёРµ СЃРѕРіР»Р°СЃРѕРІР°РЅРёСЏ (РЅРµ СЃРѕРіР»Р°СЃРѕРІР°РЅРёСЏ) СЌРєСЃРїРµСЂС‚РЅРѕРіРѕ Р·Р°РєР»СЋС‡РµРЅРёСЏ СЂРµС„РµСЂРµРЅС‚РЅРѕРіРѕ РіРѕСЃСѓРґР°СЂСЃС‚РІР° РїРѕ СЂРµР·СѓР»СЊС‚Р°С‚Р°Рј СЌРєСЃРїРµСЂС‚РёР·С‹ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё, СЌС„С„РµРєС‚РёРІРЅРѕСЃС‚Рё Рё РєР°С‡РµСЃС‚РІР° РјРµРґРёС†РёРЅСЃРєРёС… РёР·РґРµР»РёР№');
INSERT INTO registrationproductfilecodeclassifier VALUES (8, '2', 'Р­РєСЃРїРµСЂС‚РЅРѕРµ Р·Р°РєР»СЋС‡РµРЅРёРµ Рѕ РІРѕР·РјРѕР¶РЅРѕСЃС‚Рё (РЅРµРІРѕР·РјРѕР¶РЅРѕСЃС‚Рё) РІРЅРµСЃРµРЅРёСЏ РёР·РјРµРЅРµРЅРёР№ РІ СЂРµРіРёСЃС‚СЂР°С†РёРѕРЅРЅРѕРµ РґРѕСЃСЊРµ РЅР° РјРµРґРёС†РёРЅСЃРєРѕРµ РёР·РґРµР»РёРµ');
INSERT INTO registrationproductfilecodeclassifier VALUES (9, '3', 'Р—Р°РїСЂРѕСЃ Р·Р°СЏРІРёС‚РµР»СЋ Рѕ РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРё РґРѕРїРѕР»РЅРёС‚РµР»СЊРЅС‹С… СЃРІРµРґРµРЅРёР№');
INSERT INTO registrationproductfilecodeclassifier VALUES (10, '4', 'РћС‚РІРµС‚ РѕС‚ Р·Р°СЏРІРёС‚РµР»СЏ Рѕ РїСЂРµРґРѕСЃС‚Р°РІР»РµРЅРёРё РґРѕРїРѕР»РЅРёС‚РµР»СЊРЅС‹С… СЃРІРµРґРµРЅРёР№');
INSERT INTO registrationproductfilecodeclassifier VALUES (11, '5', 'Р—Р°РїСЂРѕСЃ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° (СЌРєСЃРїРµСЂС‚РЅРѕР№ РѕСЂРіР°РЅРёР·Р°С†РёРё) РіРѕСЃСѓРґР°СЂСЃС‚РІР° РїСЂРёР·РЅР°РЅРёСЏ, РЅР°РїСЂР°РІР»РµРЅРЅС‹Р№ РІ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Р№ РѕСЂРіР°РЅ СЂРµС„РµСЂРµРЅС‚РЅРѕРіРѕ РіРѕСЃСѓРґР°СЂСЃС‚РІР°');
INSERT INTO registrationproductfilecodeclassifier VALUES (12, '6', 'РћС‚РІРµС‚ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° (СЌРєСЃРїРµСЂС‚РЅРѕР№ РѕСЂРіР°РЅРёР·Р°С†РёРё) СЂРµС„РµСЂРµРЅС‚РЅРѕРіРѕ РіРѕСЃСѓРґР°СЂСЃС‚РІР°, РЅР°РїСЂР°РІР»РµРЅРЅС‹Р№ РІ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Р№ РѕСЂРіР°РЅ РіРѕСЃСѓРґР°СЂСЃС‚РІР° РіРѕСЃСѓРґР°СЂСЃС‚РІР° РїСЂРёР·РЅР°РЅРёСЏ');
INSERT INTO registrationproductfilecodeclassifier VALUES (13, '7', 'Р—Р°РјРµС‡Р°РЅРёРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° (СЌРєСЃРїРµСЂС‚РЅРѕР№ РѕСЂРіР°РЅРёР·Р°С†РёРё) РіРѕСЃСѓРґР°СЂСЃС‚РІР° РїСЂРёР·РЅР°РЅРёСЏ, РЅР°РїСЂР°РІР»РµРЅРЅС‹Р№ РІ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Р№ РѕСЂРіР°РЅ СЂРµС„РµСЂРµРЅС‚РЅРѕРіРѕ РіРѕСЃСѓРґР°СЂСЃС‚РІР°');
INSERT INTO registrationproductfilecodeclassifier VALUES (14, '8', 'РџСЂРµРґР»РѕР¶РµРЅРёРµ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ РѕСЂРіР°РЅР° (СЌРєСЃРїРµСЂС‚РЅРѕР№ РѕСЂРіР°РЅРёР·Р°С†РёРё) РіРѕСЃСѓРґР°СЂСЃС‚РІР° РїСЂРёР·РЅР°РЅРёСЏ, РЅР°РїСЂР°РІР»РµРЅРЅС‹Р№ РІ СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅС‹Р№ РѕСЂРіР°РЅ СЂРµС„РµСЂРµРЅС‚РЅРѕРіРѕ РіРѕСЃСѓРґР°СЂСЃС‚РІР°');
INSERT INTO registrationproductfilecodeclassifier VALUES (15, '9', 'РћС‚С‡РµС‚ РѕР± РёРЅСЃРїРµРєС†РёРё РїСЂРѕРёР·РІРѕРґСЃС‚РІР°');


--
-- TOC entry 4615 (class 0 OID 19119)
-- Dependencies: 309
-- Data for Name: specialsimplificationtypeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO specialsimplificationtypeclassifier VALUES (1, 'A', 'РІСЂРµРјРµРЅРЅРѕРµ С…СЂР°РЅРµРЅРёРµ С‚РѕРІР°СЂРѕРІ РІ РїРѕРјРµС‰РµРЅРёСЏС…, РЅР° РѕС‚РєСЂС‹С‚С‹С… РїР»РѕС‰Р°РґРєР°С… Рё РёРЅС‹С… С‚РµСЂСЂРёС‚РѕСЂРёСЏС… СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ РѕРїРµСЂР°С‚РѕСЂР°', NULL, NULL);
INSERT INTO specialsimplificationtypeclassifier VALUES (2, 'B', 'РІС‹РїСѓСЃРє С‚РѕРІР°СЂРѕРІ РґРѕ РїРѕРґР°С‡Рё С‚Р°РјРѕР¶РµРЅРЅРѕР№ РґРµРєР»Р°СЂР°С†РёРё РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃРѕ СЃС‚Р°С‚СЊРµР№ 197 РўРљ РўРЎ', NULL, NULL);
INSERT INTO specialsimplificationtypeclassifier VALUES (3, 'C', 'РїСЂРѕРІРµРґРµРЅРёРµ С‚Р°РјРѕР¶РµРЅРЅС‹С… РѕРїРµСЂР°С†РёР№ СЃРІСЏР·Р°РЅРЅС‹С… СЃ РІС‹РїСѓСЃРєРѕРј С‚РѕРІР°СЂРѕРІ, РІ РїРѕРјРµС‰РµРЅРёСЏС…, РЅР° РѕС‚РєСЂС‹С‚С‹С… РїР»РѕС‰Р°РґРєР°С… Рё РёРЅС‹С… С‚РµСЂСЂРёС‚РѕСЂРёСЏС… СѓРїРѕР»РЅРѕРјРѕС‡РµРЅРЅРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ РѕРїРµСЂР°С‚РѕСЂР°', NULL, NULL);
INSERT INTO specialsimplificationtypeclassifier VALUES (4, 'D', 'РёРЅС‹Рµ СЃРїРµС†РёР°Р»СЊРЅС‹Рµ СѓРїСЂРѕС‰РµРЅРёСЏ, РїСЂРµРґСѓСЃРјРѕС‚СЂРµРЅРЅС‹Рµ СЂРµРіСѓР»РёСЂСѓСЋС‰РёРјРё С‚Р°РјРѕР¶РµРЅРЅС‹Рµ РїСЂР°РІРѕРѕС‚РЅРѕС€РµРЅРёСЏ РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹РјРё РґРѕРіРѕРІРѕСЂР°РјРё Рё Р°РєС‚Р°РјРё, СЃРѕСЃС‚Р°РІР»СЏСЋС‰РёРјРё РїСЂР°РІРѕ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', NULL, NULL);


--
-- TOC entry 4617 (class 0 OID 19127)
-- Dependencies: 311
-- Data for Name: steeringwheelpositionclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO steeringwheelpositionclassifier VALUES (1, '10', 'СЃРїСЂР°РІР°', '2', NULL, NULL);
INSERT INTO steeringwheelpositionclassifier VALUES (2, '20', 'СЃР»РµРІР°', '2', NULL, NULL);
INSERT INTO steeringwheelpositionclassifier VALUES (3, '30', 'РїРѕСЃРµСЂРµРґРёРЅРµ', '2', NULL, NULL);
INSERT INTO steeringwheelpositionclassifier VALUES (4, '10', 'СЃРїСЂР°РІР°', '1', NULL, NULL);
INSERT INTO steeringwheelpositionclassifier VALUES (5, '20', 'СЃР»РµРІР°', '1', NULL, NULL);
INSERT INTO steeringwheelpositionclassifier VALUES (6, '30', 'РїРѕСЃРµСЂРµРґРёРЅРµ', '1', NULL, NULL);
INSERT INTO steeringwheelpositionclassifier VALUES (7, '10', 'СЃРїСЂР°РІР°', '3', NULL, NULL);
INSERT INTO steeringwheelpositionclassifier VALUES (8, '20', 'СЃР»РµРІР°', '3', NULL, NULL);
INSERT INTO steeringwheelpositionclassifier VALUES (9, '30', 'РїРѕСЃРµСЂРµРґРёРЅРµ', '3', NULL, NULL);


--
-- TOC entry 4619 (class 0 OID 19135)
-- Dependencies: 313
-- Data for Name: subjectsoflawclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO subjectsoflawclassifier VALUES (1, '05', 'РіРѕСЃСѓРґР°СЂСЃС‚РІРѕ', NULL, NULL);
INSERT INTO subjectsoflawclassifier VALUES (2, '10', 'С„РёР·РёС‡РµСЃРєРѕРµ Р»РёС†Рѕ', NULL, NULL);
INSERT INTO subjectsoflawclassifier VALUES (3, '15', 'СЋСЂРёРґРёС‡РµСЃРєРѕРµ Р»РёС†Рѕ', NULL, NULL);
INSERT INTO subjectsoflawclassifier VALUES (4, '20', 'СЃСѓР±СЉРµРєС‚ РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕРіРѕ РїСЂР°РІР°', NULL, NULL);
INSERT INTO subjectsoflawclassifier VALUES (5, '25', 'СЃСѓР±СЉРµРєС‚ РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕРіРѕ С‡Р°СЃС‚РЅРѕРіРѕ РїСЂР°РІР°', NULL, NULL);


--
-- TOC entry 4621 (class 0 OID 19143)
-- Dependencies: 315
-- Data for Name: technicalobjectkindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4623 (class 0 OID 19151)
-- Dependencies: 317
-- Data for Name: termsofdeliveryclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO termsofdeliveryclassifier VALUES (1, 'EXW', 'Р¤Р РђРќРљРћ-Р—РђР’РћР”', 'РњРµСЃС‚РѕРЅР°С…РѕР¶РґРµРЅРёРµ Р·Р°РІРѕРґР°', '');
INSERT INTO termsofdeliveryclassifier VALUES (2, 'FCA', 'Р¤Р РђРќРљРћ- РџР•Р Р•Р’РћР—Р§Р�Рљ', 'РЈРєР°Р·Р°РЅРЅРѕРµ РјРµСЃС‚Рѕ', '');
INSERT INTO termsofdeliveryclassifier VALUES (3, 'FAS', 'РЎР’РћР‘РћР”РќРћ Р’Р”РћР›Р¬ Р‘РћР РўРђ РЎРЈР”РќРђ', 'РЈРєР°Р·Р°РЅРЅС‹Р№ РїРѕСЂС‚ РїРѕРіСЂСѓР·РєРё', '');
INSERT INTO termsofdeliveryclassifier VALUES (4, 'FOB', 'РЎР’РћР‘РћР”РќРћ РќРђ Р‘РћР РўРЈ РЎРЈР”РќРђ', 'РЈРєР°Р·Р°РЅРЅС‹Р№ РїРѕСЂС‚ РїРѕРіСЂСѓР·РєРё', '');
INSERT INTO termsofdeliveryclassifier VALUES (5, 'CFR', 'РЎРўРћР�РњРћРЎРўР¬ Р� Р¤Р РђРҐРў', 'РЈРєР°Р·Р°РЅРЅС‹Р№ РїРѕСЂС‚ РЅР°Р·РЅР°С‡РµРЅРёСЏ', '');
INSERT INTO termsofdeliveryclassifier VALUES (6, 'CIF', 'РЎРўРћР�РњРћРЎРўР¬, РЎРўР РђРҐРћР’РђРќР�Р• Р� Р¤Р РђРҐРў', 'РЈРєР°Р·Р°РЅРЅС‹Р№ РїРѕСЂС‚ РЅР°Р·РЅР°С‡РµРЅРёСЏ', '');
INSERT INTO termsofdeliveryclassifier VALUES (7, 'CPT', 'РџР•Р Р•Р’РћР—РљРђ РћРџР›РђР§Р•РќРђ Р”Рћ ...', 'РЈРєР°Р·Р°РЅРЅРѕРµ РјРµСЃС‚Рѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ', '');
INSERT INTO termsofdeliveryclassifier VALUES (8, 'CIP', 'РџР•Р Р•Р’РћР—РљРђ Р� РЎРўР РђРҐРћР’РђРќР�Р• РћРџР›РђР§Р•РќР« Р”Рћ ...', 'РЈРєР°Р·Р°РЅРЅРѕРµ РјРµСЃС‚Рѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ', '');
INSERT INTO termsofdeliveryclassifier VALUES (9, 'DAF', 'Р¤Р РђРќРљРћ-Р“Р РђРќР�Р¦Рђ', 'РЈРєР°Р·Р°РЅРЅРѕРµ РјРµСЃС‚Рѕ', '');
INSERT INTO termsofdeliveryclassifier VALUES (10, 'DES', 'РџРћРЎРўРђР’РљРђ РЎ РЎРЈР”РќРђ', 'РЈРєР°Р·Р°РЅРЅС‹Р№ РїРѕСЂС‚ РЅР°Р·РЅР°С‡РµРЅРёСЏ', '');
INSERT INTO termsofdeliveryclassifier VALUES (11, 'DEQ', 'РџРћРЎРўРђР’РљРђ РЎ РџР Р�РЎРўРђРќР�', 'РЈРєР°Р·Р°РЅРЅС‹Р№ РїРѕСЂС‚ РЅР°Р·РЅР°С‡РµРЅРёСЏ', '');
INSERT INTO termsofdeliveryclassifier VALUES (12, 'DDU', 'РџРћРЎРўРђР’РљРђ Р‘Р•Р— РћРџР›РђРўР« РџРћРЁР›Р�РќР«', 'РЈРєР°Р·Р°РЅРЅРѕРµ РјРµСЃС‚Рѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ', '');
INSERT INTO termsofdeliveryclassifier VALUES (13, 'DDP', 'РџРћРЎРўРђР’РљРђ РЎ РћРџР›РђРўРћР™ РџРћРЁР›Р�РќР«', 'РЈРєР°Р·Р°РЅРЅРѕРµ РјРµСЃС‚Рѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ', '');
INSERT INTO termsofdeliveryclassifier VALUES (14, 'XXX', 'Р�РќРћР• РќРђР�РњР•РќРћР’РђРќР�Р• РЈРЎР›РћР’Р�РЇ РџРћРЎРўРђР’РљР�', 'РћРїРёСЃР°РЅРёРµ СѓСЃР»РѕРІРёР№ РїРѕСЃС‚Р°РІРєРё, РїСЂРёРІРµРґРµРЅРЅРѕРµ РІ РєРѕРЅС‚СЂР°РєС‚Рµ', '');
INSERT INTO termsofdeliveryclassifier VALUES (15, 'DAT', 'РџРћРЎРўРђР’РљРђ РќРђ РўР•Р РњР�РќРђР›Р•', 'РЈРєР°Р·Р°РЅРЅС‹Р№ С‚РµСЂРјРёРЅР°Р»', '');
INSERT INTO termsofdeliveryclassifier VALUES (16, 'DAP', 'РџРћРЎРўРђР’РљРђ Р’ РџРЈРќРљРўР•', 'РЈРєР°Р·Р°РЅРЅС‹Р№ РїСѓРЅРєС‚', '');


--
-- TOC entry 4625 (class 0 OID 19159)
-- Dependencies: 319
-- Data for Name: transactiontypeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO transactiontypeclassifier VALUES (1, 'K', 'РџРµСЂРµРґР°С‡Р° С‚РѕРІР°СЂР° РїРѕ РёРЅРѕРјСѓ РґРѕРіРѕРІРѕСЂСѓ');
INSERT INTO transactiontypeclassifier VALUES (2, 'J', 'РџРµСЂРµРґР°С‡Р° РІРѕР·РІСЂР°С‰РµРЅРЅРѕРіРѕ С‚РѕРІР°СЂР°');
INSERT INTO transactiontypeclassifier VALUES (3, 'I', 'РџРµСЂРµРґР°С‡Р° С‚РѕРІР°СЂР° РІ РєР°С‡РµСЃС‚РІРµ Р±РµР·РІРѕР·РјРµР·РґРЅРѕР№, РіСѓРјР°РЅРёС‚Р°СЂРЅРѕР№ Р»РёР±Рѕ С‚РµС…РЅРёС‡РµСЃРєРѕР№ РїРѕРјРѕС‰Рё, РґР°СЂР°');
INSERT INTO transactiontypeclassifier VALUES (4, 'H', 'РџРµСЂРµРґР°С‡Р° С‚РѕРІР°СЂР° РїРѕ РґРѕРіРѕРІРѕСЂСѓ С…СЂР°РЅРµРЅРёСЏ РЅР° СЃСЂРѕРє 1 РіРѕРґ Рё Р±РѕР»РµРµ');
INSERT INTO transactiontypeclassifier VALUES (5, 'G', 'РџРµСЂРµРґР°С‡Р° С‚РѕРІР°СЂР° РїРѕ РґРѕРіРѕРІРѕСЂСѓ С„РёРЅР°РЅСЃРѕРІРѕР№ Р°СЂРµРЅРґС‹ (Р»РёР·РёРЅРіР°) РЅР° СЃСЂРѕРє 1 РіРѕРґ Рё Р±РѕР»РµРµ');
INSERT INTO transactiontypeclassifier VALUES (6, 'F', 'РџРµСЂРµРґР°С‡Р° С‚РѕРІР°СЂР° РїРѕ РєРѕРЅСЃРёРіРЅР°С†РёРѕРЅРЅРѕРјСѓ СЃРѕРіР»Р°С€РµРЅРёСЋ');
INSERT INTO transactiontypeclassifier VALUES (7, 'E', 'РџРµСЂРµРґР°С‡Р° С‚РѕРІР°СЂР° РІ РєР°С‡РµСЃС‚РІРµ РІРєР»Р°РґР° РІ СѓСЃС‚Р°РІРЅС‹Р№ С„РѕРЅРґ');
INSERT INTO transactiontypeclassifier VALUES (8, 'D', 'РџРµСЂРµРґР°С‡Р° С‚РѕРІР°СЂР° РїРѕСЃР»Рµ РїРµСЂРµСЂР°Р±РѕС‚РєРё');
INSERT INTO transactiontypeclassifier VALUES (9, 'C', 'РџРµСЂРµРґР°С‡Р° С‚РѕРІР°СЂР° РЅР° РїРµСЂРµСЂР°Р±РѕС‚РєСѓ');
INSERT INTO transactiontypeclassifier VALUES (10, 'B', 'РџРµСЂРµРґР°С‡Р° С‚РѕРІР°СЂР° РїРѕ РґРѕРіРѕРІРѕСЂСѓ РјРµРЅС‹');
INSERT INTO transactiontypeclassifier VALUES (11, 'A', 'РџРµСЂРµРґР°С‡Р° С‚РѕРІР°СЂР° РїРѕ РґРѕРіРѕРІРѕСЂСѓ РєСѓРїР»Рё-РїСЂРѕРґР°Р¶Рё');


--
-- TOC entry 4627 (class 0 OID 19167)
-- Dependencies: 321
-- Data for Name: transportandfreightmodesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO transportandfreightmodesclassifier VALUES (1, '10', 'РњРѕСЂСЃРєРѕР№/СЂРµС‡РЅРѕР№ С‚СЂР°РЅСЃРїРѕСЂС‚', NULL, '* РІ С‚РѕРј С‡РёСЃР»Рµ Р»СЋР±РѕРµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ, РїРµСЂРµРІРѕР·РёРјРѕРµ РїРѕСЃСЂРµРґСЃС‚РІРѕРј СѓРєР°Р·Р°РЅРЅРѕРіРѕ РІРёРґР° С‚СЂР°РЅСЃРїРѕСЂС‚Р°');
INSERT INTO transportandfreightmodesclassifier VALUES (2, '20', 'Р–РµР»РµР·РЅРѕРґРѕСЂРѕР¶РЅС‹Р№ С‚СЂР°РЅСЃРїРѕСЂС‚', NULL, '* РІ С‚РѕРј С‡РёСЃР»Рµ Р»СЋР±РѕРµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ, РїРµСЂРµРІРѕР·РёРјРѕРµ РїРѕСЃСЂРµРґСЃС‚РІРѕРј СѓРєР°Р·Р°РЅРЅРѕРіРѕ РІРёРґР° С‚СЂР°РЅСЃРїРѕСЂС‚Р°');
INSERT INTO transportandfreightmodesclassifier VALUES (3, '30', 'РђРІС‚РѕРґРѕСЂРѕР¶РЅС‹Р№ С‚СЂР°РЅСЃРїРѕСЂС‚, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ, СѓРєР°Р·Р°РЅРЅС‹С… РїРѕРґ РєРѕРґР°РјРё 31, 32', NULL, '* РІ С‚РѕРј С‡РёСЃР»Рµ Р»СЋР±РѕРµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ, РїРµСЂРµРІРѕР·РёРјРѕРµ РїРѕСЃСЂРµРґСЃС‚РІРѕРј СѓРєР°Р·Р°РЅРЅРѕРіРѕ РІРёРґР° С‚СЂР°РЅСЃРїРѕСЂС‚Р°');
INSERT INTO transportandfreightmodesclassifier VALUES (4, '31', 'РЎРѕСЃС‚Р°РІ С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ (С‚СЏРіР°С‡ СЃ РїРѕР»СѓРїСЂРёС†РµРїРѕРј РёР»Рё РїСЂРёС†РµРїРѕРј)', NULL, '* РІ С‚РѕРј С‡РёСЃР»Рµ Р»СЋР±РѕРµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ, РїРµСЂРµРІРѕР·РёРјРѕРµ РїРѕСЃСЂРµРґСЃС‚РІРѕРј СѓРєР°Р·Р°РЅРЅРѕРіРѕ РІРёРґР° С‚СЂР°РЅСЃРїРѕСЂС‚Р°');
INSERT INTO transportandfreightmodesclassifier VALUES (5, '32', 'РЎРѕСЃС‚Р°РІ С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ (С‚СЏРіР°С‡ СЃ РїСЂРёС†РµРїРѕРј (-Р°РјРё) Рё РїРѕР»СѓРїСЂРёС†РµРїРѕРј (-Р°РјРё)', NULL, '* РІ С‚РѕРј С‡РёСЃР»Рµ Р»СЋР±РѕРµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ, РїРµСЂРµРІРѕР·РёРјРѕРµ РїРѕСЃСЂРµРґСЃС‚РІРѕРј СѓРєР°Р·Р°РЅРЅРѕРіРѕ РІРёРґР° С‚СЂР°РЅСЃРїРѕСЂС‚Р°');
INSERT INTO transportandfreightmodesclassifier VALUES (6, '40', 'Р’РѕР·РґСѓС€РЅС‹Р№ С‚СЂР°РЅСЃРїРѕСЂС‚', NULL, '* РІ С‚РѕРј С‡РёСЃР»Рµ Р»СЋР±РѕРµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ, РїРµСЂРµРІРѕР·РёРјРѕРµ РїРѕСЃСЂРµРґСЃС‚РІРѕРј СѓРєР°Р·Р°РЅРЅРѕРіРѕ РІРёРґР° С‚СЂР°РЅСЃРїРѕСЂС‚Р°');
INSERT INTO transportandfreightmodesclassifier VALUES (7, '50', 'РџРѕС‡С‚РѕРІРѕРµ РѕС‚РїСЂР°РІР»РµРЅРёРµ', NULL, NULL);
INSERT INTO transportandfreightmodesclassifier VALUES (8, '71', 'РўСЂСѓР±РѕРїСЂРѕРІРѕРґРЅС‹Р№ С‚СЂР°РЅСЃРїРѕСЂС‚', NULL, NULL);
INSERT INTO transportandfreightmodesclassifier VALUES (9, '72', 'Р›РёРЅРёРё СЌР»РµРєС‚СЂРѕРїРµСЂРµРґР°С‡Рё', NULL, NULL);
INSERT INTO transportandfreightmodesclassifier VALUES (10, '80', 'Р’РЅСѓС‚СЂРµРЅРЅРёР№ РІРѕРґРЅС‹Р№ С‚СЂР°РЅСЃРїРѕСЂС‚', NULL, '* РІ С‚РѕРј С‡РёСЃР»Рµ Р»СЋР±РѕРµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ, РїРµСЂРµРІРѕР·РёРјРѕРµ РїРѕСЃСЂРµРґСЃС‚РІРѕРј СѓРєР°Р·Р°РЅРЅРѕРіРѕ РІРёРґР° С‚СЂР°РЅСЃРїРѕСЂС‚Р°');
INSERT INTO transportandfreightmodesclassifier VALUES (11, '90', 'РўСЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ, РїРµСЂРµРјРµС‰Р°СЋС‰РµРµСЃСЏ РІ РєР°С‡РµСЃС‚РІРµ С‚РѕРІР°СЂР° СЃРІРѕРёРј С…РѕРґРѕРј', NULL, NULL);
INSERT INTO transportandfreightmodesclassifier VALUES (12, '99', 'РџСЂРѕС‡РёРµ', NULL, NULL);


--
-- TOC entry 4629 (class 0 OID 19175)
-- Dependencies: 323
-- Data for Name: userkindtimeadvincidentclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO userkindtimeadvincidentclassifier VALUES (1, '01', 'РјРµРґРёС†РёРЅСЃРєРёР№ РїРµСЂСЃРѕРЅР°Р»');
INSERT INTO userkindtimeadvincidentclassifier VALUES (2, '02', 'РїР°С†РёРµРЅС‚');
INSERT INTO userkindtimeadvincidentclassifier VALUES (3, '03', 'РґСЂСѓРіРѕРµ');


--
-- TOC entry 4631 (class 0 OID 19183)
-- Dependencies: 325
-- Data for Name: vehiclebodycolorclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclebodycolorclassifier VALUES (1, '1003', 'Р¶РµР»С‚С‹Р№', NULL, NULL);
INSERT INTO vehiclebodycolorclassifier VALUES (2, '2010', 'РѕСЂР°РЅР¶РµРІС‹Р№', NULL, NULL);
INSERT INTO vehiclebodycolorclassifier VALUES (3, '3001', 'РєСЂР°СЃРЅС‹Р№', NULL, NULL);
INSERT INTO vehiclebodycolorclassifier VALUES (4, '4008', 'С„РёРѕР»РµС‚РѕРІС‹Р№', NULL, NULL);
INSERT INTO vehiclebodycolorclassifier VALUES (5, '5005', 'СЃРёРЅРёР№', NULL, NULL);
INSERT INTO vehiclebodycolorclassifier VALUES (6, '6032', 'Р·РµР»РµРЅС‹Р№', NULL, NULL);
INSERT INTO vehiclebodycolorclassifier VALUES (7, '7004', 'СЃРµСЂС‹Р№', NULL, NULL);
INSERT INTO vehiclebodycolorclassifier VALUES (8, '8002', 'РєРѕСЂРёС‡РЅРµРІС‹Р№', NULL, NULL);
INSERT INTO vehiclebodycolorclassifier VALUES (9, '9003', 'Р±РµР»С‹Р№', NULL, NULL);
INSERT INTO vehiclebodycolorclassifier VALUES (10, '9004', 'С‡РµСЂРЅС‹Р№', NULL, NULL);


--
-- TOC entry 4633 (class 0 OID 19191)
-- Dependencies: 327
-- Data for Name: vehiclebrandsclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclebrandsclassifier VALUES (1, '001', 'ABARTH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (2, '002', 'ABG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (3, '003', 'AC CARS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (4, '004', 'ACERBI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (5, '005', 'ACKERMANN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (6, '006', 'ACTM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (7, '007', 'ACURA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (8, '008', 'ADIVA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (9, '009', 'ADLY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (10, '010', 'ADR TRAILERS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (11, '011', 'ADRIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (12, '012', 'AEON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (13, '013', 'AERMACCHI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (14, '014', 'AJP', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (15, '015', 'AJS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (16, '016', 'ALBAR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (17, '017', 'ALFA ROMEO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (18, '018', 'ALI RIZA USTA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (19, '019', 'ALLIGATOR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (20, '020', 'ALPINA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (21, '021', 'ALPINE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (22, '022', 'AMC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (23, '023', 'AMERICAN EAGLE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (24, '024', 'AMMANN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (25, '025', 'ANKAI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (26, '026', 'ANNABURGER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (27, '027', 'APRILIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (28, '028', 'ARCTIC CAT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (29, '029', 'ARDOR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (30, '030', 'ARIEL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (31, '031', 'ARO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (32, '032', 'ARQIN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (33, '033', 'ARTEGA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (34, '034', 'ASCARI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (35, '035', 'ASIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (36, '036', 'ASPES', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (37, '037', 'ASTON MARTIN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (38, '038', 'ASTRA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (39, '039', 'ATEK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (40, '040', 'ATK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (41, '041', 'ATLAS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (42, '042', 'ATLAS HONDA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (43, '043', 'AUDI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (44, '044', 'AUSTIN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (45, '045', 'AUTOSAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (46, '046', 'AVIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (47, '047', 'AVTOTREIDING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (48, '048', 'BAJAJ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (49, '049', 'BALKANCAR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (50, '050', 'BALTMOTORS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (51, '051', 'BAMX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (52, '052', 'BAROSSA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (53, '053', 'BARYVAL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (54, '054', 'BAW', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (55, '055', 'BAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (56, '056', 'BEIFANG BENCHI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (57, '057', 'BEIJING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (58, '058', 'BELAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (59, '059', 'BENALU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (60, '060', 'BENELLI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (61, '061', 'BENNCHE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (62, '062', 'BENTLEY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (63, '063', 'BERGER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (64, '064', 'BETA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (65, '065', 'BIG BEAR CHOPPERS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (66, '066', 'BIG DOG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (67, '067', 'BIMOTA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (68, '068', 'BITTER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (69, '069', 'BLATA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (70, '070', 'BMW', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (71, '071', 'BOBCAT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (72, '072', 'BOCKMANN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (73, '073', 'BODEX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (74, '074', 'BOGDAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (75, '075', 'BOMAG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (76, '076', 'BOOM TRIKES', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (77, '077', 'BOVA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (78, '078', 'BPG RECREATIONAL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (79, '079', 'BRAMMO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (80, '080', 'BRIAB', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (81, '081', 'BRILLIANCE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (82, '082', 'BRISTOL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (83, '083', 'BROOKE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (84, '084', 'BROSHUIS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (85, '085', 'BSA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (86, '086', 'BSLT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (87, '087', 'BSS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (88, '088', 'BUCCIMOTO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (89, '089', 'BUELL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (90, '090', 'BUGATTI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (91, '091', 'BUICK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (92, '092', 'BURG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (93, '093', 'BYD', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (94, '094', 'CADILLAC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (95, '095', 'CAGIVA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (96, '096', 'CALIFORNIA SCOOTER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (97, '097', 'CALLAWAY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (98, '098', 'CAMC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (99, '099', 'CAMPTOURIST', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (100, '100', 'CAN-AM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (101, '101', 'CARBODIES', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (102, '102', 'CARDI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (103, '103', 'CARGOBIKE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (104, '104', 'CARNEHL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (105, '105', 'CASE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (106, '106', 'CATERHAM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (107, '107', 'CATERPILLAR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (108, '108', 'CCM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (109, '109', 'CECTEK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (110, '110', 'CFMOTO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (111, '111', 'CH RACING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (112, '112', 'CHAMPION', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (113, '113', 'CHANA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (114, '114', 'CHANG JIANG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (115, '115', 'CHANGAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (116, '116', 'CHANGFENG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (117, '117', 'CHANGHE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (118, '118', 'CHANGLIN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (119, '119', 'CHENGGONG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (120, '120', 'CHEREAU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (121, '121', 'CHERY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (122, '122', 'CHEVAL LIBERTE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (123, '123', 'CHEVROLET', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (124, '124', 'CHRYSLER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (125, '125', 'CIFA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (126, '126', 'CIMC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (127, '127', 'CIMC SILVERGREEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (128, '128', 'CITROEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (129, '129', 'CIZETA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (130, '130', 'COBRA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (131, '131', 'COGGIOLA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (132, '132', 'CPI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (133, '133', 'CRS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (134, '134', 'DACIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (135, '135', 'DADI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (136, '136', 'DAEWOO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (137, '137', 'DAF', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (138, '138', 'DAIHATSU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (139, '139', 'DAIMLER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (140, '140', 'DALLAS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (141, '141', 'DATSUN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (142, '142', 'DE TOMASO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (143, '143', 'DELOREAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (144, '144', 'DEMAG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (145, '145', 'DERWAYS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (146, '146', 'DKW', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (147, '147', 'DODGE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (148, '148', 'DOLL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (149, '149', 'DONGFENG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (150, '150', 'DONINVEST', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (151, '151', 'DONKERVOORT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (152, '152', 'DOOSAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (153, '153', 'DRESSTA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (154, '154', 'DYNAPAC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (155, '155', 'E-MAX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (156, '156', 'E-TON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (157, '157', 'ETROPOLIS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (158, '158', 'EAGLE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (159, '159', 'EAGLE WING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (160, '160', 'ECOSSE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (161, '161', 'EDUARD', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (162, '162', 'EFINI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (163, '163', 'EIGENBAU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (164, '164', 'ELFIN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (165, '165', 'ERAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (166, '166', 'EBR (ERIK BUELL RACING)', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (167, '167', 'ESPERO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (168, '168', 'EXCALIBUR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (169, '169', 'EXPLORER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (170, '170', 'FACTORY BIKE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (171, '171', 'FANTIC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (172, '172', 'FAUN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (173, '173', 'FAW', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (174, '174', 'FAYMONVILLE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (175, '175', 'FELDBINDER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (176, '176', 'FERRARI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (177, '177', 'FGR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (178, '178', 'FIAT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (179, '179', 'FIAT-HITACHI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (180, '180', 'FIAT KOBELCO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (181, '181', 'FIORI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (182, '182', 'FISCHER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (183, '183', 'FISKER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (184, '184', 'FLIEGL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (185, '185', 'FOKAMO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (186, '186', 'FORD', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (187, '187', 'FOSTI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (188, '188', 'FOTON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (189, '189', 'FREIGHTLINER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (190, '190', 'FRUEHAUF', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (191, '191', 'FSM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (192, '192', 'FSO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (193, '193', 'FUCHS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (194, '194', 'FUQI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (195, '195', 'FURUKAWA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (196, '196', 'GARELLI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (197, '197', 'GAS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (198, '198', 'GASVI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (199, '199', 'GAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (200, '200', 'GEELY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (201, '201', 'GENERAL MOTORS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (202, '202', 'GENERIC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (203, '203', 'GENUINE SCOOTER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (204, '204', 'GEO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (205, '205', 'GIANT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (206, '206', 'GIANTCO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (207, '207', 'GILERA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (208, '208', 'GMC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (209, '209', 'GOES', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (210, '210', 'GOFA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (211, '211', 'GOLDEN DRAGON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (212, '212', 'GONOW', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (213, '213', 'GOODWILL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (214, '214', 'GOVECS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (215, '215', 'GRAYADAMS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (216, '216', 'GRC MOTO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (217, '217', 'GREAT WALL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (218, '218', 'GREENTRANS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (219, '219', 'GROENEWEGEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (220, '220', 'GROVE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (221, '221', 'GRUNWALD', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (222, '222', 'GRYPHON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (223, '223', 'GT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (224, '224', 'GUMPERT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (225, '225', 'GURLESENYIL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (226, '226', 'HAFEI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (227, '227', 'HAIMA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (228, '228', 'HALLER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (229, '229', 'HAMM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (230, '230', 'HANIX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (231, '231', 'HANOMAG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (232, '232', 'HANWOO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (233, '233', 'HAOJIN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (234, '234', 'HAPERT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (235, '235', 'HARLEY-DAVIDSON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (236, '236', 'HBM-NOBAS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (237, '237', 'HDM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (238, '238', 'HEADBANGER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (239, '239', 'HEALEY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (240, '240', 'HENDRICKS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (241, '241', 'HERCULES', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (242, '242', 'HERO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (243, '243', 'HERO ELECTRIC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (244, '244', 'HERO HONDA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (245, '245', 'HESKETH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (246, '246', 'HFR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (247, '247', 'HIDROMEK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (248, '248', 'HIGER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (249, '249', 'HIGHLAND', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (250, '250', 'HINDUSTAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (251, '251', 'HINO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (252, '252', 'HISUN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (253, '253', 'HITACHI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (254, '254', 'HM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (255, '255', 'HOBBS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (256, '256', 'HOLDEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (257, '257', 'HONDA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (258, '258', 'HONGYAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (259, '259', 'HORCH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (260, '260', 'HOREX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (261, '261', 'HOWO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (262, '262', 'HP', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (263, '263', 'HP POWER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (264, '264', 'HUANDA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (265, '265', 'HUANGHAI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (266, '266', 'HUMBAUR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (267, '267', 'HUMMER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (268, '268', 'HUSABERG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (269, '269', 'HUSQVARNA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (270, '270', 'HYDREMA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (271, '271', 'HYOSUNG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (272, '272', 'HYUNDAI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (273, '273', 'IFA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (274, '274', 'IKARBUS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (275, '275', 'IKARUS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (276, '276', 'INDIAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (277, '277', 'INFINITI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (278, '278', 'INNOCENTI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (279, '279', 'INNOSCOOTER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (280, '280', 'INTERNATIONAL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (281, '281', 'INTERSTATE 1', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (282, '282', 'INTREPID', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (283, '283', 'INVICTA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (284, '284', 'IPV', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (285, '285', 'IRAN KHODRO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (286, '286', 'IRBIS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (287, '287', 'IRISBUS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (288, '288', 'ISDERA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (289, '289', 'ISUZU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (290, '290', 'ITALJET', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (291, '291', 'IVECO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (292, '292', 'IZH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (293, '293', 'IZUKA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (294, '294', 'JAC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (295, '295', 'JAGUAR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (296, '296', 'JAWA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (297, '297', 'JCB', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (298, '298', 'JEEP', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (299, '299', 'JELCZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (300, '300', 'JIALING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (301, '301', 'JIANGLING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (302, '302', 'JIANGNAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (303, '303', 'JIANSHE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (304, '304', 'JINBEI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (305, '305', 'JINCHENG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (306, '306', 'JINLUN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (307, '307', 'JOHN DEERE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (308, '308', 'JOHNNY PAG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (309, '309', 'JONWAY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (310, '310', 'JORDAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (311, '311', 'JRL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (312, '312', 'JUEJIN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (313, '313', 'JUKI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (314, '314', 'JUMBO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (315, '315', 'JYKI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (316, '316', 'K2O', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (317, '317', 'KABIRDASS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (318, '318', 'KAMAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (319, '319', 'KANGDA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (320, '320', 'KANUNI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (321, '321', 'KASINSKI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (322, '322', 'KASSBOHRER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (323, '323', 'KATO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (324, '324', 'KAVZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (325, '325', 'KAWASAKI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (326, '326', 'KEEWAY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (327, '327', 'KEL-BERG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (328, '328', 'KENWORTH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (329, '329', 'KIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (330, '330', 'KINETIC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (331, '331', 'KING LONG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (332, '332', 'KINROAD', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (333, '333', 'KIP', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (334, '334', 'KOBELCO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (335, '335', 'KOGEL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (336, '336', 'KOENIGSEGG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (337, '337', 'KOMATSU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (338, '338', 'KRAMER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (339, '339', 'KRAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (340, '340', 'KRONE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (341, '341', 'KRUPP', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (342, '342', 'KTM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (343, '343', 'KUBOTA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (344, '344', 'KUFER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (345, '345', 'KYMCO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (346, '346', 'LADA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (347, '347', 'LAG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (348, '348', 'LAMBERET', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (349, '349', 'LAMBORGHINI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (350, '350', 'LAMBRETTA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (351, '351', 'LANCIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (352, '352', 'LAND ROVER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (353, '353', 'LANDWIND', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (354, '354', 'LANGENDORF', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (355, '355', 'LANGFELD', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (356, '356', 'LATRE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (357, '357', 'LAUGE JENSEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (358, '358', 'LAVERDA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (359, '359', 'LAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (360, '360', 'LDV', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (361, '361', 'LECTRIX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (362, '362', 'LEHMAN TRIKES', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (363, '363', 'LEM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (364, '364', 'LEONHARDT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (365, '365', 'LEXUS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (366, '366', 'LEYLAND', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (367, '367', 'LIAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (368, '368', 'LIDER TRADE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (369, '369', 'LIEBHERR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (370, '370', 'LIFAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (371, '371', 'LINCOLN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (372, '372', 'LINHAI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (373, '373', 'LINTRAILERS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (374, '374', 'LIUGONG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (375, '375', 'LML', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (376, '376', 'LOCATELLI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (377, '377', 'LOHIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (378, '378', 'LOHR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (379, '379', 'LONCIN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (380, '380', 'LONKING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (381, '381', 'LOTUS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (382, '382', 'LTI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (383, '383', 'LUAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (384, '384', 'LUNA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (385, '385', 'LUXGEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (386, '386', 'LYNX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (387, '387', 'MACBOR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (388, '388', 'MACK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (389, '389', 'MAGIRUS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (390, '390', 'MAGNI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (391, '391', 'MAHINDRA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (392, '392', 'MAISONNEUVE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (393, '393', 'MALAGUTI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (394, '394', 'MAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (395, '395', 'MANAC-AUTO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (396, '396', 'MANITOU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (397, '397', 'MARCOPOLO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (398, '398', 'MARCOS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (399, '399', 'MARINE TURBINE TECHNOLOGIES', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (400, '400', 'MARLIN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (401, '401', 'MARUSSIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (402, '402', 'MARUTI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (403, '403', 'MASERATI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (404, '404', 'MAVIZEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (405, '405', 'MAYBACH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (406, '406', 'MAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (407, '407', 'MAZDA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (408, '408', 'MBK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (409, '409', 'MBS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (410, '410', 'MCLAREN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (411, '411', 'MEGA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (412, '412', 'MEGELLI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (413, '413', 'MEILLER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (414, '414', 'MENCI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (415, '415', 'MERCEDES-BENZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (416, '416', 'MERCURY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (417, '417', 'MERLO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (418, '418', 'METISSE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (419, '419', 'METROCAB', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (420, '420', 'METSAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (421, '421', 'MEUSBURGER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (422, '422', 'MG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (423, '423', 'MIDUAL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (424, '424', 'MIKILON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (425, '425', 'MINELLI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (426, '426', 'MINI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (427, '427', 'MINSK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (428, '428', 'MISSION', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (429, '429', 'MITSUBISHI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (430, '430', 'MITSUOKA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (431, '431', 'MODENAS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (432, '432', 'MONDIAL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (433, '433', 'MONTE CARLO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (434, '434', 'MONTESA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (435, '435', 'MONTRACON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (436, '436', 'MORGAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (437, '437', 'MOSKVICH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (438, '438', 'MOTO GUZZI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (439, '439', 'MOTO MORINI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (440, '440', 'MOTOCZYSZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (441, '441', 'MOTORHISPANIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (442, '442', 'MUDAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (443, '443', 'MULTICAR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (444, '444', 'MUZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (445, '445', 'MV AGUSTA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (446, '446', 'MZKT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (447, '447', 'NARKO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (448, '448', 'NCR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (449, '449', 'NEANDER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (450, '450', 'NEOPLAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (451, '451', 'NESS MOTORCYCLES', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (452, '452', 'NEW HOLLAND', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (453, '453', 'NEXUS MOTORS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (454, '454', 'NIPPONIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (455, '455', 'NISSAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (456, '456', 'NOBLE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (457, '457', 'NOOTEBOOM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (458, '458', 'NORDIC TANK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (459, '459', 'NORTON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (460, '460', 'NYSA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (461, '461', 'OK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (462, '462', 'O.ME.P.S.', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (463, '463', 'OFF MECC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (464, '464', 'OLDSMOBILE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (465, '465', 'OLTCIT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (466, '466', 'OMT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (467, '467', 'OPEL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (468, '468', 'ORION', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (469, '469', 'OSCA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (470, '470', 'OTOSAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (471, '471', 'PACTON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (472, '472', 'PAGANI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (473, '473', 'PALFINGER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (474, '474', 'PANNONIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (475, '475', 'PANOZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (476, '476', 'PANTHER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (477, '477', 'PARCISA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (478, '478', 'PAYKAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (479, '479', 'PAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (480, '480', 'PERAVES', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (481, '481', 'PERODUA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (482, '482', 'PETERBILT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (483, '483', 'PEUGEOT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (484, '484', 'PGO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (485, '485', 'PIAGGIO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (486, '486', 'PITSTER PRO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (487, '487', 'PKW', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (488, '488', 'PLYMOUTH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (489, '489', 'PNO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (490, '490', 'POLARIS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (491, '491', 'POLINI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (492, '492', 'POLONEZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (493, '493', 'PONSSE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (494, '494', 'PONTIAC', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (495, '495', 'PORSCHE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (496, '496', 'POWERCAT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (497, '497', 'PRAGA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (498, '498', 'PRC (PRO RACING CYCLES)', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (499, '499', 'PCW (PRECISION CYCLE WORKS)', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (500, '500', 'PREMIER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (501, '501', 'PRIM-BALL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (502, '502', 'PROTON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (503, '503', 'PUCH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (504, '504', 'PUMA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (505, '505', 'PUTZMEISTER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (506, '506', 'QINGQI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (507, '507', 'QLINK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (508, '508', 'QOROS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (509, '509', 'QUANTYA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (510, '510', 'QVALE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (511, '511', 'RAF', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (512, '512', 'RANGE ROVER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (513, '513', 'RAVI PIAGGIO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (514, '514', 'RED WING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (515, '515', 'REDNECK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (516, '516', 'RELIANT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (517, '517', 'RENAISSANCE CARS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (518, '518', 'RENAULT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (519, '519', 'RENDERS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (520, '520', 'RESPO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (521, '521', 'RHINO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (522, '522', 'RIDLEY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (523, '523', 'RIEJU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (524, '524', 'RINSPEED', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (525, '525', 'ROAD HOPPER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (526, '526', 'ROBUR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (527, '527', 'ROEHR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (528, '528', 'ROHR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (529, '529', 'ROKON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (530, '530', 'ROLFO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (531, '531', 'ROLLS-ROYCE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (532, '532', 'RONART', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (533, '533', 'ROVER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (534, '534', 'ROYAL ENFIELD', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (535, '535', 'RUCKER PERFORMANCE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (536, '536', 'SAAB', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (537, '537', 'SACHS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (538, '538', 'SACIM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (539, '539', 'SALEEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (540, '540', 'SAMRO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (541, '541', 'SAMSUNG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (542, '542', 'SAMURAI CHOPPER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (543, '543', 'SANGLAS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (544, '544', 'SANTANA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (545, '545', 'SANY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (546, '546', 'SARIS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (547, '547', 'SATURN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (548, '548', 'SAXON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (549, '549', 'SCANIA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (550, '550', 'SCHMITZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (551, '551', 'SCHWARZMULLER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (552, '552', 'SCHWINN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (553, '553', 'SCION', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (554, '554', 'SCORPA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (555, '555', 'SDLG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (556, '556', 'SEAT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (557, '557', 'SEAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (558, '558', 'SEM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (559, '559', 'SENKE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (560, '560', 'SETRA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (561, '561', 'SHAANXI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (562, '562', 'SHANTUI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (563, '563', 'SHELBY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (564, '564', 'SHENLONG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (565, '565', 'SHERCO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (566, '566', 'SHIFENG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (567, '567', 'SHOKEL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (568, '568', 'SHORELANDER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (569, '569', 'SHUANGHUAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (570, '570', 'SINOMACH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (571, '571', 'SISU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (572, '572', 'SKI-DOO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (573, '573', 'SKIF', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (574, '574', 'SKODA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (575, '575', 'SKYTEAM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (576, '576', 'SMA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (577, '577', 'SMART', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (578, '578', 'SOKON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (579, '579', 'SOMMER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (580, '580', 'SOUEAST', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (581, '581', 'SPECTRE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (582, '582', 'SPIER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (583, '583', 'SPYKER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (584, '584', 'SSANGYONG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (585, '585', 'STANDBIKE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (586, '586', 'STAS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (587, '587', 'STEELBEAR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (588, '588', 'STEINSBERGER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (589, '589', 'STELS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (590, '590', 'STEMA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (591, '591', 'STILL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (592, '592', 'SUBARU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (593, '593', 'SUCKER PUNCH SALLYS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (594, '594', 'SUKIDA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (595, '595', 'SUNDIRO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (596, '596', 'SUNLONG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (597, '597', 'SUPER MOTOR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (598, '598', 'SUZUKI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (599, '599', 'SYM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (600, '600', 'SYRENA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (601, '601', 'TADANO FAUN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (602, '602', 'TALBOT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (603, '603', 'TARPAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (604, '604', 'TARSUS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (605, '605', 'TATA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (606, '606', 'TATRA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (607, '607', 'TAURAS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (608, '608', 'TAURIS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (609, '609', 'TAYO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (610, '610', 'TCM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (611, '611', 'TEMSA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (612, '612', 'TEREX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (613, '613', 'TERRA MODENA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (614, '614', 'TESLA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (615, '615', 'TGB', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (616, '616', 'TIANMA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (617, '617', 'TIANYE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (618, '618', 'TIGER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (619, '619', 'TIKI TREILER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (620, '620', 'TIMBERJACK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (621, '621', 'TITAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (622, '622', 'TM RACING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (623, '623', 'TOFAS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (624, '624', 'TOMBERLIN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (625, '625', 'TOMOS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (626, '626', 'TONAR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (627, '627', 'TORGAU', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (628, '628', 'TOYOTA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (629, '629', 'TRABANT', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (630, '630', 'TRACK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (631, '631', 'TRAIL KING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (632, '632', 'TRAILOR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (633, '633', 'TRAVERTSON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (634, '634', 'TRIUMPH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (635, '635', 'TROLL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (636, '636', 'TROLZA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (637, '637', 'TSR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (638, '638', 'TURBOвЂ™S HOET', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (639, '639', 'TVR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (640, '640', 'TVS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (641, '641', 'UAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (642, '642', 'UDS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (643, '643', 'UM', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (644, '644', 'UNIMOG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (645, '645', 'URAL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (646, '646', 'UTILITY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (647, '647', 'VALMET', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (648, '648', 'VAN HOOL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (649, '649', 'VAN VEEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (650, '650', 'VAUXHALL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (651, '651', 'VAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (652, '652', 'VECTOR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (653, '653', 'VECTRIX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (654, '654', 'VELI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (655, '655', 'VENTO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (656, '656', 'VENTURI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (657, '657', 'VESPA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (658, '658', 'VIBERTI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (659, '659', 'VIBROMAX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (660, '660', 'VICTORY', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (661, '661', 'VIPER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (662, '662', 'VIS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (663, '663', 'VMZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (664, '664', 'VOGELE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (665, '665', 'VOLKSWAGEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (666, '666', 'VOLVO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (667, '667', 'VORTEX', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (668, '668', 'VUKA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (669, '669', 'WABASH', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (670, '670', 'WACKER', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (671, '671', 'WAKAN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (672, '672', 'WARTBURG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (673, '673', 'WESTFIELD', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (674, '674', 'WIELTON', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (675, '675', 'WIESMANN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (676, '676', 'WILK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (677, '677', 'WILLIG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (678, '678', 'WIRTGEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (679, '679', 'WITZCO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (680, '680', 'WT MOTORS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (681, '681', 'WULING', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (682, '682', 'XCG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (683, '683', 'XCMG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (684, '684', 'XIN KAI', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (685, '685', 'XINGYUE', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (686, '686', 'XMOTOS', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (687, '687', 'YAMAHA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (688, '688', 'YANMAR', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (689, '689', 'YIBEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (690, '690', 'YOBYKES', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (691, '691', 'YORK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (692, '692', 'YUGO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (693, '693', 'YUTONG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (694, '694', 'ZANELLA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (695, '695', 'ZASLAW', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (696, '696', 'ZASTAVA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (697, '697', 'ZAZ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (698, '698', 'ZENVO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (699, '699', 'ZEST', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (700, '700', 'ZHONG TONG', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (701, '701', 'ZIL', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (702, '702', 'ZNEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (703, '703', 'ZONDA', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (704, '704', 'ZONGSHEN', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (705, '705', 'ZOOMLION', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (706, '706', 'ZUK', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (707, '707', 'ZUNDAPP', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (708, '708', 'ZX AUTO', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (709, '709', 'РђР’РўРћРњРђРЎРўР•Р ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (710, '710', 'РђР›Р¬РўР•Р РќРђ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (711, '711', 'РђРњРљРћР”РћР ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (712, '712', 'Р‘РђР›РўРЎРџР•Р¦РњРђРЁ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (713, '713', 'Р‘Р•Р›РђР РЈРЎ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (714, '714', 'Р‘Р•Р¦Р•РњРђ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (715, '715', 'Р‘РћР“Р”РђРќ-РЎРџР•Р¦РђР’РўРћРўР•РҐРќР�РљРђ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (716, '716', 'Р’Р—РўРњ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (717, '717', 'Р“Рљ РЎРћР”Р РЈР–Р•РЎРўР’Рћ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (718, '718', 'Р“Р РђР—', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (719, '719', 'Р”Р•РЎРќРђ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (720, '720', 'Р”Р—', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (721, '721', 'Р”Р�Р—Р•Р›Р¬-РўРЎ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (722, '722', 'Р”РЈ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (723, '723', 'Р�Р’РђРќРћР’Р•Р¦', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (724, '724', 'РљР�Р РћР’Р•Р¦', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (725, '725', 'Р›РўР—', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (726, '726', 'РњРђР Р—', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (727, '727', 'РњРўР—', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (728, '728', 'РќР•РњРђРќ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (729, '729', 'РќР•Р¤РђР—', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (730, '730', 'РџРљ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (731, '731', 'РџРўР—', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (732, '732', 'РџРўРљ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (733, '733', 'Р РћРђР—', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (734, '734', 'Р РЈРЎРЎРљРђРЇ РњР•РҐРђРќР�РљРђ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (735, '735', 'РЎР—РђРџ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (736, '736', 'РЎРџР•Р¦РџР Р�Р¦Р•Рџ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (737, '737', 'РўРђР“РђР—', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (738, '738', 'РўР’Р­РљРЎ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (739, '739', 'РўР РђРќРЎРњРђРЁ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (740, '740', 'РўРЈРЁР�РќРћ-РђР’РўРћ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (741, '741', 'Р§РЎР”Рњ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (742, '742', 'Р­Рћ', NULL, NULL);
INSERT INTO vehiclebrandsclassifier VALUES (743, '999', 'РџР РћР§Р�Р•', NULL, NULL);


--
-- TOC entry 4635 (class 0 OID 19199)
-- Dependencies: 329
-- Data for Name: vehiclecategorypereaeutechnicalregulationsclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (1, 'O1', 'РєР°С‚РµРіРѕСЂРёСЏ O1', 'РїСЂРёС†РµРїС‹, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ РЅРµ Р±РѕР»РµРµ 0,75 С‚', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (2, 'O1', 'РєР°С‚РµРіРѕСЂРёСЏ O1', 'РїСЂРёС†РµРїС‹, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ РЅРµ Р±РѕР»РµРµ 0,75 С‚', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (3, 'N3G', 'РєР°С‚РµРіРѕСЂРёСЏ N3G', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° РїРѕРІС‹С€РµРЅРЅРѕР№ РїСЂРѕС…РѕРґРёРјРѕСЃС‚Рё, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ Р±РѕР»РµРµ 12 С‚', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (4, 'O3', 'РєР°С‚РµРіРѕСЂРёСЏ O3', 'РїСЂРёС†РµРїС‹, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ СЃРІС‹С€Рµ 3,5 С‚, РЅРѕ РЅРµ Р±РѕР»РµРµ 10 С‚', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (5, 'O4', 'РєР°С‚РµРіРѕСЂРёСЏ O4', 'РїСЂРёС†РµРїС‹, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ Р±РѕР»РµРµ 10 С‚', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (6, 'L7', 'РєР°С‚РµРіРѕСЂРёСЏ L7', 'С‡РµС‚С‹СЂРµС…РєРѕР»РµСЃРЅРѕРµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ, РёРЅРѕРµ, С‡РµРј С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ РєР°С‚РµРіРѕСЂРёРё L6, РјР°СЃСЃР° РєРѕС‚РѕСЂРѕРіРѕ Р±РµР· РЅР°РіСЂСѓР·РєРё РЅРµ РїСЂРµРІС‹С€Р°РµС‚ 400 РєРі (550 РєРі РґР»СЏ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅРѕРіРѕ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ) Р±РµР· СѓС‡РµС‚Р° РјР°СЃСЃС‹ Р°РєРєСѓРјСѓР»СЏС‚РѕСЂРѕРІ (РґР»СЏ СЌР»РµРєС‚СЂРёС‡РµСЃРєРѕРіРѕ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°) Рё РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ СЌС„С„РµРєС‚РёРІРЅР°СЏ РјРѕС‰РЅРѕСЃС‚СЊ РґРІРёРіР°С‚РµР»СЏ РєРѕС‚РѕСЂРѕРіРѕ РЅРµ РїСЂРµРІС‹С€Р°РµС‚ 15 РєР’С‚', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (7, 'M1G', 'РєР°С‚РµРіРѕСЂРёСЏ M1G', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° РїРѕРІС‹С€РµРЅРЅРѕР№ РїСЂРѕС…РѕРґРёРјРѕСЃС‚Рё, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё РёРјРµСЋС‰РёРµ, РїРѕРјРёРјРѕ РјРµСЃС‚Р° РІРѕРґРёС‚РµР»СЏ, РЅРµ Р±РѕР»РµРµ 8 РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (8, 'M2', 'РєР°С‚РµРіРѕСЂРёСЏ M2', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ, РёРјРµСЋС‰РёРµ, РїРѕРјРёРјРѕ РјРµСЃС‚Р° РІРѕРґРёС‚РµР»СЏ, Р±РѕР»РµРµ 8 РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ Рё С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ РЅРµ Р±РѕР»РµРµ 5 С‚', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (9, 'M2G', 'РєР°С‚РµРіРѕСЂРёСЏ M2G', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° РїРѕРІС‹С€РµРЅРЅРѕР№ РїСЂРѕС…РѕРґРёРјРѕСЃС‚Рё, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё РёРјРµСЋС‰РёРµ, РїРѕРјРёРјРѕ РјРµСЃС‚Р° РІРѕРґРёС‚РµР»СЏ, Р±РѕР»РµРµ 8 РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ, Рё С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ РЅРµ Р±РѕР»РµРµ 5 С‚', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (10, 'M3', 'РєР°С‚РµРіРѕСЂРёСЏ M3', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё РёРјРµСЋС‰РёРµ, РїРѕРјРёРјРѕ РјРµСЃС‚Р° РІРѕРґРёС‚РµР»СЏ, Р±РѕР»РµРµ 8 РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ Рё С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ Р±РѕР»РµРµ 5 С‚', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (11, 'M3G', 'РєР°С‚РµРіРѕСЂРёСЏ M3G', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° РїРѕРІС‹С€РµРЅРЅРѕР№ РїСЂРѕС…РѕРґРёРјРѕСЃС‚Рё, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё РёРјРµСЋС‰РёРµ, РїРѕРјРёРјРѕ РјРµСЃС‚Р° РІРѕРґРёС‚РµР»СЏ, Р±РѕР»РµРµ 8 РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ Рё С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ Р±РѕР»РµРµ 5 С‚', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (12, 'N1', 'РєР°С‚РµРіРѕСЂРёСЏ N1', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ Рё РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ РЅРµ Р±РѕР»РµРµ 3,5 С‚', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (13, 'N1G', 'РєР°С‚РµРіРѕСЂРёСЏ N1G', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° РїРѕРІС‹С€РµРЅРЅРѕР№ РїСЂРѕС…РѕРґРёРјРѕСЃС‚Рё, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ Рё РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ РЅРµ Р±РѕР»РµРµ 3,5 С‚', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (14, 'N2', 'РєР°С‚РµРіРѕСЂРёСЏ N2', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ Рё РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ Р±РѕР»РµРµ 3,5 С‚, РЅРѕ РЅРµ Р±РѕР»РµРµ 12 С‚', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (15, 'N2G', 'РєР°С‚РµРіРѕСЂРёСЏ N2G', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° РїРѕРІС‹С€РµРЅРЅРѕР№ РїСЂРѕС…РѕРґРёРјРѕСЃС‚Рё, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ СЃРІС‹С€Рµ 3,5 С‚, РЅРѕ РЅРµ Р±РѕР»РµРµ 12 С‚', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (16, 'N3', 'РєР°С‚РµРіРѕСЂРёСЏ N3', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ Рё РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ Р±РѕР»РµРµ 12 С‚', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (17, 'N3G', 'РєР°С‚РµРіРѕСЂРёСЏ N3G', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° РїРѕРІС‹С€РµРЅРЅРѕР№ РїСЂРѕС…РѕРґРёРјРѕСЃС‚Рё, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ Р±РѕР»РµРµ 12 С‚', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (18, 'N3G', 'РєР°С‚РµРіРѕСЂРёСЏ N3G', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° РїРѕРІС‹С€РµРЅРЅРѕР№ РїСЂРѕС…РѕРґРёРјРѕСЃС‚Рё, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ Р±РѕР»РµРµ 12 С‚', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (19, 'O2', 'РєР°С‚РµРіРѕСЂРёСЏ O2', 'РїСЂРёС†РµРїС‹, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ СЃРІС‹С€Рµ 0,75 С‚, РЅРѕ РЅРµ Р±РѕР»РµРµ 3,5 С‚', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (20, 'O3', 'РєР°С‚РµРіРѕСЂРёСЏ O3', 'РїСЂРёС†РµРїС‹, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ СЃРІС‹С€Рµ 3,5 С‚, РЅРѕ РЅРµ Р±РѕР»РµРµ 10 С‚', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (21, 'O4', 'РєР°С‚РµРіРѕСЂРёСЏ O4', 'РїСЂРёС†РµРїС‹, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ Р±РѕР»РµРµ 10 С‚', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (22, 'L7', 'РєР°С‚РµРіРѕСЂРёСЏ L7', 'С‡РµС‚С‹СЂРµС…РєРѕР»РµСЃРЅРѕРµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ, РёРЅРѕРµ, С‡РµРј С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ РєР°С‚РµРіРѕСЂРёРё L6, РјР°СЃСЃР° РєРѕС‚РѕСЂРѕРіРѕ Р±РµР· РЅР°РіСЂСѓР·РєРё РЅРµ РїСЂРµРІС‹С€Р°РµС‚ 400 РєРі (550 РєРі РґР»СЏ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅРѕРіРѕ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ) Р±РµР· СѓС‡РµС‚Р° РјР°СЃСЃС‹ Р°РєРєСѓРјСѓР»СЏС‚РѕСЂРѕРІ (РґР»СЏ СЌР»РµРєС‚СЂРёС‡РµСЃРєРѕРіРѕ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°) Рё РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ СЌС„С„РµРєС‚РёРІРЅР°СЏ РјРѕС‰РЅРѕСЃС‚СЊ РґРІРёРіР°С‚РµР»СЏ РєРѕС‚РѕСЂРѕРіРѕ РЅРµ РїСЂРµРІС‹С€Р°РµС‚ 15 РєР’С‚', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (23, 'M1', 'РєР°С‚РµРіРѕСЂРёСЏ M1', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё РёРјРµСЋС‰РёРµ, РїРѕРјРёРјРѕ РјРµСЃС‚Р° РІРѕРґРёС‚РµР»СЏ, РЅРµ Р±РѕР»РµРµ 8 РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (24, 'M1G', 'РєР°С‚РµРіРѕСЂРёСЏ M1G', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° РїРѕРІС‹С€РµРЅРЅРѕР№ РїСЂРѕС…РѕРґРёРјРѕСЃС‚Рё, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё РёРјРµСЋС‰РёРµ, РїРѕРјРёРјРѕ РјРµСЃС‚Р° РІРѕРґРёС‚РµР»СЏ, РЅРµ Р±РѕР»РµРµ 8 РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (25, 'M1G', 'РєР°С‚РµРіРѕСЂРёСЏ M1G', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° РїРѕРІС‹С€РµРЅРЅРѕР№ РїСЂРѕС…РѕРґРёРјРѕСЃС‚Рё, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё РёРјРµСЋС‰РёРµ, РїРѕРјРёРјРѕ РјРµСЃС‚Р° РІРѕРґРёС‚РµР»СЏ, РЅРµ Р±РѕР»РµРµ 8 РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (26, 'M2', 'РєР°С‚РµРіРѕСЂРёСЏ M2', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ, РёРјРµСЋС‰РёРµ, РїРѕРјРёРјРѕ РјРµСЃС‚Р° РІРѕРґРёС‚РµР»СЏ, Р±РѕР»РµРµ 8 РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ Рё С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ РЅРµ Р±РѕР»РµРµ 5 С‚', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (27, 'M2', 'РєР°С‚РµРіРѕСЂРёСЏ M2', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ, РёРјРµСЋС‰РёРµ, РїРѕРјРёРјРѕ РјРµСЃС‚Р° РІРѕРґРёС‚РµР»СЏ, Р±РѕР»РµРµ 8 РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ Рё С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ РЅРµ Р±РѕР»РµРµ 5 С‚', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (28, 'M2G', 'РєР°С‚РµРіРѕСЂРёСЏ M2G', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° РїРѕРІС‹С€РµРЅРЅРѕР№ РїСЂРѕС…РѕРґРёРјРѕСЃС‚Рё, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё РёРјРµСЋС‰РёРµ, РїРѕРјРёРјРѕ РјРµСЃС‚Р° РІРѕРґРёС‚РµР»СЏ, Р±РѕР»РµРµ 8 РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ, Рё С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ РЅРµ Р±РѕР»РµРµ 5 С‚', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (29, 'M2G', 'РєР°С‚РµРіРѕСЂРёСЏ M2G', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° РїРѕРІС‹С€РµРЅРЅРѕР№ РїСЂРѕС…РѕРґРёРјРѕСЃС‚Рё, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё РёРјРµСЋС‰РёРµ, РїРѕРјРёРјРѕ РјРµСЃС‚Р° РІРѕРґРёС‚РµР»СЏ, Р±РѕР»РµРµ 8 РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ, Рё С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ РЅРµ Р±РѕР»РµРµ 5 С‚', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (30, 'M3', 'РєР°С‚РµРіРѕСЂРёСЏ M3', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё РёРјРµСЋС‰РёРµ, РїРѕРјРёРјРѕ РјРµСЃС‚Р° РІРѕРґРёС‚РµР»СЏ, Р±РѕР»РµРµ 8 РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ Рё С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ Р±РѕР»РµРµ 5 С‚', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (31, 'M3', 'РєР°С‚РµРіРѕСЂРёСЏ M3', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё РёРјРµСЋС‰РёРµ, РїРѕРјРёРјРѕ РјРµСЃС‚Р° РІРѕРґРёС‚РµР»СЏ, Р±РѕР»РµРµ 8 РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ Рё С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ Р±РѕР»РµРµ 5 С‚', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (32, 'M3G', 'РєР°С‚РµРіРѕСЂРёСЏ M3G', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° РїРѕРІС‹С€РµРЅРЅРѕР№ РїСЂРѕС…РѕРґРёРјРѕСЃС‚Рё, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё РёРјРµСЋС‰РёРµ, РїРѕРјРёРјРѕ РјРµСЃС‚Р° РІРѕРґРёС‚РµР»СЏ, Р±РѕР»РµРµ 8 РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ Рё С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ Р±РѕР»РµРµ 5 С‚', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (33, 'M3G', 'РєР°С‚РµРіРѕСЂРёСЏ M3G', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° РїРѕРІС‹С€РµРЅРЅРѕР№ РїСЂРѕС…РѕРґРёРјРѕСЃС‚Рё, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё РёРјРµСЋС‰РёРµ, РїРѕРјРёРјРѕ РјРµСЃС‚Р° РІРѕРґРёС‚РµР»СЏ, Р±РѕР»РµРµ 8 РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ Рё С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ Р±РѕР»РµРµ 5 С‚', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (34, 'N1', 'РєР°С‚РµРіРѕСЂРёСЏ N1', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ Рё РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ РЅРµ Р±РѕР»РµРµ 3,5 С‚', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (35, 'N1', 'РєР°С‚РµРіРѕСЂРёСЏ N1', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ Рё РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ РЅРµ Р±РѕР»РµРµ 3,5 С‚', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (36, 'N1G', 'РєР°С‚РµРіРѕСЂРёСЏ N1G', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° РїРѕРІС‹С€РµРЅРЅРѕР№ РїСЂРѕС…РѕРґРёРјРѕСЃС‚Рё, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ Рё РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ РЅРµ Р±РѕР»РµРµ 3,5 С‚', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (37, 'N1G', 'РєР°С‚РµРіРѕСЂРёСЏ N1G', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° РїРѕРІС‹С€РµРЅРЅРѕР№ РїСЂРѕС…РѕРґРёРјРѕСЃС‚Рё, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ Рё РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ РЅРµ Р±РѕР»РµРµ 3,5 С‚', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (38, 'N2', 'РєР°С‚РµРіРѕСЂРёСЏ N2', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ Рё РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ Р±РѕР»РµРµ 3,5 С‚, РЅРѕ РЅРµ Р±РѕР»РµРµ 12 С‚', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (39, 'N2', 'РєР°С‚РµРіРѕСЂРёСЏ N2', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ Рё РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ Р±РѕР»РµРµ 3,5 С‚, РЅРѕ РЅРµ Р±РѕР»РµРµ 12 С‚', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (40, 'N2G', 'РєР°С‚РµРіРѕСЂРёСЏ N2G', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° РїРѕРІС‹С€РµРЅРЅРѕР№ РїСЂРѕС…РѕРґРёРјРѕСЃС‚Рё, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ СЃРІС‹С€Рµ 3,5 С‚, РЅРѕ РЅРµ Р±РѕР»РµРµ 12 С‚', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (41, 'N2G', 'РєР°С‚РµРіРѕСЂРёСЏ N2G', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° РїРѕРІС‹С€РµРЅРЅРѕР№ РїСЂРѕС…РѕРґРёРјРѕСЃС‚Рё, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ СЃРІС‹С€Рµ 3,5 С‚, РЅРѕ РЅРµ Р±РѕР»РµРµ 12 С‚', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (42, 'N3', 'РєР°С‚РµРіРѕСЂРёСЏ N3', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ Рё РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ Р±РѕР»РµРµ 12 С‚', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (43, 'N3', 'РєР°С‚РµРіРѕСЂРёСЏ N3', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РіСЂСѓР·РѕРІ Рё РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ Р±РѕР»РµРµ 12 С‚', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (44, 'O2', 'РєР°С‚РµРіРѕСЂРёСЏ O2', 'РїСЂРёС†РµРїС‹, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РјР°РєСЃРёРјР°Р»СЊРЅСѓСЋ РјР°СЃСЃСѓ СЃРІС‹С€Рµ 0,75 С‚, РЅРѕ РЅРµ Р±РѕР»РµРµ 3,5 С‚', '2', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (45, 'Ra1', 'РєР°С‚РµРіРѕСЂРёСЏ Ra1', 'РїСЂРёС†РµРїС‹ СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЂР°СЃС‡РµС‚РЅРѕР№ СЃРєРѕСЂРѕСЃС‚СЊСЋ РЅРµ Р±РѕР»РµРµ 40 РєРј/С‡, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РѕР±С‰СѓСЋ РјР°СЃСЃСѓ РЅРµ Р±РѕР»РµРµ 1500 РєРі', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (46, 'Ra2', 'РєР°С‚РµРіРѕСЂРёСЏ Ra2', 'РїСЂРёС†РµРїС‹ СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЂР°СЃС‡РµС‚РЅРѕР№ СЃРєРѕСЂРѕСЃС‚СЊСЋ РЅРµ Р±РѕР»РµРµ 40 РєРј/С‡, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РѕР±С‰СѓСЋ РјР°СЃСЃСѓ СЃРІС‹С€Рµ 1500 РєРі, РЅРѕ РЅРµ Р±РѕР»РµРµ 3500 РєРі', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (47, 'Ra3', 'РєР°С‚РµРіРѕСЂРёСЏ Ra3', 'РїСЂРёС†РµРїС‹ СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЂР°СЃС‡РµС‚РЅРѕР№ СЃРєРѕСЂРѕСЃС‚СЊСЋ Р±РѕР»РµРµ 40 РєРј/С‡, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РѕР±С‰СѓСЋ РјР°СЃСЃСѓ СЃРІС‹С€Рµ 3500 РєРі, РЅРѕ РЅРµ Р±РѕР»РµРµ 21000 РєРі', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (48, 'Ra4', 'РєР°С‚РµРіРѕСЂРёСЏ Ra4', 'РїСЂРёС†РµРїС‹ СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЂР°СЃС‡РµС‚РЅРѕР№ СЃРєРѕСЂРѕСЃС‚СЊСЋ РЅРµ Р±РѕР»РµРµ 40 РєРј/С‡, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РѕР±С‰СѓСЋ РјР°СЃСЃСѓ Р±РѕР»РµРµ 21000 РєРі', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (49, 'Rb1', 'РєР°С‚РµРіРѕСЂРёСЏ Rb1', 'РїСЂРёС†РµРїС‹ СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЂР°СЃС‡РµС‚РЅРѕР№ СЃРєРѕСЂРѕСЃС‚СЊСЋ Р±РѕР»РµРµ 40 РєРј/С‡, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РѕР±С‰СѓСЋ РјР°СЃСЃСѓ РЅРµ Р±РѕР»РµРµ 1500 РєРі', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (50, 'Rb2', 'РєР°С‚РµРіРѕСЂРёСЏ Rb2', 'РїСЂРёС†РµРїС‹ СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЂР°СЃС‡РµС‚РЅРѕР№ СЃРєРѕСЂРѕСЃС‚СЊСЋ Р±РѕР»РµРµ 40 РєРј/С‡, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РѕР±С‰СѓСЋ РјР°СЃСЃСѓ СЃРІС‹С€Рµ 1500 РєРі, РЅРѕ РЅРµ Р±РѕР»РµРµ 3500 РєРі', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (51, 'Rb4', 'РєР°С‚РµРіРѕСЂРёСЏ Rb4', 'РїСЂРёС†РµРїС‹ СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЂР°СЃС‡РµС‚РЅРѕР№ СЃРєРѕСЂРѕСЃС‚СЊСЋ Р±РѕР»РµРµ 40 РєРј/С‡, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РѕР±С‰СѓСЋ РјР°СЃСЃСѓ Р±РѕР»РµРµ 21000 РєРі', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (52, 'RX', 'РєР°С‚РµРіРѕСЂРёСЏ RX', 'РїСЂРёС†РµРїС‹ Рє СЃРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рј Рё РґСЂСѓРіРёРј СЃР°РјРѕС…РѕРґРЅС‹Рј Рё РјРѕР±РёР»СЊРЅС‹Рј РјР°С€РёРЅР°Рј', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (53, 'T1', 'РєР°С‚РµРіРѕСЂРёСЏ T1', 'РєРѕР»РµСЃРЅС‹Рµ С‚СЂР°РєС‚РѕСЂС‹ СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЂР°СЃС‡РµС‚РЅРѕР№ СЃРєРѕСЂРѕСЃС‚СЊСЋ РЅРµ Р±РѕР»РµРµ 40 РєРј/С‡, РјРёРЅРёРјР°Р»СЊРЅС‹Рј СЂР°Р·РјРµСЂРѕРј РєРѕР»РµРё РѕСЃРё, РЅР°С…РѕРґСЏС‰РµР№СЃСЏ Р±Р»РёР¶Рµ Рє РѕРїРµСЂР°С‚РѕСЂСѓ, РЅРµ РјРµРЅРµРµ 1150 РјРј, СЃРЅР°СЂСЏР¶РµРЅРЅРѕР№ РјР°СЃСЃРѕР№ Р±РѕР»РµРµ 600 РєРі Рё РґРѕСЂРѕР¶РЅС‹Рј РїСЂРѕСЃРІРµС‚РѕРј РЅРµ Р±РѕР»РµРµ 1000 РјРј. Р”Р»СЏ С‚СЂР°РєС‚РѕСЂРѕРІ СЃ СЂРµРІРµСЂСЃРёРІРЅС‹Рј СЃРёРґРµРЅСЊРµРј РѕРїРµСЂР°С‚РѕСЂР° РѕСЃСЊСЋ, РЅР°С…РѕРґСЏС‰РµР№СЃСЏ Р±Р»РёР¶Рµ Рє РѕРїРµСЂР°С‚РѕСЂСѓ, СЃС‡РёС‚Р°РµС‚СЃСЏ РѕСЃСЊ, РѕР±РѕСЂСѓРґРѕРІР°РЅРЅР°СЏ С€РёРЅР°РјРё СЃ РЅР°РёР±РѕР»СЊС€РёРј РґРёР°РјРµС‚СЂРѕРј', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (54, 'T2', 'РєР°С‚РµРіРѕСЂРёСЏ T2', 'РєРѕР»РµСЃРЅС‹Рµ С‚СЂР°РєС‚РѕСЂС‹ СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЂР°СЃС‡РµС‚РЅРѕР№ СЃРєРѕСЂРѕСЃС‚СЊСЋ РЅРµ Р±РѕР»РµРµ 40 РєРј/С‡, РјРёРЅРёРјР°Р»СЊРЅС‹Рј СЂР°Р·РјРµСЂРѕРј РєРѕР»РµРё РјРµРЅРµРµ 1150 РјРј, СЃРЅР°СЂСЏР¶РµРЅРЅРѕР№ РјР°СЃСЃРѕР№ Р±РѕР»РµРµ 600 РєРі Рё РґРѕСЂРѕР¶РЅС‹Рј РїСЂРѕСЃРІРµС‚РѕРј РЅРµ Р±РѕР»РµРµ 600 РјРј. Р•СЃР»Рё РѕС‚РЅРѕС€РµРЅРёРµ РІС‹СЃРѕС‚С‹ С†РµРЅС‚СЂР° С‚СЏР¶РµСЃС‚Рё С‚СЂР°РєС‚РѕСЂР° Рє СЃСЂРµРґРЅРµРјСѓ РјРёРЅРёРјР°Р»СЊРЅРѕРјСѓ СЂР°Р·РјРµСЂСѓ РєРѕР»РµРё РѕСЃРµР№ РїСЂРµРІС‹С€Р°РµС‚ 0,9, С‚Рѕ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ СЂР°СЃС‡РµС‚РЅР°СЏ СЃРєРѕСЂРѕСЃС‚СЊ РЅРµ РґРѕР»Р¶РЅР° РїСЂРµРІС‹С€Р°С‚СЊ 30 РєРј/С‡', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (55, 'T3', 'РєР°С‚РµРіРѕСЂРёСЏ T3', 'РєРѕР»РµСЃРЅС‹Рµ С‚СЂР°РєС‚РѕСЂС‹ СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЂР°СЃС‡РµС‚РЅРѕР№ СЃРєРѕСЂРѕСЃС‚СЊСЋ РЅРµ Р±РѕР»РµРµ 40 РєРј/С‡ Рё СЃРЅР°СЂСЏР¶РµРЅРЅРѕР№ РјР°СЃСЃРѕР№ РЅРµ Р±РѕР»РµРµ 600 РєРі', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (56, 'T4.1', 'РєР°С‚РµРіРѕСЂРёСЏ T4.1', 'РІС‹СЃРѕРєРѕРєР»РёСЂРµРЅСЃРЅС‹Рµ С‚СЂР°РєС‚РѕСЂС‹, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ РїСЂРё РѕР±СЂР°Р±РѕС‚РєРµ РІС‹СЃРѕРєРѕСЃС‚РµР±РµР»СЊРЅС‹С… РєСѓР»СЊС‚СѓСЂ (РЅР°РїСЂРёРјРµСЂ, РІРёРЅРѕРіСЂР°РґРЅРёРєРѕРІ), С…Р°СЂР°РєС‚РµСЂРёР·СѓСЋС‰РёРµСЃСЏ СѓРІРµР»РёС‡РµРЅРЅРѕР№ РІС‹СЃРѕС‚РѕР№ С€Р°СЃСЃРё РёР»Рё С‡Р°СЃС‚Рё С€Р°СЃСЃРё, Р±Р»Р°РіРѕРґР°СЂСЏ С‡РµРјСѓ РѕРЅРё РјРѕРіСѓС‚ РїРµСЂРµРјРµС‰Р°С‚СЊСЃСЏ РїР°СЂР°Р»Р»РµР»СЊРЅРѕ СЂСЏРґР°Рј СЂР°СЃС‚РµРЅРёР№ СЃ РІРѕР·РІС‹С€РµРЅРёРµРј РЅР°Рґ РЅРёРјРё, СЃ РІРѕР·РјРѕР¶РЅРѕСЃС‚СЊСЋ РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ СЂР°Р±РѕС‡РёРјРё РѕСЂРіР°РЅР°РјРё, РєРѕС‚РѕСЂС‹Рµ РјРѕРіСѓС‚ Р±С‹С‚СЊ СѓСЃС‚Р°РЅРѕРІР»РµРЅС‹ СЃРїРµСЂРµРґРё, РјРµР¶РґСѓ РѕСЃСЏРјРё, СЃР·Р°РґРё РёР»Рё РЅР° РїР»Р°С‚С„РѕСЂРјРµ. РџСЂРё СЂР°Р±РѕС‚Рµ РєР»РёСЂРµРЅСЃ С‚СЂР°РєС‚РѕСЂР° РїСЂРµРІС‹С€Р°РµС‚ 1000 РјРј. Р•СЃР»Рё РѕС‚РЅРѕС€РµРЅРёРµ РІС‹СЃРѕС‚С‹ С†РµРЅС‚СЂР° С‚СЏР¶РµСЃС‚Рё С‚СЂР°РєС‚РѕСЂР° (РїСЂРё РѕР±С‹С‡РЅС‹С… С€РёРЅР°С…) Рє СЃСЂРµРґРЅРµРјСѓ РјРёРЅРёРјР°Р»СЊРЅРѕРјСѓ СЂР°Р·РјРµСЂСѓ РєРѕР»РµРё РѕСЃРµР№ РїСЂРµРІС‹С€Р°РµС‚ 0,9, С‚Рѕ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ СЂР°СЃС‡РµС‚РЅР°СЏ СЃРєРѕСЂРѕСЃС‚СЊ РЅРµ РґРѕР»Р¶РЅР° РїСЂРµРІС‹С€Р°С‚СЊ 30 РєРј/С‡', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (57, 'T4.2', 'РєР°С‚РµРіРѕСЂРёСЏ T4.2', 'СЃРІРµСЂС…С€РёСЂРѕРєРёРµ С‚СЂР°РєС‚РѕСЂС‹ СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЂР°СЃС‡РµС‚РЅРѕР№ СЃРєРѕСЂРѕСЃС‚СЊСЋ РЅРµ Р±РѕР»РµРµ 40 РєРј/С‡, С…Р°СЂР°РєС‚РµСЂРёР·СѓСЋС‰РёРµСЃСЏ Р·РЅР°С‡РёС‚РµР»СЊРЅС‹РјРё СЂР°Р·РјРµСЂР°РјРё Рё РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ СЃРїРµС†РёР°Р»СЊРЅРѕ РґР»СЏ РѕР±СЂР°Р±РѕС‚РєРё Р±РѕР»СЊС€РёС… СЃРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹С… РїР»РѕС‰Р°РґРµР№', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (58, 'T4.3', 'РєР°С‚РµРіРѕСЂРёСЏ T4.3', 'РЅРёР·РєРѕРєР»РёСЂРµРЅСЃРЅС‹Рµ Р»РµСЃРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РёР»Рё СЃРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ С‚СЂР°РєС‚РѕСЂС‹ СЃ РїСЂРёРІРѕРґРѕРј РЅР° 4 РєРѕР»РµСЃР°, СЃРјРµРЅРЅРѕРµ СЂР°Р±РѕС‡РµРµ РѕР±РѕСЂСѓРґРѕРІР°РЅРёРµ РєРѕС‚РѕСЂС‹С… РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРѕ РґР»СЏ РІС‹РїРѕР»РЅРµРЅРёСЏ СЂР°Р±РѕС‚ РІ Р»РµСЃРЅРѕРј РёР»Рё СЃРµР»СЊСЃРєРѕРј С…РѕР·СЏР№СЃС‚РІРµ, СЃ РЅРµСЃСѓС‰РµР№ СЂР°РјРѕР№, РѕРґРЅРёРј РёР»Рё РЅРµСЃРєРѕР»СЊРєРёРјРё РІР°Р»Р°РјРё РѕС‚Р±РѕСЂР° РјРѕС‰РЅРѕСЃС‚Рё, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РѕР±С‰СѓСЋ РјР°СЃСЃСѓ РЅРµ Р±РѕР»РµРµ 10 С‚ Рё РѕС‚РЅРѕС€РµРЅРёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјРѕР№ РѕР±С‰РµР№ РјР°СЃСЃС‹ Рє РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЃРЅР°СЂСЏР¶РµРЅРЅРѕР№ РјР°СЃСЃРµ РјРµРЅРµРµ 2,5, СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЂР°СЃС‡РµС‚РЅРѕР№ СЃРєРѕСЂРѕСЃС‚СЊСЋ РЅРµ Р±РѕР»РµРµ 40 РєРј/С‡. Р’С‹СЃРѕС‚Р° С†РµРЅС‚СЂР° С‚СЏР¶РµСЃС‚Рё С‚СЂР°РєС‚РѕСЂР° (РїСЂРё РѕР±С‹С‡РЅС‹С… С€РёРЅР°С…) вЂ“ РјРµРЅРµРµ 850 РјРј', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (59, 'C2', 'РєР°С‚РµРіРѕСЂРёСЏ C2', 'РіСѓСЃРµРЅРёС‡РЅС‹Рµ С‚СЂР°РєС‚РѕСЂС‹ СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЂР°СЃС‡РµС‚РЅРѕР№ СЃРєРѕСЂРѕСЃС‚СЊСЋ РЅРµ Р±РѕР»РµРµ 40 РєРј/С‡, РјРёРЅРёРјР°Р»СЊРЅС‹Рј СЂР°Р·РјРµСЂРѕРј РєРѕР»РµРё РјРµРЅРµРµ 1150 РјРј, СЃРЅР°СЂСЏР¶РµРЅРЅРѕР№ РјР°СЃСЃРѕР№ Р±РѕР»РµРµ 600 РєРі Рё РґРѕСЂРѕР¶РЅС‹Рј РїСЂРѕСЃРІРµС‚РѕРј РЅРµ Р±РѕР»РµРµ 600 РјРј. Р•СЃР»Рё РѕС‚РЅРѕС€РµРЅРёРµ РІС‹СЃРѕС‚С‹ С†РµРЅС‚СЂР° С‚СЏР¶РµСЃС‚Рё С‚СЂР°РєС‚РѕСЂР° Рє СЃСЂРµРґРЅРµРјСѓ РјРёРЅРёРјР°Р»СЊРЅРѕРјСѓ СЂР°Р·РјРµСЂСѓ РєРѕР»РµРё РѕСЃРµР№ РїСЂРµРІС‹С€Р°РµС‚ 0,9, С‚Рѕ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ СЂР°СЃС‡РµС‚РЅР°СЏ СЃРєРѕСЂРѕСЃС‚СЊ РЅРµ РґРѕР»Р¶РЅР° РїСЂРµРІС‹С€Р°С‚СЊ 30 РєРј/С‡', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (60, 'C3', 'РєР°С‚РµРіРѕСЂРёСЏ C3', 'РіСѓСЃРµРЅРёС‡РЅС‹Рµ С‚СЂР°РєС‚РѕСЂС‹ СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЂР°СЃС‡РµС‚РЅРѕР№ СЃРєРѕСЂРѕСЃС‚СЊСЋ РЅРµ Р±РѕР»РµРµ 40 РєРј/С‡ Рё СЃРЅР°СЂСЏР¶РµРЅРЅРѕР№ РјР°СЃСЃРѕР№ РЅРµ Р±РѕР»РµРµ 600 РєРі', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (61, 'C4', 'РєР°С‚РµРіРѕСЂРёСЏ C4', 'РіСѓСЃРµРЅРёС‡РЅС‹Рµ С‚СЂР°РєС‚РѕСЂС‹ СЃРїРµС†РёР°Р»СЊРЅРѕРіРѕ РЅР°Р·РЅР°С‡РµРЅРёСЏ СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЂР°СЃС‡РµС‚РЅРѕР№ СЃРєРѕСЂРѕСЃС‚СЊСЋ РЅРµ Р±РѕР»РµРµ 40 РєРј/С‡', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (62, 'C4.1', 'РєР°С‚РµРіРѕСЂРёСЏ C4.1', 'РІС‹СЃРѕРєРѕРєР»РёСЂРµРЅСЃРЅС‹Рµ РіСѓСЃРµРЅРёС‡РЅС‹Рµ С‚СЂР°РєС‚РѕСЂС‹, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РёСЃРїРѕР»СЊР·РѕРІР°РЅРёСЏ РїСЂРё РѕР±СЂР°Р±РѕС‚РєРµ РІС‹СЃРѕРєРѕСЃС‚РµР±РµР»СЊРЅС‹С… РєСѓР»СЊС‚СѓСЂ (РЅР°РїСЂРёРјРµСЂ, РІРёРЅРѕРіСЂР°РґРЅРёРєРѕРІ), С…Р°СЂР°РєС‚РµСЂРёР·СѓСЋС‰РёРµСЃСЏ СѓРІРµР»РёС‡РµРЅРЅРѕР№ РІС‹СЃРѕС‚РѕР№ С€Р°СЃСЃРё РёР»Рё С‡Р°СЃС‚Рё С€Р°СЃСЃРё, Р±Р»Р°РіРѕРґР°СЂСЏ С‡РµРјСѓ РѕРЅРё РјРѕРіСѓС‚ РїРµСЂРµРјРµС‰Р°С‚СЊСЃСЏ РїР°СЂР°Р»Р»РµР»СЊРЅРѕ СЂСЏРґР°Рј СЂР°СЃС‚РµРЅРёР№ СЃ РІРѕР·РІС‹С€РµРЅРёРµРј РЅР°Рґ РЅРёРјРё, РІРѕР·РјРѕР¶РЅРѕСЃС‚СЊСЋ РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏ СЂР°Р±РѕС‡РёРјРё РѕСЂРіР°РЅР°РјРё, РєРѕС‚РѕСЂС‹Рµ РјРѕРіСѓС‚ Р±С‹С‚СЊ СѓСЃС‚Р°РЅРѕРІР»РµРЅС‹ СЃРїРµСЂРµРґРё, РјРµР¶РґСѓ РѕСЃСЏРјРё, СЃР·Р°РґРё РёР»Рё РЅР° РїР»Р°С‚С„РѕСЂРјРµ. РџСЂРё СЂР°Р±РѕС‚Рµ РєР»РёСЂРµРЅСЃ С‚СЂР°РєС‚РѕСЂР° РїСЂРµРІС‹С€Р°РµС‚ 1000 РјРј. Р•СЃР»Рё РѕС‚РЅРѕС€РµРЅРёРµ РІС‹СЃРѕС‚С‹ С†РµРЅС‚СЂР° С‚СЏР¶РµСЃС‚Рё С‚СЂР°РєС‚РѕСЂР° (РїСЂРё РѕР±С‹С‡РЅС‹С… С€РёРЅР°С…) Рє СЃСЂРµРґРЅРµРјСѓ РјРёРЅРёРјР°Р»СЊРЅРѕРјСѓ СЂР°Р·РјРµСЂСѓ РєРѕР»РµРё РѕСЃРµР№ РїСЂРµРІС‹С€Р°РµС‚ 0,9, С‚Рѕ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ СЂР°СЃС‡РµС‚РЅР°СЏ СЃРєРѕСЂРѕСЃС‚СЊ РЅРµ РґРѕР»Р¶РЅР° РїСЂРµРІС‹С€Р°С‚СЊ 30 РєРј/С‡', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (63, 'C5', 'РєР°С‚РµРіРѕСЂРёСЏ C5', 'РіСѓСЃРµРЅРёС‡РЅС‹Рµ С‚СЂР°РєС‚РѕСЂС‹ СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЂР°СЃС‡РµС‚РЅРѕР№ СЃРєРѕСЂРѕСЃС‚СЊСЋ Р±РѕР»РµРµ 40 РєРј/С‡', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (64, 'L1', 'РєР°С‚РµРіРѕСЂРёСЏ L1', 'РґРІСѓС…РєРѕР»РµСЃРЅРѕРµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ, РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РєРѕРЅСЃС‚СЂСѓРєС‚РёРІРЅР°СЏ СЃРєРѕСЂРѕСЃС‚СЊ РєРѕС‚РѕСЂРѕРіРѕ РЅРµ РїСЂРµРІС‹С€Р°РµС‚ 50 РєРј/С‡ Рё РєРѕС‚РѕСЂРѕРµ С…Р°СЂР°РєС‚РµСЂРёР·СѓРµС‚СЃСЏ РїСЂРё РЅР°Р»РёС‡РёРё РґРІРёРіР°С‚РµР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ СЃРіРѕСЂР°РЅРёСЏ вЂ“ СЂР°Р±РѕС‡РёРј РѕР±СЉРµРјРѕРј РґРІРёРіР°С‚РµР»СЏ, РЅРµ РїСЂРµРІС‹С€Р°СЋС‰РёРј 50 СЃРј3, РёР»Рё РїСЂРё РЅР°Р»РёС‡РёРё СЌР»РµРєС‚СЂРѕРґРІРёРіР°С‚РµР»СЏ вЂ“ РЅРѕРјРёРЅР°Р»СЊРЅРѕР№ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ РјРѕС‰РЅРѕСЃС‚СЊСЋ РІ СЂРµР¶РёРјРµ РґР»РёС‚РµР»СЊРЅРѕР№ РЅР°РіСЂСѓР·РєРё, РЅРµ РїСЂРµРІС‹С€Р°СЋС‰РµР№ 4 РєР’С‚', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (65, 'L2', 'РєР°С‚РµРіРѕСЂРёСЏ L2', 'С‚СЂРµС…РєРѕР»РµСЃРЅРѕРµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ СЃ Р»СЋР±С‹Рј СЂР°СЃРїРѕР»РѕР¶РµРЅРёРµРј РєРѕР»РµСЃ, РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РєРѕРЅСЃС‚СЂСѓРєС‚РёРІРЅР°СЏ СЃРєРѕСЂРѕСЃС‚СЊ РєРѕС‚РѕСЂРѕРіРѕ РЅРµ РїСЂРµРІС‹С€Р°РµС‚ 50 РєРј/С‡ Рё РєРѕС‚РѕСЂРѕРµ С…Р°СЂР°РєС‚РµСЂРёР·СѓРµС‚СЃСЏ РїСЂРё РЅР°Р»РёС‡РёРё РґРІРёРіР°С‚РµР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ СЃРіРѕСЂР°РЅРёСЏ СЃ РїСЂРёРЅСѓРґРёС‚РµР»СЊРЅС‹Рј Р·Р°Р¶РёРіР°РЅРёРµРј вЂ“ СЂР°Р±РѕС‡РёРј РѕР±СЉРµРјРѕРј РґРІРёРіР°С‚РµР»СЏ, РЅРµ РїСЂРµРІС‹С€Р°СЋС‰РёРј 50 СЃРј3, РёР»Рё РїСЂРё РЅР°Р»РёС‡РёРё РґРІРёРіР°С‚РµР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ СЃРіРѕСЂР°РЅРёСЏ РґСЂСѓРіРѕРіРѕ С‚РёРїР° вЂ“ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЌС„С„РµРєС‚РёРІРЅРѕР№ РјРѕС‰РЅРѕСЃС‚СЊСЋ, РЅРµ РїСЂРµРІС‹С€Р°СЋС‰РµР№ 4 РєР’С‚, РёР»Рё РїСЂРё РЅР°Р»РёС‡РёРё СЌР»РµРєС‚СЂРѕРґРІРёРіР°С‚РµР»СЏ вЂ“ РЅРѕРјРёРЅР°Р»СЊРЅРѕР№ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ РјРѕС‰РЅРѕСЃС‚СЊСЋ РІ СЂРµР¶РёРјРµ РґР»РёС‚РµР»СЊРЅРѕР№ РЅР°РіСЂСѓР·РєРё, РЅРµ РїСЂРµРІС‹С€Р°СЋС‰РµР№ 4 РєР’С‚', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (66, 'T5', 'РєР°С‚РµРіРѕСЂРёСЏ T5', 'РєРѕР»РµСЃРЅС‹Рµ С‚СЂР°РєС‚РѕСЂС‹ СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЂР°СЃС‡РµС‚РЅРѕР№ СЃРєРѕСЂРѕСЃС‚СЊСЋ Р±РѕР»РµРµ 40 РєРј/С‡', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (67, 'L3', 'РєР°С‚РµРіРѕСЂРёСЏ L3', 'РґРІСѓС…РєРѕР»РµСЃРЅРѕРµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ, СЂР°Р±РѕС‡РёР№ РѕР±СЉРµРј РґРІРёРіР°С‚РµР»СЏ РєРѕС‚РѕСЂРѕРіРѕ (РїСЂРё РЅР°Р»РёС‡РёРё РґРІРёРіР°С‚РµР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ СЃРіРѕСЂР°РЅРёСЏ) РїСЂРµРІС‹С€Р°РµС‚ 50 СЃРј3 Рё (РёР»Рё) РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РєРѕРЅСЃС‚СЂСѓРєС‚РёРІРЅР°СЏ СЃРєРѕСЂРѕСЃС‚СЊ РєРѕС‚РѕСЂРѕРіРѕ (РїСЂРё Р»СЋР±РѕРј РґРІРёРіР°С‚РµР»Рµ) РїСЂРµРІС‹С€Р°РµС‚ 50 РєРј/С‡', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (68, 'L4', 'РєР°С‚РµРіРѕСЂРёСЏ L4', 'С‚СЂРµС…РєРѕР»РµСЃРЅРѕРµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ СЃ РєРѕР»РµСЃР°РјРё, Р°СЃРёРјРјРµС‚СЂРёС‡РЅС‹РјРё РїРѕ РѕС‚РЅРѕС€РµРЅРёСЋ Рє СЃСЂРµРґРЅРµР№ РїСЂРѕРґРѕР»СЊРЅРѕР№ РїР»РѕСЃРєРѕСЃС‚Рё, СЂР°Р±РѕС‡РёР№ РѕР±СЉРµРј РґРІРёРіР°С‚РµР»СЏ РєРѕС‚РѕСЂРѕРіРѕ (РїСЂРё РЅР°Р»РёС‡РёРё РґРІРёРіР°С‚РµР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ СЃРіРѕСЂР°РЅРёСЏ) РїСЂРµРІС‹С€Р°РµС‚ 50 СЃРј3 Рё (РёР»Рё) РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РєРѕРЅСЃС‚СЂСѓРєС‚РёРІРЅР°СЏ СЃРєРѕСЂРѕСЃС‚СЊ (РїСЂРё Р»СЋР±РѕРј РґРІРёРіР°С‚РµР»Рµ) РїСЂРµРІС‹С€Р°РµС‚ 50 РєРј/С‡', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (69, 'L5', 'РєР°С‚РµРіРѕСЂРёСЏ L5', 'С‚СЂРµС…РєРѕР»РµСЃРЅРѕРµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ СЃ РєРѕР»РµСЃР°РјРё, СЃРёРјРјРµС‚СЂРёС‡РЅС‹РјРё РїРѕ РѕС‚РЅРѕС€РµРЅРёСЋ Рє СЃСЂРµРґРЅРµР№ РїСЂРѕРґРѕР»СЊРЅРѕР№ РїР»РѕСЃРєРѕСЃС‚Рё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°, СЂР°Р±РѕС‡РёР№ РѕР±СЉРµРј РґРІРёРіР°С‚РµР»СЏ РєРѕС‚РѕСЂРѕРіРѕ (РїСЂРё РЅР°Р»РёС‡РёРё РґРІРёРіР°С‚РµР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ СЃРіРѕСЂР°РЅРёСЏ) РїСЂРµРІС‹С€Р°РµС‚ 50 СЃРј3 Рё (РёР»Рё) РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РєРѕРЅСЃС‚СЂСѓРєС‚РёРІРЅР°СЏ СЃРєРѕСЂРѕСЃС‚СЊ (РїСЂРё Р»СЋР±РѕРј РґРІРёРіР°С‚РµР»Рµ) РїСЂРµРІС‹С€Р°РµС‚ 50 РєРј/С‡', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (70, 'L6', 'РєР°С‚РµРіРѕСЂРёСЏ L6', 'С‡РµС‚С‹СЂРµС…РєРѕР»РµСЃРЅРѕРµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ, РјР°СЃСЃР° РєРѕС‚РѕСЂРѕРіРѕ Р±РµР· РЅР°РіСЂСѓР·РєРё РЅРµ РїСЂРµРІС‹С€Р°РµС‚ 350 РєРі Р±РµР· СѓС‡РµС‚Р° РјР°СЃСЃС‹ Р°РєРєСѓРјСѓР»СЏС‚РѕСЂРѕРІ (РІ СЃР»СѓС‡Р°Рµ СЌР»РµРєС‚СЂРёС‡РµСЃРєРѕРіРѕ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°), РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РєРѕРЅСЃС‚СЂСѓРєС‚РёРІРЅР°СЏ СЃРєРѕСЂРѕСЃС‚СЊ РЅРµ РїСЂРµРІС‹С€Р°РµС‚ 50 РєРј/С‡ Рё РєРѕС‚РѕСЂРѕРµ С…Р°СЂР°РєС‚РµСЂРёР·СѓРµС‚СЃСЏ РїСЂРё РЅР°Р»РёС‡РёРё РґРІРёРіР°С‚РµР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ СЃРіРѕСЂР°РЅРёСЏ СЃ РїСЂРёРЅСѓРґРёС‚РµР»СЊРЅС‹Рј Р·Р°Р¶РёРіР°РЅРёРµРј вЂ“ СЂР°Р±РѕС‡РёРј РѕР±СЉРµРјРѕРј РґРІРёРіР°С‚РµР»СЏ, РЅРµ РїСЂРµРІС‹С€Р°СЋС‰РёРј 50 СЃРј3, РёР»Рё РїСЂРё РЅР°Р»РёС‡РёРё РґРІРёРіР°С‚РµР»СЏ РІРЅСѓС‚СЂРµРЅРЅРµРіРѕ СЃРіРѕСЂР°РЅРёСЏ РґСЂСѓРіРѕРіРѕ С‚РёРїР° вЂ“ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЌС„С„РµРєС‚РёРІРЅРѕР№ РјРѕС‰РЅРѕСЃС‚СЊСЋ РґРІРёРіР°С‚РµР»СЏ, РЅРµ РїСЂРµРІС‹С€Р°СЋС‰РµР№ 4 РєР’С‚, РёР»Рё РїСЂРё РЅР°Р»РёС‡РёРё СЌР»РµРєС‚СЂРѕРґРІРёРіР°С‚РµР»СЏ вЂ“ РЅРѕРјРёРЅР°Р»СЊРЅРѕР№ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ РјРѕС‰РЅРѕСЃС‚СЊСЋ РґРІРёРіР°С‚РµР»СЏ РІ СЂРµР¶РёРјРµ РґР»РёС‚РµР»СЊРЅРѕР№ РЅР°РіСЂСѓР·РєРё, РЅРµ РїСЂРµРІС‹С€Р°СЋС‰РµР№ 4 РєР’С‚', '1', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (71, 'M1', 'РєР°С‚РµРіРѕСЂРёСЏ M1', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, РёСЃРїРѕР»СЊР·СѓРµРјС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё РёРјРµСЋС‰РёРµ, РїРѕРјРёРјРѕ РјРµСЃС‚Р° РІРѕРґРёС‚РµР»СЏ, РЅРµ Р±РѕР»РµРµ 8 РјРµСЃС‚ РґР»СЏ СЃРёРґРµРЅРёСЏ', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (72, 'X', 'СЃРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ Рё РґСЂСѓРіРёРµ СЃР°РјРѕС…РѕРґРЅС‹Рµ Рё РјРѕР±РёР»СЊРЅС‹Рµ РјР°С€РёРЅС‹', 'РѕРїРёСЃР°РЅРёРµ С‚РµС…РЅРёС‡РµСЃРєРѕР№ РєР°С‚РµРіРѕСЂРёРё РїСЂРёРІРµРґРµРЅРѕ РІ РїСЂРёР»РѕР¶РµРЅРёРё в„– 2 Рє С‚РµС…РЅРёС‡РµСЃРєРѕРјСѓ СЂРµРіР»Р°РјРµРЅС‚Сѓ РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° В«Рћ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё РјР°С€РёРЅ Рё РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏВ» (РўР  РўРЎ 010/2011)', '3', NULL, NULL);
INSERT INTO vehiclecategorypereaeutechnicalregulationsclassifier VALUES (73, 'Rb3', 'РєР°С‚РµРіРѕСЂРёСЏ Rb3', 'РїСЂРёС†РµРїС‹ СЃ РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ СЂР°СЃС‡РµС‚РЅРѕР№ СЃРєРѕСЂРѕСЃС‚СЊСЋ Р±РѕР»РµРµ 40 РєРј/С‡, РёРјРµСЋС‰РёРµ С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјСѓСЋ РѕР±С‰СѓСЋ РјР°СЃСЃСѓ СЃРІС‹С€Рµ 3500 РєРі, РЅРѕ РЅРµ Р±РѕР»РµРµ 21000 РєРі', '3', NULL, NULL);


--
-- TOC entry 4637 (class 0 OID 19207)
-- Dependencies: 331
-- Data for Name: vehiclecategoryperviennaconventiononroadtrafficclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclecategoryperviennaconventiononroadtrafficclassifier VALUES (1, 'A', 'РєР°С‚РµРіРѕСЂРёСЏ A', 'РјРѕС‚РѕС†РёРєР»С‹', NULL, NULL);
INSERT INTO vehiclecategoryperviennaconventiononroadtrafficclassifier VALUES (2, 'A1', 'РєР°С‚РµРіРѕСЂРёСЏ A1', 'РјРѕС‚РѕС†РёРєР»С‹ СЃ СЂР°Р±РѕС‡РёРј РѕР±СЉРµРјРѕРј РґРІРёРіР°С‚РµР»СЏ, РЅРµ РїСЂРµРІС‹С€Р°СЋС‰РёРј 125 СЃРј3, Рё РјР°РєСЃРёРјР°Р»СЊРЅРѕР№ РјРѕС‰РЅРѕСЃС‚СЊСЋ, РЅРµ РїСЂРµРІС‹С€Р°СЋС‰РµР№ 11 РєР’С‚ (Р»РµРіРєРёРµ РјРѕС‚РѕС†РёРєР»С‹)', NULL, NULL);
INSERT INTO vehiclecategoryperviennaconventiononroadtrafficclassifier VALUES (3, 'B', 'РєР°С‚РµРіРѕСЂРёСЏ B', 'Р°РІС‚РѕРјРѕР±РёР»Рё (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ, РѕС‚РЅРѕСЃСЏС‰РёС…СЃСЏ Рє РєР°С‚РµРіРѕСЂРёРё Рђ), СЂР°Р·СЂРµС€РµРЅРЅР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° РєРѕС‚РѕСЂС‹С… РЅРµ РїСЂРµРІС‹С€Р°РµС‚ 3500 РєРі Рё С‡РёСЃР»Рѕ СЃРёРґСЏС‡РёС… РјРµСЃС‚ РєРѕС‚РѕСЂС‹С…, РїРѕРјРёРјРѕ СЃРёРґРµРЅСЊСЏ РІРѕРґРёС‚РµР»СЏ, РЅРµ РїСЂРµРІС‹С€Р°РµС‚ 8; Р°РІС‚РѕРјРѕР±РёР»СЊ РєР°С‚РµРіРѕСЂРёРё Р’, СЃС†РµРїР»РµРЅРЅС‹Р№ СЃ РїСЂРёС†РµРїРѕРј, СЂР°Р·СЂРµС€РµРЅРЅР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° РєРѕС‚РѕСЂРѕРіРѕ РЅРµ РїСЂРµРІС‹С€Р°РµС‚ 750 РєРі; Р°РІС‚РѕРјРѕР±РёР»СЊ РєР°С‚РµРіРѕСЂРёРё Р’, СЃС†РµРїР»РµРЅРЅС‹Р№ СЃ РїСЂРёС†РµРїРѕРј, СЂР°Р·СЂРµС€РµРЅРЅР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° РєРѕС‚РѕСЂРѕРіРѕ РїСЂРµРІС‹С€Р°РµС‚ 750 РєРі, РЅРѕ РЅРµ РїСЂРµРІС‹С€Р°РµС‚ РјР°СЃСЃС‹ Р°РІС‚РѕРјРѕР±РёР»СЏ Р±РµР· РЅР°РіСЂСѓР·РєРё, Р° РѕР±С‰Р°СЏ СЂР°Р·СЂРµС€РµРЅРЅР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° С‚Р°РєРѕРіРѕ СЃРѕСЃС‚Р°РІР° РЅРµ РїСЂРµРІС‹С€Р°РµС‚ 3500 РєРі', NULL, NULL);
INSERT INTO vehiclecategoryperviennaconventiononroadtrafficclassifier VALUES (4, 'B1', 'РєР°С‚РµРіРѕСЂРёСЏ B1', 'РјРѕС‚РѕСЂРёР·РѕРІР°РЅРЅС‹Рµ С‚СЂРёС†РёРєР»С‹ Рё РєРІР°РґСЂРёС†РёРєР»С‹', NULL, NULL);
INSERT INTO vehiclecategoryperviennaconventiononroadtrafficclassifier VALUES (5, 'C', 'РєР°С‚РµРіРѕСЂРёСЏ C', 'Р°РІС‚РѕРјРѕР±РёР»Рё, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РѕС‚РЅРѕСЃСЏС‰РёС…СЃСЏ Рє РєР°С‚РµРіРѕСЂРёРё D, СЂР°Р·СЂРµС€РµРЅРЅР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° РєРѕС‚РѕСЂС‹С… РїСЂРµРІС‹С€Р°РµС‚ 3500 РєРі; Р°РІС‚РѕРјРѕР±РёР»СЊ РєР°С‚РµРіРѕСЂРёРё РЎ, СЃС†РµРїР»РµРЅРЅС‹Р№ СЃ РїСЂРёС†РµРїРѕРј, СЂР°Р·СЂРµС€РµРЅРЅР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° РєРѕС‚РѕСЂРѕРіРѕ РЅРµ РїСЂРµРІС‹С€Р°РµС‚ 750 РєРі', NULL, NULL);
INSERT INTO vehiclecategoryperviennaconventiononroadtrafficclassifier VALUES (6, 'C1', 'РєР°С‚РµРіРѕСЂРёСЏ C1', 'Р°РІС‚РѕРјРѕР±РёР»Рё, Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РѕС‚РЅРѕСЃСЏС‰РёС…СЃСЏ Рє РєР°С‚РµРіРѕСЂРёРё D, СЂР°Р·СЂРµС€РµРЅРЅР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° РєРѕС‚РѕСЂС‹С… РїСЂРµРІС‹С€Р°РµС‚ 3500 РєРі, РЅРѕ РЅРµ РїСЂРµРІС‹С€Р°РµС‚ 7500 РєРі; Р°РІС‚РѕРјРѕР±РёР»СЊ РїРѕРґРєР°С‚РµРіРѕСЂРёРё РЎ1, СЃС†РµРїР»РµРЅРЅС‹Р№ СЃ РїСЂРёС†РµРїРѕРј, СЂР°Р·СЂРµС€РµРЅРЅР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° РєРѕС‚РѕСЂРѕРіРѕ РЅРµ РїСЂРµРІС‹С€Р°РµС‚ 750 РєРі', NULL, NULL);
INSERT INTO vehiclecategoryperviennaconventiononroadtrafficclassifier VALUES (7, 'D', 'РєР°С‚РµРіРѕСЂРёСЏ D', 'Р°РІС‚РѕРјРѕР±РёР»Рё, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё РёРјРµСЋС‰РёРµ Р±РѕР»РµРµ 8 СЃРёРґСЏС‡РёС… РјРµСЃС‚, РїРѕРјРёРјРѕ СЃРёРґРµРЅСЊСЏ РІРѕРґРёС‚РµР»СЏ; Р°РІС‚РѕРјРѕР±РёР»СЊ РєР°С‚РµРіРѕСЂРёРё D, СЃС†РµРїР»РµРЅРЅС‹Р№ СЃ РїСЂРёС†РµРїРѕРј, СЂР°Р·СЂРµС€РµРЅРЅР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° РєРѕС‚РѕСЂРѕРіРѕ РЅРµ РїСЂРµРІС‹С€Р°РµС‚ 750 РєРі', NULL, NULL);
INSERT INTO vehiclecategoryperviennaconventiononroadtrafficclassifier VALUES (8, 'D1', 'РєР°С‚РµРіРѕСЂРёСЏ D1', 'Р°РІС‚РѕРјРѕР±РёР»Рё, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё РёРјРµСЋС‰РёРµ Р±РѕР»РµРµ 8 СЃРёРґСЏС‡РёС… РјРµСЃС‚, РїРѕРјРёРјРѕ СЃРёРґРµРЅСЊСЏ РІРѕРґРёС‚РµР»СЏ, РЅРѕ РЅРµ Р±РѕР»РµРµ 16 СЃРёРґСЏС‡РёС… РјРµСЃС‚, РїРѕРјРёРјРѕ СЃРёРґРµРЅСЊСЏ РІРѕРґРёС‚РµР»СЏ; Р°РІС‚РѕРјРѕР±РёР»СЊ РїРѕРґРєР°С‚РµРіРѕСЂРёРё D1, СЃС†РµРїР»РµРЅРЅС‹Р№ СЃ РїСЂРёС†РµРїРѕРј, СЂР°Р·СЂРµС€РµРЅРЅР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° РєРѕС‚РѕСЂРѕРіРѕ РЅРµ РїСЂРµРІС‹С€Р°РµС‚ 750 РєРі', NULL, NULL);
INSERT INTO vehiclecategoryperviennaconventiononroadtrafficclassifier VALUES (9, 'E', 'РїСЂРёС†РµРї', 'РїСЂРёС†РµРїС‹', NULL, NULL);


--
-- TOC entry 4639 (class 0 OID 19215)
-- Dependencies: 333
-- Data for Name: vehiclecatperelectrontechcertificateregistrationrulesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclecatperelectrontechcertificateregistrationrulesclassifier VALUES (1, 'AI', 'РєР°С‚РµРіРѕСЂРёСЏ A I', 'РІРЅРµРґРѕСЂРѕР¶РЅС‹Рµ РјРѕС‚РѕС‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°', NULL, NULL);
INSERT INTO vehiclecatperelectrontechcertificateregistrationrulesclassifier VALUES (2, 'AII', 'РєР°С‚РµРіРѕСЂРёСЏ A II', 'РІРЅРµРґРѕСЂРѕР¶РЅС‹Рµ Р°РІС‚РѕС‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, СЂР°Р·СЂРµС€РµРЅРЅР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° РєРѕС‚РѕСЂС‹С… РЅРµ РїСЂРµРІС‹С€Р°РµС‚ 3500 РєРі Рё С‡РёСЃР»Рѕ СЃРёРґСЏС‡РёС… РјРµСЃС‚, РєРѕС‚РѕСЂС‹С…, РїРѕРјРёРјРѕ СЃРёРґРµРЅСЊСЏ РІРѕРґРёС‚РµР»СЏ, РЅРµ РїСЂРµРІС‹С€Р°РµС‚ 8', NULL, NULL);
INSERT INTO vehiclecatperelectrontechcertificateregistrationrulesclassifier VALUES (3, 'AIII', 'РєР°С‚РµРіРѕСЂРёСЏ A III', 'РІРЅРµРґРѕСЂРѕР¶РЅС‹Рµ Р°РІС‚РѕС‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, СЂР°Р·СЂРµС€РµРЅРЅР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° РєРѕС‚РѕСЂС‹С… РїСЂРµРІС‹С€Р°РµС‚ 3 500 РєРёР»РѕРіСЂР°РјРјРѕРІ (Р·Р° РёСЃРєР»СЋС‡РµРЅРёРµРј РѕС‚РЅРѕСЃСЏС‰РёС…СЃСЏ Рє РєР°С‚РµРіРѕСЂРёРё A IV)', NULL, NULL);
INSERT INTO vehiclecatperelectrontechcertificateregistrationrulesclassifier VALUES (4, 'AIV', 'РєР°С‚РµРіРѕСЂРёСЏ A IV', 'РІРЅРµРґРѕСЂРѕР¶РЅС‹Рµ Р°РІС‚РѕС‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РїРµСЂРµРІРѕР·РєРё РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё РёРјРµСЋС‰РёРµ, РїРѕРјРёРјРѕ СЃРёРґРµРЅСЊСЏ РІРѕРґРёС‚РµР»СЏ, Р±РѕР»РµРµ 8 СЃРёРґСЏС‡РёС… РјРµСЃС‚', NULL, NULL);
INSERT INTO vehiclecatperelectrontechcertificateregistrationrulesclassifier VALUES (5, 'B', 'РєР°С‚РµРіРѕСЂРёСЏ B', 'РіСѓСЃРµРЅРёС‡РЅС‹Рµ Рё РєРѕР»РµСЃРЅС‹Рµ РјР°С€РёРЅС‹ СЃ РґРІРёРіР°С‚РµР»РµРј РјРѕС‰РЅРѕСЃС‚СЊСЋ РґРѕ 25,7 РєР’С‚', NULL, NULL);
INSERT INTO vehiclecatperelectrontechcertificateregistrationrulesclassifier VALUES (6, 'C', 'РєР°С‚РµРіРѕСЂРёСЏ C', 'РєРѕР»РµСЃРЅС‹Рµ РјР°С€РёРЅС‹ СЃ РґРІРёРіР°С‚РµР»РµРј РјРѕС‰РЅРѕСЃС‚СЊСЋ РѕС‚ 25,7 РґРѕ 110,3 РєР’С‚', NULL, NULL);
INSERT INTO vehiclecatperelectrontechcertificateregistrationrulesclassifier VALUES (7, 'D', 'РєР°С‚РµРіРѕСЂРёСЏ D', 'РєРѕР»РµСЃРЅС‹Рµ РјР°С€РёРЅС‹ СЃ РґРІРёРіР°С‚РµР»РµРј РјРѕС‰РЅРѕСЃС‚СЊСЋ СЃРІС‹С€Рµ 110,3 РєР’С‚', NULL, NULL);
INSERT INTO vehiclecatperelectrontechcertificateregistrationrulesclassifier VALUES (8, 'E', 'РєР°С‚РµРіРѕСЂРёСЏ E', 'РіСѓСЃРµРЅРёС‡РЅС‹Рµ РјР°С€РёРЅС‹ СЃ РґРІРёРіР°С‚РµР»РµРј РјРѕС‰РЅРѕСЃС‚СЊСЋ СЃРІС‹С€Рµ 25,7 РєР’С‚', NULL, NULL);
INSERT INTO vehiclecatperelectrontechcertificateregistrationrulesclassifier VALUES (9, 'F', 'РєР°С‚РµРіРѕСЂРёСЏ F', 'СЃР°РјРѕС…РѕРґРЅС‹Рµ СЃРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹Рµ РјР°С€РёРЅС‹', NULL, NULL);
INSERT INTO vehiclecatperelectrontechcertificateregistrationrulesclassifier VALUES (10, 'R', 'РїСЂРёС†РµРї', 'С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР°, РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅРЅС‹Рµ РґР»СЏ РґРІРёР¶РµРЅРёСЏ РІ СЃРѕСЃС‚Р°РІРµ СЃ РјРµС…Р°РЅРёС‡РµСЃРєРёРј С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рј СЃСЂРµРґСЃС‚РІРѕРј. РџРѕРґ РїСЂРёС†РµРїР°РјРё РїРѕРЅРёРјР°СЋС‚СЃСЏ С‚Р°РєР¶Рµ РїРѕР»СѓРїСЂРёС†РµРїС‹', NULL, NULL);


--
-- TOC entry 4641 (class 0 OID 19223)
-- Dependencies: 335
-- Data for Name: vehiclechassisclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclechassisclassifier VALUES (1, '05', 'С€Р°СЃСЃРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° СЃ РєР°Р±РёРЅРѕР№ Рё РґРІРёРіР°С‚РµР»РµРј', NULL, NULL);
INSERT INTO vehiclechassisclassifier VALUES (2, '10', 'Р°РІС‚РѕР±СѓСЃРЅРѕРµ С€Р°СЃСЃРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° Р±РµР· РєСѓР·РѕРІР° РґР»СЏ Р°РІС‚РѕР±СѓСЃРѕРІ СЂР°РјРЅРѕР№ РєРѕРЅСЃС‚СЂСѓРєС†РёРё', NULL, NULL);
INSERT INTO vehiclechassisclassifier VALUES (3, '15', 'Р°РІС‚РѕР±СѓСЃРЅРѕРµ С€Р°СЃСЃРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° Р±РµР· РєСѓР·РѕРІР° РґР»СЏ Р°РІС‚РѕР±СѓСЃРѕРІ РєР°СЂРєР°СЃРЅРѕР№ РєРѕРЅСЃС‚СЂСѓРєС†РёРё', NULL, NULL);
INSERT INTO vehiclechassisclassifier VALUES (4, '20', 'РіСЂСѓР·РѕРІРѕРµ С€Р°СЃСЃРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° Р±РµР· РєР°Р±РёРЅС‹ РґР»СЏ РёР·РіРѕС‚РѕРІР»РµРЅРёСЏ С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІ СЃРѕ СЃРїРµС†РёР°Р»СЊРЅРѕР№ РєР°Р±РёРЅРѕР№', NULL, NULL);
INSERT INTO vehiclechassisclassifier VALUES (5, '25', 'РіСЂСѓР·РѕРІРѕРµ С€Р°СЃСЃРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° СЃ С‡Р°СЃС‚РёС‡РЅРѕ СЃРѕР±СЂР°РЅРЅРѕР№ РєР°Р±РёРЅРѕР№ (Р±РµР· Р·Р°РґРЅРµР№ СЃС‚РµРЅРєРё)', NULL, NULL);
INSERT INTO vehiclechassisclassifier VALUES (6, '30', 'С€Р°СЃСЃРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° СЃ РїРµСЂРµРґРЅРµР№ С‡Р°СЃС‚СЊСЋ РєР°Р±РёРЅС‹ РґР»СЏ РёР·РіРѕС‚РѕРІР»РµРЅРёСЏ Р°РІС‚РѕРјРѕР±РёР»РµР№-РґРѕРјРѕРІ', NULL, NULL);
INSERT INTO vehiclechassisclassifier VALUES (7, '35', 'РїРµСЂРµРґРЅСЏСЏ С‡Р°СЃС‚СЊ С€Р°СЃСЃРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° Р±РµР· РєР°Р±РёРЅС‹ РґР»СЏ РёР·РіРѕС‚РѕРІР»РµРЅРёСЏ Р°РІС‚РѕРјРѕР±РёР»РµР№-РґРѕРјРѕРІ', NULL, NULL);
INSERT INTO vehiclechassisclassifier VALUES (8, '40', 'С€Р°СЃСЃРё РїСЂРёС†РµРїР°', NULL, NULL);
INSERT INTO vehiclechassisclassifier VALUES (9, '99', 'РїСЂРѕС‡РµРµ', NULL, NULL);


--
-- TOC entry 4643 (class 0 OID 19231)
-- Dependencies: 337
-- Data for Name: vehiclecomponentschassistypesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclecomponentschassistypesclassifier VALUES (1, '5', 'РєРѕСЂРѕР±РєР° РїРµСЂРµРґР°С‡', '1', NULL, NULL);
INSERT INTO vehiclecomponentschassistypesclassifier VALUES (2, '5', 'РєРѕСЂРѕР±РєР° РїРµСЂРµРґР°С‡', '2', NULL, NULL);
INSERT INTO vehiclecomponentschassistypesclassifier VALUES (3, '5', 'РєРѕСЂРѕР±РєР° РїРµСЂРµРґР°С‡', '3', NULL, NULL);
INSERT INTO vehiclecomponentschassistypesclassifier VALUES (4, '10', 'СЂР°Р·РґР°С‚РѕС‡РЅР°СЏ РєРѕСЂРѕР±РєР°', '1', NULL, NULL);
INSERT INTO vehiclecomponentschassistypesclassifier VALUES (5, '10', 'СЂР°Р·РґР°С‚РѕС‡РЅР°СЏ РєРѕСЂРѕР±РєР°', '2', NULL, NULL);
INSERT INTO vehiclecomponentschassistypesclassifier VALUES (6, '10', 'СЂР°Р·РґР°С‚РѕС‡РЅР°СЏ РєРѕСЂРѕР±РєР°', '3', NULL, NULL);
INSERT INTO vehiclecomponentschassistypesclassifier VALUES (7, '15', 'РіР»Р°РІРЅР°СЏ РїРµСЂРµРґР°С‡Р°', '1', NULL, NULL);
INSERT INTO vehiclecomponentschassistypesclassifier VALUES (8, '15', 'РіР»Р°РІРЅР°СЏ РїРµСЂРµРґР°С‡Р°', '2', NULL, NULL);
INSERT INTO vehiclecomponentschassistypesclassifier VALUES (9, '15', 'РіР»Р°РІРЅР°СЏ РїРµСЂРµРґР°С‡Р°', '3', NULL, NULL);
INSERT INTO vehiclecomponentschassistypesclassifier VALUES (10, '20', 'РІР°Р» РѕС‚Р±РѕСЂР° РјРѕС‰РЅРѕСЃС‚Рё', '3', NULL, NULL);


--
-- TOC entry 4645 (class 0 OID 19239)
-- Dependencies: 339
-- Data for Name: vehicleelectricmachinetypeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehicleelectricmachinetypeclassifier VALUES (1, '01', 'СЌР»РµРєС‚СЂРѕРґРІРёРіР°С‚РµР»СЊ СЌР»РµРєС‚СЂРѕРјРѕР±РёР»СЏ (СЌР»РµРєС‚СЂРѕРјР°С€РёРЅС‹)', '1', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (2, '02', 'СЌР»РµРєС‚СЂРѕРґРІРёРіР°С‚РµР»СЊ С‚СЂР°РЅСЃРјРёСЃСЃРёРё', '1', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (3, '03', 'СЌР»РµРєС‚СЂРѕРіРµРЅРµСЂР°С‚РѕСЂ С‚СЂР°РЅСЃРјРёСЃСЃРёРё', '1', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (4, '04', 'РѕР±СЂР°С‚РёРјР°СЏ СЌР»РµРєС‚СЂРѕРјР°С€РёРЅР°', '1', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (5, '01', 'СЌР»РµРєС‚СЂРѕРґРІРёРіР°С‚РµР»СЊ СЌР»РµРєС‚СЂРѕРјРѕР±РёР»СЏ (СЌР»РµРєС‚СЂРѕРјР°С€РёРЅС‹)', '2', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (6, '01', 'СЌР»РµРєС‚СЂРѕРґРІРёРіР°С‚РµР»СЊ СЌР»РµРєС‚СЂРѕРјРѕР±РёР»СЏ (СЌР»РµРєС‚СЂРѕРјР°С€РёРЅС‹)', '3', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (7, '02', 'СЌР»РµРєС‚СЂРѕРґРІРёРіР°С‚РµР»СЊ С‚СЂР°РЅСЃРјРёСЃСЃРёРё', '2', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (8, '02', 'СЌР»РµРєС‚СЂРѕРґРІРёРіР°С‚РµР»СЊ С‚СЂР°РЅСЃРјРёСЃСЃРёРё', '3', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (9, '03', 'СЌР»РµРєС‚СЂРѕРіРµРЅРµСЂР°С‚РѕСЂ С‚СЂР°РЅСЃРјРёСЃСЃРёРё', '2', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (10, '03', 'СЌР»РµРєС‚СЂРѕРіРµРЅРµСЂР°С‚РѕСЂ С‚СЂР°РЅСЃРјРёСЃСЃРёРё', '3', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (11, '04', 'РѕР±СЂР°С‚РёРјР°СЏ СЌР»РµРєС‚СЂРѕРјР°С€РёРЅР°', '2', NULL, NULL);
INSERT INTO vehicleelectricmachinetypeclassifier VALUES (12, '04', 'РѕР±СЂР°С‚РёРјР°СЏ СЌР»РµРєС‚СЂРѕРјР°С€РёРЅР°', '3', NULL, NULL);


--
-- TOC entry 4647 (class 0 OID 19247)
-- Dependencies: 341
-- Data for Name: vehicleelectroniccertificateissuecauseclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehicleelectroniccertificateissuecauseclassifier VALUES (1, '01', 'РёР·РіРѕС‚РѕРІР»РµРЅРёРµ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° (С€Р°СЃСЃРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°, СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ РёР»Рё РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё)', NULL, NULL);
INSERT INTO vehicleelectroniccertificateissuecauseclassifier VALUES (2, '02', 'РІРІРѕР· С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° (С€Р°СЃСЃРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°, СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ РёР»Рё РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё) РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° РёР· РіРѕСЃСѓРґР°СЂСЃС‚РІР°, РЅРµ СЏРІР»СЏСЋС‰РµРіРѕСЃСЏ С‡Р»РµРЅРѕРј Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°', NULL, NULL);
INSERT INTO vehicleelectroniccertificateissuecauseclassifier VALUES (3, '03', 'РѕС„РѕСЂРјР»РµРЅРёРµ СЌР»РµРєС‚СЂРѕРЅРЅРѕРіРѕ РїР°СЃРїРѕСЂС‚Р° РЅР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ (СЃР°РјРѕС…РѕРґРЅСѓСЋ РјР°С€РёРЅСѓ РёР»Рё РґСЂСѓРіРѕР№ РІРёРґ С‚РµС…РЅРёРєРё), Р·Р°СЂРµРіРёСЃС‚СЂРёСЂРѕРІР°РЅРЅРѕРµ РѕСЂРіР°РЅРѕРј СЂРµРіРёСЃС‚СЂР°С†РёРё', NULL, NULL);
INSERT INTO vehicleelectroniccertificateissuecauseclassifier VALUES (4, '04', 'РѕС„РѕСЂРјР»РµРЅРёРµ СЌР»РµРєС‚СЂРѕРЅРЅРѕРіРѕ РїР°СЃРїРѕСЂС‚Р° РЅР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРµ СЃСЂРµРґСЃС‚РІРѕ (С€Р°СЃСЃРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°, СЃР°РјРѕС…РѕРґРЅСѓСЋ РјР°С€РёРЅСѓ РёР»Рё РґСЂСѓРіРѕР№ РІРёРґ С‚РµС…РЅРёРєРё) РЅР° РёРЅС‹С… РѕСЃРЅРѕРІР°РЅРёСЏС…', NULL, NULL);


--
-- TOC entry 4649 (class 0 OID 19255)
-- Dependencies: 343
-- Data for Name: vehicleelectroniccertificateissuecausewodocumentationsubstantia; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehicleelectroniccertificateissuecausewodocumentationsubstantia VALUES (1, '01', 'РѕС„РѕСЂРјР»РµРЅРёРµ СЌР»РµРєС‚СЂРѕРЅРЅРѕРіРѕ РїР°СЃРїРѕСЂС‚Р° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° (СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ РёР»Рё РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё), Р·Р°СЂРµРіРёСЃС‚СЂРёСЂРѕРІР°РЅРЅРѕРіРѕ РѕСЂРіР°РЅРѕРј СЂРµРіРёСЃС‚СЂР°С†РёРё РґРѕ РґР°С‚С‹ РЅР°С‡Р°Р»Р° РїСЂРёРјРµРЅРµРЅРёСЏ СЌР»РµРєС‚СЂРѕРЅРЅС‹С… РїР°СЃРїРѕСЂС‚РѕРІ', NULL, NULL);
INSERT INTO vehicleelectroniccertificateissuecausewodocumentationsubstantia VALUES (2, '02', 'РѕС„РѕСЂРјР»РµРЅРёРµ СЌР»РµРєС‚СЂРѕРЅРЅРѕРіРѕ РїР°СЃРїРѕСЂС‚Р° РЅР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹Рµ СЃСЂРµРґСЃС‚РІР° РєР°С‚РµРіРѕСЂРёР№ L Рё M1 (РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РїСЂРёР»РѕР¶РµРЅРёРµРј в„– 1 Рє С‚РµС…РЅРёС‡РµСЃРєРѕРјСѓ СЂРµРіР»Р°РјРµРЅС‚Сѓ РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° В«Рћ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё РєРѕР»РµСЃРЅС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІВ» (РўР  РўРЎ 018/2011)), СЃ РґР°С‚С‹ РІС‹РїСѓСЃРєР° РєРѕС‚РѕСЂС‹С… РїСЂРѕС€Р»Рѕ 30 Р»РµС‚ Рё Р±РѕР»РµРµ, Р° С‚Р°РєР¶Рµ РєР°С‚РµРіРѕСЂРёР№ M2, M3 Рё N (РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РїСЂРёР»РѕР¶РµРЅРёРµРј в„– 1 Рє С‚РµС…РЅРёС‡РµСЃРєРѕРјСѓ СЂРµРіР»Р°РјРµРЅС‚Сѓ РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° В«Рћ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё РєРѕР»РµСЃРЅС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІВ» (РўР  РўРЎ 018/2011)), РєРѕС‚РѕСЂС‹Рµ РЅРµ РїСЂРµРґРЅР°Р·РЅР°С‡РµРЅС‹ РґР»СЏ РєРѕРјРјРµСЂС‡РµСЃРєРёС… РїРµСЂРµРІРѕР·РѕРє РїР°СЃСЃР°Р¶РёСЂРѕРІ Рё РіСЂСѓР·РѕРІ, СЃ РґР°С‚С‹ РІС‹РїСѓСЃРєР° РєРѕС‚РѕСЂС‹С… РїСЂРѕС€Р»Рѕ 50 Р»РµС‚ Рё Р±РѕР»РµРµ, СЃ РѕСЂРёРіРёРЅР°Р»СЊРЅС‹РјРё РґРІРёРіР°С‚РµР»РµРј, РєСѓР·РѕРІРѕРј Рё СЂР°РјРѕР№ (РїСЂРё РЅР°Р»РёС‡РёРё), СЃРѕС…СЂР°РЅРµРЅРЅС‹С… РёР»Рё РѕС‚СЂРµСЃС‚Р°РІСЂРёСЂРѕРІР°РЅРЅС‹С… РґРѕ РѕСЂРёРіРёРЅР°Р»СЊРЅРѕРіРѕ СЃРѕСЃС‚РѕСЏРЅРёСЏ', NULL, NULL);
INSERT INTO vehicleelectroniccertificateissuecausewodocumentationsubstantia VALUES (3, '03', 'РІРІРѕР· С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° РЅР° С‚РµСЂСЂРёС‚РѕСЂРёСЋ РіРѕСЃСѓРґР°СЂСЃС‚РІР° вЂ“ С‡Р»РµРЅР° Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р°, РІ РєРѕС‚РѕСЂРѕРј РІ РѕС‚РЅРѕС€РµРЅРёРё С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЂРµРіР»Р°РјРµРЅС‚Р° РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° В«Рћ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё РјР°С€РёРЅ Рё РѕР±РѕСЂСѓРґРѕРІР°РЅРёСЏВ» (РўР  РўРЎ 010/2011), С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЂРµРіР»Р°РјРµРЅС‚Р° РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° В«Рћ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё РєРѕР»РµСЃРЅС‹С… С‚СЂР°РЅСЃРїРѕСЂС‚РЅС‹С… СЃСЂРµРґСЃС‚РІВ» (РўР  РўРЎ 018/2011) РёР»Рё С‚РµС…РЅРёС‡РµСЃРєРѕРіРѕ СЂРµРіР»Р°РјРµРЅС‚Р° РўР°РјРѕР¶РµРЅРЅРѕРіРѕ СЃРѕСЋР·Р° В«Рћ Р±РµР·РѕРїР°СЃРЅРѕСЃС‚Рё СЃРµР»СЊСЃРєРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹С… Рё Р»РµСЃРѕС…РѕР·СЏР№СЃС‚РІРµРЅРЅС‹С… С‚СЂР°РєС‚РѕСЂРѕРІ Рё РїСЂРёС†РµРїРѕРІ Рє РЅРёРјВ» (РўР  РўРЎ 031/2012) РЅРµ РїСЂРёРјРµРЅСЏРµС‚СЃСЏ РїРµСЂРІС‹Р№ Р°Р±Р·Р°С† РїСѓРЅРєС‚Р° 3 СЃС‚Р°С‚СЊРё 53 Р”РѕРіРѕРІРѕСЂР° Рѕ Р•РІСЂР°Р·РёР№СЃРєРѕРј СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРј СЃРѕСЋР·Рµ РѕС‚ 29 РјР°СЏ 2014 РіРѕРґР° Рё РЅРµ РёСЃС‚РµРєР»Рё СЃСЂРѕРєРё РїРµСЂРµС…РѕРґРЅС‹С… РїРѕР»РѕР¶РµРЅРёР№ СѓРєР°Р·Р°РЅРЅС‹С… С‚РµС…РЅРёС‡РµСЃРєРёС… СЂРµРіР»Р°РјРµРЅС‚РѕРІ, СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅС‹Рµ Р•РІСЂР°Р·РёР№СЃРєРѕР№ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕР№ РєРѕРјРёСЃСЃРёРµР№ РґР»СЏ СЌС‚РѕРіРѕ РіРѕСЃСѓРґР°СЂСЃС‚РІР°-С‡Р»РµРЅР°', NULL, NULL);
INSERT INTO vehicleelectroniccertificateissuecausewodocumentationsubstantia VALUES (4, '04', 'РІРІРѕР· РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°, РїСЂРёРЅР°РґР»РµР¶Р°С‰РµРіРѕ С„РёР·РёС‡РµСЃРєРѕРјСѓ Р»РёС†Сѓ, СЏРІР»СЏСЋС‰РµРјСѓСЃСЏ СѓС‡Р°СЃС‚РЅРёРєРѕРј РЅР°С†РёРѕРЅР°Р»СЊРЅС‹С… РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹С… РїСЂРѕРіСЂР°РјРј РїРѕ РѕРєР°Р·Р°РЅРёСЋ СЃРѕРґРµР№СЃС‚РІРёСЏ РґРѕР±СЂРѕРІРѕР»СЊРЅРѕРјСѓ РїРµСЂРµСЃРµР»РµРЅРёСЋ Р»РёС†, РїСЂРѕР¶РёРІР°СЋС‰РёС… Р·Р° СЂСѓР±РµР¶РѕРј, Р»РёР±Рѕ РїСЂРёР·РЅР°РЅРЅРѕРјСѓ РІ СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅРѕРј РїРѕСЂСЏРґРєРµ Р±РµР¶РµРЅС†РµРј РёР»Рё РІС‹РЅСѓР¶РґРµРЅРЅС‹Рј РїРµСЂРµСЃРµР»РµРЅС†РµРј, Р° С‚Р°РєР¶Рµ С‡Р»РµРЅР°Рј РµРіРѕ СЃРµРјСЊРё', NULL, NULL);
INSERT INTO vehicleelectroniccertificateissuecausewodocumentationsubstantia VALUES (5, '05', 'РІРІРѕР· РЅР° С‚Р°РјРѕР¶РµРЅРЅСѓСЋ С‚РµСЂСЂРёС‚РѕСЂРёСЋ Р•РІСЂР°Р·РёР№СЃРєРѕРіРѕ СЌРєРѕРЅРѕРјРёС‡РµСЃРєРѕРіРѕ СЃРѕСЋР·Р° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°, РїСЂРёРЅР°РґР»РµР¶Р°С‰РµРіРѕ РґРёРїР»РѕРјР°С‚РёС‡РµСЃРєРёРј РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІР°Рј Рё РєРѕРЅСЃСѓР»СЊСЃРєРёРј СѓС‡СЂРµР¶РґРµРЅРёСЏРј, РјРµР¶РґСѓРЅР°СЂРѕРґРЅС‹Рј (РјРµР¶РіРѕСЃСѓРґР°СЂСЃС‚РІРµРЅРЅС‹Рј) РѕСЂРіР°РЅРёР·Р°С†РёСЏРј, РїРѕР»СЊР·СѓСЋС‰РёРјСЃСЏ РїСЂРёРІРёР»РµРіРёСЏРјРё Рё РёРјРјСѓРЅРёС‚РµС‚Р°РјРё РІ СЃРѕРѕС‚РІРµС‚СЃС‚РІРёРё СЃ РѕР±С‰РµРїСЂРёР·РЅР°РЅРЅС‹РјРё РїСЂРёРЅС†РёРїР°РјРё Рё РЅРѕСЂРјР°РјРё РјРµР¶РґСѓРЅР°СЂРѕРґРЅРѕРіРѕ РїСЂР°РІР°, СЃРѕС‚СЂСѓРґРЅРёРєР°Рј СЌС‚РёС… РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊСЃС‚РІ (СѓС‡СЂРµР¶РґРµРЅРёР№, РѕСЂРіР°РЅРёР·Р°С†РёР№), Р° С‚Р°РєР¶Рµ С‡Р»РµРЅР°Рј РёС… СЃРµРјРµР№', NULL, NULL);


--
-- TOC entry 4651 (class 0 OID 19263)
-- Dependencies: 345
-- Data for Name: vehicleenvironmentalclassclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehicleenvironmentalclassclassifier VALUES (1, '00', 'СЌРєРѕР»РѕРіРёС‡РµСЃРєРёР№ РєР»Р°СЃСЃ 0', NULL, NULL);
INSERT INTO vehicleenvironmentalclassclassifier VALUES (2, '01', 'СЌРєРѕР»РѕРіРёС‡РµСЃРєРёР№ РєР»Р°СЃСЃ 1', NULL, NULL);
INSERT INTO vehicleenvironmentalclassclassifier VALUES (3, '02', 'СЌРєРѕР»РѕРіРёС‡РµСЃРєРёР№ РєР»Р°СЃСЃ 2', NULL, NULL);
INSERT INTO vehicleenvironmentalclassclassifier VALUES (4, '03', 'СЌРєРѕР»РѕРіРёС‡РµСЃРєРёР№ РєР»Р°СЃСЃ 3', NULL, NULL);
INSERT INTO vehicleenvironmentalclassclassifier VALUES (5, '04', 'СЌРєРѕР»РѕРіРёС‡РµСЃРєРёР№ РєР»Р°СЃСЃ 4', NULL, NULL);
INSERT INTO vehicleenvironmentalclassclassifier VALUES (6, '05', 'СЌРєРѕР»РѕРіРёС‡РµСЃРєРёР№ РєР»Р°СЃСЃ 5', NULL, NULL);
INSERT INTO vehicleenvironmentalclassclassifier VALUES (7, '06', 'СЌРєРѕР»РѕРіРёС‡РµСЃРєРёР№ РєР»Р°СЃСЃ 6', NULL, NULL);


--
-- TOC entry 4653 (class 0 OID 19271)
-- Dependencies: 347
-- Data for Name: vehiclefueltypesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclefueltypesclassifier VALUES (1, '01', 'Р±РµРЅР·РёРЅ', NULL, NULL);
INSERT INTO vehiclefueltypesclassifier VALUES (2, '02', 'РґРёР·РµР»СЊРЅРѕРµ С‚РѕРїР»РёРІРѕ', NULL, NULL);
INSERT INTO vehiclefueltypesclassifier VALUES (3, '03', 'РєРѕРјРїСЂРёРјРёСЂРѕРІР°РЅРЅС‹Р№ РїСЂРёСЂРѕРґРЅС‹Р№ РіР°Р·', NULL, NULL);
INSERT INTO vehiclefueltypesclassifier VALUES (4, '04', 'СЃР¶РёР¶РµРЅРЅС‹Р№ РїСЂРёСЂРѕРґРЅС‹Р№ РіР°Р·', NULL, NULL);
INSERT INTO vehiclefueltypesclassifier VALUES (5, '05', 'СЃР¶РёР¶РµРЅРЅС‹Р№ РїСЂРѕРїР°РЅ-Р±СѓС‚Р°РЅ', NULL, NULL);
INSERT INTO vehiclefueltypesclassifier VALUES (6, '06', 'РІРѕРґРѕСЂРѕРґРЅС‹Рµ С‚РѕРїР»РёРІРЅС‹Рµ СЌР»РµРјРµРЅС‚С‹', NULL, NULL);
INSERT INTO vehiclefueltypesclassifier VALUES (7, '99', 'РїСЂРѕС‡РµРµ', NULL, NULL);


--
-- TOC entry 4655 (class 0 OID 19279)
-- Dependencies: 349
-- Data for Name: vehiclemanufacturertypeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclemanufacturertypeclassifier VALUES (1, '05', 'РёР·РіРѕС‚РѕРІРёС‚РµР»СЊ', '1', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (2, '10', 'РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊ РёР·РіРѕС‚РѕРІРёС‚РµР»СЏ', '1', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (3, '15', 'РёР·РіРѕС‚РѕРІРёС‚РµР»СЊ вЂ“ СЃР±РѕСЂРѕС‡РЅС‹Р№ Р·Р°РІРѕРґ', '1', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (4, '20', 'РёР·РіРѕС‚РѕРІРёС‚РµР»СЊ вЂ“ РїРѕСЃС‚Р°РІС‰РёРє СЃР±РѕСЂРѕС‡РЅС‹С… РєРѕРјРїР»РµРєС‚РѕРІ', '1', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (5, '05', 'РёР·РіРѕС‚РѕРІРёС‚РµР»СЊ', '2', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (6, '05', 'РёР·РіРѕС‚РѕРІРёС‚РµР»СЊ', '2', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (7, '10', 'РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊ РёР·РіРѕС‚РѕРІРёС‚РµР»СЏ', '2', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (8, '10', 'РїСЂРµРґСЃС‚Р°РІРёС‚РµР»СЊ РёР·РіРѕС‚РѕРІРёС‚РµР»СЏ', '2', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (9, '15', 'РёР·РіРѕС‚РѕРІРёС‚РµР»СЊ вЂ“ СЃР±РѕСЂРѕС‡РЅС‹Р№ Р·Р°РІРѕРґ', '3', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (10, '15', 'РёР·РіРѕС‚РѕРІРёС‚РµР»СЊ вЂ“ СЃР±РѕСЂРѕС‡РЅС‹Р№ Р·Р°РІРѕРґ', '3', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (11, '20', 'РёР·РіРѕС‚РѕРІРёС‚РµР»СЊ вЂ“ РїРѕСЃС‚Р°РІС‰РёРє СЃР±РѕСЂРѕС‡РЅС‹С… РєРѕРјРїР»РµРєС‚РѕРІ', '3', NULL, NULL);
INSERT INTO vehiclemanufacturertypeclassifier VALUES (12, '20', 'РёР·РіРѕС‚РѕРІРёС‚РµР»СЊ вЂ“ РїРѕСЃС‚Р°РІС‰РёРє СЃР±РѕСЂРѕС‡РЅС‹С… РєРѕРјРїР»РµРєС‚РѕРІ', '3', NULL, NULL);


--
-- TOC entry 4657 (class 0 OID 19287)
-- Dependencies: 351
-- Data for Name: vehiclepassportissuerkindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4659 (class 0 OID 19295)
-- Dependencies: 353
-- Data for Name: vehiclepropellertypesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclepropellertypesclassifier VALUES (1, '05', 'РєРѕР»РµСЃРЅС‹Р№ РґРІРёР¶РёС‚РµР»СЊ', NULL, NULL);
INSERT INTO vehiclepropellertypesclassifier VALUES (2, '10', 'РіСѓСЃРµРЅРёС‡РЅС‹Р№ РґРІРёР¶РёС‚РµР»СЊ', NULL, NULL);
INSERT INTO vehiclepropellertypesclassifier VALUES (3, '15', 'РїРѕР»СѓРіСѓСЃРµРЅРёС‡РЅС‹Р№ РґРІРёР¶РёС‚РµР»СЊ', NULL, NULL);
INSERT INTO vehiclepropellertypesclassifier VALUES (4, '20', 'С€Р°РіР°СЋС‰РёР№ РґРІРёР¶РёС‚РµР»СЊ', NULL, NULL);
INSERT INTO vehiclepropellertypesclassifier VALUES (5, '25', 'С€РЅРµРєРѕСЂРѕС‚РѕСЂРЅС‹Р№ РґРІРёР¶РёС‚РµР»СЊ', NULL, NULL);
INSERT INTO vehiclepropellertypesclassifier VALUES (6, '30', 'РІР°Р»СЊС†РѕРІС‹Р№ РґРІРёР¶РёС‚РµР»СЊ', NULL, NULL);
INSERT INTO vehiclepropellertypesclassifier VALUES (7, '99', 'РїСЂРѕС‡РёРµ С‚РёРїС‹ РґРІРёР¶РёС‚РµР»СЏ', NULL, NULL);


--
-- TOC entry 4661 (class 0 OID 19303)
-- Dependencies: 355
-- Data for Name: vehicleregistrationclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehicleregistrationclassifier VALUES (1, '05', 'РїРѕСЃС‚Р°РЅРѕРІРєР° РЅР° СѓС‡РµС‚', NULL, NULL);
INSERT INTO vehicleregistrationclassifier VALUES (2, '10', 'СЃРЅСЏС‚РёРµ СЃ СѓС‡РµС‚Р° (РїСЂРµРєСЂР°С‰РµРЅРёРµ СЂРµРіРёСЃС‚СЂР°С†РёРё)', NULL, NULL);


--
-- TOC entry 4663 (class 0 OID 19311)
-- Dependencies: 357
-- Data for Name: vehiclesuspensiontypeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehiclesuspensiontypeclassifier VALUES (1, '01', 'РїРµСЂРµРґРЅСЏСЏ', NULL, NULL);
INSERT INTO vehiclesuspensiontypeclassifier VALUES (2, '02', 'Р·Р°РґРЅСЏСЏ', NULL, NULL);


--
-- TOC entry 4665 (class 0 OID 19319)
-- Dependencies: 359
-- Data for Name: vehicletechnicalcertificatetypesclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehicletechnicalcertificatetypesclassifier VALUES (1, '1', 'РїР°СЃРїРѕСЂС‚ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°', 'РїР°СЃРїРѕСЂС‚ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°', NULL, NULL);
INSERT INTO vehicletechnicalcertificatetypesclassifier VALUES (2, '2', 'РїР°СЃРїРѕСЂС‚ С€Р°СЃСЃРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°', 'РїР°СЃРїРѕСЂС‚ С€Р°СЃСЃРё', NULL, NULL);
INSERT INTO vehicletechnicalcertificatetypesclassifier VALUES (3, '3', 'РїР°СЃРїРѕСЂС‚ СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ РёР»Рё РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё', 'РїР°СЃРїРѕСЂС‚ РјР°С€РёРЅС‹', NULL, NULL);


--
-- TOC entry 4667 (class 0 OID 19327)
-- Dependencies: 361
-- Data for Name: vehicleweighttypeclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--

INSERT INTO vehicleweighttypeclassifier VALUES (1, '10', 'РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° (С€Р°СЃСЃРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°) РІ СЃРЅР°СЂСЏР¶РµРЅРЅРѕРј СЃРѕСЃС‚РѕСЏРЅРёРё', 'СЃРЅР°СЂСЏР¶РµРЅРЅР°СЏ РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°', 'РѕРїСЂРµРґРµР»РµРЅРЅР°СЏ РёР·РіРѕС‚РѕРІРёС‚РµР»РµРј РјР°СЃСЃР° РєРѕРјРїР»РµРєС‚РЅРѕРіРѕ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° СЃ РІРѕРґРёС‚РµР»РµРј Р±РµР· РЅР°РіСЂСѓР·РєРё. РњР°СЃСЃР° РІРєР»СЋС‡Р°РµС‚ РЅРµ РјРµРЅРµРµ 90% С‚РѕРїР»РёРІР°', '1', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (2, '10', 'РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° (С€Р°СЃСЃРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°) РІ СЃРЅР°СЂСЏР¶РµРЅРЅРѕРј СЃРѕСЃС‚РѕСЏРЅРёРё', 'СЃРЅР°СЂСЏР¶РµРЅРЅР°СЏ РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°', 'РѕРїСЂРµРґРµР»РµРЅРЅР°СЏ РёР·РіРѕС‚РѕРІРёС‚РµР»РµРј РјР°СЃСЃР° РєРѕРјРїР»РµРєС‚РЅРѕРіРѕ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° СЃ РІРѕРґРёС‚РµР»РµРј Р±РµР· РЅР°РіСЂСѓР·РєРё. РњР°СЃСЃР° РІРєР»СЋС‡Р°РµС‚ РЅРµ РјРµРЅРµРµ 90% С‚РѕРїР»РёРІР°', '2', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (3, '10', 'РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° (С€Р°СЃСЃРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°) РІ СЃРЅР°СЂСЏР¶РµРЅРЅРѕРј СЃРѕСЃС‚РѕСЏРЅРёРё', 'СЃРЅР°СЂСЏР¶РµРЅРЅР°СЏ РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°', 'РѕРїСЂРµРґРµР»РµРЅРЅР°СЏ РёР·РіРѕС‚РѕРІРёС‚РµР»РµРј РјР°СЃСЃР° РєРѕРјРїР»РµРєС‚РЅРѕРіРѕ С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° СЃ РІРѕРґРёС‚РµР»РµРј Р±РµР· РЅР°РіСЂСѓР·РєРё. РњР°СЃСЃР° РІРєР»СЋС‡Р°РµС‚ РЅРµ РјРµРЅРµРµ 90% С‚РѕРїР»РёРІР°', '3', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (4, '12', 'С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° (С€Р°СЃСЃРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°)', 'РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°', 'СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅР°СЏ РёР·РіРѕС‚РѕРІРёС‚РµР»РµРј РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° СЃРѕ СЃРЅР°СЂСЏР¶РµРЅРёРµРј, РїР°СЃСЃР°Р¶РёСЂР°РјРё Рё РіСЂСѓР·РѕРј, РѕР±СѓСЃР»РѕРІР»РµРЅРЅР°СЏ РµРіРѕ РєРѕРЅСЃС‚СЂСѓРєС†РёРµР№ Рё Р·Р°РґР°РЅРЅС‹РјРё С…Р°СЂР°РєС‚РµСЂРёСЃС‚РёРєР°РјРё', '1', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (5, '12', 'С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° (С€Р°СЃСЃРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°)', 'РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°', 'СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅР°СЏ РёР·РіРѕС‚РѕРІРёС‚РµР»РµРј РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° СЃРѕ СЃРЅР°СЂСЏР¶РµРЅРёРµРј, РїР°СЃСЃР°Р¶РёСЂР°РјРё Рё РіСЂСѓР·РѕРј, РѕР±СѓСЃР»РѕРІР»РµРЅРЅР°СЏ РµРіРѕ РєРѕРЅСЃС‚СЂСѓРєС†РёРµР№ Рё Р·Р°РґР°РЅРЅС‹РјРё С…Р°СЂР°РєС‚РµСЂРёСЃС‚РёРєР°РјРё', '2', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (6, '12', 'С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° (С€Р°СЃСЃРё С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°)', 'РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР°', 'СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅР°СЏ РёР·РіРѕС‚РѕРІРёС‚РµР»РµРј РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° С‚СЂР°РЅСЃРїРѕСЂС‚РЅРѕРіРѕ СЃСЂРµРґСЃС‚РІР° СЃРѕ СЃРЅР°СЂСЏР¶РµРЅРёРµРј, РїР°СЃСЃР°Р¶РёСЂР°РјРё Рё РіСЂСѓР·РѕРј, РѕР±СѓСЃР»РѕРІР»РµРЅРЅР°СЏ РµРіРѕ РєРѕРЅСЃС‚СЂСѓРєС†РёРµР№ Рё Р·Р°РґР°РЅРЅС‹РјРё С…Р°СЂР°РєС‚РµСЂРёСЃС‚РёРєР°РјРё', '3', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (7, '14', 'С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° Р°РІС‚РѕРїРѕРµР·РґР°', 'РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°СЃСЃР° Р°РІС‚РѕРїРѕРµР·РґР°', 'СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅР°СЏ РёР·РіРѕС‚РѕРІРёС‚РµР»РµРј РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ СЃСѓРјРјР°СЂРЅР°СЏ РјР°СЃСЃР° С‚СЏРіР°С‡Р° Рё Р±СѓРєСЃРёСЂСѓРµРјРѕРіРѕ РёРј РїРѕР»СѓРїСЂРёС†РµРїР° РёР»Рё РїСЂРёС†РµРїР° (РїСЂРёС†РµРїРѕРІ) СЃРѕ СЃРЅР°СЂСЏР¶РµРЅРёРµРј, РїР°СЃСЃР°Р¶РёСЂР°РјРё Рё РіСЂСѓР·РѕРј', '1', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (8, '14', 'С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° Р°РІС‚РѕРїРѕРµР·РґР°', 'РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°СЃСЃР° Р°РІС‚РѕРїРѕРµР·РґР°', 'СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅР°СЏ РёР·РіРѕС‚РѕРІРёС‚РµР»РµРј РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ СЃСѓРјРјР°СЂРЅР°СЏ РјР°СЃСЃР° С‚СЏРіР°С‡Р° Рё Р±СѓРєСЃРёСЂСѓРµРјРѕРіРѕ РёРј РїРѕР»СѓРїСЂРёС†РµРїР° РёР»Рё РїСЂРёС†РµРїР° (РїСЂРёС†РµРїРѕРІ) СЃРѕ СЃРЅР°СЂСЏР¶РµРЅРёРµРј, РїР°СЃСЃР°Р¶РёСЂР°РјРё Рё РіСЂСѓР·РѕРј', '2', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (9, '14', 'С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ РјР°СЃСЃР° Р°РІС‚РѕРїРѕРµР·РґР°', 'РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°СЃСЃР° Р°РІС‚РѕРїРѕРµР·РґР°', 'СѓСЃС‚Р°РЅРѕРІР»РµРЅРЅР°СЏ РёР·РіРѕС‚РѕРІРёС‚РµР»РµРј РјР°РєСЃРёРјР°Р»СЊРЅР°СЏ СЃСѓРјРјР°СЂРЅР°СЏ РјР°СЃСЃР° С‚СЏРіР°С‡Р° Рё Р±СѓРєСЃРёСЂСѓРµРјРѕРіРѕ РёРј РїРѕР»СѓРїСЂРёС†РµРїР° РёР»Рё РїСЂРёС†РµРїР° (РїСЂРёС†РµРїРѕРІ) СЃРѕ СЃРЅР°СЂСЏР¶РµРЅРёРµРј, РїР°СЃСЃР°Р¶РёСЂР°РјРё Рё РіСЂСѓР·РѕРј', '3', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (10, '20', 'С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РѕР±С‰Р°СЏ РјР°СЃСЃР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё) Рё РїСЂРёС†РµРїР°', 'РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°СЃСЃР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹', 'С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РѕР±С‰Р°СЏ РјР°СЃСЃР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё) Рё РїСЂРёС†РµРїР° (РєРі)', '1', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (11, '20', 'С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РѕР±С‰Р°СЏ РјР°СЃСЃР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё) Рё РїСЂРёС†РµРїР°', 'РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°СЃСЃР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹', 'С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РѕР±С‰Р°СЏ РјР°СЃСЃР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё) Рё РїСЂРёС†РµРїР° (РєРі)', '2', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (12, '20', 'С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РѕР±С‰Р°СЏ РјР°СЃСЃР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё) Рё РїСЂРёС†РµРїР°', 'РґРѕРїСѓСЃС‚РёРјР°СЏ РјР°СЃСЃР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹', 'С‚РµС…РЅРёС‡РµСЃРєРё РґРѕРїСѓСЃС‚РёРјР°СЏ РѕР±С‰Р°СЏ РјР°СЃСЃР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё) Рё РїСЂРёС†РµРїР° (РєРі)', '3', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (13, '22', 'РїРѕР»РµР·РЅР°СЏ РЅР°РіСЂСѓР·РєР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё)', 'РїРѕР»РµР·РЅР°СЏ РЅР°РіСЂСѓР·РєР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё)', 'РїРѕР»РµР·РЅР°СЏ РЅР°РіСЂСѓР·РєР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё) (РєРі)', '1', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (14, '22', 'РїРѕР»РµР·РЅР°СЏ РЅР°РіСЂСѓР·РєР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё)', 'РїРѕР»РµР·РЅР°СЏ РЅР°РіСЂСѓР·РєР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё)', 'РїРѕР»РµР·РЅР°СЏ РЅР°РіСЂСѓР·РєР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё) (РєРі)', '2', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (15, '22', 'РїРѕР»РµР·РЅР°СЏ РЅР°РіСЂСѓР·РєР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё)', 'РїРѕР»РµР·РЅР°СЏ РЅР°РіСЂСѓР·РєР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё)', 'РїРѕР»РµР·РЅР°СЏ РЅР°РіСЂСѓР·РєР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё) (РєРі)', '3', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (16, '24', 'СЃРЅР°СЂСЏР¶РµРЅРЅР°СЏ (СЌРєСЃРїР»СѓР°С‚Р°С†РёРѕРЅРЅР°СЏ) РјР°СЃСЃР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё)', 'СЃРЅР°СЂСЏР¶РµРЅРЅР°СЏ РјР°СЃСЃР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё)', 'РјР°СЃСЃР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё) РІ СЂР°Р±РѕС‡РµРј СЃРѕСЃС‚РѕСЏРЅРёРё (РєРі), РІРєР»СЋС‡Р°СЏ СѓСЃС‚СЂРѕР№СЃС‚РІРѕ Р·Р°С‰РёС‚С‹ РїСЂРё РѕРїСЂРѕРєРёРґС‹РІР°РЅРёРё, РѕС…Р»Р°Р¶РґР°СЋС‰СѓСЋ Р¶РёРґРєРѕСЃС‚СЊ, СЃРјР°Р·РѕС‡РЅС‹Рµ РјР°С‚РµСЂРёР°Р»С‹, С‚РѕРїР»РёРІРѕ (Р±Р°Рє, РЅР°РїРѕР»РЅРµРЅРЅС‹Р№ РЅРµ РјРµРЅРµРµ С‡РµРј РЅР° 90 % РЅРѕРјРёРЅР°Р»СЊРЅРѕР№ РІРјРµСЃС‚РёРјРѕСЃС‚Рё), РёРЅСЃС‚СЂСѓРјРµРЅС‚С‹ Рё РѕРїРµСЂР°С‚РѕСЂР°', '1', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (17, '24', 'СЃРЅР°СЂСЏР¶РµРЅРЅР°СЏ (СЌРєСЃРїР»СѓР°С‚Р°С†РёРѕРЅРЅР°СЏ) РјР°СЃСЃР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё)', 'СЃРЅР°СЂСЏР¶РµРЅРЅР°СЏ РјР°СЃСЃР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё)', 'РјР°СЃСЃР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё) РІ СЂР°Р±РѕС‡РµРј СЃРѕСЃС‚РѕСЏРЅРёРё (РєРі), РІРєР»СЋС‡Р°СЏ СѓСЃС‚СЂРѕР№СЃС‚РІРѕ Р·Р°С‰РёС‚С‹ РїСЂРё РѕРїСЂРѕРєРёРґС‹РІР°РЅРёРё, РѕС…Р»Р°Р¶РґР°СЋС‰СѓСЋ Р¶РёРґРєРѕСЃС‚СЊ, СЃРјР°Р·РѕС‡РЅС‹Рµ РјР°С‚РµСЂРёР°Р»С‹, С‚РѕРїР»РёРІРѕ (Р±Р°Рє, РЅР°РїРѕР»РЅРµРЅРЅС‹Р№ РЅРµ РјРµРЅРµРµ С‡РµРј РЅР° 90 % РЅРѕРјРёРЅР°Р»СЊРЅРѕР№ РІРјРµСЃС‚РёРјРѕСЃС‚Рё), РёРЅСЃС‚СЂСѓРјРµРЅС‚С‹ Рё РѕРїРµСЂР°С‚РѕСЂР°', '2', NULL, NULL);
INSERT INTO vehicleweighttypeclassifier VALUES (18, '24', 'СЃРЅР°СЂСЏР¶РµРЅРЅР°СЏ (СЌРєСЃРїР»СѓР°С‚Р°С†РёРѕРЅРЅР°СЏ) РјР°СЃСЃР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё)', 'СЃРЅР°СЂСЏР¶РµРЅРЅР°СЏ РјР°СЃСЃР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё)', 'РјР°СЃСЃР° СЃР°РјРѕС…РѕРґРЅРѕР№ РјР°С€РёРЅС‹ (РґСЂСѓРіРѕРіРѕ РІРёРґР° С‚РµС…РЅРёРєРё) РІ СЂР°Р±РѕС‡РµРј СЃРѕСЃС‚РѕСЏРЅРёРё (РєРі), РІРєР»СЋС‡Р°СЏ СѓСЃС‚СЂРѕР№СЃС‚РІРѕ Р·Р°С‰РёС‚С‹ РїСЂРё РѕРїСЂРѕРєРёРґС‹РІР°РЅРёРё, РѕС…Р»Р°Р¶РґР°СЋС‰СѓСЋ Р¶РёРґРєРѕСЃС‚СЊ, СЃРјР°Р·РѕС‡РЅС‹Рµ РјР°С‚РµСЂРёР°Р»С‹, С‚РѕРїР»РёРІРѕ (Р±Р°Рє, РЅР°РїРѕР»РЅРµРЅРЅС‹Р№ РЅРµ РјРµРЅРµРµ С‡РµРј РЅР° 90 % РЅРѕРјРёРЅР°Р»СЊРЅРѕР№ РІРјРµСЃС‚РёРјРѕСЃС‚Рё), РёРЅСЃС‚СЂСѓРјРµРЅС‚С‹ Рё РѕРїРµСЂР°С‚РѕСЂР°', '3', NULL, NULL);


--
-- TOC entry 4669 (class 0 OID 19335)
-- Dependencies: 363
-- Data for Name: waypointkindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4671 (class 0 OID 19343)
-- Dependencies: 365
-- Data for Name: workinghourskindclassifier; Type: TABLE DATA; Schema: classifiers; Owner: postgres
--



--
-- TOC entry 4762 (class 0 OID 0)
-- Dependencies: 198
-- Name: accreditationcertificatestatusclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('accreditationcertificatestatusclassifier_id_seq', 33, true);


--
-- TOC entry 4763 (class 0 OID 0)
-- Dependencies: 200
-- Name: additionalparamsforcustomsfeesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('additionalparamsforcustomsfeesclassifier_id_seq', 26, true);


--
-- TOC entry 4764 (class 0 OID 0)
-- Dependencies: 202
-- Name: addresskindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('addresskindclassifier_id_seq', 3, true);


--
-- TOC entry 4765 (class 0 OID 0)
-- Dependencies: 204
-- Name: bankidentitykindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('bankidentitykindclassifier_id_seq', 1, false);


--
-- TOC entry 4766 (class 0 OID 0)
-- Dependencies: 206
-- Name: biologicalsexclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('biologicalsexclassifier_id_seq', 1, false);


--
-- TOC entry 4767 (class 0 OID 0)
-- Dependencies: 208
-- Name: brakingsystemtypeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('brakingsystemtypeclassifier_id_seq', 10, true);


--
-- TOC entry 4768 (class 0 OID 0)
-- Dependencies: 210
-- Name: businessentitytypeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('businessentitytypeclassifier_id_seq', 113, true);


--
-- TOC entry 4769 (class 0 OID 0)
-- Dependencies: 212
-- Name: businessentitytypecodeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('businessentitytypecodeclassifier_id_seq', 113, true);


--
-- TOC entry 4770 (class 0 OID 0)
-- Dependencies: 214
-- Name: cargolocationclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('cargolocationclassifier_id_seq', 16, true);


--
-- TOC entry 4771 (class 0 OID 0)
-- Dependencies: 216
-- Name: cargopackagekindsclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('cargopackagekindsclassifier_id_seq', 364, true);


--
-- TOC entry 4772 (class 0 OID 0)
-- Dependencies: 218
-- Name: certificatioorganizationkindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('certificatioorganizationkindclassifier_id_seq', 1, false);


--
-- TOC entry 4773 (class 0 OID 0)
-- Dependencies: 220
-- Name: communicationchannelclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('communicationchannelclassifier_id_seq', 6, true);


--
-- TOC entry 4774 (class 0 OID 0)
-- Dependencies: 222
-- Name: conformityassessmentdocstypesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('conformityassessmentdocstypesclassifier_id_seq', 10, true);


--
-- TOC entry 4775 (class 0 OID 0)
-- Dependencies: 224
-- Name: countriesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('countriesclassifier_id_seq', 249, true);


--
-- TOC entry 4776 (class 0 OID 0)
-- Dependencies: 226
-- Name: currencyclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('currencyclassifier_id_seq', 162, true);


--
-- TOC entry 4777 (class 0 OID 0)
-- Dependencies: 228
-- Name: customcheckpointcctvplacementclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customcheckpointcctvplacementclassifier_id_seq', 1, false);


--
-- TOC entry 4778 (class 0 OID 0)
-- Dependencies: 230
-- Name: customcheckpointcommchannelclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customcheckpointcommchannelclassifier_id_seq', 4, true);


--
-- TOC entry 4779 (class 0 OID 0)
-- Dependencies: 232
-- Name: customprocesskindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customprocesskindclassifier_id_seq', 18, true);


--
-- TOC entry 4780 (class 0 OID 0)
-- Dependencies: 234
-- Name: customsconclusionsclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customsconclusionsclassifier_id_seq', 8, true);


--
-- TOC entry 4781 (class 0 OID 0)
-- Dependencies: 236
-- Name: customsfeesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customsfeesclassifier_id_seq', 283, true);


--
-- TOC entry 4782 (class 0 OID 0)
-- Dependencies: 238
-- Name: customsfeesclassifierchapters_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customsfeesclassifierchapters_id_seq', 55, true);


--
-- TOC entry 4783 (class 0 OID 0)
-- Dependencies: 240
-- Name: customsfeesfeaturesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customsfeesfeaturesclassifier_id_seq', 11, true);


--
-- TOC entry 4784 (class 0 OID 0)
-- Dependencies: 242
-- Name: customsfeesguaranteemethodsclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customsfeesguaranteemethodsclassifier_id_seq', 1, false);


--
-- TOC entry 4785 (class 0 OID 0)
-- Dependencies: 244
-- Name: customsfeesmethodsclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customsfeesmethodsclassifier_id_seq', 10, true);


--
-- TOC entry 4786 (class 0 OID 0)
-- Dependencies: 246
-- Name: customstransitmovementofgoodsclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customstransitmovementofgoodsclassifier_id_seq', 5, true);


--
-- TOC entry 4787 (class 0 OID 0)
-- Dependencies: 248
-- Name: customsvalueconclusionclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('customsvalueconclusionclassifier_id_seq', 3, true);


--
-- TOC entry 4788 (class 0 OID 0)
-- Dependencies: 250
-- Name: dataformatclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('dataformatclassifier_id_seq', 1, false);


--
-- TOC entry 4789 (class 0 OID 0)
-- Dependencies: 252
-- Name: declarationofgoodsfeaturesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('declarationofgoodsfeaturesclassifier_id_seq', 14, true);


--
-- TOC entry 4790 (class 0 OID 0)
-- Dependencies: 254
-- Name: definingcustomsvaluemethodsclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('definingcustomsvaluemethodsclassifier_id_seq', 7, true);


--
-- TOC entry 4791 (class 0 OID 0)
-- Dependencies: 256
-- Name: docstatstatusclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('docstatstatusclassifier_id_seq', 1, false);


--
-- TOC entry 4792 (class 0 OID 0)
-- Dependencies: 258
-- Name: documentprocessingresultcodeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('documentprocessingresultcodeclassifier_id_seq', 8, true);


--
-- TOC entry 4793 (class 0 OID 0)
-- Dependencies: 260
-- Name: electronicvehicleandchassiscertificatestatusclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('electronicvehicleandchassiscertificatestatusclassifier_id_seq', 5, true);


--
-- TOC entry 4794 (class 0 OID 0)
-- Dependencies: 262
-- Name: exemptionsfromcustomsdutychapters_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('exemptionsfromcustomsdutychapters_id_seq', 72, true);


--
-- TOC entry 4795 (class 0 OID 0)
-- Dependencies: 264
-- Name: exemptionsfromcustomsdutyclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('exemptionsfromcustomsdutyclassifier_id_seq', 333, true);


--
-- TOC entry 4796 (class 0 OID 0)
-- Dependencies: 266
-- Name: featureofmovementofgoodsclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('featureofmovementofgoodsclassifier_id_seq', 1, false);


--
-- TOC entry 4797 (class 0 OID 0)
-- Dependencies: 268
-- Name: govcontrolsystemandtechresourceskindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('govcontrolsystemandtechresourceskindclassifier_id_seq', 1, false);


--
-- TOC entry 4798 (class 0 OID 0)
-- Dependencies: 270
-- Name: govcontrolsystemkindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('govcontrolsystemkindclassifier_id_seq', 1, false);


--
-- TOC entry 4799 (class 0 OID 0)
-- Dependencies: 272
-- Name: govsupportsystemkindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('govsupportsystemkindclassifier_id_seq', 1, false);


--
-- TOC entry 4800 (class 0 OID 0)
-- Dependencies: 274
-- Name: incidentassessmentcodeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('incidentassessmentcodeclassifier_id_seq', 101, true);


--
-- TOC entry 4801 (class 0 OID 0)
-- Dependencies: 276
-- Name: institutionaleconomysectorclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('institutionaleconomysectorclassifier_id_seq', 123, true);


--
-- TOC entry 4802 (class 0 OID 0)
-- Dependencies: 278
-- Name: internatioanltransporttypesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('internatioanltransporttypesclassifier_id_seq', 41, true);


--
-- TOC entry 4803 (class 0 OID 0)
-- Dependencies: 280
-- Name: issuersellerclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('issuersellerclassifier_id_seq', 3, true);


--
-- TOC entry 4804 (class 0 OID 0)
-- Dependencies: 282
-- Name: kindidclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('kindidclassifier_id_seq', 7, true);


--
-- TOC entry 4805 (class 0 OID 0)
-- Dependencies: 284
-- Name: kindofdocumentsforcustomsdeclarationchapters_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('kindofdocumentsforcustomsdeclarationchapters_id_seq', 9, true);


--
-- TOC entry 4806 (class 0 OID 0)
-- Dependencies: 286
-- Name: kindofdocumentsforcustomsdeclarationclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('kindofdocumentsforcustomsdeclarationclassifier_id_seq', 204, true);


--
-- TOC entry 4807 (class 0 OID 0)
-- Dependencies: 288
-- Name: kindoftransportandtransportationgoodsclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('kindoftransportandtransportationgoodsclassifier_id_seq', 12, true);


--
-- TOC entry 4808 (class 0 OID 0)
-- Dependencies: 290
-- Name: languagecodeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('languagecodeclassifier_id_seq', 174, true);


--
-- TOC entry 4809 (class 0 OID 0)
-- Dependencies: 292
-- Name: measurementunitclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('measurementunitclassifier_id_seq', 26, true);


--
-- TOC entry 4810 (class 0 OID 0)
-- Dependencies: 294
-- Name: measurementunitcodeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('measurementunitcodeclassifier_id_seq', 15, true);


--
-- TOC entry 4811 (class 0 OID 0)
-- Dependencies: 296
-- Name: measuresensurecompliancecustomstransitprocedure_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('measuresensurecompliancecustomstransitprocedure_id_seq', 23, true);


--
-- TOC entry 4812 (class 0 OID 0)
-- Dependencies: 298
-- Name: nsicountry_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('nsicountry_id_seq', 252, true);


--
-- TOC entry 4813 (class 0 OID 0)
-- Dependencies: 300
-- Name: objectpassedcustomcheckpointclssifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('objectpassedcustomcheckpointclssifier_id_seq', 1, false);


--
-- TOC entry 4814 (class 0 OID 0)
-- Dependencies: 302
-- Name: pharmaprodconsignmentlimitkindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('pharmaprodconsignmentlimitkindclassifier_id_seq', 1, false);


--
-- TOC entry 4815 (class 0 OID 0)
-- Dependencies: 304
-- Name: pharmaproductregistrationdocelementkindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('pharmaproductregistrationdocelementkindclassifier_id_seq', 1, false);


--
-- TOC entry 4816 (class 0 OID 0)
-- Dependencies: 306
-- Name: registrationproductdoccodeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('registrationproductdoccodeclassifier_id_seq', 28, true);


--
-- TOC entry 4817 (class 0 OID 0)
-- Dependencies: 308
-- Name: registrationproductfilecodeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('registrationproductfilecodeclassifier_id_seq', 15, true);


--
-- TOC entry 4818 (class 0 OID 0)
-- Dependencies: 310
-- Name: specialsimplificationtypeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('specialsimplificationtypeclassifier_id_seq', 4, true);


--
-- TOC entry 4819 (class 0 OID 0)
-- Dependencies: 312
-- Name: steeringwheelpositionclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('steeringwheelpositionclassifier_id_seq', 9, true);


--
-- TOC entry 4820 (class 0 OID 0)
-- Dependencies: 314
-- Name: subjectsoflawclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('subjectsoflawclassifier_id_seq', 5, true);


--
-- TOC entry 4821 (class 0 OID 0)
-- Dependencies: 316
-- Name: technicalobjectkindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('technicalobjectkindclassifier_id_seq', 1, false);


--
-- TOC entry 4822 (class 0 OID 0)
-- Dependencies: 318
-- Name: termsofdeliveryclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('termsofdeliveryclassifier_id_seq', 16, true);


--
-- TOC entry 4823 (class 0 OID 0)
-- Dependencies: 320
-- Name: transactiontypeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('transactiontypeclassifier_id_seq', 11, true);


--
-- TOC entry 4824 (class 0 OID 0)
-- Dependencies: 322
-- Name: transportandfreightmodesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('transportandfreightmodesclassifier_id_seq', 12, true);


--
-- TOC entry 4825 (class 0 OID 0)
-- Dependencies: 324
-- Name: userkindtimeadvincidentclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('userkindtimeadvincidentclassifier_id_seq', 3, true);


--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 326
-- Name: vehiclebodycolorclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclebodycolorclassifier_id_seq', 10, true);


--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 328
-- Name: vehiclebrandsclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclebrandsclassifier_id_seq', 743, true);


--
-- TOC entry 4828 (class 0 OID 0)
-- Dependencies: 330
-- Name: vehiclecategorypereaeutechnicalregulationsclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclecategorypereaeutechnicalregulationsclassifier_id_seq', 73, true);


--
-- TOC entry 4829 (class 0 OID 0)
-- Dependencies: 332
-- Name: vehiclecategoryperviennaconventiononroadtrafficclassifie_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclecategoryperviennaconventiononroadtrafficclassifie_id_seq', 9, true);


--
-- TOC entry 4830 (class 0 OID 0)
-- Dependencies: 334
-- Name: vehiclecatperelectrontechcertificateregistrationrulescla_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclecatperelectrontechcertificateregistrationrulescla_id_seq', 10, true);


--
-- TOC entry 4831 (class 0 OID 0)
-- Dependencies: 336
-- Name: vehiclechassisclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclechassisclassifier_id_seq', 9, true);


--
-- TOC entry 4832 (class 0 OID 0)
-- Dependencies: 338
-- Name: vehiclecomponentschassistypesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclecomponentschassistypesclassifier_id_seq', 10, true);


--
-- TOC entry 4833 (class 0 OID 0)
-- Dependencies: 340
-- Name: vehicleelectricmachinetypeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehicleelectricmachinetypeclassifier_id_seq', 12, true);


--
-- TOC entry 4834 (class 0 OID 0)
-- Dependencies: 342
-- Name: vehicleelectroniccertificateissuecauseclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehicleelectroniccertificateissuecauseclassifier_id_seq', 4, true);


--
-- TOC entry 4835 (class 0 OID 0)
-- Dependencies: 344
-- Name: vehicleelectroniccertificateissuecausewodocumentationsub_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehicleelectroniccertificateissuecausewodocumentationsub_id_seq', 5, true);


--
-- TOC entry 4836 (class 0 OID 0)
-- Dependencies: 346
-- Name: vehicleenvironmentalclassclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehicleenvironmentalclassclassifier_id_seq', 7, true);


--
-- TOC entry 4837 (class 0 OID 0)
-- Dependencies: 348
-- Name: vehiclefueltypesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclefueltypesclassifier_id_seq', 7, true);


--
-- TOC entry 4838 (class 0 OID 0)
-- Dependencies: 350
-- Name: vehiclemanufacturertypeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclemanufacturertypeclassifier_id_seq', 12, true);


--
-- TOC entry 4839 (class 0 OID 0)
-- Dependencies: 352
-- Name: vehiclepassportissuerkindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclepassportissuerkindclassifier_id_seq', 1, false);


--
-- TOC entry 4840 (class 0 OID 0)
-- Dependencies: 354
-- Name: vehiclepropellertypesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclepropellertypesclassifier_id_seq', 7, true);


--
-- TOC entry 4841 (class 0 OID 0)
-- Dependencies: 356
-- Name: vehicleregistrationclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehicleregistrationclassifier_id_seq', 2, true);


--
-- TOC entry 4842 (class 0 OID 0)
-- Dependencies: 358
-- Name: vehiclesuspensiontypeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehiclesuspensiontypeclassifier_id_seq', 2, true);


--
-- TOC entry 4843 (class 0 OID 0)
-- Dependencies: 360
-- Name: vehicletechnicalcertificatetypesclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehicletechnicalcertificatetypesclassifier_id_seq', 3, true);


--
-- TOC entry 4844 (class 0 OID 0)
-- Dependencies: 362
-- Name: vehicleweighttypeclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('vehicleweighttypeclassifier_id_seq', 18, true);


--
-- TOC entry 4845 (class 0 OID 0)
-- Dependencies: 364
-- Name: waypointkindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('waypointkindclassifier_id_seq', 1, false);


--
-- TOC entry 4846 (class 0 OID 0)
-- Dependencies: 366
-- Name: workinghourskindclassifier_id_seq; Type: SEQUENCE SET; Schema: classifiers; Owner: postgres
--

SELECT pg_catalog.setval('workinghourskindclassifier_id_seq', 1, false);


--
-- TOC entry 4213 (class 2606 OID 19437)
-- Name: accreditationcertificatestatusclassifier accreditationcertificatestatusclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY accreditationcertificatestatusclassifier
    ADD CONSTRAINT accreditationcertificatestatusclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4215 (class 2606 OID 19439)
-- Name: additionalparamsforcustomsfeesclassifier additionalparamsforcustomsfeesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY additionalparamsforcustomsfeesclassifier
    ADD CONSTRAINT additionalparamsforcustomsfeesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4217 (class 2606 OID 19441)
-- Name: addresskindclassifier addresskindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY addresskindclassifier
    ADD CONSTRAINT addresskindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4219 (class 2606 OID 19443)
-- Name: bankidentitykindclassifier bankidentitykindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY bankidentitykindclassifier
    ADD CONSTRAINT bankidentitykindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4221 (class 2606 OID 19445)
-- Name: biologicalsexclassifier biologicalsexclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY biologicalsexclassifier
    ADD CONSTRAINT biologicalsexclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4223 (class 2606 OID 19447)
-- Name: brakingsystemtypeclassifier brakingsystemtypeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY brakingsystemtypeclassifier
    ADD CONSTRAINT brakingsystemtypeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4225 (class 2606 OID 19449)
-- Name: businessentitytypeclassifier businessentitytypeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY businessentitytypeclassifier
    ADD CONSTRAINT businessentitytypeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4227 (class 2606 OID 19451)
-- Name: businessentitytypecodeclassifier businessentitytypecodeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY businessentitytypecodeclassifier
    ADD CONSTRAINT businessentitytypecodeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4229 (class 2606 OID 19453)
-- Name: cargolocationclassifier cargolocationclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY cargolocationclassifier
    ADD CONSTRAINT cargolocationclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4231 (class 2606 OID 19455)
-- Name: cargopackagekindsclassifier cargopackagekindsclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY cargopackagekindsclassifier
    ADD CONSTRAINT cargopackagekindsclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4233 (class 2606 OID 19457)
-- Name: certificatioorganizationkindclassifier certificatioorganizationkindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY certificatioorganizationkindclassifier
    ADD CONSTRAINT certificatioorganizationkindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4235 (class 2606 OID 19459)
-- Name: communicationchannelclassifier communicationchannelclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY communicationchannelclassifier
    ADD CONSTRAINT communicationchannelclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4237 (class 2606 OID 19461)
-- Name: conformityassessmentdocstypesclassifier conformityassessmentdocstypesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY conformityassessmentdocstypesclassifier
    ADD CONSTRAINT conformityassessmentdocstypesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4239 (class 2606 OID 19463)
-- Name: countriesclassifier countriesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY countriesclassifier
    ADD CONSTRAINT countriesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4241 (class 2606 OID 19465)
-- Name: currencyclassifier currencyclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY currencyclassifier
    ADD CONSTRAINT currencyclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4243 (class 2606 OID 19467)
-- Name: customcheckpointcctvplacementclassifier customcheckpointcctvplacementclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customcheckpointcctvplacementclassifier
    ADD CONSTRAINT customcheckpointcctvplacementclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4245 (class 2606 OID 19469)
-- Name: customcheckpointcommchannelclassifier customcheckpointcommchannelclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customcheckpointcommchannelclassifier
    ADD CONSTRAINT customcheckpointcommchannelclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4247 (class 2606 OID 19471)
-- Name: customprocesskindclassifier customprocesskindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customprocesskindclassifier
    ADD CONSTRAINT customprocesskindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4249 (class 2606 OID 19473)
-- Name: customsconclusionsclassifier customsconclusionsclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsconclusionsclassifier
    ADD CONSTRAINT customsconclusionsclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4251 (class 2606 OID 19475)
-- Name: customsfeesclassifier customsfeesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsfeesclassifier
    ADD CONSTRAINT customsfeesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4253 (class 2606 OID 19477)
-- Name: customsfeesclassifierchapters customsfeesclassifierchapters_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsfeesclassifierchapters
    ADD CONSTRAINT customsfeesclassifierchapters_pkey PRIMARY KEY (id);


--
-- TOC entry 4255 (class 2606 OID 19479)
-- Name: customsfeesfeaturesclassifier customsfeesfeaturesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsfeesfeaturesclassifier
    ADD CONSTRAINT customsfeesfeaturesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4257 (class 2606 OID 19481)
-- Name: customsfeesguaranteemethodsclassifier customsfeesguaranteemethodsclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsfeesguaranteemethodsclassifier
    ADD CONSTRAINT customsfeesguaranteemethodsclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4259 (class 2606 OID 19483)
-- Name: customsfeesmethodsclassifier customsfeesmethodsclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsfeesmethodsclassifier
    ADD CONSTRAINT customsfeesmethodsclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4261 (class 2606 OID 19485)
-- Name: customstransitmovementofgoodsclassifier customstransitmovementofgoodsclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customstransitmovementofgoodsclassifier
    ADD CONSTRAINT customstransitmovementofgoodsclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4263 (class 2606 OID 19487)
-- Name: customsvalueconclusionclassifier customsvalueconclusionclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY customsvalueconclusionclassifier
    ADD CONSTRAINT customsvalueconclusionclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4265 (class 2606 OID 19489)
-- Name: dataformatclassifier dataformatclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY dataformatclassifier
    ADD CONSTRAINT dataformatclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4267 (class 2606 OID 19491)
-- Name: declarationofgoodsfeaturesclassifier declarationofgoodsfeaturesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY declarationofgoodsfeaturesclassifier
    ADD CONSTRAINT declarationofgoodsfeaturesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4269 (class 2606 OID 19493)
-- Name: definingcustomsvaluemethodsclassifier definingcustomsvaluemethodsclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY definingcustomsvaluemethodsclassifier
    ADD CONSTRAINT definingcustomsvaluemethodsclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4271 (class 2606 OID 19495)
-- Name: docstatstatusclassifier docstatstatusclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY docstatstatusclassifier
    ADD CONSTRAINT docstatstatusclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4273 (class 2606 OID 19497)
-- Name: documentprocessingresultcodeclassifier documentprocessingresultcodeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY documentprocessingresultcodeclassifier
    ADD CONSTRAINT documentprocessingresultcodeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4275 (class 2606 OID 19499)
-- Name: electronicvehicleandchassiscertificatestatusclassifier electronicvehicleandchassiscertificatestatusclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY electronicvehicleandchassiscertificatestatusclassifier
    ADD CONSTRAINT electronicvehicleandchassiscertificatestatusclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4277 (class 2606 OID 19501)
-- Name: exemptionsfromcustomsdutychapters exemptionsfromcustomsdutychapters_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY exemptionsfromcustomsdutychapters
    ADD CONSTRAINT exemptionsfromcustomsdutychapters_pkey PRIMARY KEY (id);


--
-- TOC entry 4279 (class 2606 OID 19503)
-- Name: exemptionsfromcustomsdutyclassifier exemptionsfromcustomsdutyclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY exemptionsfromcustomsdutyclassifier
    ADD CONSTRAINT exemptionsfromcustomsdutyclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4281 (class 2606 OID 19505)
-- Name: featureofmovementofgoodsclassifier featureofmovementofgoodsclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY featureofmovementofgoodsclassifier
    ADD CONSTRAINT featureofmovementofgoodsclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4283 (class 2606 OID 19507)
-- Name: govcontrolsystemandtechresourceskindclassifier govcontrolsystemandtechresourceskindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY govcontrolsystemandtechresourceskindclassifier
    ADD CONSTRAINT govcontrolsystemandtechresourceskindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4285 (class 2606 OID 19509)
-- Name: govcontrolsystemkindclassifier govcontrolsystemkindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY govcontrolsystemkindclassifier
    ADD CONSTRAINT govcontrolsystemkindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4287 (class 2606 OID 19511)
-- Name: govsupportsystemkindclassifier govsupportsystemkindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY govsupportsystemkindclassifier
    ADD CONSTRAINT govsupportsystemkindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4289 (class 2606 OID 19513)
-- Name: incidentassessmentcodeclassifier incidentassessmentcodeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY incidentassessmentcodeclassifier
    ADD CONSTRAINT incidentassessmentcodeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4291 (class 2606 OID 19515)
-- Name: institutionaleconomysectorclassifier institutionaleconomysectorclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY institutionaleconomysectorclassifier
    ADD CONSTRAINT institutionaleconomysectorclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4293 (class 2606 OID 19517)
-- Name: internatioanltransporttypesclassifier internatioanltransporttypesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY internatioanltransporttypesclassifier
    ADD CONSTRAINT internatioanltransporttypesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4295 (class 2606 OID 19519)
-- Name: issuersellerclassifier issuersellerclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY issuersellerclassifier
    ADD CONSTRAINT issuersellerclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4297 (class 2606 OID 19521)
-- Name: kindidclassifier kindidclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY kindidclassifier
    ADD CONSTRAINT kindidclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4299 (class 2606 OID 19523)
-- Name: kindofdocumentsforcustomsdeclarationchapters kindofdocumentsforcustomsdeclarationchapters_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY kindofdocumentsforcustomsdeclarationchapters
    ADD CONSTRAINT kindofdocumentsforcustomsdeclarationchapters_pkey PRIMARY KEY (id);


--
-- TOC entry 4301 (class 2606 OID 19525)
-- Name: kindofdocumentsforcustomsdeclarationclassifier kindofdocumentsforcustomsdeclarationclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY kindofdocumentsforcustomsdeclarationclassifier
    ADD CONSTRAINT kindofdocumentsforcustomsdeclarationclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4303 (class 2606 OID 19527)
-- Name: kindoftransportandtransportationgoodsclassifier kindoftransportandtransportationgoodsclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY kindoftransportandtransportationgoodsclassifier
    ADD CONSTRAINT kindoftransportandtransportationgoodsclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4305 (class 2606 OID 19529)
-- Name: languagecodeclassifier languagecodeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY languagecodeclassifier
    ADD CONSTRAINT languagecodeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4307 (class 2606 OID 19531)
-- Name: measurementunitclassifier measurementunitclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY measurementunitclassifier
    ADD CONSTRAINT measurementunitclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4309 (class 2606 OID 19533)
-- Name: measurementunitcodeclassifier measurementunitcodeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY measurementunitcodeclassifier
    ADD CONSTRAINT measurementunitcodeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4311 (class 2606 OID 19535)
-- Name: measuresensurecompliancecustomstransitprocedure measuresensurecompliancecustomstransitprocedure_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY measuresensurecompliancecustomstransitprocedure
    ADD CONSTRAINT measuresensurecompliancecustomstransitprocedure_pkey PRIMARY KEY (id);


--
-- TOC entry 4313 (class 2606 OID 19537)
-- Name: nsicountry nsicountry_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY nsicountry
    ADD CONSTRAINT nsicountry_pkey PRIMARY KEY (id);


--
-- TOC entry 4315 (class 2606 OID 19539)
-- Name: objectpassedcustomcheckpointclssifier objectpassedcustomcheckpointclssifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY objectpassedcustomcheckpointclssifier
    ADD CONSTRAINT objectpassedcustomcheckpointclssifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4317 (class 2606 OID 19541)
-- Name: pharmaprodconsignmentlimitkindclassifier pharmaprodconsignmentlimitkindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY pharmaprodconsignmentlimitkindclassifier
    ADD CONSTRAINT pharmaprodconsignmentlimitkindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4319 (class 2606 OID 19543)
-- Name: pharmaproductregistrationdocelementkindclassifier pharmaproductregistrationdocelementkindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY pharmaproductregistrationdocelementkindclassifier
    ADD CONSTRAINT pharmaproductregistrationdocelementkindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4321 (class 2606 OID 19545)
-- Name: registrationproductdoccodeclassifier registrationproductdoccodeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY registrationproductdoccodeclassifier
    ADD CONSTRAINT registrationproductdoccodeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4323 (class 2606 OID 19547)
-- Name: registrationproductfilecodeclassifier registrationproductfilecodeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY registrationproductfilecodeclassifier
    ADD CONSTRAINT registrationproductfilecodeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4325 (class 2606 OID 19549)
-- Name: specialsimplificationtypeclassifier specialsimplificationtypeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY specialsimplificationtypeclassifier
    ADD CONSTRAINT specialsimplificationtypeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4327 (class 2606 OID 19551)
-- Name: steeringwheelpositionclassifier steeringwheelpositionclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY steeringwheelpositionclassifier
    ADD CONSTRAINT steeringwheelpositionclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4329 (class 2606 OID 19553)
-- Name: subjectsoflawclassifier subjectsoflawclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY subjectsoflawclassifier
    ADD CONSTRAINT subjectsoflawclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4331 (class 2606 OID 19555)
-- Name: technicalobjectkindclassifier technicalobjectkindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY technicalobjectkindclassifier
    ADD CONSTRAINT technicalobjectkindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4333 (class 2606 OID 19557)
-- Name: termsofdeliveryclassifier termsofdeliveryclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY termsofdeliveryclassifier
    ADD CONSTRAINT termsofdeliveryclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4335 (class 2606 OID 19559)
-- Name: transactiontypeclassifier transactiontypeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY transactiontypeclassifier
    ADD CONSTRAINT transactiontypeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4337 (class 2606 OID 19561)
-- Name: transportandfreightmodesclassifier transportandfreightmodesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY transportandfreightmodesclassifier
    ADD CONSTRAINT transportandfreightmodesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4339 (class 2606 OID 19563)
-- Name: userkindtimeadvincidentclassifier userkindtimeadvincidentclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY userkindtimeadvincidentclassifier
    ADD CONSTRAINT userkindtimeadvincidentclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4341 (class 2606 OID 19565)
-- Name: vehiclebodycolorclassifier vehiclebodycolorclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclebodycolorclassifier
    ADD CONSTRAINT vehiclebodycolorclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4343 (class 2606 OID 19567)
-- Name: vehiclebrandsclassifier vehiclebrandsclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclebrandsclassifier
    ADD CONSTRAINT vehiclebrandsclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4345 (class 2606 OID 19569)
-- Name: vehiclecategorypereaeutechnicalregulationsclassifier vehiclecategorypereaeutechnicalregulationsclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclecategorypereaeutechnicalregulationsclassifier
    ADD CONSTRAINT vehiclecategorypereaeutechnicalregulationsclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4347 (class 2606 OID 19571)
-- Name: vehiclecategoryperviennaconventiononroadtrafficclassifier vehiclecategoryperviennaconventiononroadtrafficclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclecategoryperviennaconventiononroadtrafficclassifier
    ADD CONSTRAINT vehiclecategoryperviennaconventiononroadtrafficclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4349 (class 2606 OID 19573)
-- Name: vehiclecatperelectrontechcertificateregistrationrulesclassifier vehiclecatperelectrontechcertificateregistrationrulesclass_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclecatperelectrontechcertificateregistrationrulesclassifier
    ADD CONSTRAINT vehiclecatperelectrontechcertificateregistrationrulesclass_pkey PRIMARY KEY (id);


--
-- TOC entry 4351 (class 2606 OID 19575)
-- Name: vehiclechassisclassifier vehiclechassisclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclechassisclassifier
    ADD CONSTRAINT vehiclechassisclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4353 (class 2606 OID 19577)
-- Name: vehiclecomponentschassistypesclassifier vehiclecomponentschassistypesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclecomponentschassistypesclassifier
    ADD CONSTRAINT vehiclecomponentschassistypesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4355 (class 2606 OID 19579)
-- Name: vehicleelectricmachinetypeclassifier vehicleelectricmachinetypeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleelectricmachinetypeclassifier
    ADD CONSTRAINT vehicleelectricmachinetypeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4357 (class 2606 OID 19581)
-- Name: vehicleelectroniccertificateissuecauseclassifier vehicleelectroniccertificateissuecauseclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleelectroniccertificateissuecauseclassifier
    ADD CONSTRAINT vehicleelectroniccertificateissuecauseclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4359 (class 2606 OID 19583)
-- Name: vehicleelectroniccertificateissuecausewodocumentationsubstantia vehicleelectroniccertificateissuecausewodocumentationsubst_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleelectroniccertificateissuecausewodocumentationsubstantia
    ADD CONSTRAINT vehicleelectroniccertificateissuecausewodocumentationsubst_pkey PRIMARY KEY (id);


--
-- TOC entry 4361 (class 2606 OID 19585)
-- Name: vehicleenvironmentalclassclassifier vehicleenvironmentalclassclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleenvironmentalclassclassifier
    ADD CONSTRAINT vehicleenvironmentalclassclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4363 (class 2606 OID 19587)
-- Name: vehiclefueltypesclassifier vehiclefueltypesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclefueltypesclassifier
    ADD CONSTRAINT vehiclefueltypesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4365 (class 2606 OID 19589)
-- Name: vehiclemanufacturertypeclassifier vehiclemanufacturertypeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclemanufacturertypeclassifier
    ADD CONSTRAINT vehiclemanufacturertypeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4367 (class 2606 OID 19591)
-- Name: vehiclepassportissuerkindclassifier vehiclepassportissuerkindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclepassportissuerkindclassifier
    ADD CONSTRAINT vehiclepassportissuerkindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4369 (class 2606 OID 19593)
-- Name: vehiclepropellertypesclassifier vehiclepropellertypesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclepropellertypesclassifier
    ADD CONSTRAINT vehiclepropellertypesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4371 (class 2606 OID 19595)
-- Name: vehicleregistrationclassifier vehicleregistrationclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleregistrationclassifier
    ADD CONSTRAINT vehicleregistrationclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4373 (class 2606 OID 19597)
-- Name: vehiclesuspensiontypeclassifier vehiclesuspensiontypeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehiclesuspensiontypeclassifier
    ADD CONSTRAINT vehiclesuspensiontypeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4375 (class 2606 OID 19599)
-- Name: vehicletechnicalcertificatetypesclassifier vehicletechnicalcertificatetypesclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicletechnicalcertificatetypesclassifier
    ADD CONSTRAINT vehicletechnicalcertificatetypesclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4377 (class 2606 OID 19601)
-- Name: vehicleweighttypeclassifier vehicleweighttypeclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY vehicleweighttypeclassifier
    ADD CONSTRAINT vehicleweighttypeclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4379 (class 2606 OID 19603)
-- Name: waypointkindclassifier waypointkindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY waypointkindclassifier
    ADD CONSTRAINT waypointkindclassifier_pkey PRIMARY KEY (id);


--
-- TOC entry 4381 (class 2606 OID 19605)
-- Name: workinghourskindclassifier workinghourskindclassifier_pkey; Type: CONSTRAINT; Schema: classifiers; Owner: postgres
--

ALTER TABLE ONLY workinghourskindclassifier
    ADD CONSTRAINT workinghourskindclassifier_pkey PRIMARY KEY (id);


CREATE SCHEMA  IF NOT EXISTS conf;

CREATE TABLE IF NOT EXISTS conf.jms (
	id serial8 NOT NULL,
	name varchar(128) NOT NULL CONSTRAINT name_unique UNIQUE,
	channel varchar(128) NULL, 
	host varchar(128) NOT NULL,
	port int4 NOT NULL,
	mq_manager varchar(128) NOT NULL,
	usr varchar(64) NULL,
	pswrd varchar(64) NULL,
	CONSTRAINT jms_pk PRIMARY KEY (id)
) 
WITH (
	OIDS=FALSE
) ;
CREATE TABLE IF NOT EXISTS conf.process (
	id serial8 NOT NULL,
	proc_cd varchar(50) NOT NULL,
	version varchar(64) NULL,
	url_path varchar(512) NULL,
	proc_descr varchar(1024) NULL,
	proc_descr_token tsvector NULL,
	db_schema varchar(63) NULL,
	db_tbl_message varchar(63) NULL,
	db_tbl_signal varchar(63) NULL,
	db_tbl_signal_error varchar(63) NULL,
	jms_nm varchar(64) NULL ,
	jms_queue_in varchar(64) NULL,
	jms_queue_out varchar(64) NULL,
	CONSTRAINT process_pk PRIMARY KEY (id),
	CONSTRAINT process_un UNIQUE (proc_cd, version)
)
WITH (
	OIDS=FALSE
) ;
CREATE INDEX  IF NOT EXISTS process_prod_cd_version_idx ON conf.process USING btree (proc_cd, version) ;
CREATE INDEX  IF NOT EXISTS proc_descr_token_index ON conf.process USING gin (proc_descr_token) ;
COMMENT ON COLUMN conf.process.proc_cd IS 'Common process code' ;
COMMENT ON COLUMN conf.process.proc_descr IS 'Common process description' ;
COMMENT ON COLUMN conf.process.proc_descr_token IS 'Token for full-text search' ;


CREATE TABLE IF NOT EXISTS conf.procedure (
	id serial8 NOT NULL,
	proc_id int8 NOT NULL,
	prcd_cd varchar(32) NOT NULL,
	prcd_descr varchar(1024) NULL,
	prcd_descr_token tsvector NULL,
	CONSTRAINT procedure_pk PRIMARY KEY (id),
	CONSTRAINT procedure_un UNIQUE (prcd_cd),
	CONSTRAINT procedure_process_fk FOREIGN KEY (proc_id) REFERENCES conf.process(id)
)
WITH (
	OIDS=FALSE
) ;
CREATE INDEX  IF NOT EXISTS procedure_prcd_cd_idx ON conf.procedure USING btree (prcd_cd) ;
CREATE INDEX  IF NOT EXISTS prcd_descr_token_index ON conf.procedure USING gin (prcd_descr_token) ;
COMMENT ON COLUMN conf.procedure.prcd_cd IS 'Procedure code' ;
COMMENT ON COLUMN conf.procedure.prcd_cd IS 'Procedure code' ;
COMMENT ON COLUMN conf.procedure.prcd_descr IS 'Procedure description' ;
COMMENT ON COLUMN conf.procedure.prcd_descr_token IS 'Token for full-text search' ;

CREATE TABLE IF NOT EXISTS conf.data_model (
	id serial8 NOT NULL,
	proc_id int8 NOT NULL,
	code varchar(1024) NOT NULL,
	description varchar(1024) NULL,
	db_schema_nm varchar(60) NULL,
	json_schema text NULL,
	ui_schema text NULL,
	xml_bindings text NULL,
	url_path varchar(512) NULL,
	status_cd varchar(8) NULL,
	db_bindings text NULL,
	description_token tsvector NULL,
	CONSTRAINT data_model_pk PRIMARY KEY (id),
	CONSTRAINT data_model_process_fk FOREIGN KEY (proc_id) REFERENCES conf.process(id)
)
WITH (
	OIDS=FALSE
) ;
CREATE INDEX  IF NOT EXISTS data_model_proc_id_idx ON conf.data_model USING btree (proc_id) ;
CREATE INDEX  IF NOT EXISTS data_model_code_idx ON conf.data_model USING btree (code) ;
CREATE INDEX  IF NOT EXISTS data_model_descr_token_index ON conf.data_model USING gin (description_token) ;
COMMENT ON COLUMN conf.data_model.code IS 'Document code' ;
COMMENT ON COLUMN conf.data_model.description IS 'Document description' ;
COMMENT ON COLUMN conf.data_model.description_token IS 'Token for full-text search' ;


CREATE TABLE IF NOT EXISTS conf.operation (
	id serial8 NOT NULL,
	prcd_id int8 NOT NULL,
	actor_cd varchar(64) NULL,
	recv_actor_cd varchar(64) NULL,
	act_init_cd varchar(64) NULL,
	act_resp_cd varchar(64) NULL,
	exec_actor_cd varchar(64) NULL,
	op_cd varchar(64) NOT NULL,
	op_descr varchar(1024) NULL,
	op_descr_token tsvector NULL,
	CONSTRAINT operation_pk PRIMARY KEY (id),
	CONSTRAINT operation_un UNIQUE (op_cd),
	CONSTRAINT operation_procedure_fk FOREIGN KEY (prcd_id) REFERENCES conf.procedure(id)
)
WITH (
	OIDS=FALSE
) ;
CREATE INDEX  IF NOT EXISTS operation_op_cd_char_idx ON conf.operation USING btree (op_cd) ;
CREATE INDEX  IF NOT EXISTS op_descr_token_index ON conf.operation USING gin (op_descr_token) ;
COMMENT ON COLUMN conf.operation.op_cd IS 'Operation code' ;
COMMENT ON COLUMN conf.operation.op_descr IS 'Operation description' ;
COMMENT ON COLUMN conf.operation.op_descr_token IS 'Token for full-text search' ;


CREATE TABLE IF NOT EXISTS conf.service (
	id serial8 NOT NULL,
	msg_cd varchar(64) NULL,
	svc_version varchar(16) NULL,
	status varchar(8) NULL,
	svc_descr varchar(1024) NULL,
	db_schema_nm varchar(60) NULL,
	json_schema text NULL,
	ui_schema text NULL,
	xml_bindings text NULL,
	svc_url varchar(512) NOT NULL,
	db_bindings text NULL,
	svc_descr_token tsvector NULL,
	doc_cd varchar(1024) NULL,
	CONSTRAINT service_pk PRIMARY KEY (id)
	--,CONSTRAINT service_un UNIQUE (svc_url)
)
WITH (
	OIDS=FALSE
) ;
CREATE INDEX  IF NOT EXISTS service_svc_url_idx ON conf.service (svc_url) ;
CREATE INDEX  IF NOT EXISTS service_svc_version_idx ON conf.service (svc_version) ;
CREATE INDEX  IF NOT EXISTS svc_descr_token_index ON conf.service USING gin (svc_descr_token) ;
CREATE INDEX  IF NOT EXISTS service_doc_cd_idx ON conf.service (doc_cd) ;
COMMENT ON COLUMN conf.service.svc_version IS 'Service version' ;
COMMENT ON COLUMN conf.service.svc_descr IS 'Service description' ;
COMMENT ON COLUMN conf.service.svc_url IS 'Service url' ;
COMMENT ON COLUMN conf.service.svc_descr_token IS 'Token for full-text search' ;

CREATE TABLE IF NOT EXISTS conf.xsd (
	id serial8 NOT NULL,
	file_nm varchar(256) NOT NULL,
	content bytea NULL,
	xsd_type varchar(8) NULL,
	CONSTRAINT xsd_pk PRIMARY KEY (id)
)
WITH (
	OIDS=FALSE
) ;
COMMENT ON COLUMN conf.xsd.file_nm IS 'XSD file name' ;
COMMENT ON COLUMN conf.xsd.content IS 'XSD file content' ;
COMMENT ON COLUMN conf.xsd.xsd_type IS 'XSD Type (global or local)' ;


CREATE TABLE IF NOT EXISTS conf.data_model_xsd (
	id serial8 NOT NULL,
	dm_id int8 NOT NULL,
	xsd_id int8 NOT NULL,
	ordr int2 NULL,
	is_root bool NULL,
	CONSTRAINT data_model_xsd_pk PRIMARY KEY (id),
	CONSTRAINT service_xsd_service_fk FOREIGN KEY (dm_id) REFERENCES conf.data_model(id),
	CONSTRAINT data_model_xsd_fk FOREIGN KEY (xsd_id) REFERENCES conf.xsd(id)
)
WITH (
	OIDS=FALSE
) ;

CREATE TABLE IF NOT EXISTS conf.validation_rule(
	id serial8 NOT NULL,
	code varchar(256) NULL,
	rule_template text NOT NULL,
	rule_source_code TEXT NULL,
	rule_class_name varchar(512) NULL,
	description varchar(512) NOT NULL,
	version int8 NOT NULL DEFAULT 0,
	CONSTRAINT validation_rule_pk PRIMARY KEY (id)
)
WITH (
	OIDS=FALSE
) ;

CREATE TABLE IF NOT EXISTS conf.validation_rule_msg(
	id serial8 NOT NULL,
	valdn_rule_id int8 NOT NULL,
	msg_id int8 NOT NULL,
	msg_cd varchar(1024) NOT NULL,
	CONSTRAINT validation_rule_msg_pk PRIMARY KEY (id),
	CONSTRAINT validation_rule_msg_validation_rule_fk FOREIGN KEY (valdn_rule_id) REFERENCES conf.validation_rule(id),
	CONSTRAINT validation_rule_msg_msg_fk FOREIGN KEY (msg_id) REFERENCES conf.service(id)
)
WITH (
	OIDS=FALSE
) ;

CREATE TABLE IF NOT EXISTS conf.validation_rule_document(
	id serial8 NOT NULL,
	rule_id int8 NOT NULL,
	doc_id int8 NOT NULL,
	CONSTRAINT validation_rule_document_pk PRIMARY KEY (id),
	CONSTRAINT validation_rule_document_validation_rule_fk FOREIGN KEY (rule_id) REFERENCES conf.validation_rule(id),
	CONSTRAINT validation_rule_document_doc_id_fk FOREIGN KEY (doc_id) REFERENCES conf.data_model(id)
)
WITH (
	OIDS=FALSE
) ;

CREATE TABLE IF NOT EXISTS conf.service_xsd (
	id serial8 NOT NULL,
	svc_id int8 NOT NULL,
	xsd_id int8 NOT NULL,
	ordr int2 NULL,
	is_root bool NULL,
	CONSTRAINT service_xsd_pk PRIMARY KEY (id),
	CONSTRAINT service_xsd_service_fk FOREIGN KEY (svc_id) REFERENCES conf.service(id),
	CONSTRAINT service_xsd_xsd_fk FOREIGN KEY (xsd_id) REFERENCES conf.xsd(id)
)
WITH (
	OIDS=FALSE
) ;

CREATE TABLE IF NOT EXISTS conf.operation_service (
	op_id int8 NOT NULL,
	svc_id int8 NOT NULL,
	CONSTRAINT operation_service_pk PRIMARY KEY (op_id, svc_id),
	CONSTRAINT operation_service_operation_fk FOREIGN KEY (op_id) REFERENCES conf.operation(id),
	CONSTRAINT operation_service_service_fk FOREIGN KEY (svc_id) REFERENCES conf.service(id)
)
WITH (
	OIDS=FALSE
) ;
CREATE INDEX  IF NOT EXISTS operation_service_op_id_idx ON conf.operation_service (op_id) ;
CREATE INDEX  IF NOT EXISTS operation_service_svc_id_idx ON conf.operation_service (svc_id) ;

CREATE TABLE IF NOT EXISTS conf.service_method (
	id serial8 NOT NULL,
	svc_id int8 NOT NULL,
	path varchar(256) NULL,
	http_method varchar(6) NULL,
	content_type varchar(64) NULL,
	action_type varchar(10),
	action_decr varchar(512),
	send_conn_type varchar(16),
	send_conn_http_cd varchar(128),
	send_conn_jms_cd varchar(128),
	send_conn_http_path varchar(256),
	send_conn_http_method varchar(6),
	queue_nm varchar(64) NULL,
	CONSTRAINT service_method_pk PRIMARY KEY (id),
	CONSTRAINT service_method_service_fk FOREIGN KEY (svc_id) REFERENCES conf.service(id)
)
WITH (
	OIDS=FALSE
) ;
CREATE INDEX  IF NOT EXISTS service_method_svc_id_idx ON conf.service_method (svc_id) ;

CREATE TABLE IF NOT EXISTS conf.http_server (
	id serial8 NOT NULL,
	code varchar(128) NOT NULL CONSTRAINT code_unique UNIQUE,
	host varchar(128) NOT NULL,
	description varchar(512) NOT NULL,
	CONSTRAINT http_server_pk PRIMARY KEY (id)
)
WITH (
	OIDS=FALSE
) ; 

CREATE TABLE IF NOT EXISTS conf.user (
	id serial8 NOT NULL,
	first_nm varchar(128) NULL,
	last_nm varchar(128) NULL,
	middle_nm varchar(128) NULL,
	email varchar(128) NULL,
	CONSTRAINT user_pk PRIMARY KEY (id)
) 
WITH (
	OIDS=FALSE
) ;

CREATE TABLE IF NOT EXISTS conf.role (
	id serial8 NOT NULL,
	role_nm varchar(128) NULL CONSTRAINT role_nm_unique UNIQUE,
	CONSTRAINT role_pk PRIMARY KEY (id)
) 
WITH (
	OIDS=FALSE
) ;

CREATE TABLE IF NOT EXISTS conf.user_role (
	id serial8 NOT NULL,
	user_id int8 NOT NULL,
	role_id int8 NOT NULL,
	CONSTRAINT user_role_pk PRIMARY KEY (id),
	CONSTRAINT user_role_user_fk FOREIGN KEY (user_id) REFERENCES conf.user(id),
	CONSTRAINT user_role_role_fk FOREIGN KEY (role_id) REFERENCES conf.role(id)
) 
WITH (
	OIDS=FALSE
) ;

CREATE TABLE IF NOT EXISTS conf.role_process (
	id serial8 NOT NULL,
	role_id int8 NOT NULL,
	proc_id int8 NOT NULL,
	CONSTRAINT role_process_pk PRIMARY KEY (id),
	CONSTRAINT role_process_role_fk FOREIGN KEY (role_id) REFERENCES conf.role(id),
	CONSTRAINT role_process_process_fk FOREIGN KEY (proc_id) REFERENCES conf.process(id)
) 
WITH (
	OIDS=FALSE
) ;

CREATE TABLE IF NOT EXISTS conf.signal (
	id serial8 NOT NULL,
	cd varchar(32) NULL,
	descr varchar(256) NULL,
	CONSTRAINT signal_pk PRIMARY KEY (id)
)
WITH (
	OIDS=FALSE
) ; 

CREATE TABLE IF NOT EXISTS conf.procedure_signal (
	prcd_id int8 NOT NULL,
	signal_id int8 NOT NULL,
	CONSTRAINT procedure_signal_pk PRIMARY KEY (prcd_id, signal_id),
	CONSTRAINT procedure_signal_procedure_fk FOREIGN KEY (prcd_id) REFERENCES conf.procedure(id),
	CONSTRAINT procedure_signal_signal_fk FOREIGN KEY (signal_id) REFERENCES conf.signal(id)
)
WITH (
	OIDS=FALSE
) ;
CREATE INDEX  IF NOT EXISTS procedure_signal_prcd_id_idx ON conf.procedure_signal (prcd_id) ;
CREATE INDEX  IF NOT EXISTS procedure_signal_signal_id_idx ON conf.procedure_signal (signal_id) ;

CREATE TABLE IF NOT EXISTS conf.service_signal (
	svc_id int8 NOT NULL,
	signal_id int8 NOT NULL,
	CONSTRAINT service_signal_pk PRIMARY KEY (svc_id, signal_id),
	CONSTRAINT service_signal_service_fk FOREIGN KEY (svc_id) REFERENCES conf.service(id),
	CONSTRAINT service_signal_signal_fk FOREIGN KEY (signal_id) REFERENCES conf.signal(id)
)
WITH (
	OIDS=FALSE
) ;
CREATE INDEX  IF NOT EXISTS service_signal_svc_id_idx ON conf.service_signal (svc_id) ;
CREATE INDEX  IF NOT EXISTS service_signal_signal_id_idx ON conf.service_signal (signal_id) ;

CREATE TABLE IF NOT EXISTS conf.transaction (
	id serial8 NOT NULL,
	prcd_id int8 NOT NULL,
	cd varchar(64) NULL,
	descr varchar(512) NULL,
	bpmn_proc_def_id varchar(512) NULL,
	bpmn_initiator_proc_def_id varchar(512) NULL,
	CONSTRAINT transaction_pk PRIMARY KEY (id),
	CONSTRAINT transaction_procedure_fk FOREIGN KEY (prcd_id) REFERENCES conf.procedure(id)
)
WITH (
	OIDS=FALSE
) ; 
CREATE INDEX  IF NOT EXISTS transaction_prcd_id_idx ON conf.transaction (prcd_id) ;

CREATE TABLE IF NOT EXISTS conf.bp_file (
	id serial8 NOT NULL,
	tr_id int8 NOT NULL,
	file_nm varchar(256) NOT NULL,
	file_type varchar(64) NOT NULL,
	content bytea NULL,
	CONSTRAINT bp_file_pk PRIMARY KEY (id),
	CONSTRAINT bp_file_transaction_fk FOREIGN KEY (tr_id) REFERENCES conf.transaction(id),
	CONSTRAINT bp_file_type_transaction_id UNIQUE (tr_id, file_type)
)
WITH (
	OIDS=FALSE
) ;

CREATE INDEX  IF NOT EXISTS transaction_bp_file_id_idx ON conf.bp_file(tr_id) ;

CREATE TABLE IF NOT EXISTS conf.json_schema_template (
	id serial8 NOT NULL,
	nm varchar(1024) NOT NULL,
	template text NULL,
	CONSTRAINT json_schema_template_pk PRIMARY KEY (id),
	CONSTRAINT json_schema_template_un UNIQUE (nm)
)
WITH (
	OIDS=FALSE
) ;

CREATE TABLE IF NOT EXISTS conf.bpmn_trans_map (
	id serial8 NOT NULL,
	tr_id int8 NOT NULL,
	flow_elem_key varchar(256) NOT NULL,
	trans_cd varchar(64) NOT NULL,
	msg_cd varchar(64) NOT NULL,
	action varchar(64) NULL,
	trans_type varchar(16),
	CONSTRAINT bpmn_trans_def_map_pk PRIMARY KEY (id)
)
WITH (
	OIDS=FALSE
) ;

CREATE INDEX  IF NOT EXISTS bpmn_trans_map_trans_msg_cd ON conf.bpmn_trans_map (trans_cd, msg_cd) ;

CREATE OR REPLACE FUNCTION conf.add_process_token()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
    token tsvector;
    proc_id int8;
BEGIN
    IF  TG_OP = 'INSERT' THEN
        token = to_tsvector('russian', NEW.proc_descr);
		proc_id=new.id;
        UPDATE conf.process
		SET proc_descr_token=token
		WHERE id=proc_id;
        RETURN NEW;
    END IF;
END;
$function$;

DROP TRIGGER IF exists  process_token ON conf.process ;
CREATE TRIGGER process_token
AFTER INSERT  ON conf.process FOR EACH ROW EXECUTE PROCEDURE conf.add_process_token();

CREATE OR REPLACE FUNCTION conf.add_procedure_token()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
    token tsvector;
    prcd_id int8;
BEGIN
    IF  TG_OP = 'INSERT' THEN
        token = to_tsvector('russian', NEW.prcd_descr);
		prcd_id=new.id;
        UPDATE conf.procedure
		SET prcd_descr_token=token
		WHERE id=prcd_id;
        RETURN NEW;
    END IF;
END;
$function$;

DROP TRIGGER IF exists  procedure_token ON conf.procedure ;
CREATE TRIGGER procedure_token
AFTER INSERT  ON conf.procedure FOR EACH ROW EXECUTE PROCEDURE conf.add_procedure_token();

CREATE OR REPLACE FUNCTION conf.add_operation_token()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
    token tsvector;
    op_id int8;
BEGIN
    IF  TG_OP = 'INSERT' THEN
        token = to_tsvector('russian', NEW.op_descr);
		op_id=new.id;
        UPDATE conf.operation
		SET op_descr_token=token
		WHERE id=op_id;
        RETURN NEW;
    END IF;
END;
$function$;

DROP TRIGGER IF exists  operation_token ON conf.operation ;
CREATE TRIGGER operation_token
AFTER INSERT  ON conf.operation FOR EACH ROW EXECUTE PROCEDURE conf.add_operation_token();

CREATE OR REPLACE FUNCTION conf.add_service_token()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
DECLARE
    token tsvector;
    svc_id int8;
BEGIN
    IF  TG_OP = 'INSERT' THEN
        token = to_tsvector('russian', NEW.svc_descr);
		svc_id=new.id;
        UPDATE conf.service
		SET svc_descr_token=token
		WHERE id=svc_id;
        RETURN NEW;
    END IF;
END;
$function$;

DROP TRIGGER IF exists  service_token ON conf.service ;
CREATE TRIGGER service_token 
	AFTER INSERT ON conf.service FOR EACH ROW EXECUTE PROCEDURE conf.add_service_token();
	
CREATE TABLE IF NOT EXISTS conf.xsd_table_bindings (
	id serial8 NOT NULL,
	xsd_elem_key varchar(1024) NOT NULL,
	db_schema varchar(64) NOT NULL,
	db_table varchar(64) NOT NULL,
	CONSTRAINT xsd_table_bindings_pk PRIMARY KEY (id),
	CONSTRAINT xsd_table_bindings_un UNIQUE (xsd_elem_key, db_schema, db_table)
)
WITH (
	OIDS=FALSE
);

CREATE TABLE IF NOT EXISTS conf.refbook (
  id serial8 NOT NULL,
  rb_code VARCHAR(50) NOT NULL ,
  rb_descr VARCHAR(1024) NOT NULL,
  rb_json_schema text NULL,
  date_changed timestamp NULL,
  CONSTRAINT refbook_pk PRIMARY KEY (id)
)
WITH (
	OIDS=FALSE
);

CREATE TABLE IF NOT EXISTS conf.refbook_db_table (
  id serial8 NOT NULL,
  rb_id int8 NOT NULL,
  db_schema VARCHAR(50) NOT NULL ,
  db_table_name VARCHAR(50) NOT NULL,
  CONSTRAINT refbook_db_table_pk PRIMARY KEY (id),
  CONSTRAINT refbook_id_fk FOREIGN KEY (rb_id) REFERENCES conf.refbook(id) ON DELETE CASCADE ON UPDATE CASCADE
)
WITH (
	OIDS=FALSE
);

-- CREATE TABLE , Denis Oreshkevich , 22.10.2018 18:54

CREATE TABLE IF NOT EXISTS public.log (
	id bigserial NOT NULL,
	message_id varchar(128) NOT NULL,
	datetime timestamp NULL,
	url varchar(256) NOT NULL,
	headers varchar(1024) NOT NULL,
	"type" varchar(16) NOT NULL,
	status varchar(64) NULL,
	CONSTRAINT log_pk PRIMARY KEY (id)
)
WITH (
	OIDS=FALSE
) ;

-- ADD COLUMN conf.http_server.header ,  Denis Oreshkevich , 23.10.2018 17:09

ALTER TABLE conf.http_server ADD COLUMN  IF NOT  EXISTS header varchar(128) NULL;

-- ADD COLUMN conf.http_server.menu_ind ,  Denis Oreshkevich , 24.10.2018 13:09
ALTER TABLE conf.http_server ADD COLUMN  IF NOT  EXISTS menu_ind boolean NOT NULL DEFAULT false;

--alter table conf.process add column IF NOT EXISTS url_path varchar(512) NULL;
--Alesia Shalai, add url_path to process, 25.10.2018 by A.Medvedev

ALTER TABLE conf.process ADD COLUMN IF NOT EXISTS url_path varchar(512) NULL;


-- ADD COLUMN conf.http_server.header_ind ,  Denis Oreshkevich , 25.10.2018 17:09
ALTER TABLE conf.http_server ADD COLUMN  IF NOT  EXISTS header_ind boolean NULL;

-- ADD COLUMN conf.role.source_type, Andrey Bobr , 27.10.2018 17:09
ALTER TABLE conf.role ADD COLUMN IF NOT EXISTS source_type varchar(64) NOT NULL DEFAULT 'LOCAL';

-- ADD COLUMN conf.role.description, Andrey Bobr , 27.10.2018 17:09 // increase size from Oreshkevich D.
ALTER TABLE conf.role ADD COLUMN IF NOT EXISTS description varchar(1024) NULL;

-- ADD COLUMN conf.role.source_type, Andrey Bobr , 27.10.2018 17:09
ALTER TABLE conf.role ADD COLUMN IF NOT EXISTS source_type varchar(64) NOT NULL DEFAULT 'LOCAL';

-- ADD COLUMN conf.role.description, Andrey Bobr , 27.10.2018 17:09
ALTER TABLE conf.role ADD COLUMN IF NOT EXISTS description varchar(128) NULL;

-- ADD COLUMN conf.process.db_tbl_doc_status, Oleg Seiko , 30.10.2018 12:07
ALTER TABLE conf.process ADD COLUMN IF NOT EXISTS db_tbl_doc_status varchar(128) NULL;

--remove column conf.validation_rule.rule_class, Waldemar Tsiamruk 31.10.2018 14:34
ALTER TABLE conf.validation_rule DROP COLUMN IF EXISTS rule_class;

--add column conf.validation_rule.rule_source_code, Waldemar Tsiamruk 31.10.2018 14:34

ALTER TABLE conf.validation_rule ADD COLUMN IF NOT EXISTS rule_source_code TEXT NULL;

--add column conf.validation_rule.rule_class_name, Waldemar Tsiamruk 31.10.2018 14:34
ALTER TABLE conf.validation_rule ADD COLUMN IF NOT EXISTS rule_class_name varchar(512) NULL;

-- Edit column size conf.validation_rule.description 512 to 2048 (varchar) , Alexey Mozgo 05.11.2018 11:20
ALTER TABLE conf.validation_rule ALTER COLUMN description TYPE varchar(2048) USING description::varchar;

-- ON DELETE CASCADE TO CONSTRAINT conf.validation_rule_msg.validation_rule_msg_validation_rule_fk, Waldemar Tsiamruk 8.11.2018 15:53
ALTER TABLE conf.validation_rule_msg DROP CONSTRAINT validation_rule_msg_validation_rule_fk, ADD CONSTRAINT
	validation_rule_msg_validation_rule_fk FOREIGN KEY (valdn_rule_id) REFERENCES conf.validation_rule(id) ON DELETE CASCADE;
		
-- ADD COLUMN conf.process.api_name, Andrey Bobr , 10.11.2018 19:00
ALTER TABLE conf.process ADD COLUMN IF NOT EXISTS api_name varchar(64) NULL;
ALTER TABLE conf.process ADD CONSTRAINT api_name_unique UNIQUE (api_name);

-- ADD COLUMN conf.process.api_version, Andrey Bobr , 10.11.2018 19:00
ALTER TABLE conf.process ADD COLUMN IF NOT EXISTS api_version varchar(64) NULL;

-- ADD COLUMN conf.process.api_context_url, Andrey Bobr , 10.11.2018 19:00
ALTER TABLE conf.process ADD COLUMN IF NOT EXISTS api_context_url varchar(128) NULL;

-- ADD COLUMN conf.process.title_schema, Maria Pashkevich , 17.11.2018 12:00
ALTER TABLE conf.process ADD COLUMN IF NOT EXISTS title_schema varchar(1024) NULL;

--ADD COLUMN conf.data_model.is_sign, Andrey Bobr, 27.11.2018 14:00
ALTER TABLE conf.data_model ADD is_sign bool NOT NULL DEFAULT false;

--ADD COLUMN conf.data_model.proc_number, Alex Medvedev, 29.11.2018 14:00
ALTER TABLE conf.process ADD proc_number int4 NULL;

-- Edit column size conf.service.doc_cd 64 (varchar) , Denis Arteshkevich 04.12.2018 11:20
ALTER TABLE conf.service ALTER COLUMN doc_cd TYPE varchar(64) USING doc_cd::varchar;

--Add column date_created into conf.refbook (timestamp), Shvetsov Alexander 13.12.2018
ALTER TABLE conf.refbook ADD COLUMN IF NOT  EXISTS date_changed timestamp  NULL;

-- CREATE TABLES FOR DATABASE dead_message

\c dead_message;
\echo 'CREATE TABLES FOR DATABASE dead_message';

CREATE TABLE IF NOT EXISTS public.dead_message (
	id bigserial NOT NULL,
	content bytea NULL,
	datetime timestamp NULL,
	jms_to varchar(256)  NULL,
	jms_reply_to varchar(256)  NULL,
	CONSTRAINT dead_message_pk PRIMARY KEY (id)
)
WITH (
OIDS=FALSE
);


-- CREATE TABLES FOR DATABASE logs

\c logs;
\echo 'CREATE TABLES FOR DATABASE logs';

CREATE TABLE IF NOT EXISTS public.log (
	id bigserial NOT NULL,
	message_id varchar(128) NOT NULL,
	datetime timestamp NULL,
	url varchar(256)  NULL,
	headers varchar(5120) NOT NULL,
	"type" varchar(16) NOT NULL,
	status varchar(64) NULL,
	CONSTRAINT log_pk PRIMARY KEY (id)
)
WITH (
	OIDS=FALSE
);

CREATE VIEW log_view AS
    SELECT request.id,
           request.url,
           response.status,
           request.headers as request_header,
           response.headers as response_headers,
           to_json(request.datetime) as request_datetime,
           to_json(datetime2) as response_datetime
    FROM (select id,
                message_id,
                url,
                type,
                headers,
                datetime
          FROM "log"
          WHERE type = 'request') request
    JOIN (SELECT message_id,
                status,
                headers,
                type as type1,
                datetime as datetime2
          FROM "log" where type = 'response') response
    ON request.message_id = response.message_id;
    
    
-- Edit column public.log.headers varvhar -> varchar(5120)

-- Add table public.log.processing_logs  03.12.2018 Denis Oreshkevich
CREATE TABLE IF NOT EXISTS public.processing_logs (
			id bigserial NOT NULL,
			date_time timestamp NULL,
			log_level varchar(8) NULL,
			"to" varchar(128) NULL,
			reply_to varchar(128) NULL,
			msg_id varchar(128) NULL,
			msg_cd varchar(128) NULL,
			prcd_id varchar(128) NULL,
			prcd_cd varchar(128) NULL,
			trn_cd varchar(128) NULL,
			conv_id varchar(128) NULL,
			activiti_id varchar(128) NULL,
			step varchar(128) NULL,
			action varchar(128) NULL,
			log_message varchar(512) NULL,
			process_cd varchar(128) NULL,
			edoc_id varchar(128) NULL,
			CONSTRAINT processing_logs_pk PRIMARY KEY (id)
		)
		WITH (
			OIDS=FALSE
		) ;


		
CREATE OR REPLACE VIEW processing_logs_view AS 
SELECT DISTINCT ON (msg_id) msg_id,
    id, 
    msg_cd AS massage_code, 
    prcd_cd AS procedure_code, 
    trn_cd AS transaction_code, 
    process_cd AS process_code,
    prcd_id, 
    to_json(date_time) AS prc_date_time
FROM processing_logs;

-- Edit column type public.processing_logs.log_message text , Denis Arteshkevich 20.12.2018 14:10
ALTER TABLE public.processing_logs ALTER COLUMN log_message TYPE text USING log_message::text;

-- create WSO2AM_CARBON_DB

\c wso2am_carbon_db;

\echo 'CREATE TABLES FOR WSO2AM_CARBON_DB'

DROP TABLE IF EXISTS CM_PII_CATEGORY;
DROP SEQUENCE IF EXISTS CM_PII_CATEGORY_PK_SEQ;
CREATE SEQUENCE CM_PII_CATEGORY_PK_SEQ;
CREATE TABLE CM_PII_CATEGORY (
  ID           INTEGER DEFAULT NEXTVAL('CM_PII_CATEGORY_PK_SEQ'),
  NAME         VARCHAR(255) NOT NULL,
  DESCRIPTION  VARCHAR(1023),
  DISPLAY_NAME VARCHAR(255),
  IS_SENSITIVE INTEGER      NOT NULL,
  TENANT_ID    INTEGER DEFAULT '-1234',
  CONSTRAINT CM_PII_CATEGORY_CNT UNIQUE (NAME, TENANT_ID),
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS CM_RECEIPT;
CREATE TABLE CM_RECEIPT (
  CONSENT_RECEIPT_ID  VARCHAR(255) NOT NULL,
  VERSION             VARCHAR(255) NOT NULL,
  JURISDICTION        VARCHAR(255) NOT NULL,
  CONSENT_TIMESTAMP   TIMESTAMP    NOT NULL,
  COLLECTION_METHOD   VARCHAR(255) NOT NULL,
  LANGUAGE            VARCHAR(255) NOT NULL,
  PII_PRINCIPAL_ID    VARCHAR(255) NOT NULL,
  PRINCIPAL_TENANT_ID INTEGER DEFAULT '-1234',
  POLICY_URL          VARCHAR(255) NOT NULL,
  STATE               VARCHAR(255) NOT NULL,
  PII_CONTROLLER      VARCHAR(2048) NOT NULL,
  PRIMARY KEY (CONSENT_RECEIPT_ID)
);

DROP TABLE IF EXISTS CM_PURPOSE;
DROP SEQUENCE IF EXISTS CM_PURPOSE_PK_SEQ;
CREATE SEQUENCE CM_PURPOSE_PK_SEQ;
CREATE TABLE CM_PURPOSE (
  ID          INTEGER DEFAULT NEXTVAL('CM_PURPOSE_PK_SEQ'),
  NAME        VARCHAR(255) NOT NULL,
  DESCRIPTION VARCHAR(1023),
  TENANT_ID   INTEGER DEFAULT '-1234',
  CONSTRAINT CM_PURPOSE_CNT UNIQUE  (NAME, TENANT_ID),
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS CM_PURPOSE_CATEGORY;
DROP SEQUENCE IF EXISTS CM_PURPOSE_CATEGORY_PK_SEQ;
CREATE SEQUENCE CM_PURPOSE_CATEGORY_PK_SEQ;
CREATE TABLE CM_PURPOSE_CATEGORY (
  ID          INTEGER DEFAULT NEXTVAL('CM_PURPOSE_CATEGORY_PK_SEQ'),
  NAME        VARCHAR(255) NOT NULL,
  DESCRIPTION VARCHAR(1023),
  TENANT_ID   INTEGER DEFAULT '-1234',
  CONSTRAINT CM_PURPOSE_CATEGORY_CNT UNIQUE  (NAME, TENANT_ID),
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS CM_RECEIPT_SP_ASSOC;
DROP SEQUENCE IF EXISTS CM_RECEIPT_SP_ASSOC_PK_SEQ;
CREATE SEQUENCE CM_RECEIPT_SP_ASSOC_PK_SEQ;
CREATE TABLE CM_RECEIPT_SP_ASSOC (
  ID                 INTEGER DEFAULT NEXTVAL('CM_RECEIPT_SP_ASSOC_PK_SEQ'),
  CONSENT_RECEIPT_ID VARCHAR(255) NOT NULL,
  SP_NAME            VARCHAR(255) NOT NULL,
  SP_DISPLAY_NAME    VARCHAR(255),
  SP_DESCRIPTION     VARCHAR(255),
  SP_TENANT_ID       INTEGER DEFAULT '-1234',
  CONSTRAINT CM_RECEIPT_SP_ASSOC_CNT UNIQUE  (CONSENT_RECEIPT_ID, SP_NAME, SP_TENANT_ID),
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS CM_SP_PURPOSE_ASSOC;
DROP SEQUENCE IF EXISTS CM_SP_PURPOSE_ASSOC_PK_SEQ;
CREATE SEQUENCE CM_SP_PURPOSE_ASSOC_PK_SEQ;
CREATE TABLE CM_SP_PURPOSE_ASSOC (
  ID                     INTEGER DEFAULT NEXTVAL('CM_SP_PURPOSE_ASSOC_PK_SEQ'),
  RECEIPT_SP_ASSOC       INTEGER      NOT NULL,
  PURPOSE_ID             INTEGER      NOT NULL,
  CONSENT_TYPE           VARCHAR(255) NOT NULL,
  IS_PRIMARY_PURPOSE     INTEGER      NOT NULL,
  TERMINATION            VARCHAR(255) NOT NULL,
  THIRD_PARTY_DISCLOSURE INTEGER      NOT NULL,
  THIRD_PARTY_NAME       VARCHAR(255),
  CONSTRAINT CM_SP_PURPOSE_ASSOC_CNT UNIQUE  (RECEIPT_SP_ASSOC, PURPOSE_ID),
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS CM_SP_PURPOSE_PURPOSE_CAT_ASSC;
CREATE TABLE CM_SP_PURPOSE_PURPOSE_CAT_ASSC (
  SP_PURPOSE_ASSOC_ID INTEGER NOT NULL,
  PURPOSE_CATEGORY_ID INTEGER NOT NULL,
  CONSTRAINT CM_SP_PURPOSE_PURPOSE_CAT_ASSC_CNT UNIQUE  (SP_PURPOSE_ASSOC_ID, PURPOSE_CATEGORY_ID)
);

DROP TABLE IF EXISTS CM_PURPOSE_PII_CAT_ASSOC;
CREATE TABLE CM_PURPOSE_PII_CAT_ASSOC (
  PURPOSE_ID         INTEGER NOT NULL,
  CM_PII_CATEGORY_ID INTEGER NOT NULL,
  CONSTRAINT CM_PURPOSE_PII_CAT_ASSOC_CNT UNIQUE  (PURPOSE_ID, CM_PII_CATEGORY_ID)
);

DROP TABLE IF EXISTS CM_SP_PURPOSE_PII_CAT_ASSOC;
CREATE TABLE CM_SP_PURPOSE_PII_CAT_ASSOC (
  SP_PURPOSE_ASSOC_ID INTEGER NOT NULL,
  PII_CATEGORY_ID     INTEGER NOT NULL,
  VALIDITY            VARCHAR(1023),
  CONSTRAINT CM_SP_PURPOSE_PII_CAT_ASSOC_CNT UNIQUE  (SP_PURPOSE_ASSOC_ID, PII_CATEGORY_ID)
);

DROP TABLE IF EXISTS CM_CONSENT_RECEIPT_PROPERTY;
CREATE TABLE CM_CONSENT_RECEIPT_PROPERTY (
  CONSENT_RECEIPT_ID VARCHAR(255)  NOT NULL,
  NAME               VARCHAR(255)  NOT NULL,
  VALUE              VARCHAR(1023) NOT NULL,
  CONSTRAINT CM_CONSENT_RECEIPT_PROPERTY_CNT UNIQUE  (CONSENT_RECEIPT_ID, NAME)
);

ALTER TABLE CM_RECEIPT_SP_ASSOC
  ADD CONSTRAINT CM_RECEIPT_SP_ASSOC_fk0 FOREIGN KEY (CONSENT_RECEIPT_ID) REFERENCES CM_RECEIPT (CONSENT_RECEIPT_ID);

ALTER TABLE CM_SP_PURPOSE_ASSOC
  ADD CONSTRAINT CM_SP_PURPOSE_ASSOC_fk0 FOREIGN KEY (RECEIPT_SP_ASSOC) REFERENCES CM_RECEIPT_SP_ASSOC (ID);

ALTER TABLE CM_SP_PURPOSE_ASSOC
  ADD CONSTRAINT CM_SP_PURPOSE_ASSOC_fk1 FOREIGN KEY (PURPOSE_ID) REFERENCES CM_PURPOSE (ID);

ALTER TABLE CM_SP_PURPOSE_PURPOSE_CAT_ASSC
  ADD CONSTRAINT CM_SP_P_P_CAT_ASSOC_fk0 FOREIGN KEY (SP_PURPOSE_ASSOC_ID) REFERENCES CM_SP_PURPOSE_ASSOC (ID);

ALTER TABLE CM_SP_PURPOSE_PURPOSE_CAT_ASSC
  ADD CONSTRAINT CM_SP_P_P_CAT_ASSOC_fk1 FOREIGN KEY (PURPOSE_CATEGORY_ID) REFERENCES CM_PURPOSE_CATEGORY (ID);

ALTER TABLE CM_SP_PURPOSE_PII_CAT_ASSOC
  ADD CONSTRAINT CM_SP_P_PII_CAT_ASSOC_fk0 FOREIGN KEY (SP_PURPOSE_ASSOC_ID) REFERENCES CM_SP_PURPOSE_ASSOC (ID);

ALTER TABLE CM_SP_PURPOSE_PII_CAT_ASSOC
  ADD CONSTRAINT CM_SP_P_PII_CAT_ASSOC_fk1 FOREIGN KEY (PII_CATEGORY_ID) REFERENCES CM_PII_CATEGORY (ID);

ALTER TABLE CM_CONSENT_RECEIPT_PROPERTY
  ADD CONSTRAINT CM_CONSENT_RECEIPT_PRT_fk0 FOREIGN KEY (CONSENT_RECEIPT_ID) REFERENCES CM_RECEIPT (CONSENT_RECEIPT_ID);

INSERT INTO CM_PURPOSE (NAME, DESCRIPTION, TENANT_ID) values ('DEFAULT', 'For core functionalities of the product', '-1234');

INSERT INTO CM_PURPOSE_CATEGORY (NAME, DESCRIPTION, TENANT_ID) VALUES ('DEFAULT','For core functionalities of the product', '-1234');

DROP TABLE IF EXISTS REG_CLUSTER_LOCK;
CREATE TABLE REG_CLUSTER_LOCK (
             REG_LOCK_NAME VARCHAR (20),
             REG_LOCK_STATUS VARCHAR (20),
             REG_LOCKED_TIME TIMESTAMP,
             REG_TENANT_ID INTEGER DEFAULT 0,
             PRIMARY KEY (REG_LOCK_NAME)
);

DROP TABLE IF EXISTS REG_LOG;
DROP SEQUENCE IF EXISTS REG_LOG_PK_SEQ;
CREATE SEQUENCE REG_LOG_PK_SEQ;
CREATE TABLE REG_LOG (
             REG_LOG_ID INTEGER DEFAULT NEXTVAL('REG_LOG_PK_SEQ'),
             REG_PATH VARCHAR (2000),
             REG_USER_ID VARCHAR (31) NOT NULL,
             REG_LOGGED_TIME TIMESTAMP NOT NULL,
             REG_ACTION INTEGER NOT NULL,
             REG_ACTION_DATA VARCHAR (500),
             REG_TENANT_ID INTEGER DEFAULT 0,
             PRIMARY KEY (REG_LOG_ID, REG_TENANT_ID)
);

CREATE INDEX REG_LOG_IND_BY_REG_LOGTIME ON REG_LOG(REG_LOGGED_TIME, REG_TENANT_ID);

DROP TABLE IF EXISTS REG_PATH;
DROP SEQUENCE IF EXISTS REG_PATH_PK_SEQ;
CREATE SEQUENCE REG_PATH_PK_SEQ;
CREATE TABLE REG_PATH(
             REG_PATH_ID INTEGER DEFAULT NEXTVAL('REG_PATH_PK_SEQ'),
             REG_PATH_VALUE VARCHAR(2000) NOT NULL,
             REG_PATH_PARENT_ID INTEGER,
             REG_TENANT_ID INTEGER DEFAULT 0,
             CONSTRAINT PK_REG_PATH PRIMARY KEY(REG_PATH_ID, REG_TENANT_ID)
);

CREATE INDEX REG_PATH_IND_BY_PATH_VALUE ON REG_PATH(REG_PATH_VALUE, REG_TENANT_ID);
CREATE INDEX REG_PATH_IND_BY_PATH_PARENT_ID  ON REG_PATH(REG_PATH_PARENT_ID, REG_TENANT_ID);

DROP TABLE IF EXISTS REG_CONTENT;
DROP SEQUENCE IF EXISTS REG_CONTENT_PK_SEQ;
CREATE SEQUENCE REG_CONTENT_PK_SEQ;
CREATE TABLE REG_CONTENT (
             REG_CONTENT_ID INTEGER DEFAULT NEXTVAL('REG_CONTENT_PK_SEQ'),
             REG_CONTENT_DATA BYTEA,
             REG_TENANT_ID INTEGER DEFAULT 0,
             CONSTRAINT PK_REG_CONTENT PRIMARY KEY(REG_CONTENT_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_CONTENT_HISTORY;
CREATE TABLE REG_CONTENT_HISTORY (
             REG_CONTENT_ID INTEGER NOT NULL,
             REG_CONTENT_DATA BYTEA,
             REG_DELETED   SMALLINT,
             REG_TENANT_ID INTEGER DEFAULT 0,
             CONSTRAINT PK_REG_CONTENT_HISTORY PRIMARY KEY(REG_CONTENT_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_RESOURCE;
DROP SEQUENCE IF EXISTS REG_RESOURCE_PK_SEQ;
CREATE SEQUENCE REG_RESOURCE_PK_SEQ;
CREATE TABLE REG_RESOURCE (
            REG_PATH_ID         INTEGER NOT NULL,
            REG_NAME            VARCHAR(256),
            REG_VERSION         INTEGER DEFAULT NEXTVAL('REG_RESOURCE_PK_SEQ'),
            REG_MEDIA_TYPE      VARCHAR(500),
            REG_CREATOR         VARCHAR(31) NOT NULL,
            REG_CREATED_TIME    TIMESTAMP NOT NULL,
            REG_LAST_UPDATOR    VARCHAR(31),
            REG_LAST_UPDATED_TIME    TIMESTAMP NOT NULL,
            REG_DESCRIPTION     VARCHAR(1000),
            REG_CONTENT_ID      INTEGER,
            REG_TENANT_ID INTEGER DEFAULT 0,
            REG_UUID VARCHAR(100) NOT NULL,
            CONSTRAINT PK_REG_RESOURCE PRIMARY KEY(REG_VERSION, REG_TENANT_ID)
);

ALTER TABLE REG_RESOURCE ADD CONSTRAINT REG_RESOURCE_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE ADD CONSTRAINT REG_RESOURCE_FK_BY_CONTENT_ID FOREIGN KEY (REG_CONTENT_ID, REG_TENANT_ID) REFERENCES REG_CONTENT (REG_CONTENT_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_IND_BY_NAME  ON REG_RESOURCE(REG_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_IND_BY_PATH_ID_NAME  ON REG_RESOURCE(REG_PATH_ID, REG_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_IND_BY_UUID  ON REG_RESOURCE(REG_UUID);
CREATE INDEX REG_RESOURCE_IND_BY_TENANT ON REG_RESOURCE(REG_TENANT_ID, REG_UUID);
CREATE INDEX REG_RESOURCE_IND_BY_TYPE ON REG_RESOURCE(REG_TENANT_ID, REG_MEDIA_TYPE);

DROP TABLE IF EXISTS REG_RESOURCE_HISTORY;
CREATE TABLE REG_RESOURCE_HISTORY (
            REG_PATH_ID         INTEGER NOT NULL,
            REG_NAME            VARCHAR(256),
            REG_VERSION         INTEGER NOT NULL,
            REG_MEDIA_TYPE      VARCHAR(500),
            REG_CREATOR         VARCHAR(31) NOT NULL,
            REG_CREATED_TIME    TIMESTAMP NOT NULL,
            REG_LAST_UPDATOR    VARCHAR(31),
            REG_LAST_UPDATED_TIME    TIMESTAMP NOT NULL,
            REG_DESCRIPTION     VARCHAR(1000),
            REG_CONTENT_ID      INTEGER,
            REG_DELETED         SMALLINT,
            REG_TENANT_ID INTEGER DEFAULT 0,
            REG_UUID VARCHAR(100) NOT NULL,
            CONSTRAINT PK_REG_RESOURCE_HISTORY PRIMARY KEY(REG_VERSION, REG_TENANT_ID)
);

ALTER TABLE REG_RESOURCE_HISTORY ADD CONSTRAINT REG_RESOURCE_HIST_FK_BY_PATHID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE_HISTORY ADD CONSTRAINT REG_RESOURCE_HIST_FK_BY_CONTENT_ID FOREIGN KEY (REG_CONTENT_ID, REG_TENANT_ID) REFERENCES REG_CONTENT_HISTORY (REG_CONTENT_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_HISTORY_IND_BY_NAME  ON REG_RESOURCE_HISTORY(REG_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_HISTORY_IND_BY_PATH_ID_NAME  ON REG_RESOURCE(REG_PATH_ID, REG_NAME, REG_TENANT_ID);

DROP TABLE IF EXISTS REG_COMMENT;
DROP SEQUENCE IF EXISTS REG_COMMENT_PK_SEQ;
CREATE SEQUENCE REG_COMMENT_PK_SEQ;
CREATE TABLE REG_COMMENT (
            REG_ID        INTEGER DEFAULT NEXTVAL('REG_COMMENT_PK_SEQ'),
            REG_COMMENT_TEXT      VARCHAR(500) NOT NULL,
            REG_USER_ID           VARCHAR(31) NOT NULL,
            REG_COMMENTED_TIME    TIMESTAMP NOT NULL,
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_COMMENT PRIMARY KEY(REG_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_RESOURCE_COMMENT;
CREATE TABLE REG_RESOURCE_COMMENT (
            REG_COMMENT_ID          INTEGER NOT NULL,
            REG_VERSION             INTEGER,
            REG_PATH_ID             INTEGER,
            REG_RESOURCE_NAME       VARCHAR(256),
            REG_TENANT_ID INTEGER DEFAULT 0
);

ALTER TABLE REG_RESOURCE_COMMENT ADD CONSTRAINT REG_RESOURCE_COMMENT_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE_COMMENT ADD CONSTRAINT REG_RESOURCE_COMMENT_FK_BY_COMMENT_ID FOREIGN KEY (REG_COMMENT_ID, REG_TENANT_ID) REFERENCES REG_COMMENT (REG_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_COMMENT_IND_BY_PATH_ID_AND_RESOURCE_NAME  ON REG_RESOURCE_COMMENT(REG_PATH_ID, REG_RESOURCE_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_COMMENT_IND_BY_VERSION  ON REG_RESOURCE_COMMENT(REG_VERSION, REG_TENANT_ID);

DROP TABLE IF EXISTS REG_RATING;
DROP SEQUENCE IF EXISTS REG_RATING_PK_SEQ;
CREATE SEQUENCE REG_RATING_PK_SEQ;
CREATE TABLE REG_RATING (
            REG_ID     INTEGER DEFAULT NEXTVAL('REG_RATING_PK_SEQ'),
            REG_RATING        INTEGER NOT NULL,
            REG_USER_ID       VARCHAR(31) NOT NULL,
            REG_RATED_TIME    TIMESTAMP NOT NULL,
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_RATING PRIMARY KEY(REG_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_RESOURCE_RATING;
CREATE TABLE REG_RESOURCE_RATING (
            REG_RATING_ID           INTEGER NOT NULL,
            REG_VERSION             INTEGER,
            REG_PATH_ID             INTEGER,
            REG_RESOURCE_NAME       VARCHAR(256),
            REG_TENANT_ID INTEGER DEFAULT 0
);

ALTER TABLE REG_RESOURCE_RATING ADD CONSTRAINT REG_RESOURCE_RATING_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE_RATING ADD CONSTRAINT REG_RESOURCE_RATING_FK_BY_RATING_ID FOREIGN KEY (REG_RATING_ID, REG_TENANT_ID) REFERENCES REG_RATING (REG_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_RATING_IND_BY_PATH_ID_AND_RESOURCE_NAME  ON REG_RESOURCE_RATING(REG_PATH_ID, REG_RESOURCE_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_RATING_IND_BY_VERSION  ON REG_RESOURCE_RATING(REG_VERSION, REG_TENANT_ID);

DROP TABLE IF EXISTS REG_TAG;
DROP SEQUENCE IF EXISTS REG_TAG_PK_SEQ;
CREATE SEQUENCE REG_TAG_PK_SEQ;
CREATE TABLE REG_TAG (
            REG_ID         INTEGER DEFAULT NEXTVAL('REG_TAG_PK_SEQ'),
            REG_TAG_NAME       VARCHAR(500) NOT NULL,
            REG_USER_ID        VARCHAR(31) NOT NULL,
            REG_TAGGED_TIME    TIMESTAMP NOT NULL,
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_TAG PRIMARY KEY(REG_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_RESOURCE_TAG;
CREATE TABLE REG_RESOURCE_TAG (
            REG_TAG_ID              INTEGER NOT NULL,
            REG_VERSION             INTEGER,
            REG_PATH_ID             INTEGER,
            REG_RESOURCE_NAME       VARCHAR(256),
            REG_TENANT_ID INTEGER DEFAULT 0
);

ALTER TABLE REG_RESOURCE_TAG ADD CONSTRAINT REG_RESOURCE_TAG_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE_TAG ADD CONSTRAINT REG_RESOURCE_TAG_FK_BY_TAG_ID FOREIGN KEY (REG_TAG_ID, REG_TENANT_ID) REFERENCES REG_TAG (REG_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_TAG_IND_BY_PATH_ID_AND_RESOURCE_NAME  ON REG_RESOURCE_TAG(REG_PATH_ID, REG_RESOURCE_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_TAG_IND_BY_VERSION  ON REG_RESOURCE_TAG(REG_VERSION, REG_TENANT_ID);

DROP TABLE IF EXISTS REG_PROPERTY;
DROP SEQUENCE IF EXISTS REG_PROPERTY_PK_SEQ;
CREATE SEQUENCE REG_PROPERTY_PK_SEQ;
CREATE TABLE REG_PROPERTY (
            REG_ID         INTEGER DEFAULT NEXTVAL('REG_PROPERTY_PK_SEQ'),
            REG_NAME       VARCHAR(100) NOT NULL,
            REG_VALUE        VARCHAR(1000),
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_PROPERTY PRIMARY KEY(REG_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_RESOURCE_PROPERTY;
CREATE TABLE REG_RESOURCE_PROPERTY (
            REG_PROPERTY_ID         INTEGER NOT NULL,
            REG_VERSION             INTEGER,
            REG_PATH_ID             INTEGER,
            REG_RESOURCE_NAME       VARCHAR(256),
            REG_TENANT_ID INTEGER DEFAULT 0
);

ALTER TABLE REG_RESOURCE_PROPERTY ADD CONSTRAINT REG_RESOURCE_PROPERTY_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE_PROPERTY ADD CONSTRAINT REG_RESOURCE_PROPERTY_FK_BY_TAG_ID FOREIGN KEY (REG_PROPERTY_ID, REG_TENANT_ID) REFERENCES REG_PROPERTY (REG_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_PROPERTY_IND_BY_PATH_ID_AND_RESOURCE_NAME  ON REG_RESOURCE_PROPERTY(REG_PATH_ID, REG_RESOURCE_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_PROPERTY_IND_BY_VERSION  ON REG_RESOURCE_PROPERTY(REG_VERSION, REG_TENANT_ID);


DROP TABLE IF EXISTS REG_ASSOCIATION;
DROP SEQUENCE IF EXISTS REG_ASSOCIATION_PK_SEQ;
CREATE SEQUENCE REG_ASSOCIATION_PK_SEQ;
CREATE TABLE REG_ASSOCIATION (
            REG_ASSOCIATION_ID INTEGER DEFAULT NEXTVAL('REG_ASSOCIATION_PK_SEQ'),
            REG_SOURCEPATH VARCHAR (2000) NOT NULL,
            REG_TARGETPATH VARCHAR (2000) NOT NULL,
            REG_ASSOCIATION_TYPE VARCHAR (2000) NOT NULL,
            REG_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (REG_ASSOCIATION_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_SNAPSHOT;
DROP SEQUENCE IF EXISTS REG_SNAPSHOT_PK_SEQ;
CREATE SEQUENCE REG_SNAPSHOT_PK_SEQ;
CREATE TABLE REG_SNAPSHOT (
            REG_SNAPSHOT_ID     INTEGER DEFAULT NEXTVAL('REG_SNAPSHOT_PK_SEQ'),
            REG_PATH_ID            INTEGER NOT NULL,
            REG_RESOURCE_NAME      VARCHAR(255),
            REG_RESOURCE_VIDS     BYTEA NOT NULL,
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_SNAPSHOT PRIMARY KEY(REG_SNAPSHOT_ID, REG_TENANT_ID)
);

CREATE INDEX REG_SNAPSHOT_IND_BY_PATH_ID_AND_RESOURCE_NAME  ON REG_SNAPSHOT(REG_PATH_ID, REG_RESOURCE_NAME, REG_TENANT_ID);

ALTER TABLE REG_SNAPSHOT ADD CONSTRAINT REG_SNAPSHOT_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);


-- ################################
-- USER MANAGER TABLES
-- ################################

DROP TABLE IF EXISTS UM_TENANT;
DROP SEQUENCE IF EXISTS UM_TENANT_PK_SEQ;
CREATE SEQUENCE UM_TENANT_PK_SEQ;
CREATE TABLE UM_TENANT (
			UM_ID INTEGER DEFAULT NEXTVAL('UM_TENANT_PK_SEQ'),
			UM_DOMAIN_NAME VARCHAR(255) NOT NULL,
            UM_EMAIL VARCHAR(255),
            UM_ACTIVE BOOLEAN DEFAULT FALSE,
	        UM_CREATED_DATE TIMESTAMP NOT NULL,
	        UM_USER_CONFIG BYTEA,
			PRIMARY KEY (UM_ID),
			UNIQUE(UM_DOMAIN_NAME));

CREATE INDEX INDEX_UM_TENANT_UM_DOMAIN_NAME
                    ON UM_TENANT (UM_DOMAIN_NAME); 


DROP TABLE IF EXISTS UM_DOMAIN;
DROP SEQUENCE IF EXISTS UM_DOMAIN_PK_SEQ;
CREATE SEQUENCE UM_DOMAIN_PK_SEQ;
CREATE TABLE UM_DOMAIN(
            UM_DOMAIN_ID INTEGER DEFAULT NEXTVAL('UM_DOMAIN_PK_SEQ'),
            UM_DOMAIN_NAME VARCHAR(255),
            UM_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (UM_DOMAIN_ID, UM_TENANT_ID)
);


DROP TABLE IF EXISTS UM_USER CASCADE;			
DROP SEQUENCE IF EXISTS UM_USER_PK_SEQ;
CREATE SEQUENCE UM_USER_PK_SEQ;
CREATE TABLE UM_USER ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_USER_PK_SEQ'), 
             UM_USER_NAME VARCHAR(255) NOT NULL, 
             UM_USER_PASSWORD VARCHAR(255) NOT NULL,
             UM_SALT_VALUE VARCHAR(31),
             UM_REQUIRE_CHANGE BOOLEAN DEFAULT FALSE,
             UM_CHANGED_TIME TIMESTAMP NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0, 
             PRIMARY KEY (UM_ID, UM_TENANT_ID), 
             UNIQUE(UM_USER_NAME, UM_TENANT_ID)
);
 

DROP TABLE IF EXISTS UM_SYSTEM_USER  CASCADE;			
DROP SEQUENCE IF EXISTS UM_SYSTEM_USER_PK_SEQ;
CREATE SEQUENCE UM_SYSTEM_USER_PK_SEQ;
CREATE TABLE UM_SYSTEM_USER ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_SYSTEM_USER_PK_SEQ'), 
             UM_USER_NAME VARCHAR(255) NOT NULL, 
             UM_USER_PASSWORD VARCHAR(255) NOT NULL,
             UM_SALT_VALUE VARCHAR(31),
             UM_REQUIRE_CHANGE BOOLEAN DEFAULT FALSE,
             UM_CHANGED_TIME TIMESTAMP NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0, 
             PRIMARY KEY (UM_ID, UM_TENANT_ID), 
             UNIQUE(UM_USER_NAME, UM_TENANT_ID)
); 

DROP TABLE IF EXISTS UM_ROLE CASCADE;
DROP SEQUENCE IF EXISTS UM_ROLE_PK_SEQ;
CREATE SEQUENCE UM_ROLE_PK_SEQ;
CREATE TABLE UM_ROLE ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_ROLE_PK_SEQ'), 
             UM_ROLE_NAME VARCHAR(255) NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0,
		UM_SHARED_ROLE BOOLEAN DEFAULT FALSE,  
             PRIMARY KEY (UM_ID, UM_TENANT_ID),
             UNIQUE(UM_ROLE_NAME, UM_TENANT_ID) 
);


DROP TABLE IF EXISTS UM_MODULE CASCADE;
DROP SEQUENCE IF EXISTS UM_MODULE_PK_SEQ;
CREATE SEQUENCE UM_MODULE_PK_SEQ;
CREATE TABLE UM_MODULE(
	UM_ID INTEGER  DEFAULT NEXTVAL('UM_MODULE_PK_SEQ'),
	UM_MODULE_NAME VARCHAR(100),
	UNIQUE(UM_MODULE_NAME),
	PRIMARY KEY(UM_ID)
);

DROP TABLE IF EXISTS UM_MODULE_ACTIONS CASCADE;
CREATE TABLE UM_MODULE_ACTIONS(
	UM_ACTION VARCHAR(255) NOT NULL,
	UM_MODULE_ID INTEGER NOT NULL,
	PRIMARY KEY(UM_ACTION, UM_MODULE_ID),
	FOREIGN KEY (UM_MODULE_ID) REFERENCES UM_MODULE(UM_ID) ON DELETE CASCADE
);


DROP TABLE IF EXISTS UM_PERMISSION CASCADE;
DROP SEQUENCE IF EXISTS UM_PERMISSION_PK_SEQ;
CREATE SEQUENCE UM_PERMISSION_PK_SEQ;
CREATE TABLE UM_PERMISSION ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_PERMISSION_PK_SEQ'), 
             UM_RESOURCE_ID VARCHAR(255) NOT NULL, 
             UM_ACTION VARCHAR(255) NOT NULL, 
             UM_TENANT_ID INTEGER DEFAULT 0, 
	     UM_MODULE_ID INTEGER DEFAULT 0,
	         	 UNIQUE(UM_RESOURCE_ID,UM_ACTION, UM_TENANT_ID),
             PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

CREATE INDEX INDEX_UM_PERMISSION_UM_RESOURCE_ID_UM_ACTION 
                    ON UM_PERMISSION (UM_RESOURCE_ID, UM_ACTION, UM_TENANT_ID); 

					
DROP TABLE IF EXISTS UM_ROLE_PERMISSION;
DROP SEQUENCE IF EXISTS UM_ROLE_PERMISSION_PK_SEQ;
CREATE SEQUENCE UM_ROLE_PERMISSION_PK_SEQ;
CREATE TABLE UM_ROLE_PERMISSION ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_ROLE_PERMISSION_PK_SEQ'), 
             UM_PERMISSION_ID INTEGER NOT NULL, 
             UM_ROLE_NAME VARCHAR(255) NOT NULL,
             UM_IS_ALLOWED SMALLINT NOT NULL, 
             UM_TENANT_ID INTEGER DEFAULT 0, 
	     UM_DOMAIN_ID INTEGER,
             FOREIGN KEY (UM_PERMISSION_ID, UM_TENANT_ID) REFERENCES UM_PERMISSION(UM_ID, UM_TENANT_ID) ON DELETE CASCADE,
	     FOREIGN KEY (UM_DOMAIN_ID, UM_TENANT_ID) REFERENCES UM_DOMAIN(UM_DOMAIN_ID, UM_TENANT_ID) ON DELETE CASCADE, 
             PRIMARY KEY (UM_ID, UM_TENANT_ID) 
); 

-- REMOVED UNIQUE (UM_PERMISSION_ID, UM_ROLE_ID) 
DROP TABLE IF EXISTS UM_USER_PERMISSION;
DROP SEQUENCE IF EXISTS UM_USER_PERMISSION_PK_SEQ;
CREATE SEQUENCE UM_USER_PERMISSION_PK_SEQ;
CREATE TABLE UM_USER_PERMISSION ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_USER_PERMISSION_PK_SEQ'), 
             UM_PERMISSION_ID INTEGER NOT NULL, 
             UM_USER_NAME VARCHAR(255) NOT NULL,
             UM_IS_ALLOWED SMALLINT NOT NULL,          
             UM_TENANT_ID INTEGER DEFAULT 0, 
             FOREIGN KEY (UM_PERMISSION_ID, UM_TENANT_ID) REFERENCES UM_PERMISSION(UM_ID, UM_TENANT_ID) ON DELETE CASCADE,
             PRIMARY KEY (UM_ID, UM_TENANT_ID)
);

-- REMOVED UNIQUE (UM_PERMISSION_ID, UM_USER_ID) 
DROP TABLE IF EXISTS UM_USER_ROLE;
DROP SEQUENCE IF EXISTS UM_USER_ROLE_PK_SEQ;
CREATE SEQUENCE UM_USER_ROLE_PK_SEQ;
CREATE TABLE UM_USER_ROLE ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_USER_ROLE_PK_SEQ'), 
             UM_ROLE_ID INTEGER NOT NULL, 
             UM_USER_ID INTEGER NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0,  
             UNIQUE (UM_USER_ID, UM_ROLE_ID, UM_TENANT_ID), 
             FOREIGN KEY (UM_ROLE_ID, UM_TENANT_ID) REFERENCES UM_ROLE(UM_ID, UM_TENANT_ID), 
             FOREIGN KEY (UM_USER_ID, UM_TENANT_ID) REFERENCES UM_USER(UM_ID, UM_TENANT_ID), 
             PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

DROP TABLE IF EXISTS UM_SHARED_USER_ROLE;
CREATE TABLE UM_SHARED_USER_ROLE(
    UM_ROLE_ID INTEGER NOT NULL,
    UM_USER_ID INTEGER NOT NULL,
    UM_USER_TENANT_ID INTEGER NOT NULL,
    UM_ROLE_TENANT_ID INTEGER NOT NULL,
    UNIQUE(UM_USER_ID,UM_ROLE_ID,UM_USER_TENANT_ID, UM_ROLE_TENANT_ID),
    FOREIGN KEY(UM_ROLE_ID,UM_ROLE_TENANT_ID) REFERENCES UM_ROLE(UM_ID,UM_TENANT_ID) ON DELETE CASCADE ,
    FOREIGN KEY(UM_USER_ID,UM_USER_TENANT_ID) REFERENCES UM_USER(UM_ID,UM_TENANT_ID) ON DELETE CASCADE 
);

DROP TABLE IF EXISTS UM_ACCOUNT_MAPPING;
DROP SEQUENCE IF EXISTS UM_ACCOUNT_MAPPING_SEQ;
CREATE SEQUENCE UM_ACCOUNT_MAPPING_SEQ;
CREATE TABLE UM_ACCOUNT_MAPPING(
	UM_ID INTEGER DEFAULT NEXTVAL('UM_ACCOUNT_MAPPING_SEQ'),
	UM_USER_NAME VARCHAR(255) NOT NULL,
	UM_TENANT_ID INTEGER NOT NULL,
	UM_USER_STORE_DOMAIN VARCHAR(100),
	UM_ACC_LINK_ID INTEGER NOT NULL,
	UNIQUE(UM_USER_NAME, UM_TENANT_ID, UM_USER_STORE_DOMAIN, UM_ACC_LINK_ID),
	FOREIGN KEY (UM_TENANT_ID) REFERENCES UM_TENANT(UM_ID) ON DELETE CASCADE,
	PRIMARY KEY (UM_ID)
);

DROP TABLE IF EXISTS UM_USER_ATTRIBUTE;
DROP SEQUENCE IF EXISTS UM_USER_ATTRIBUTE_PK_SEQ;
CREATE SEQUENCE UM_USER_ATTRIBUTE_PK_SEQ;
CREATE TABLE UM_USER_ATTRIBUTE ( 
            UM_ID INTEGER DEFAULT NEXTVAL('UM_USER_ATTRIBUTE_PK_SEQ'), 
            UM_ATTR_NAME VARCHAR(255) NOT NULL, 
            UM_ATTR_VALUE VARCHAR(1024), 
            UM_PROFILE_ID VARCHAR(255), 
            UM_USER_ID INTEGER, 
            UM_TENANT_ID INTEGER DEFAULT 0, 
            FOREIGN KEY (UM_USER_ID, UM_TENANT_ID) REFERENCES UM_USER(UM_ID, UM_TENANT_ID), 
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

CREATE INDEX UM_USER_ID_INDEX ON UM_USER_ATTRIBUTE(UM_USER_ID);

DROP TABLE IF EXISTS UM_DIALECT CASCADE;
DROP SEQUENCE IF EXISTS UM_DIALECT_PK_SEQ;
CREATE SEQUENCE UM_DIALECT_PK_SEQ;
CREATE TABLE UM_DIALECT( 
            UM_ID INTEGER DEFAULT NEXTVAL('UM_DIALECT_PK_SEQ'), 
            UM_DIALECT_URI VARCHAR(255) NOT NULL, 
            UM_TENANT_ID INTEGER DEFAULT 0, 
            UNIQUE(UM_DIALECT_URI, UM_TENANT_ID), 
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

DROP TABLE IF EXISTS UM_CLAIM;
DROP SEQUENCE IF EXISTS UM_CLAIM_PK_SEQ;
CREATE SEQUENCE UM_CLAIM_PK_SEQ;
CREATE TABLE UM_CLAIM( 
            UM_ID INTEGER DEFAULT NEXTVAL('UM_CLAIM_PK_SEQ'), 
            UM_DIALECT_ID INTEGER NOT NULL, 
            UM_CLAIM_URI VARCHAR(255) NOT NULL, 
            UM_DISPLAY_TAG VARCHAR(255), 
            UM_DESCRIPTION VARCHAR(255), 
            UM_MAPPED_ATTRIBUTE_DOMAIN VARCHAR(255),
            UM_MAPPED_ATTRIBUTE VARCHAR(255), 
            UM_REG_EX VARCHAR(255), 
            UM_SUPPORTED SMALLINT, 
            UM_REQUIRED SMALLINT, 
            UM_DISPLAY_ORDER INTEGER,
	    UM_CHECKED_ATTRIBUTE SMALLINT,
	    UM_READ_ONLY SMALLINT,
            UM_TENANT_ID INTEGER DEFAULT 0, 
            UNIQUE(UM_DIALECT_ID, UM_CLAIM_URI, UM_TENANT_ID), 
            FOREIGN KEY(UM_DIALECT_ID, UM_TENANT_ID) REFERENCES UM_DIALECT(UM_ID, UM_TENANT_ID), 
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

DROP TABLE IF EXISTS UM_PROFILE_CONFIG;
DROP SEQUENCE IF EXISTS UM_PROFILE_CONFIG_PK_SEQ;
CREATE SEQUENCE UM_PROFILE_CONFIG_PK_SEQ;
CREATE TABLE UM_PROFILE_CONFIG( 
            UM_ID INTEGER DEFAULT NEXTVAL('UM_PROFILE_CONFIG_PK_SEQ'), 
            UM_DIALECT_ID INTEGER NOT NULL, 
            UM_PROFILE_NAME VARCHAR(255), 
            UM_TENANT_ID INTEGER DEFAULT 0, 
            FOREIGN KEY(UM_DIALECT_ID, UM_TENANT_ID) REFERENCES UM_DIALECT(UM_ID, UM_TENANT_ID), 
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

DROP TABLE IF EXISTS UM_CLAIM_BEHAVIOR;    
DROP SEQUENCE IF EXISTS UM_CLAIM_BEHAVIOR_PK_SEQ;
CREATE SEQUENCE UM_CLAIM_BEHAVIOR_PK_SEQ;
CREATE TABLE UM_CLAIM_BEHAVIOR( 
            UM_ID INTEGER DEFAULT NEXTVAL('UM_CLAIM_BEHAVIOR_PK_SEQ'), 
            UM_PROFILE_ID INTEGER, 
            UM_CLAIM_ID INTEGER, 
            UM_BEHAVIOUR SMALLINT, 
            UM_TENANT_ID INTEGER DEFAULT 0, 
            FOREIGN KEY(UM_PROFILE_ID, UM_TENANT_ID) REFERENCES UM_PROFILE_CONFIG(UM_ID, UM_TENANT_ID), 
            FOREIGN KEY(UM_CLAIM_ID, UM_TENANT_ID) REFERENCES UM_CLAIM(UM_ID, UM_TENANT_ID), 
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

DROP TABLE IF EXISTS UM_HYBRID_ROLE;
DROP SEQUENCE IF EXISTS UM_HYBRID_ROLE_PK_SEQ;
CREATE SEQUENCE UM_HYBRID_ROLE_PK_SEQ;
CREATE TABLE UM_HYBRID_ROLE(
            UM_ID INTEGER DEFAULT NEXTVAL('UM_HYBRID_ROLE_PK_SEQ'),
            UM_ROLE_NAME VARCHAR(255),
            UM_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
);

DROP TABLE IF EXISTS UM_HYBRID_USER_ROLE;
DROP SEQUENCE IF EXISTS UM_HYBRID_USER_ROLE_PK_SEQ;
CREATE SEQUENCE UM_HYBRID_USER_ROLE_PK_SEQ;
CREATE TABLE UM_HYBRID_USER_ROLE(
            UM_ID INTEGER DEFAULT NEXTVAL('UM_HYBRID_USER_ROLE_PK_SEQ'),
            UM_USER_NAME VARCHAR(255),
            UM_ROLE_ID INTEGER NOT NULL,
            UM_TENANT_ID INTEGER DEFAULT 0,
	    UM_DOMAIN_ID INTEGER,
            UNIQUE (UM_USER_NAME, UM_ROLE_ID, UM_TENANT_ID, UM_DOMAIN_ID),
            FOREIGN KEY (UM_ROLE_ID, UM_TENANT_ID) REFERENCES UM_HYBRID_ROLE(UM_ID, UM_TENANT_ID) ON DELETE CASCADE,
	    FOREIGN KEY (UM_DOMAIN_ID, UM_TENANT_ID) REFERENCES UM_DOMAIN(UM_DOMAIN_ID, UM_TENANT_ID) ON DELETE CASCADE,
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
);

DROP TABLE IF EXISTS UM_SYSTEM_ROLE;
DROP SEQUENCE IF EXISTS UM_SYSTEM_ROLE_PK_SEQ;
CREATE SEQUENCE UM_SYSTEM_ROLE_PK_SEQ;
CREATE TABLE UM_SYSTEM_ROLE(
            UM_ID INTEGER DEFAULT NEXTVAL('UM_SYSTEM_ROLE_PK_SEQ'),
            UM_ROLE_NAME VARCHAR(255),
            UM_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
);

CREATE INDEX SYSTEM_ROLE_IND_BY_RN_TI ON UM_SYSTEM_ROLE(UM_ROLE_NAME, UM_TENANT_ID);

DROP TABLE IF EXISTS UM_SYSTEM_USER_ROLE;
DROP SEQUENCE IF EXISTS UM_SYSTEM_USER_ROLE_PK_SEQ;
CREATE SEQUENCE UM_SYSTEM_USER_ROLE_PK_SEQ;
CREATE TABLE UM_SYSTEM_USER_ROLE(
            UM_ID INTEGER DEFAULT NEXTVAL('UM_SYSTEM_USER_ROLE_PK_SEQ'),
            UM_USER_NAME VARCHAR(255),
            UM_ROLE_ID INTEGER NOT NULL,
            UM_TENANT_ID INTEGER DEFAULT 0,
            UNIQUE (UM_USER_NAME, UM_ROLE_ID, UM_TENANT_ID),
            FOREIGN KEY (UM_ROLE_ID, UM_TENANT_ID) REFERENCES UM_SYSTEM_ROLE(UM_ID, UM_TENANT_ID),
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
);



DROP TABLE IF EXISTS UM_HYBRID_REMEMBER_ME;
DROP SEQUENCE IF EXISTS UM_HYBRID_REMEMBER_ME_PK_SEQ;
CREATE SEQUENCE UM_HYBRID_REMEMBER_ME_PK_SEQ;
CREATE TABLE UM_HYBRID_REMEMBER_ME(
            UM_ID INTEGER DEFAULT NEXTVAL('UM_HYBRID_REMEMBER_ME_PK_SEQ'),
            UM_USER_NAME VARCHAR(255) NOT NULL,
			UM_COOKIE_VALUE VARCHAR(1024),
			UM_CREATED_TIME TIMESTAMP,
            UM_TENANT_ID INTEGER DEFAULT 0,
			PRIMARY KEY (UM_ID, UM_TENANT_ID)
);

-- create WSO2REG_DB

\c wso2reg_db;

\echo  'create tables for WSO2REG_DB';



DROP TABLE IF EXISTS REG_CLUSTER_LOCK;
CREATE TABLE REG_CLUSTER_LOCK (
             REG_LOCK_NAME VARCHAR (20),
             REG_LOCK_STATUS VARCHAR (20),
             REG_LOCKED_TIME TIMESTAMP,
             REG_TENANT_ID INTEGER DEFAULT 0,
             PRIMARY KEY (REG_LOCK_NAME)
);

DROP TABLE IF EXISTS REG_LOG;
DROP SEQUENCE IF EXISTS REG_LOG_PK_SEQ;
CREATE SEQUENCE REG_LOG_PK_SEQ;
CREATE TABLE REG_LOG (
             REG_LOG_ID INTEGER DEFAULT NEXTVAL('REG_LOG_PK_SEQ'),
             REG_PATH VARCHAR (2000),
             REG_USER_ID VARCHAR (31) NOT NULL,
             REG_LOGGED_TIME TIMESTAMP NOT NULL,
             REG_ACTION INTEGER NOT NULL,
             REG_ACTION_DATA VARCHAR (500),
             REG_TENANT_ID INTEGER DEFAULT 0,
             PRIMARY KEY (REG_LOG_ID, REG_TENANT_ID)
);

CREATE INDEX REG_LOG_IND_BY_REG_LOGTIME ON REG_LOG(REG_LOGGED_TIME, REG_TENANT_ID);

DROP TABLE IF EXISTS REG_PATH;
DROP SEQUENCE IF EXISTS REG_PATH_PK_SEQ;
CREATE SEQUENCE REG_PATH_PK_SEQ;
CREATE TABLE REG_PATH(
             REG_PATH_ID INTEGER DEFAULT NEXTVAL('REG_PATH_PK_SEQ'),
             REG_PATH_VALUE VARCHAR(2000) NOT NULL,
             REG_PATH_PARENT_ID INTEGER,
             REG_TENANT_ID INTEGER DEFAULT 0,
             CONSTRAINT PK_REG_PATH PRIMARY KEY(REG_PATH_ID, REG_TENANT_ID)
);

CREATE INDEX REG_PATH_IND_BY_PATH_VALUE ON REG_PATH(REG_PATH_VALUE, REG_TENANT_ID);
CREATE INDEX REG_PATH_IND_BY_PATH_PARENT_ID  ON REG_PATH(REG_PATH_PARENT_ID, REG_TENANT_ID);

DROP TABLE IF EXISTS REG_CONTENT;
DROP SEQUENCE IF EXISTS REG_CONTENT_PK_SEQ;
CREATE SEQUENCE REG_CONTENT_PK_SEQ;
CREATE TABLE REG_CONTENT (
             REG_CONTENT_ID INTEGER DEFAULT NEXTVAL('REG_CONTENT_PK_SEQ'),
             REG_CONTENT_DATA BYTEA,
             REG_TENANT_ID INTEGER DEFAULT 0,
             CONSTRAINT PK_REG_CONTENT PRIMARY KEY(REG_CONTENT_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_CONTENT_HISTORY;
CREATE TABLE REG_CONTENT_HISTORY (
             REG_CONTENT_ID INTEGER NOT NULL,
             REG_CONTENT_DATA BYTEA,
             REG_DELETED   SMALLINT,
             REG_TENANT_ID INTEGER DEFAULT 0,
             CONSTRAINT PK_REG_CONTENT_HISTORY PRIMARY KEY(REG_CONTENT_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_RESOURCE;
DROP SEQUENCE IF EXISTS REG_RESOURCE_PK_SEQ;
CREATE SEQUENCE REG_RESOURCE_PK_SEQ;
CREATE TABLE REG_RESOURCE (
            REG_PATH_ID         INTEGER NOT NULL,
            REG_NAME            VARCHAR(256),
            REG_VERSION         INTEGER DEFAULT NEXTVAL('REG_RESOURCE_PK_SEQ'),
            REG_MEDIA_TYPE      VARCHAR(500),
            REG_CREATOR         VARCHAR(31) NOT NULL,
            REG_CREATED_TIME    TIMESTAMP NOT NULL,
            REG_LAST_UPDATOR    VARCHAR(31),
            REG_LAST_UPDATED_TIME    TIMESTAMP NOT NULL,
            REG_DESCRIPTION     VARCHAR(1000),
            REG_CONTENT_ID      INTEGER,
            REG_TENANT_ID INTEGER DEFAULT 0,
            REG_UUID VARCHAR(100) NOT NULL,
            CONSTRAINT PK_REG_RESOURCE PRIMARY KEY(REG_VERSION, REG_TENANT_ID)
);

ALTER TABLE REG_RESOURCE ADD CONSTRAINT REG_RESOURCE_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE ADD CONSTRAINT REG_RESOURCE_FK_BY_CONTENT_ID FOREIGN KEY (REG_CONTENT_ID, REG_TENANT_ID) REFERENCES REG_CONTENT (REG_CONTENT_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_IND_BY_NAME  ON REG_RESOURCE(REG_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_IND_BY_PATH_ID_NAME  ON REG_RESOURCE(REG_PATH_ID, REG_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_IND_BY_UUID  ON REG_RESOURCE(REG_UUID);
CREATE INDEX REG_RESOURCE_IND_BY_TENANT ON REG_RESOURCE(REG_TENANT_ID, REG_UUID);
CREATE INDEX REG_RESOURCE_IND_BY_TYPE ON REG_RESOURCE(REG_TENANT_ID, REG_MEDIA_TYPE);

DROP TABLE IF EXISTS REG_RESOURCE_HISTORY;
CREATE TABLE REG_RESOURCE_HISTORY (
            REG_PATH_ID         INTEGER NOT NULL,
            REG_NAME            VARCHAR(256),
            REG_VERSION         INTEGER NOT NULL,
            REG_MEDIA_TYPE      VARCHAR(500),
            REG_CREATOR         VARCHAR(31) NOT NULL,
            REG_CREATED_TIME    TIMESTAMP NOT NULL,
            REG_LAST_UPDATOR    VARCHAR(31),
            REG_LAST_UPDATED_TIME    TIMESTAMP NOT NULL,
            REG_DESCRIPTION     VARCHAR(1000),
            REG_CONTENT_ID      INTEGER,
            REG_DELETED         SMALLINT,
            REG_TENANT_ID INTEGER DEFAULT 0,
            REG_UUID VARCHAR(100) NOT NULL,
            CONSTRAINT PK_REG_RESOURCE_HISTORY PRIMARY KEY(REG_VERSION, REG_TENANT_ID)
);

ALTER TABLE REG_RESOURCE_HISTORY ADD CONSTRAINT REG_RESOURCE_HIST_FK_BY_PATHID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE_HISTORY ADD CONSTRAINT REG_RESOURCE_HIST_FK_BY_CONTENT_ID FOREIGN KEY (REG_CONTENT_ID, REG_TENANT_ID) REFERENCES REG_CONTENT_HISTORY (REG_CONTENT_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_HISTORY_IND_BY_NAME  ON REG_RESOURCE_HISTORY(REG_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_HISTORY_IND_BY_PATH_ID_NAME  ON REG_RESOURCE(REG_PATH_ID, REG_NAME, REG_TENANT_ID);

DROP TABLE IF EXISTS REG_COMMENT;
DROP SEQUENCE IF EXISTS REG_COMMENT_PK_SEQ;
CREATE SEQUENCE REG_COMMENT_PK_SEQ;
CREATE TABLE REG_COMMENT (
            REG_ID        INTEGER DEFAULT NEXTVAL('REG_COMMENT_PK_SEQ'),
            REG_COMMENT_TEXT      VARCHAR(500) NOT NULL,
            REG_USER_ID           VARCHAR(31) NOT NULL,
            REG_COMMENTED_TIME    TIMESTAMP NOT NULL,
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_COMMENT PRIMARY KEY(REG_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_RESOURCE_COMMENT;
CREATE TABLE REG_RESOURCE_COMMENT (
            REG_COMMENT_ID          INTEGER NOT NULL,
            REG_VERSION             INTEGER,
            REG_PATH_ID             INTEGER,
            REG_RESOURCE_NAME       VARCHAR(256),
            REG_TENANT_ID INTEGER DEFAULT 0
);

ALTER TABLE REG_RESOURCE_COMMENT ADD CONSTRAINT REG_RESOURCE_COMMENT_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE_COMMENT ADD CONSTRAINT REG_RESOURCE_COMMENT_FK_BY_COMMENT_ID FOREIGN KEY (REG_COMMENT_ID, REG_TENANT_ID) REFERENCES REG_COMMENT (REG_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_COMMENT_IND_BY_PATH_ID_AND_RESOURCE_NAME  ON REG_RESOURCE_COMMENT(REG_PATH_ID, REG_RESOURCE_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_COMMENT_IND_BY_VERSION  ON REG_RESOURCE_COMMENT(REG_VERSION, REG_TENANT_ID);

DROP TABLE IF EXISTS REG_RATING;
DROP SEQUENCE IF EXISTS REG_RATING_PK_SEQ;
CREATE SEQUENCE REG_RATING_PK_SEQ;
CREATE TABLE REG_RATING (
            REG_ID     INTEGER DEFAULT NEXTVAL('REG_RATING_PK_SEQ'),
            REG_RATING        INTEGER NOT NULL,
            REG_USER_ID       VARCHAR(31) NOT NULL,
            REG_RATED_TIME    TIMESTAMP NOT NULL,
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_RATING PRIMARY KEY(REG_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_RESOURCE_RATING;
CREATE TABLE REG_RESOURCE_RATING (
            REG_RATING_ID           INTEGER NOT NULL,
            REG_VERSION             INTEGER,
            REG_PATH_ID             INTEGER,
            REG_RESOURCE_NAME       VARCHAR(256),
            REG_TENANT_ID INTEGER DEFAULT 0
);

ALTER TABLE REG_RESOURCE_RATING ADD CONSTRAINT REG_RESOURCE_RATING_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE_RATING ADD CONSTRAINT REG_RESOURCE_RATING_FK_BY_RATING_ID FOREIGN KEY (REG_RATING_ID, REG_TENANT_ID) REFERENCES REG_RATING (REG_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_RATING_IND_BY_PATH_ID_AND_RESOURCE_NAME  ON REG_RESOURCE_RATING(REG_PATH_ID, REG_RESOURCE_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_RATING_IND_BY_VERSION  ON REG_RESOURCE_RATING(REG_VERSION, REG_TENANT_ID);

DROP TABLE IF EXISTS REG_TAG;
DROP SEQUENCE IF EXISTS REG_TAG_PK_SEQ;
CREATE SEQUENCE REG_TAG_PK_SEQ;
CREATE TABLE REG_TAG (
            REG_ID         INTEGER DEFAULT NEXTVAL('REG_TAG_PK_SEQ'),
            REG_TAG_NAME       VARCHAR(500) NOT NULL,
            REG_USER_ID        VARCHAR(31) NOT NULL,
            REG_TAGGED_TIME    TIMESTAMP NOT NULL,
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_TAG PRIMARY KEY(REG_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_RESOURCE_TAG;
CREATE TABLE REG_RESOURCE_TAG (
            REG_TAG_ID              INTEGER NOT NULL,
            REG_VERSION             INTEGER,
            REG_PATH_ID             INTEGER,
            REG_RESOURCE_NAME       VARCHAR(256),
            REG_TENANT_ID INTEGER DEFAULT 0
);

ALTER TABLE REG_RESOURCE_TAG ADD CONSTRAINT REG_RESOURCE_TAG_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE_TAG ADD CONSTRAINT REG_RESOURCE_TAG_FK_BY_TAG_ID FOREIGN KEY (REG_TAG_ID, REG_TENANT_ID) REFERENCES REG_TAG (REG_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_TAG_IND_BY_PATH_ID_AND_RESOURCE_NAME  ON REG_RESOURCE_TAG(REG_PATH_ID, REG_RESOURCE_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_TAG_IND_BY_VERSION  ON REG_RESOURCE_TAG(REG_VERSION, REG_TENANT_ID);

DROP TABLE IF EXISTS REG_PROPERTY;
DROP SEQUENCE IF EXISTS REG_PROPERTY_PK_SEQ;
CREATE SEQUENCE REG_PROPERTY_PK_SEQ;
CREATE TABLE REG_PROPERTY (
            REG_ID         INTEGER DEFAULT NEXTVAL('REG_PROPERTY_PK_SEQ'),
            REG_NAME       VARCHAR(100) NOT NULL,
            REG_VALUE        VARCHAR(1000),
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_PROPERTY PRIMARY KEY(REG_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_RESOURCE_PROPERTY;
CREATE TABLE REG_RESOURCE_PROPERTY (
            REG_PROPERTY_ID         INTEGER NOT NULL,
            REG_VERSION             INTEGER,
            REG_PATH_ID             INTEGER,
            REG_RESOURCE_NAME       VARCHAR(256),
            REG_TENANT_ID INTEGER DEFAULT 0
);

ALTER TABLE REG_RESOURCE_PROPERTY ADD CONSTRAINT REG_RESOURCE_PROPERTY_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE_PROPERTY ADD CONSTRAINT REG_RESOURCE_PROPERTY_FK_BY_TAG_ID FOREIGN KEY (REG_PROPERTY_ID, REG_TENANT_ID) REFERENCES REG_PROPERTY (REG_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_PROPERTY_IND_BY_PATH_ID_AND_RESOURCE_NAME  ON REG_RESOURCE_PROPERTY(REG_PATH_ID, REG_RESOURCE_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_PROPERTY_IND_BY_VERSION  ON REG_RESOURCE_PROPERTY(REG_VERSION, REG_TENANT_ID);


DROP TABLE IF EXISTS REG_ASSOCIATION;
DROP SEQUENCE IF EXISTS REG_ASSOCIATION_PK_SEQ;
CREATE SEQUENCE REG_ASSOCIATION_PK_SEQ;
CREATE TABLE REG_ASSOCIATION (
            REG_ASSOCIATION_ID INTEGER DEFAULT NEXTVAL('REG_ASSOCIATION_PK_SEQ'),
            REG_SOURCEPATH VARCHAR (2000) NOT NULL,
            REG_TARGETPATH VARCHAR (2000) NOT NULL,
            REG_ASSOCIATION_TYPE VARCHAR (2000) NOT NULL,
            REG_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (REG_ASSOCIATION_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_SNAPSHOT;
DROP SEQUENCE IF EXISTS REG_SNAPSHOT_PK_SEQ;
CREATE SEQUENCE REG_SNAPSHOT_PK_SEQ;
CREATE TABLE REG_SNAPSHOT (
            REG_SNAPSHOT_ID     INTEGER DEFAULT NEXTVAL('REG_SNAPSHOT_PK_SEQ'),
            REG_PATH_ID            INTEGER NOT NULL,
            REG_RESOURCE_NAME      VARCHAR(255),
            REG_RESOURCE_VIDS     BYTEA NOT NULL,
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_SNAPSHOT PRIMARY KEY(REG_SNAPSHOT_ID, REG_TENANT_ID)
);

CREATE INDEX REG_SNAPSHOT_IND_BY_PATH_ID_AND_RESOURCE_NAME  ON REG_SNAPSHOT(REG_PATH_ID, REG_RESOURCE_NAME, REG_TENANT_ID);

ALTER TABLE REG_SNAPSHOT ADD CONSTRAINT REG_SNAPSHOT_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);


-- ################################
-- USER MANAGER TABLES
-- ################################

DROP TABLE IF EXISTS UM_TENANT;
DROP SEQUENCE IF EXISTS UM_TENANT_PK_SEQ;
CREATE SEQUENCE UM_TENANT_PK_SEQ;
CREATE TABLE UM_TENANT (
			UM_ID INTEGER DEFAULT NEXTVAL('UM_TENANT_PK_SEQ'),
			UM_DOMAIN_NAME VARCHAR(255) NOT NULL,
            UM_EMAIL VARCHAR(255),
            UM_ACTIVE BOOLEAN DEFAULT FALSE,
	        UM_CREATED_DATE TIMESTAMP NOT NULL,
	        UM_USER_CONFIG BYTEA,
			PRIMARY KEY (UM_ID),
			UNIQUE(UM_DOMAIN_NAME));

CREATE INDEX INDEX_UM_TENANT_UM_DOMAIN_NAME
                    ON UM_TENANT (UM_DOMAIN_NAME); 


DROP TABLE IF EXISTS UM_DOMAIN;
DROP SEQUENCE IF EXISTS UM_DOMAIN_PK_SEQ;
CREATE SEQUENCE UM_DOMAIN_PK_SEQ;
CREATE TABLE UM_DOMAIN(
            UM_DOMAIN_ID INTEGER DEFAULT NEXTVAL('UM_DOMAIN_PK_SEQ'),
            UM_DOMAIN_NAME VARCHAR(255),
            UM_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (UM_DOMAIN_ID, UM_TENANT_ID)
);


DROP TABLE IF EXISTS UM_USER CASCADE;			
DROP SEQUENCE IF EXISTS UM_USER_PK_SEQ;
CREATE SEQUENCE UM_USER_PK_SEQ;
CREATE TABLE UM_USER ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_USER_PK_SEQ'), 
             UM_USER_NAME VARCHAR(255) NOT NULL, 
             UM_USER_PASSWORD VARCHAR(255) NOT NULL,
             UM_SALT_VALUE VARCHAR(31),
             UM_REQUIRE_CHANGE BOOLEAN DEFAULT FALSE,
             UM_CHANGED_TIME TIMESTAMP NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0, 
             PRIMARY KEY (UM_ID, UM_TENANT_ID), 
             UNIQUE(UM_USER_NAME, UM_TENANT_ID)
);
 

DROP TABLE IF EXISTS UM_SYSTEM_USER  CASCADE;			
DROP SEQUENCE IF EXISTS UM_SYSTEM_USER_PK_SEQ;
CREATE SEQUENCE UM_SYSTEM_USER_PK_SEQ;
CREATE TABLE UM_SYSTEM_USER ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_SYSTEM_USER_PK_SEQ'), 
             UM_USER_NAME VARCHAR(255) NOT NULL, 
             UM_USER_PASSWORD VARCHAR(255) NOT NULL,
             UM_SALT_VALUE VARCHAR(31),
             UM_REQUIRE_CHANGE BOOLEAN DEFAULT FALSE,
             UM_CHANGED_TIME TIMESTAMP NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0, 
             PRIMARY KEY (UM_ID, UM_TENANT_ID), 
             UNIQUE(UM_USER_NAME, UM_TENANT_ID)
); 

DROP TABLE IF EXISTS UM_ROLE CASCADE;
DROP SEQUENCE IF EXISTS UM_ROLE_PK_SEQ;
CREATE SEQUENCE UM_ROLE_PK_SEQ;
CREATE TABLE UM_ROLE ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_ROLE_PK_SEQ'), 
             UM_ROLE_NAME VARCHAR(255) NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0,
		UM_SHARED_ROLE BOOLEAN DEFAULT FALSE,  
             PRIMARY KEY (UM_ID, UM_TENANT_ID),
             UNIQUE(UM_ROLE_NAME, UM_TENANT_ID) 
);


DROP TABLE IF EXISTS UM_MODULE CASCADE;
DROP SEQUENCE IF EXISTS UM_MODULE_PK_SEQ;
CREATE SEQUENCE UM_MODULE_PK_SEQ;
CREATE TABLE UM_MODULE(
	UM_ID INTEGER  DEFAULT NEXTVAL('UM_MODULE_PK_SEQ'),
	UM_MODULE_NAME VARCHAR(100),
	UNIQUE(UM_MODULE_NAME),
	PRIMARY KEY(UM_ID)
);

DROP TABLE IF EXISTS UM_MODULE_ACTIONS CASCADE;
CREATE TABLE UM_MODULE_ACTIONS(
	UM_ACTION VARCHAR(255) NOT NULL,
	UM_MODULE_ID INTEGER NOT NULL,
	PRIMARY KEY(UM_ACTION, UM_MODULE_ID),
	FOREIGN KEY (UM_MODULE_ID) REFERENCES UM_MODULE(UM_ID) ON DELETE CASCADE
);


DROP TABLE IF EXISTS UM_PERMISSION CASCADE;
DROP SEQUENCE IF EXISTS UM_PERMISSION_PK_SEQ;
CREATE SEQUENCE UM_PERMISSION_PK_SEQ;
CREATE TABLE UM_PERMISSION ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_PERMISSION_PK_SEQ'), 
             UM_RESOURCE_ID VARCHAR(255) NOT NULL, 
             UM_ACTION VARCHAR(255) NOT NULL, 
             UM_TENANT_ID INTEGER DEFAULT 0, 
	     UM_MODULE_ID INTEGER DEFAULT 0,
	         	 UNIQUE(UM_RESOURCE_ID,UM_ACTION, UM_TENANT_ID),
             PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

CREATE INDEX INDEX_UM_PERMISSION_UM_RESOURCE_ID_UM_ACTION 
                    ON UM_PERMISSION (UM_RESOURCE_ID, UM_ACTION, UM_TENANT_ID); 

					
DROP TABLE IF EXISTS UM_ROLE_PERMISSION;
DROP SEQUENCE IF EXISTS UM_ROLE_PERMISSION_PK_SEQ;
CREATE SEQUENCE UM_ROLE_PERMISSION_PK_SEQ;
CREATE TABLE UM_ROLE_PERMISSION ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_ROLE_PERMISSION_PK_SEQ'), 
             UM_PERMISSION_ID INTEGER NOT NULL, 
             UM_ROLE_NAME VARCHAR(255) NOT NULL,
             UM_IS_ALLOWED SMALLINT NOT NULL, 
             UM_TENANT_ID INTEGER DEFAULT 0, 
	     UM_DOMAIN_ID INTEGER,
             FOREIGN KEY (UM_PERMISSION_ID, UM_TENANT_ID) REFERENCES UM_PERMISSION(UM_ID, UM_TENANT_ID) ON DELETE CASCADE,
	     FOREIGN KEY (UM_DOMAIN_ID, UM_TENANT_ID) REFERENCES UM_DOMAIN(UM_DOMAIN_ID, UM_TENANT_ID) ON DELETE CASCADE, 
             PRIMARY KEY (UM_ID, UM_TENANT_ID) 
); 

-- REMOVED UNIQUE (UM_PERMISSION_ID, UM_ROLE_ID) 
DROP TABLE IF EXISTS UM_USER_PERMISSION;
DROP SEQUENCE IF EXISTS UM_USER_PERMISSION_PK_SEQ;
CREATE SEQUENCE UM_USER_PERMISSION_PK_SEQ;
CREATE TABLE UM_USER_PERMISSION ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_USER_PERMISSION_PK_SEQ'), 
             UM_PERMISSION_ID INTEGER NOT NULL, 
             UM_USER_NAME VARCHAR(255) NOT NULL,
             UM_IS_ALLOWED SMALLINT NOT NULL,          
             UM_TENANT_ID INTEGER DEFAULT 0, 
             FOREIGN KEY (UM_PERMISSION_ID, UM_TENANT_ID) REFERENCES UM_PERMISSION(UM_ID, UM_TENANT_ID) ON DELETE CASCADE,
             PRIMARY KEY (UM_ID, UM_TENANT_ID)
);

-- REMOVED UNIQUE (UM_PERMISSION_ID, UM_USER_ID) 
DROP TABLE IF EXISTS UM_USER_ROLE;
DROP SEQUENCE IF EXISTS UM_USER_ROLE_PK_SEQ;
CREATE SEQUENCE UM_USER_ROLE_PK_SEQ;
CREATE TABLE UM_USER_ROLE ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_USER_ROLE_PK_SEQ'), 
             UM_ROLE_ID INTEGER NOT NULL, 
             UM_USER_ID INTEGER NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0,  
             UNIQUE (UM_USER_ID, UM_ROLE_ID, UM_TENANT_ID), 
             FOREIGN KEY (UM_ROLE_ID, UM_TENANT_ID) REFERENCES UM_ROLE(UM_ID, UM_TENANT_ID), 
             FOREIGN KEY (UM_USER_ID, UM_TENANT_ID) REFERENCES UM_USER(UM_ID, UM_TENANT_ID), 
             PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

DROP TABLE IF EXISTS UM_SHARED_USER_ROLE;
CREATE TABLE UM_SHARED_USER_ROLE(
    UM_ROLE_ID INTEGER NOT NULL,
    UM_USER_ID INTEGER NOT NULL,
    UM_USER_TENANT_ID INTEGER NOT NULL,
    UM_ROLE_TENANT_ID INTEGER NOT NULL,
    UNIQUE(UM_USER_ID,UM_ROLE_ID,UM_USER_TENANT_ID, UM_ROLE_TENANT_ID),
    FOREIGN KEY(UM_ROLE_ID,UM_ROLE_TENANT_ID) REFERENCES UM_ROLE(UM_ID,UM_TENANT_ID) ON DELETE CASCADE ,
    FOREIGN KEY(UM_USER_ID,UM_USER_TENANT_ID) REFERENCES UM_USER(UM_ID,UM_TENANT_ID) ON DELETE CASCADE 
);

DROP TABLE IF EXISTS UM_ACCOUNT_MAPPING;
DROP SEQUENCE IF EXISTS UM_ACCOUNT_MAPPING_SEQ;
CREATE SEQUENCE UM_ACCOUNT_MAPPING_SEQ;
CREATE TABLE UM_ACCOUNT_MAPPING(
	UM_ID INTEGER DEFAULT NEXTVAL('UM_ACCOUNT_MAPPING_SEQ'),
	UM_USER_NAME VARCHAR(255) NOT NULL,
	UM_TENANT_ID INTEGER NOT NULL,
	UM_USER_STORE_DOMAIN VARCHAR(100),
	UM_ACC_LINK_ID INTEGER NOT NULL,
	UNIQUE(UM_USER_NAME, UM_TENANT_ID, UM_USER_STORE_DOMAIN, UM_ACC_LINK_ID),
	FOREIGN KEY (UM_TENANT_ID) REFERENCES UM_TENANT(UM_ID) ON DELETE CASCADE,
	PRIMARY KEY (UM_ID)
);

DROP TABLE IF EXISTS UM_USER_ATTRIBUTE;
DROP SEQUENCE IF EXISTS UM_USER_ATTRIBUTE_PK_SEQ;
CREATE SEQUENCE UM_USER_ATTRIBUTE_PK_SEQ;
CREATE TABLE UM_USER_ATTRIBUTE ( 
            UM_ID INTEGER DEFAULT NEXTVAL('UM_USER_ATTRIBUTE_PK_SEQ'), 
            UM_ATTR_NAME VARCHAR(255) NOT NULL, 
            UM_ATTR_VALUE VARCHAR(1024), 
            UM_PROFILE_ID VARCHAR(255), 
            UM_USER_ID INTEGER, 
            UM_TENANT_ID INTEGER DEFAULT 0, 
            FOREIGN KEY (UM_USER_ID, UM_TENANT_ID) REFERENCES UM_USER(UM_ID, UM_TENANT_ID), 
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

CREATE INDEX UM_USER_ID_INDEX ON UM_USER_ATTRIBUTE(UM_USER_ID);

DROP TABLE IF EXISTS UM_DIALECT CASCADE;
DROP SEQUENCE IF EXISTS UM_DIALECT_PK_SEQ;
CREATE SEQUENCE UM_DIALECT_PK_SEQ;
CREATE TABLE UM_DIALECT( 
            UM_ID INTEGER DEFAULT NEXTVAL('UM_DIALECT_PK_SEQ'), 
            UM_DIALECT_URI VARCHAR(255) NOT NULL, 
            UM_TENANT_ID INTEGER DEFAULT 0, 
            UNIQUE(UM_DIALECT_URI, UM_TENANT_ID), 
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

DROP TABLE IF EXISTS UM_CLAIM;
DROP SEQUENCE IF EXISTS UM_CLAIM_PK_SEQ;
CREATE SEQUENCE UM_CLAIM_PK_SEQ;
CREATE TABLE UM_CLAIM( 
            UM_ID INTEGER DEFAULT NEXTVAL('UM_CLAIM_PK_SEQ'), 
            UM_DIALECT_ID INTEGER NOT NULL, 
            UM_CLAIM_URI VARCHAR(255) NOT NULL, 
            UM_DISPLAY_TAG VARCHAR(255), 
            UM_DESCRIPTION VARCHAR(255), 
            UM_MAPPED_ATTRIBUTE_DOMAIN VARCHAR(255),
            UM_MAPPED_ATTRIBUTE VARCHAR(255), 
            UM_REG_EX VARCHAR(255), 
            UM_SUPPORTED SMALLINT, 
            UM_REQUIRED SMALLINT, 
            UM_DISPLAY_ORDER INTEGER,
	    UM_CHECKED_ATTRIBUTE SMALLINT,
	    UM_READ_ONLY SMALLINT,
            UM_TENANT_ID INTEGER DEFAULT 0, 
            UNIQUE(UM_DIALECT_ID, UM_CLAIM_URI, UM_TENANT_ID), 
            FOREIGN KEY(UM_DIALECT_ID, UM_TENANT_ID) REFERENCES UM_DIALECT(UM_ID, UM_TENANT_ID), 
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

DROP TABLE IF EXISTS UM_PROFILE_CONFIG;
DROP SEQUENCE IF EXISTS UM_PROFILE_CONFIG_PK_SEQ;
CREATE SEQUENCE UM_PROFILE_CONFIG_PK_SEQ;
CREATE TABLE UM_PROFILE_CONFIG( 
            UM_ID INTEGER DEFAULT NEXTVAL('UM_PROFILE_CONFIG_PK_SEQ'), 
            UM_DIALECT_ID INTEGER NOT NULL, 
            UM_PROFILE_NAME VARCHAR(255), 
            UM_TENANT_ID INTEGER DEFAULT 0, 
            FOREIGN KEY(UM_DIALECT_ID, UM_TENANT_ID) REFERENCES UM_DIALECT(UM_ID, UM_TENANT_ID), 
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

DROP TABLE IF EXISTS UM_CLAIM_BEHAVIOR;    
DROP SEQUENCE IF EXISTS UM_CLAIM_BEHAVIOR_PK_SEQ;
CREATE SEQUENCE UM_CLAIM_BEHAVIOR_PK_SEQ;
CREATE TABLE UM_CLAIM_BEHAVIOR( 
            UM_ID INTEGER DEFAULT NEXTVAL('UM_CLAIM_BEHAVIOR_PK_SEQ'), 
            UM_PROFILE_ID INTEGER, 
            UM_CLAIM_ID INTEGER, 
            UM_BEHAVIOUR SMALLINT, 
            UM_TENANT_ID INTEGER DEFAULT 0, 
            FOREIGN KEY(UM_PROFILE_ID, UM_TENANT_ID) REFERENCES UM_PROFILE_CONFIG(UM_ID, UM_TENANT_ID), 
            FOREIGN KEY(UM_CLAIM_ID, UM_TENANT_ID) REFERENCES UM_CLAIM(UM_ID, UM_TENANT_ID), 
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

DROP TABLE IF EXISTS UM_HYBRID_ROLE;
DROP SEQUENCE IF EXISTS UM_HYBRID_ROLE_PK_SEQ;
CREATE SEQUENCE UM_HYBRID_ROLE_PK_SEQ;
CREATE TABLE UM_HYBRID_ROLE(
            UM_ID INTEGER DEFAULT NEXTVAL('UM_HYBRID_ROLE_PK_SEQ'),
            UM_ROLE_NAME VARCHAR(255),
            UM_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
);

DROP TABLE IF EXISTS UM_HYBRID_USER_ROLE;
DROP SEQUENCE IF EXISTS UM_HYBRID_USER_ROLE_PK_SEQ;
CREATE SEQUENCE UM_HYBRID_USER_ROLE_PK_SEQ;
CREATE TABLE UM_HYBRID_USER_ROLE(
            UM_ID INTEGER DEFAULT NEXTVAL('UM_HYBRID_USER_ROLE_PK_SEQ'),
            UM_USER_NAME VARCHAR(255),
            UM_ROLE_ID INTEGER NOT NULL,
            UM_TENANT_ID INTEGER DEFAULT 0,
	    UM_DOMAIN_ID INTEGER,
            UNIQUE (UM_USER_NAME, UM_ROLE_ID, UM_TENANT_ID, UM_DOMAIN_ID),
            FOREIGN KEY (UM_ROLE_ID, UM_TENANT_ID) REFERENCES UM_HYBRID_ROLE(UM_ID, UM_TENANT_ID) ON DELETE CASCADE,
	    FOREIGN KEY (UM_DOMAIN_ID, UM_TENANT_ID) REFERENCES UM_DOMAIN(UM_DOMAIN_ID, UM_TENANT_ID) ON DELETE CASCADE,
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
);

DROP TABLE IF EXISTS UM_SYSTEM_ROLE;
DROP SEQUENCE IF EXISTS UM_SYSTEM_ROLE_PK_SEQ;
CREATE SEQUENCE UM_SYSTEM_ROLE_PK_SEQ;
CREATE TABLE UM_SYSTEM_ROLE(
            UM_ID INTEGER DEFAULT NEXTVAL('UM_SYSTEM_ROLE_PK_SEQ'),
            UM_ROLE_NAME VARCHAR(255),
            UM_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
);

CREATE INDEX SYSTEM_ROLE_IND_BY_RN_TI ON UM_SYSTEM_ROLE(UM_ROLE_NAME, UM_TENANT_ID);

DROP TABLE IF EXISTS UM_SYSTEM_USER_ROLE;
DROP SEQUENCE IF EXISTS UM_SYSTEM_USER_ROLE_PK_SEQ;
CREATE SEQUENCE UM_SYSTEM_USER_ROLE_PK_SEQ;
CREATE TABLE UM_SYSTEM_USER_ROLE(
            UM_ID INTEGER DEFAULT NEXTVAL('UM_SYSTEM_USER_ROLE_PK_SEQ'),
            UM_USER_NAME VARCHAR(255),
            UM_ROLE_ID INTEGER NOT NULL,
            UM_TENANT_ID INTEGER DEFAULT 0,
            UNIQUE (UM_USER_NAME, UM_ROLE_ID, UM_TENANT_ID),
            FOREIGN KEY (UM_ROLE_ID, UM_TENANT_ID) REFERENCES UM_SYSTEM_ROLE(UM_ID, UM_TENANT_ID),
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
);



DROP TABLE IF EXISTS UM_HYBRID_REMEMBER_ME;
DROP SEQUENCE IF EXISTS UM_HYBRID_REMEMBER_ME_PK_SEQ;
CREATE SEQUENCE UM_HYBRID_REMEMBER_ME_PK_SEQ;
CREATE TABLE UM_HYBRID_REMEMBER_ME(
            UM_ID INTEGER DEFAULT NEXTVAL('UM_HYBRID_REMEMBER_ME_PK_SEQ'),
            UM_USER_NAME VARCHAR(255) NOT NULL,
			UM_COOKIE_VALUE VARCHAR(1024),
			UM_CREATED_TIME TIMESTAMP,
            UM_TENANT_ID INTEGER DEFAULT 0,
			PRIMARY KEY (UM_ID, UM_TENANT_ID)
);




-- create WSO2UM_DB

\c wso2um_db;

\echo 'CREATE TABLES for WSO2UM_DB';

DROP TABLE IF EXISTS REG_CLUSTER_LOCK;
CREATE TABLE REG_CLUSTER_LOCK (
             REG_LOCK_NAME VARCHAR (20),
             REG_LOCK_STATUS VARCHAR (20),
             REG_LOCKED_TIME TIMESTAMP,
             REG_TENANT_ID INTEGER DEFAULT 0,
             PRIMARY KEY (REG_LOCK_NAME)
);

DROP TABLE IF EXISTS REG_LOG;
DROP SEQUENCE IF EXISTS REG_LOG_PK_SEQ;
CREATE SEQUENCE REG_LOG_PK_SEQ;
CREATE TABLE REG_LOG (
             REG_LOG_ID INTEGER DEFAULT NEXTVAL('REG_LOG_PK_SEQ'),
             REG_PATH VARCHAR (2000),
             REG_USER_ID VARCHAR (31) NOT NULL,
             REG_LOGGED_TIME TIMESTAMP NOT NULL,
             REG_ACTION INTEGER NOT NULL,
             REG_ACTION_DATA VARCHAR (500),
             REG_TENANT_ID INTEGER DEFAULT 0,
             PRIMARY KEY (REG_LOG_ID, REG_TENANT_ID)
);

CREATE INDEX REG_LOG_IND_BY_REG_LOGTIME ON REG_LOG(REG_LOGGED_TIME, REG_TENANT_ID);

DROP TABLE IF EXISTS REG_PATH;
DROP SEQUENCE IF EXISTS REG_PATH_PK_SEQ;
CREATE SEQUENCE REG_PATH_PK_SEQ;
CREATE TABLE REG_PATH(
             REG_PATH_ID INTEGER DEFAULT NEXTVAL('REG_PATH_PK_SEQ'),
             REG_PATH_VALUE VARCHAR(2000) NOT NULL,
             REG_PATH_PARENT_ID INTEGER,
             REG_TENANT_ID INTEGER DEFAULT 0,
             CONSTRAINT PK_REG_PATH PRIMARY KEY(REG_PATH_ID, REG_TENANT_ID)
);

CREATE INDEX REG_PATH_IND_BY_PATH_VALUE ON REG_PATH(REG_PATH_VALUE, REG_TENANT_ID);
CREATE INDEX REG_PATH_IND_BY_PATH_PARENT_ID  ON REG_PATH(REG_PATH_PARENT_ID, REG_TENANT_ID);

DROP TABLE IF EXISTS REG_CONTENT;
DROP SEQUENCE IF EXISTS REG_CONTENT_PK_SEQ;
CREATE SEQUENCE REG_CONTENT_PK_SEQ;
CREATE TABLE REG_CONTENT (
             REG_CONTENT_ID INTEGER DEFAULT NEXTVAL('REG_CONTENT_PK_SEQ'),
             REG_CONTENT_DATA BYTEA,
             REG_TENANT_ID INTEGER DEFAULT 0,
             CONSTRAINT PK_REG_CONTENT PRIMARY KEY(REG_CONTENT_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_CONTENT_HISTORY;
CREATE TABLE REG_CONTENT_HISTORY (
             REG_CONTENT_ID INTEGER NOT NULL,
             REG_CONTENT_DATA BYTEA,
             REG_DELETED   SMALLINT,
             REG_TENANT_ID INTEGER DEFAULT 0,
             CONSTRAINT PK_REG_CONTENT_HISTORY PRIMARY KEY(REG_CONTENT_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_RESOURCE;
DROP SEQUENCE IF EXISTS REG_RESOURCE_PK_SEQ;
CREATE SEQUENCE REG_RESOURCE_PK_SEQ;
CREATE TABLE REG_RESOURCE (
            REG_PATH_ID         INTEGER NOT NULL,
            REG_NAME            VARCHAR(256),
            REG_VERSION         INTEGER DEFAULT NEXTVAL('REG_RESOURCE_PK_SEQ'),
            REG_MEDIA_TYPE      VARCHAR(500),
            REG_CREATOR         VARCHAR(31) NOT NULL,
            REG_CREATED_TIME    TIMESTAMP NOT NULL,
            REG_LAST_UPDATOR    VARCHAR(31),
            REG_LAST_UPDATED_TIME    TIMESTAMP NOT NULL,
            REG_DESCRIPTION     VARCHAR(1000),
            REG_CONTENT_ID      INTEGER,
            REG_TENANT_ID INTEGER DEFAULT 0,
            REG_UUID VARCHAR(100) NOT NULL,
            CONSTRAINT PK_REG_RESOURCE PRIMARY KEY(REG_VERSION, REG_TENANT_ID)
);

ALTER TABLE REG_RESOURCE ADD CONSTRAINT REG_RESOURCE_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE ADD CONSTRAINT REG_RESOURCE_FK_BY_CONTENT_ID FOREIGN KEY (REG_CONTENT_ID, REG_TENANT_ID) REFERENCES REG_CONTENT (REG_CONTENT_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_IND_BY_NAME  ON REG_RESOURCE(REG_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_IND_BY_PATH_ID_NAME  ON REG_RESOURCE(REG_PATH_ID, REG_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_IND_BY_UUID  ON REG_RESOURCE(REG_UUID);
CREATE INDEX REG_RESOURCE_IND_BY_TENANT ON REG_RESOURCE(REG_TENANT_ID, REG_UUID);
CREATE INDEX REG_RESOURCE_IND_BY_TYPE ON REG_RESOURCE(REG_TENANT_ID, REG_MEDIA_TYPE);

DROP TABLE IF EXISTS REG_RESOURCE_HISTORY;
CREATE TABLE REG_RESOURCE_HISTORY (
            REG_PATH_ID         INTEGER NOT NULL,
            REG_NAME            VARCHAR(256),
            REG_VERSION         INTEGER NOT NULL,
            REG_MEDIA_TYPE      VARCHAR(500),
            REG_CREATOR         VARCHAR(31) NOT NULL,
            REG_CREATED_TIME    TIMESTAMP NOT NULL,
            REG_LAST_UPDATOR    VARCHAR(31),
            REG_LAST_UPDATED_TIME    TIMESTAMP NOT NULL,
            REG_DESCRIPTION     VARCHAR(1000),
            REG_CONTENT_ID      INTEGER,
            REG_DELETED         SMALLINT,
            REG_TENANT_ID INTEGER DEFAULT 0,
            REG_UUID VARCHAR(100) NOT NULL,
            CONSTRAINT PK_REG_RESOURCE_HISTORY PRIMARY KEY(REG_VERSION, REG_TENANT_ID)
);

ALTER TABLE REG_RESOURCE_HISTORY ADD CONSTRAINT REG_RESOURCE_HIST_FK_BY_PATHID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE_HISTORY ADD CONSTRAINT REG_RESOURCE_HIST_FK_BY_CONTENT_ID FOREIGN KEY (REG_CONTENT_ID, REG_TENANT_ID) REFERENCES REG_CONTENT_HISTORY (REG_CONTENT_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_HISTORY_IND_BY_NAME  ON REG_RESOURCE_HISTORY(REG_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_HISTORY_IND_BY_PATH_ID_NAME  ON REG_RESOURCE(REG_PATH_ID, REG_NAME, REG_TENANT_ID);

DROP TABLE IF EXISTS REG_COMMENT;
DROP SEQUENCE IF EXISTS REG_COMMENT_PK_SEQ;
CREATE SEQUENCE REG_COMMENT_PK_SEQ;
CREATE TABLE REG_COMMENT (
            REG_ID        INTEGER DEFAULT NEXTVAL('REG_COMMENT_PK_SEQ'),
            REG_COMMENT_TEXT      VARCHAR(500) NOT NULL,
            REG_USER_ID           VARCHAR(31) NOT NULL,
            REG_COMMENTED_TIME    TIMESTAMP NOT NULL,
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_COMMENT PRIMARY KEY(REG_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_RESOURCE_COMMENT;
CREATE TABLE REG_RESOURCE_COMMENT (
            REG_COMMENT_ID          INTEGER NOT NULL,
            REG_VERSION             INTEGER,
            REG_PATH_ID             INTEGER,
            REG_RESOURCE_NAME       VARCHAR(256),
            REG_TENANT_ID INTEGER DEFAULT 0
);

ALTER TABLE REG_RESOURCE_COMMENT ADD CONSTRAINT REG_RESOURCE_COMMENT_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE_COMMENT ADD CONSTRAINT REG_RESOURCE_COMMENT_FK_BY_COMMENT_ID FOREIGN KEY (REG_COMMENT_ID, REG_TENANT_ID) REFERENCES REG_COMMENT (REG_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_COMMENT_IND_BY_PATH_ID_AND_RESOURCE_NAME  ON REG_RESOURCE_COMMENT(REG_PATH_ID, REG_RESOURCE_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_COMMENT_IND_BY_VERSION  ON REG_RESOURCE_COMMENT(REG_VERSION, REG_TENANT_ID);

DROP TABLE IF EXISTS REG_RATING;
DROP SEQUENCE IF EXISTS REG_RATING_PK_SEQ;
CREATE SEQUENCE REG_RATING_PK_SEQ;
CREATE TABLE REG_RATING (
            REG_ID     INTEGER DEFAULT NEXTVAL('REG_RATING_PK_SEQ'),
            REG_RATING        INTEGER NOT NULL,
            REG_USER_ID       VARCHAR(31) NOT NULL,
            REG_RATED_TIME    TIMESTAMP NOT NULL,
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_RATING PRIMARY KEY(REG_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_RESOURCE_RATING;
CREATE TABLE REG_RESOURCE_RATING (
            REG_RATING_ID           INTEGER NOT NULL,
            REG_VERSION             INTEGER,
            REG_PATH_ID             INTEGER,
            REG_RESOURCE_NAME       VARCHAR(256),
            REG_TENANT_ID INTEGER DEFAULT 0
);

ALTER TABLE REG_RESOURCE_RATING ADD CONSTRAINT REG_RESOURCE_RATING_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE_RATING ADD CONSTRAINT REG_RESOURCE_RATING_FK_BY_RATING_ID FOREIGN KEY (REG_RATING_ID, REG_TENANT_ID) REFERENCES REG_RATING (REG_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_RATING_IND_BY_PATH_ID_AND_RESOURCE_NAME  ON REG_RESOURCE_RATING(REG_PATH_ID, REG_RESOURCE_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_RATING_IND_BY_VERSION  ON REG_RESOURCE_RATING(REG_VERSION, REG_TENANT_ID);

DROP TABLE IF EXISTS REG_TAG;
DROP SEQUENCE IF EXISTS REG_TAG_PK_SEQ;
CREATE SEQUENCE REG_TAG_PK_SEQ;
CREATE TABLE REG_TAG (
            REG_ID         INTEGER DEFAULT NEXTVAL('REG_TAG_PK_SEQ'),
            REG_TAG_NAME       VARCHAR(500) NOT NULL,
            REG_USER_ID        VARCHAR(31) NOT NULL,
            REG_TAGGED_TIME    TIMESTAMP NOT NULL,
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_TAG PRIMARY KEY(REG_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_RESOURCE_TAG;
CREATE TABLE REG_RESOURCE_TAG (
            REG_TAG_ID              INTEGER NOT NULL,
            REG_VERSION             INTEGER,
            REG_PATH_ID             INTEGER,
            REG_RESOURCE_NAME       VARCHAR(256),
            REG_TENANT_ID INTEGER DEFAULT 0
);

ALTER TABLE REG_RESOURCE_TAG ADD CONSTRAINT REG_RESOURCE_TAG_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE_TAG ADD CONSTRAINT REG_RESOURCE_TAG_FK_BY_TAG_ID FOREIGN KEY (REG_TAG_ID, REG_TENANT_ID) REFERENCES REG_TAG (REG_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_TAG_IND_BY_PATH_ID_AND_RESOURCE_NAME  ON REG_RESOURCE_TAG(REG_PATH_ID, REG_RESOURCE_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_TAG_IND_BY_VERSION  ON REG_RESOURCE_TAG(REG_VERSION, REG_TENANT_ID);

DROP TABLE IF EXISTS REG_PROPERTY;
DROP SEQUENCE IF EXISTS REG_PROPERTY_PK_SEQ;
CREATE SEQUENCE REG_PROPERTY_PK_SEQ;
CREATE TABLE REG_PROPERTY (
            REG_ID         INTEGER DEFAULT NEXTVAL('REG_PROPERTY_PK_SEQ'),
            REG_NAME       VARCHAR(100) NOT NULL,
            REG_VALUE        VARCHAR(1000),
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_PROPERTY PRIMARY KEY(REG_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_RESOURCE_PROPERTY;
CREATE TABLE REG_RESOURCE_PROPERTY (
            REG_PROPERTY_ID         INTEGER NOT NULL,
            REG_VERSION             INTEGER,
            REG_PATH_ID             INTEGER,
            REG_RESOURCE_NAME       VARCHAR(256),
            REG_TENANT_ID INTEGER DEFAULT 0
);

ALTER TABLE REG_RESOURCE_PROPERTY ADD CONSTRAINT REG_RESOURCE_PROPERTY_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);
ALTER TABLE REG_RESOURCE_PROPERTY ADD CONSTRAINT REG_RESOURCE_PROPERTY_FK_BY_TAG_ID FOREIGN KEY (REG_PROPERTY_ID, REG_TENANT_ID) REFERENCES REG_PROPERTY (REG_ID, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_PROPERTY_IND_BY_PATH_ID_AND_RESOURCE_NAME  ON REG_RESOURCE_PROPERTY(REG_PATH_ID, REG_RESOURCE_NAME, REG_TENANT_ID);
CREATE INDEX REG_RESOURCE_PROPERTY_IND_BY_VERSION  ON REG_RESOURCE_PROPERTY(REG_VERSION, REG_TENANT_ID);


DROP TABLE IF EXISTS REG_ASSOCIATION;
DROP SEQUENCE IF EXISTS REG_ASSOCIATION_PK_SEQ;
CREATE SEQUENCE REG_ASSOCIATION_PK_SEQ;
CREATE TABLE REG_ASSOCIATION (
            REG_ASSOCIATION_ID INTEGER DEFAULT NEXTVAL('REG_ASSOCIATION_PK_SEQ'),
            REG_SOURCEPATH VARCHAR (2000) NOT NULL,
            REG_TARGETPATH VARCHAR (2000) NOT NULL,
            REG_ASSOCIATION_TYPE VARCHAR (2000) NOT NULL,
            REG_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (REG_ASSOCIATION_ID, REG_TENANT_ID)
);

DROP TABLE IF EXISTS REG_SNAPSHOT;
DROP SEQUENCE IF EXISTS REG_SNAPSHOT_PK_SEQ;
CREATE SEQUENCE REG_SNAPSHOT_PK_SEQ;
CREATE TABLE REG_SNAPSHOT (
            REG_SNAPSHOT_ID     INTEGER DEFAULT NEXTVAL('REG_SNAPSHOT_PK_SEQ'),
            REG_PATH_ID            INTEGER NOT NULL,
            REG_RESOURCE_NAME      VARCHAR(255),
            REG_RESOURCE_VIDS     BYTEA NOT NULL,
            REG_TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT PK_REG_SNAPSHOT PRIMARY KEY(REG_SNAPSHOT_ID, REG_TENANT_ID)
);

CREATE INDEX REG_SNAPSHOT_IND_BY_PATH_ID_AND_RESOURCE_NAME  ON REG_SNAPSHOT(REG_PATH_ID, REG_RESOURCE_NAME, REG_TENANT_ID);

ALTER TABLE REG_SNAPSHOT ADD CONSTRAINT REG_SNAPSHOT_FK_BY_PATH_ID FOREIGN KEY (REG_PATH_ID, REG_TENANT_ID) REFERENCES REG_PATH (REG_PATH_ID, REG_TENANT_ID);


-- ################################
-- USER MANAGER TABLES
-- ################################

DROP TABLE IF EXISTS UM_TENANT;
DROP SEQUENCE IF EXISTS UM_TENANT_PK_SEQ;
CREATE SEQUENCE UM_TENANT_PK_SEQ;
CREATE TABLE UM_TENANT (
			UM_ID INTEGER DEFAULT NEXTVAL('UM_TENANT_PK_SEQ'),
			UM_DOMAIN_NAME VARCHAR(255) NOT NULL,
            UM_EMAIL VARCHAR(255),
            UM_ACTIVE BOOLEAN DEFAULT FALSE,
	        UM_CREATED_DATE TIMESTAMP NOT NULL,
	        UM_USER_CONFIG BYTEA,
			PRIMARY KEY (UM_ID),
			UNIQUE(UM_DOMAIN_NAME));

CREATE INDEX INDEX_UM_TENANT_UM_DOMAIN_NAME
                    ON UM_TENANT (UM_DOMAIN_NAME); 


DROP TABLE IF EXISTS UM_DOMAIN;
DROP SEQUENCE IF EXISTS UM_DOMAIN_PK_SEQ;
CREATE SEQUENCE UM_DOMAIN_PK_SEQ;
CREATE TABLE UM_DOMAIN(
            UM_DOMAIN_ID INTEGER DEFAULT NEXTVAL('UM_DOMAIN_PK_SEQ'),
            UM_DOMAIN_NAME VARCHAR(255),
            UM_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (UM_DOMAIN_ID, UM_TENANT_ID)
);


DROP TABLE IF EXISTS UM_USER CASCADE;			
DROP SEQUENCE IF EXISTS UM_USER_PK_SEQ;
CREATE SEQUENCE UM_USER_PK_SEQ;
CREATE TABLE UM_USER ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_USER_PK_SEQ'), 
             UM_USER_NAME VARCHAR(255) NOT NULL, 
             UM_USER_PASSWORD VARCHAR(255) NOT NULL,
             UM_SALT_VALUE VARCHAR(31),
             UM_REQUIRE_CHANGE BOOLEAN DEFAULT FALSE,
             UM_CHANGED_TIME TIMESTAMP NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0, 
             PRIMARY KEY (UM_ID, UM_TENANT_ID), 
             UNIQUE(UM_USER_NAME, UM_TENANT_ID)
);
 

DROP TABLE IF EXISTS UM_SYSTEM_USER  CASCADE;			
DROP SEQUENCE IF EXISTS UM_SYSTEM_USER_PK_SEQ;
CREATE SEQUENCE UM_SYSTEM_USER_PK_SEQ;
CREATE TABLE UM_SYSTEM_USER ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_SYSTEM_USER_PK_SEQ'), 
             UM_USER_NAME VARCHAR(255) NOT NULL, 
             UM_USER_PASSWORD VARCHAR(255) NOT NULL,
             UM_SALT_VALUE VARCHAR(31),
             UM_REQUIRE_CHANGE BOOLEAN DEFAULT FALSE,
             UM_CHANGED_TIME TIMESTAMP NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0, 
             PRIMARY KEY (UM_ID, UM_TENANT_ID), 
             UNIQUE(UM_USER_NAME, UM_TENANT_ID)
); 

DROP TABLE IF EXISTS UM_ROLE CASCADE;
DROP SEQUENCE IF EXISTS UM_ROLE_PK_SEQ;
CREATE SEQUENCE UM_ROLE_PK_SEQ;
CREATE TABLE UM_ROLE ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_ROLE_PK_SEQ'), 
             UM_ROLE_NAME VARCHAR(255) NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0,
		UM_SHARED_ROLE BOOLEAN DEFAULT FALSE,  
             PRIMARY KEY (UM_ID, UM_TENANT_ID),
             UNIQUE(UM_ROLE_NAME, UM_TENANT_ID) 
);


DROP TABLE IF EXISTS UM_MODULE CASCADE;
DROP SEQUENCE IF EXISTS UM_MODULE_PK_SEQ;
CREATE SEQUENCE UM_MODULE_PK_SEQ;
CREATE TABLE UM_MODULE(
	UM_ID INTEGER  DEFAULT NEXTVAL('UM_MODULE_PK_SEQ'),
	UM_MODULE_NAME VARCHAR(100),
	UNIQUE(UM_MODULE_NAME),
	PRIMARY KEY(UM_ID)
);

DROP TABLE IF EXISTS UM_MODULE_ACTIONS CASCADE;
CREATE TABLE UM_MODULE_ACTIONS(
	UM_ACTION VARCHAR(255) NOT NULL,
	UM_MODULE_ID INTEGER NOT NULL,
	PRIMARY KEY(UM_ACTION, UM_MODULE_ID),
	FOREIGN KEY (UM_MODULE_ID) REFERENCES UM_MODULE(UM_ID) ON DELETE CASCADE
);


DROP TABLE IF EXISTS UM_PERMISSION CASCADE;
DROP SEQUENCE IF EXISTS UM_PERMISSION_PK_SEQ;
CREATE SEQUENCE UM_PERMISSION_PK_SEQ;
CREATE TABLE UM_PERMISSION ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_PERMISSION_PK_SEQ'), 
             UM_RESOURCE_ID VARCHAR(255) NOT NULL, 
             UM_ACTION VARCHAR(255) NOT NULL, 
             UM_TENANT_ID INTEGER DEFAULT 0, 
	     UM_MODULE_ID INTEGER DEFAULT 0,
	         	 UNIQUE(UM_RESOURCE_ID,UM_ACTION, UM_TENANT_ID),
             PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

CREATE INDEX INDEX_UM_PERMISSION_UM_RESOURCE_ID_UM_ACTION 
                    ON UM_PERMISSION (UM_RESOURCE_ID, UM_ACTION, UM_TENANT_ID); 

					
DROP TABLE IF EXISTS UM_ROLE_PERMISSION;
DROP SEQUENCE IF EXISTS UM_ROLE_PERMISSION_PK_SEQ;
CREATE SEQUENCE UM_ROLE_PERMISSION_PK_SEQ;
CREATE TABLE UM_ROLE_PERMISSION ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_ROLE_PERMISSION_PK_SEQ'), 
             UM_PERMISSION_ID INTEGER NOT NULL, 
             UM_ROLE_NAME VARCHAR(255) NOT NULL,
             UM_IS_ALLOWED SMALLINT NOT NULL, 
             UM_TENANT_ID INTEGER DEFAULT 0, 
	     UM_DOMAIN_ID INTEGER,
             FOREIGN KEY (UM_PERMISSION_ID, UM_TENANT_ID) REFERENCES UM_PERMISSION(UM_ID, UM_TENANT_ID) ON DELETE CASCADE,
	     FOREIGN KEY (UM_DOMAIN_ID, UM_TENANT_ID) REFERENCES UM_DOMAIN(UM_DOMAIN_ID, UM_TENANT_ID) ON DELETE CASCADE, 
             PRIMARY KEY (UM_ID, UM_TENANT_ID) 
); 

-- REMOVED UNIQUE (UM_PERMISSION_ID, UM_ROLE_ID) 
DROP TABLE IF EXISTS UM_USER_PERMISSION;
DROP SEQUENCE IF EXISTS UM_USER_PERMISSION_PK_SEQ;
CREATE SEQUENCE UM_USER_PERMISSION_PK_SEQ;
CREATE TABLE UM_USER_PERMISSION ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_USER_PERMISSION_PK_SEQ'), 
             UM_PERMISSION_ID INTEGER NOT NULL, 
             UM_USER_NAME VARCHAR(255) NOT NULL,
             UM_IS_ALLOWED SMALLINT NOT NULL,          
             UM_TENANT_ID INTEGER DEFAULT 0, 
             FOREIGN KEY (UM_PERMISSION_ID, UM_TENANT_ID) REFERENCES UM_PERMISSION(UM_ID, UM_TENANT_ID) ON DELETE CASCADE,
             PRIMARY KEY (UM_ID, UM_TENANT_ID)
);

-- REMOVED UNIQUE (UM_PERMISSION_ID, UM_USER_ID) 
DROP TABLE IF EXISTS UM_USER_ROLE;
DROP SEQUENCE IF EXISTS UM_USER_ROLE_PK_SEQ;
CREATE SEQUENCE UM_USER_ROLE_PK_SEQ;
CREATE TABLE UM_USER_ROLE ( 
             UM_ID INTEGER DEFAULT NEXTVAL('UM_USER_ROLE_PK_SEQ'), 
             UM_ROLE_ID INTEGER NOT NULL, 
             UM_USER_ID INTEGER NOT NULL,
             UM_TENANT_ID INTEGER DEFAULT 0,  
             UNIQUE (UM_USER_ID, UM_ROLE_ID, UM_TENANT_ID), 
             FOREIGN KEY (UM_ROLE_ID, UM_TENANT_ID) REFERENCES UM_ROLE(UM_ID, UM_TENANT_ID), 
             FOREIGN KEY (UM_USER_ID, UM_TENANT_ID) REFERENCES UM_USER(UM_ID, UM_TENANT_ID), 
             PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

DROP TABLE IF EXISTS UM_SHARED_USER_ROLE;
CREATE TABLE UM_SHARED_USER_ROLE(
    UM_ROLE_ID INTEGER NOT NULL,
    UM_USER_ID INTEGER NOT NULL,
    UM_USER_TENANT_ID INTEGER NOT NULL,
    UM_ROLE_TENANT_ID INTEGER NOT NULL,
    UNIQUE(UM_USER_ID,UM_ROLE_ID,UM_USER_TENANT_ID, UM_ROLE_TENANT_ID),
    FOREIGN KEY(UM_ROLE_ID,UM_ROLE_TENANT_ID) REFERENCES UM_ROLE(UM_ID,UM_TENANT_ID) ON DELETE CASCADE ,
    FOREIGN KEY(UM_USER_ID,UM_USER_TENANT_ID) REFERENCES UM_USER(UM_ID,UM_TENANT_ID) ON DELETE CASCADE 
);

DROP TABLE IF EXISTS UM_ACCOUNT_MAPPING;
DROP SEQUENCE IF EXISTS UM_ACCOUNT_MAPPING_SEQ;
CREATE SEQUENCE UM_ACCOUNT_MAPPING_SEQ;
CREATE TABLE UM_ACCOUNT_MAPPING(
	UM_ID INTEGER DEFAULT NEXTVAL('UM_ACCOUNT_MAPPING_SEQ'),
	UM_USER_NAME VARCHAR(255) NOT NULL,
	UM_TENANT_ID INTEGER NOT NULL,
	UM_USER_STORE_DOMAIN VARCHAR(100),
	UM_ACC_LINK_ID INTEGER NOT NULL,
	UNIQUE(UM_USER_NAME, UM_TENANT_ID, UM_USER_STORE_DOMAIN, UM_ACC_LINK_ID),
	FOREIGN KEY (UM_TENANT_ID) REFERENCES UM_TENANT(UM_ID) ON DELETE CASCADE,
	PRIMARY KEY (UM_ID)
);

DROP TABLE IF EXISTS UM_USER_ATTRIBUTE;
DROP SEQUENCE IF EXISTS UM_USER_ATTRIBUTE_PK_SEQ;
CREATE SEQUENCE UM_USER_ATTRIBUTE_PK_SEQ;
CREATE TABLE UM_USER_ATTRIBUTE ( 
            UM_ID INTEGER DEFAULT NEXTVAL('UM_USER_ATTRIBUTE_PK_SEQ'), 
            UM_ATTR_NAME VARCHAR(255) NOT NULL, 
            UM_ATTR_VALUE VARCHAR(1024), 
            UM_PROFILE_ID VARCHAR(255), 
            UM_USER_ID INTEGER, 
            UM_TENANT_ID INTEGER DEFAULT 0, 
            FOREIGN KEY (UM_USER_ID, UM_TENANT_ID) REFERENCES UM_USER(UM_ID, UM_TENANT_ID), 
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

CREATE INDEX UM_USER_ID_INDEX ON UM_USER_ATTRIBUTE(UM_USER_ID);

DROP TABLE IF EXISTS UM_DIALECT CASCADE;
DROP SEQUENCE IF EXISTS UM_DIALECT_PK_SEQ;
CREATE SEQUENCE UM_DIALECT_PK_SEQ;
CREATE TABLE UM_DIALECT( 
            UM_ID INTEGER DEFAULT NEXTVAL('UM_DIALECT_PK_SEQ'), 
            UM_DIALECT_URI VARCHAR(255) NOT NULL, 
            UM_TENANT_ID INTEGER DEFAULT 0, 
            UNIQUE(UM_DIALECT_URI, UM_TENANT_ID), 
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

DROP TABLE IF EXISTS UM_CLAIM;
DROP SEQUENCE IF EXISTS UM_CLAIM_PK_SEQ;
CREATE SEQUENCE UM_CLAIM_PK_SEQ;
CREATE TABLE UM_CLAIM( 
            UM_ID INTEGER DEFAULT NEXTVAL('UM_CLAIM_PK_SEQ'), 
            UM_DIALECT_ID INTEGER NOT NULL, 
            UM_CLAIM_URI VARCHAR(255) NOT NULL, 
            UM_DISPLAY_TAG VARCHAR(255), 
            UM_DESCRIPTION VARCHAR(255), 
            UM_MAPPED_ATTRIBUTE_DOMAIN VARCHAR(255),
            UM_MAPPED_ATTRIBUTE VARCHAR(255), 
            UM_REG_EX VARCHAR(255), 
            UM_SUPPORTED SMALLINT, 
            UM_REQUIRED SMALLINT, 
            UM_DISPLAY_ORDER INTEGER,
	    UM_CHECKED_ATTRIBUTE SMALLINT,
	    UM_READ_ONLY SMALLINT,
            UM_TENANT_ID INTEGER DEFAULT 0, 
            UNIQUE(UM_DIALECT_ID, UM_CLAIM_URI, UM_TENANT_ID), 
            FOREIGN KEY(UM_DIALECT_ID, UM_TENANT_ID) REFERENCES UM_DIALECT(UM_ID, UM_TENANT_ID), 
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

DROP TABLE IF EXISTS UM_PROFILE_CONFIG;
DROP SEQUENCE IF EXISTS UM_PROFILE_CONFIG_PK_SEQ;
CREATE SEQUENCE UM_PROFILE_CONFIG_PK_SEQ;
CREATE TABLE UM_PROFILE_CONFIG( 
            UM_ID INTEGER DEFAULT NEXTVAL('UM_PROFILE_CONFIG_PK_SEQ'), 
            UM_DIALECT_ID INTEGER NOT NULL, 
            UM_PROFILE_NAME VARCHAR(255), 
            UM_TENANT_ID INTEGER DEFAULT 0, 
            FOREIGN KEY(UM_DIALECT_ID, UM_TENANT_ID) REFERENCES UM_DIALECT(UM_ID, UM_TENANT_ID), 
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

DROP TABLE IF EXISTS UM_CLAIM_BEHAVIOR;    
DROP SEQUENCE IF EXISTS UM_CLAIM_BEHAVIOR_PK_SEQ;
CREATE SEQUENCE UM_CLAIM_BEHAVIOR_PK_SEQ;
CREATE TABLE UM_CLAIM_BEHAVIOR( 
            UM_ID INTEGER DEFAULT NEXTVAL('UM_CLAIM_BEHAVIOR_PK_SEQ'), 
            UM_PROFILE_ID INTEGER, 
            UM_CLAIM_ID INTEGER, 
            UM_BEHAVIOUR SMALLINT, 
            UM_TENANT_ID INTEGER DEFAULT 0, 
            FOREIGN KEY(UM_PROFILE_ID, UM_TENANT_ID) REFERENCES UM_PROFILE_CONFIG(UM_ID, UM_TENANT_ID), 
            FOREIGN KEY(UM_CLAIM_ID, UM_TENANT_ID) REFERENCES UM_CLAIM(UM_ID, UM_TENANT_ID), 
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
); 

DROP TABLE IF EXISTS UM_HYBRID_ROLE;
DROP SEQUENCE IF EXISTS UM_HYBRID_ROLE_PK_SEQ;
CREATE SEQUENCE UM_HYBRID_ROLE_PK_SEQ;
CREATE TABLE UM_HYBRID_ROLE(
            UM_ID INTEGER DEFAULT NEXTVAL('UM_HYBRID_ROLE_PK_SEQ'),
            UM_ROLE_NAME VARCHAR(255),
            UM_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
);

DROP TABLE IF EXISTS UM_HYBRID_USER_ROLE;
DROP SEQUENCE IF EXISTS UM_HYBRID_USER_ROLE_PK_SEQ;
CREATE SEQUENCE UM_HYBRID_USER_ROLE_PK_SEQ;
CREATE TABLE UM_HYBRID_USER_ROLE(
            UM_ID INTEGER DEFAULT NEXTVAL('UM_HYBRID_USER_ROLE_PK_SEQ'),
            UM_USER_NAME VARCHAR(255),
            UM_ROLE_ID INTEGER NOT NULL,
            UM_TENANT_ID INTEGER DEFAULT 0,
	    UM_DOMAIN_ID INTEGER,
            UNIQUE (UM_USER_NAME, UM_ROLE_ID, UM_TENANT_ID, UM_DOMAIN_ID),
            FOREIGN KEY (UM_ROLE_ID, UM_TENANT_ID) REFERENCES UM_HYBRID_ROLE(UM_ID, UM_TENANT_ID) ON DELETE CASCADE,
	    FOREIGN KEY (UM_DOMAIN_ID, UM_TENANT_ID) REFERENCES UM_DOMAIN(UM_DOMAIN_ID, UM_TENANT_ID) ON DELETE CASCADE,
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
);

DROP TABLE IF EXISTS UM_SYSTEM_ROLE;
DROP SEQUENCE IF EXISTS UM_SYSTEM_ROLE_PK_SEQ;
CREATE SEQUENCE UM_SYSTEM_ROLE_PK_SEQ;
CREATE TABLE UM_SYSTEM_ROLE(
            UM_ID INTEGER DEFAULT NEXTVAL('UM_SYSTEM_ROLE_PK_SEQ'),
            UM_ROLE_NAME VARCHAR(255),
            UM_TENANT_ID INTEGER DEFAULT 0,
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
);

CREATE INDEX SYSTEM_ROLE_IND_BY_RN_TI ON UM_SYSTEM_ROLE(UM_ROLE_NAME, UM_TENANT_ID);

DROP TABLE IF EXISTS UM_SYSTEM_USER_ROLE;
DROP SEQUENCE IF EXISTS UM_SYSTEM_USER_ROLE_PK_SEQ;
CREATE SEQUENCE UM_SYSTEM_USER_ROLE_PK_SEQ;
CREATE TABLE UM_SYSTEM_USER_ROLE(
            UM_ID INTEGER DEFAULT NEXTVAL('UM_SYSTEM_USER_ROLE_PK_SEQ'),
            UM_USER_NAME VARCHAR(255),
            UM_ROLE_ID INTEGER NOT NULL,
            UM_TENANT_ID INTEGER DEFAULT 0,
            UNIQUE (UM_USER_NAME, UM_ROLE_ID, UM_TENANT_ID),
            FOREIGN KEY (UM_ROLE_ID, UM_TENANT_ID) REFERENCES UM_SYSTEM_ROLE(UM_ID, UM_TENANT_ID),
            PRIMARY KEY (UM_ID, UM_TENANT_ID)
);



DROP TABLE IF EXISTS UM_HYBRID_REMEMBER_ME;
DROP SEQUENCE IF EXISTS UM_HYBRID_REMEMBER_ME_PK_SEQ;
CREATE SEQUENCE UM_HYBRID_REMEMBER_ME_PK_SEQ;
CREATE TABLE UM_HYBRID_REMEMBER_ME(
            UM_ID INTEGER DEFAULT NEXTVAL('UM_HYBRID_REMEMBER_ME_PK_SEQ'),
            UM_USER_NAME VARCHAR(255) NOT NULL,
			UM_COOKIE_VALUE VARCHAR(1024),
			UM_CREATED_TIME TIMESTAMP,
            UM_TENANT_ID INTEGER DEFAULT 0,
			PRIMARY KEY (UM_ID, UM_TENANT_ID)
);

-- create WSO2MB_STORE_DB


\c wso2mb_store_db;

\echo 'CREATE TABLES for wso2mb_store_db';

-- Start of Message Store Tables --


CREATE TABLE MB_QUEUE_MAPPING (
    QUEUE_ID SERIAL,
    QUEUE_NAME VARCHAR(512) UNIQUE NOT NULL,
    CONSTRAINT PK_MB_QUEUE_MAPPING PRIMARY KEY (QUEUE_ID)
);
    

CREATE TABLE MB_METADATA (
    MESSAGE_ID NUMERIC(19),
    QUEUE_ID INT,
    DLC_QUEUE_ID INT NOT NULL,
    MESSAGE_METADATA BYTEA NOT NULL,
    CONSTRAINT PK_MB_METADATA PRIMARY KEY (MESSAGE_ID),
    CONSTRAINT FK_MB_METADATA_QUEUE_MAPPING FOREIGN KEY (QUEUE_ID) REFERENCES MB_QUEUE_MAPPING (QUEUE_ID)
);

CREATE INDEX MB_METADATA_QUEUE_ID_INDEX ON MB_METADATA (QUEUE_ID);

CREATE TABLE MB_CONTENT (
    MESSAGE_ID NUMERIC(19),
    CONTENT_OFFSET INT,
    MESSAGE_CONTENT BYTEA NOT NULL,
    CONSTRAINT pk_messages PRIMARY KEY (MESSAGE_ID,CONTENT_OFFSET),
    CONSTRAINT FK_CONTENT FOREIGN KEY (MESSAGE_ID) REFERENCES MB_METADATA
    ON DELETE CASCADE
);

CREATE TABLE MB_EXPIRATION_DATA (
    MESSAGE_ID NUMERIC(19) UNIQUE,
    EXPIRATION_TIME NUMERIC(19),
    DLC_QUEUE_ID INT NOT NULL,
    MESSAGE_DESTINATION VARCHAR(512) NOT NULL,
    CONSTRAINT FK_EXPIRATION_DATA FOREIGN KEY (MESSAGE_ID) REFERENCES MB_METADATA (MESSAGE_ID)
    ON DELETE CASCADE
);

CREATE TABLE MB_RETAINED_METADATA (
    TOPIC_ID INT,
    TOPIC_NAME VARCHAR(512) NOT NULL,
    MESSAGE_ID NUMERIC(19) NOT NULL,
    MESSAGE_METADATA BYTEA NOT NULL,
    CONSTRAINT PK_MB_RETAINED_METADATA PRIMARY KEY (TOPIC_ID)
);

CREATE TABLE IF NOT EXISTS MB_DTX_XID (
    INTERNAL_XID NUMERIC(19) UNIQUE NOT NULL,
    NODE_ID VARCHAR(512) NOT NULL,
    FORMAT_CODE NUMERIC(19) NOT NULL,
    GLOBAL_ID BYTEA, -- AMQP-10 vbin8 type
    BRANCH_ID BYTEA, -- AMQP-10 vbin8 type
    CONSTRAINT PK_MB_DTX_XID PRIMARY KEY (INTERNAL_XID, NODE_ID)
);

CREATE TABLE IF NOT EXISTS MB_DTX_ENQUEUE_RECORD (
    INTERNAL_XID NUMERIC(19) NOT NULL,
    MESSAGE_ID NUMERIC(19) UNIQUE NOT NULL,
    MESSAGE_METADATA BYTEA NOT NULL,
    CONSTRAINT PK_MB_DTX_ENQUEUE_RECORD PRIMARY KEY (MESSAGE_ID),
    CONSTRAINT FK_MB_DTX_ENQUEUE_RECORD FOREIGN KEY (INTERNAL_XID)
    REFERENCES MB_DTX_XID (INTERNAL_XID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS MB_DTX_DEQUEUE_RECORD (
    INTERNAL_XID NUMERIC(19) NOT NULL,
    MESSAGE_ID NUMERIC(19) NOT NULL,
    QUEUE_NAME VARCHAR(512) NOT NULL,
    MESSAGE_METADATA BYTEA NOT NULL,
    CONSTRAINT PK_MB_DTX_DEQUEUE_RECORD PRIMARY KEY (MESSAGE_ID),
    CONSTRAINT FK_MB_DTX_DEQUEUE_RECORD FOREIGN KEY (INTERNAL_XID)
    REFERENCES MB_DTX_XID (INTERNAL_XID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS MB_DTX_ENQUEUE_CONTENT (
    MESSAGE_ID NUMERIC(19) NOT NULL,
    INTERNAL_XID NUMERIC(19) NOT NULL,
    CONTENT_OFFSET INT NOT NULL,
    MESSAGE_CONTENT BYTEA NOT NULL,
    CONSTRAINT PK_MB_DTX_ENQUEUE_CONTENT PRIMARY KEY (MESSAGE_ID,CONTENT_OFFSET),
    CONSTRAINT FK_MB_DTX_ENQUEUE_CONTENT FOREIGN KEY (MESSAGE_ID)
    REFERENCES MB_DTX_ENQUEUE_RECORD (MESSAGE_ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS MB_DTX_DEQUEUE_CONTENT (
    INTERNAL_XID NUMERIC(19) NOT NULL,
    MESSAGE_ID NUMERIC(19) NOT NULL,
    CONTENT_OFFSET INT NOT NULL,
    MESSAGE_CONTENT BYTEA NOT NULL,
    CONSTRAINT PK_MB_DTX_DEQUEUE_CONTENT PRIMARY KEY (MESSAGE_ID,CONTENT_OFFSET),
    CONSTRAINT FK_MB_DTX_DEQUEUE_CONTENT FOREIGN KEY (MESSAGE_ID)
    REFERENCES MB_DTX_DEQUEUE_RECORD (MESSAGE_ID) ON DELETE CASCADE
);

-- End of Message Store Tables --

-- Start of Andes Context Store Tables --


CREATE TABLE MB_DURABLE_SUBSCRIPTION (
    SUBSCRIPTION_ID VARCHAR(512) NOT NULL, 
    DESTINATION_IDENTIFIER VARCHAR(512) NOT NULL,
    SUBSCRIPTION_DATA VARCHAR(2048) NOT NULL
);

CREATE TABLE MB_NODE (
    NODE_ID VARCHAR(512) NOT NULL,
    NODE_DATA VARCHAR(2048) NOT NULL,
        CONSTRAINT PK_MB_NODE PRIMARY KEY (NODE_ID)
);

CREATE TABLE MB_EXCHANGE (
    EXCHANGE_NAME VARCHAR(512) NOT NULL,
    EXCHANGE_DATA VARCHAR(2048) NOT NULL,
    CONSTRAINT PK_MB_EXCHANGE PRIMARY KEY (EXCHANGE_NAME)
);

CREATE TABLE MB_QUEUE (
    QUEUE_NAME VARCHAR(512) NOT NULL,
    QUEUE_DATA VARCHAR(2048) NOT NULL,
    CONSTRAINT PK_MB_QUEUE PRIMARY KEY (QUEUE_NAME)
);

CREATE TABLE MB_BINDING (
    EXCHANGE_NAME VARCHAR(512) NOT NULL,
    QUEUE_NAME VARCHAR(512) NOT NULL,
    BINDING_DETAILS VARCHAR(2048) NOT NULL,
    CONSTRAINT FK_MB_BINDING_EXCHANGE FOREIGN KEY (EXCHANGE_NAME) REFERENCES MB_EXCHANGE (EXCHANGE_NAME),
    CONSTRAINT FK_MB_BINDING_QUEUE FOREIGN KEY (QUEUE_NAME) REFERENCES MB_QUEUE (QUEUE_NAME)
    ON DELETE CASCADE
);

CREATE TABLE MB_QUEUE_COUNTER (
    QUEUE_NAME VARCHAR(512) NOT NULL,
    MESSAGE_COUNT NUMERIC(19), 
    CONSTRAINT PK_QUEUE_COUNTER PRIMARY KEY (QUEUE_NAME) 
);

CREATE TABLE MB_SLOT (
    SLOT_ID BIGSERIAL NOT NULL,
    START_MESSAGE_ID NUMERIC(19) NOT NULL,
    END_MESSAGE_ID NUMERIC(19) NOT NULL,
    STORAGE_QUEUE_NAME VARCHAR(512) NOT NULL,
    SLOT_STATE NUMERIC(3) NOT NULL,
    ASSIGNED_NODE_ID VARCHAR(512),
    ASSIGNED_QUEUE_NAME VARCHAR(512),
    CONSTRAINT PK_MB_SLOT PRIMARY KEY (SLOT_ID)
);

CREATE INDEX MB_SLOT_MESSAGE_ID_INDEX ON MB_SLOT (START_MESSAGE_ID, END_MESSAGE_ID);

CREATE INDEX MB_SLOT_QUEUE_INDEX ON MB_SLOT (STORAGE_QUEUE_NAME);

CREATE TABLE MB_SLOT_MESSAGE_ID (
    QUEUE_NAME VARCHAR(512) NOT NULL,
    MESSAGE_ID NUMERIC(19) NOT NULL,
    CONSTRAINT PK_MB_SLOT_MESSAGE_ID PRIMARY KEY (QUEUE_NAME,MESSAGE_ID)
);

CREATE TABLE MB_NODE_TO_LAST_PUBLISHED_ID (
    NODE_ID VARCHAR(512) NOT NULL,
    MESSAGE_ID NUMERIC(19) NOT NULL,
    CONSTRAINT PK_MB_LAST_PUBLISHED_ID PRIMARY KEY (NODE_ID)
);

CREATE TABLE MB_QUEUE_TO_LAST_ASSIGNED_ID (
    QUEUE_NAME VARCHAR(512) NOT NULL,
    MESSAGE_ID NUMERIC(19) NOT NULL,
    CONSTRAINT PK_MB_LAST_ASSIGNED_ID PRIMARY KEY (QUEUE_NAME)
);

CREATE TABLE MB_RETAINED_CONTENT (
    MESSAGE_ID NUMERIC(19),
    CONTENT_OFFSET INT,
    MESSAGE_CONTENT BYTEA NOT NULL,
    CONSTRAINT PK_MB_RETAINED_CONTENT PRIMARY KEY (MESSAGE_ID,CONTENT_OFFSET)
);

CREATE TABLE MB_MSG_STORE_STATUS (
    NODE_ID VARCHAR(512) NOT NULL,
    TIME_STAMP NUMERIC(19),
    CONSTRAINT PK_MSG_STORE_STATUS PRIMARY KEY (NODE_ID, TIME_STAMP) 
);

CREATE TABLE MB_CLUSTER_EVENT (
    EVENT_ID BIGSERIAL,
    ORIGINATED_NODE_ID VARCHAR(512) NOT NULL,
    DESTINED_NODE_ID VARCHAR(512) NOT NULL,
    EVENT_ARTIFACT VARCHAR(25) NOT NULL,
    EVENT_TYPE VARCHAR(25) NOT NULL,
    EVENT_DETAILS VARCHAR(1024) NOT NULL,
    EVENT_DESCRIPTION VARCHAR(1024),
    CONSTRAINT PK_MB_CLUSTER_EVENT PRIMARY KEY (EVENT_ID)
);

CREATE TABLE MB_COORDINATOR_HEARTBEAT (
    ANCHOR INT NOT NULL,
    NODE_ID VARCHAR(512) NOT NULL,
    LAST_HEARTBEAT NUMERIC(19) NOT NULL,
    THRIFT_HOST VARCHAR(512) NOT NULL,
    THRIFT_PORT INT NOT NULL,
    PRIMARY KEY (ANCHOR)
);

CREATE TABLE MB_NODE_HEARTBEAT (
    NODE_ID VARCHAR(512) NOT NULL,
    LAST_HEARTBEAT NUMERIC(19) NOT NULL,
    IS_NEW_NODE NUMERIC(3) NOT NULL,
    CLUSTER_AGENT_HOST VARCHAR(512) NOT NULL,
    CLUSTER_AGENT_PORT INT NOT NULL,
    PRIMARY KEY (NODE_ID)
);

CREATE TABLE MB_MEMBERSHIP (
    EVENT_ID BIGSERIAL NOT NULL,
    NODE_ID VARCHAR(512) NOT NULL,
    CHANGE_TYPE NUMERIC(3) NOT NULL,
    CHANGED_MEMBER_ID VARCHAR(512) NOT NULL,
    PRIMARY KEY (EVENT_ID)
);



-- create WSO2AM_DB

\c wso2am_db;

\echo 'WSO2AM_DB';



BEGIN TRANSACTION;

-- Start of IDN Tables --
DROP TABLE IF EXISTS IDN_BASE_TABLE;
CREATE TABLE IDN_BASE_TABLE (
            PRODUCT_NAME VARCHAR(20),
            PRIMARY KEY (PRODUCT_NAME)
);

INSERT INTO IDN_BASE_TABLE values ('WSO2 Identity Server');

DROP TABLE IF EXISTS IDN_OAUTH_CONSUMER_APPS;
DROP SEQUENCE IF EXISTS IDN_OAUTH_CONSUMER_APPS_PK_SEQ;
CREATE SEQUENCE IDN_OAUTH_CONSUMER_APPS_PK_SEQ;
CREATE TABLE IDN_OAUTH_CONSUMER_APPS (
            ID INTEGER DEFAULT NEXTVAL('IDN_OAUTH_CONSUMER_APPS_PK_SEQ'),
            CONSUMER_KEY VARCHAR(255),
            CONSUMER_SECRET VARCHAR(2048),
            USERNAME VARCHAR(255),
            TENANT_ID INTEGER DEFAULT 0,
            USER_DOMAIN VARCHAR(50),
            APP_NAME VARCHAR(255),
            OAUTH_VERSION VARCHAR(128),
            CALLBACK_URL VARCHAR(1024),
            GRANT_TYPES VARCHAR (1024),
            PKCE_MANDATORY CHAR(1) DEFAULT '0',
            PKCE_SUPPORT_PLAIN CHAR(1) DEFAULT '0',
            APP_STATE VARCHAR (25) DEFAULT 'ACTIVE',
            USER_ACCESS_TOKEN_EXPIRE_TIME BIGINT DEFAULT 3600000,
            APP_ACCESS_TOKEN_EXPIRE_TIME BIGINT DEFAULT 3600000,
            REFRESH_TOKEN_EXPIRE_TIME BIGINT DEFAULT 84600000,
            ID_TOKEN_EXPIRE_TIME BIGINT DEFAULT 3600000,
            CONSTRAINT CONSUMER_KEY_CONSTRAINT UNIQUE (CONSUMER_KEY),
            PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS IDN_OAUTH2_SCOPE_VALIDATORS;
CREATE TABLE IDN_OAUTH2_SCOPE_VALIDATORS (
	APP_ID INTEGER NOT NULL,
	SCOPE_VALIDATOR VARCHAR (128) NOT NULL,
	PRIMARY KEY (APP_ID,SCOPE_VALIDATOR),
	FOREIGN KEY (APP_ID) REFERENCES IDN_OAUTH_CONSUMER_APPS(ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS IDN_OAUTH1A_REQUEST_TOKEN;
CREATE TABLE IDN_OAUTH1A_REQUEST_TOKEN (
            REQUEST_TOKEN VARCHAR(512),
            REQUEST_TOKEN_SECRET VARCHAR(512),
            CONSUMER_KEY_ID INTEGER,
            CALLBACK_URL VARCHAR(1024),
            SCOPE VARCHAR(2048),
            AUTHORIZED VARCHAR(128),
            OAUTH_VERIFIER VARCHAR(512),
            AUTHZ_USER VARCHAR(512),
            TENANT_ID INTEGER DEFAULT -1,
            PRIMARY KEY (REQUEST_TOKEN),
            FOREIGN KEY (CONSUMER_KEY_ID) REFERENCES IDN_OAUTH_CONSUMER_APPS(ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS IDN_OAUTH1A_ACCESS_TOKEN;
CREATE TABLE IDN_OAUTH1A_ACCESS_TOKEN (
            ACCESS_TOKEN VARCHAR(512),
            ACCESS_TOKEN_SECRET VARCHAR(512),
            CONSUMER_KEY_ID INTEGER,
            SCOPE VARCHAR(2048),
            AUTHZ_USER VARCHAR(512),
            TENANT_ID INTEGER DEFAULT -1,
            PRIMARY KEY (ACCESS_TOKEN),
            FOREIGN KEY (CONSUMER_KEY_ID) REFERENCES IDN_OAUTH_CONSUMER_APPS(ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS IDN_OAUTH2_ACCESS_TOKEN;
CREATE TABLE IDN_OAUTH2_ACCESS_TOKEN (
            TOKEN_ID VARCHAR (255),
            ACCESS_TOKEN VARCHAR(2048),
            REFRESH_TOKEN VARCHAR(2048),
            CONSUMER_KEY_ID INTEGER,
            AUTHZ_USER VARCHAR (100),
            TENANT_ID INTEGER,
            USER_DOMAIN VARCHAR(50),
            USER_TYPE VARCHAR (25),
            GRANT_TYPE VARCHAR (50),
            TIME_CREATED TIMESTAMP,
            REFRESH_TOKEN_TIME_CREATED TIMESTAMP,
            VALIDITY_PERIOD BIGINT,
            REFRESH_TOKEN_VALIDITY_PERIOD BIGINT,
            TOKEN_SCOPE_HASH VARCHAR(32),
            TOKEN_STATE VARCHAR(25) DEFAULT 'ACTIVE',
            TOKEN_STATE_ID VARCHAR (128) DEFAULT 'NONE',
            SUBJECT_IDENTIFIER VARCHAR(255),
            ACCESS_TOKEN_HASH VARCHAR(512),
            REFRESH_TOKEN_HASH VARCHAR(512),
            PRIMARY KEY (TOKEN_ID),
            FOREIGN KEY (CONSUMER_KEY_ID) REFERENCES IDN_OAUTH_CONSUMER_APPS(ID) ON DELETE CASCADE,
            CONSTRAINT CON_APP_KEY UNIQUE (CONSUMER_KEY_ID,AUTHZ_USER,TOKEN_ID,USER_DOMAIN,USER_TYPE,TOKEN_SCOPE_HASH,
                                           TOKEN_STATE,TOKEN_STATE_ID)
);

CREATE INDEX IDX_AT_CK_AU ON IDN_OAUTH2_ACCESS_TOKEN(CONSUMER_KEY_ID, AUTHZ_USER, TOKEN_STATE, USER_TYPE);

CREATE INDEX IDX_TC ON IDN_OAUTH2_ACCESS_TOKEN(TIME_CREATED);

CREATE INDEX IDX_ATH ON IDN_OAUTH2_ACCESS_TOKEN(ACCESS_TOKEN_HASH);

CREATE INDEX IDX_AT_TI_UD ON IDN_OAUTH2_ACCESS_TOKEN(AUTHZ_USER, TENANT_ID, TOKEN_STATE, USER_DOMAIN);

DROP TABLE IF EXISTS IDN_OAUTH2_AUTHORIZATION_CODE;
CREATE TABLE IDN_OAUTH2_AUTHORIZATION_CODE (
            CODE_ID VARCHAR (255),
            AUTHORIZATION_CODE VARCHAR(2048),
            CONSUMER_KEY_ID INTEGER,
	          CALLBACK_URL VARCHAR(1024),
            SCOPE VARCHAR(2048),
            AUTHZ_USER VARCHAR (100),
            TENANT_ID INTEGER,
            USER_DOMAIN VARCHAR(50),
	          TIME_CREATED TIMESTAMP,
	          VALIDITY_PERIOD BIGINT,
            STATE VARCHAR (25) DEFAULT 'ACTIVE',
            TOKEN_ID VARCHAR(255),
            SUBJECT_IDENTIFIER VARCHAR(255),
            PKCE_CODE_CHALLENGE VARCHAR (255),
            PKCE_CODE_CHALLENGE_METHOD VARCHAR(128),
            AUTHORIZATION_CODE_HASH VARCHAR(512),
            PRIMARY KEY (CODE_ID),
            FOREIGN KEY (CONSUMER_KEY_ID) REFERENCES IDN_OAUTH_CONSUMER_APPS(ID) ON DELETE CASCADE
);

CREATE INDEX IDX_AUTHORIZATION_CODE_HASH ON IDN_OAUTH2_AUTHORIZATION_CODE (AUTHORIZATION_CODE_HASH,CONSUMER_KEY_ID);

CREATE INDEX IDX_AUTHORIZATION_CODE_AU_TI ON IDN_OAUTH2_AUTHORIZATION_CODE (AUTHZ_USER,TENANT_ID, USER_DOMAIN, STATE);

DROP TABLE IF EXISTS IDN_OAUTH2_ACCESS_TOKEN_SCOPE;
CREATE TABLE IDN_OAUTH2_ACCESS_TOKEN_SCOPE (
            TOKEN_ID VARCHAR (255),
            TOKEN_SCOPE VARCHAR (60),
            TENANT_ID INTEGER DEFAULT -1,
            PRIMARY KEY (TOKEN_ID, TOKEN_SCOPE),
            FOREIGN KEY (TOKEN_ID) REFERENCES IDN_OAUTH2_ACCESS_TOKEN(TOKEN_ID) ON DELETE CASCADE);

DROP TABLE IF EXISTS IDN_OAUTH2_SCOPE;
DROP SEQUENCE IF EXISTS IDN_OAUTH2_SCOPE_PK_SEQ;
CREATE SEQUENCE IDN_OAUTH2_SCOPE_PK_SEQ;
CREATE TABLE IF NOT EXISTS IDN_OAUTH2_SCOPE (
            SCOPE_ID INTEGER DEFAULT NEXTVAL('IDN_OAUTH2_SCOPE_PK_SEQ'),
            NAME VARCHAR(255) NOT NULL,
            DISPLAY_NAME VARCHAR(255) NOT NULL,
            DESCRIPTION VARCHAR(512),
            TENANT_ID INTEGER NOT NULL DEFAULT -1,
            PRIMARY KEY (SCOPE_ID)
);

DROP TABLE IF EXISTS IDN_OAUTH2_SCOPE_BINDING;
CREATE TABLE IF NOT EXISTS IDN_OAUTH2_SCOPE_BINDING (
            SCOPE_ID INTEGER NOT NULL,
            SCOPE_BINDING VARCHAR(255),
            FOREIGN KEY (SCOPE_ID) REFERENCES IDN_OAUTH2_SCOPE(SCOPE_ID) ON DELETE CASCADE,
            PRIMARY KEY (SCOPE_ID, SCOPE_BINDING)
);

DROP TABLE IF EXISTS IDN_OAUTH2_RESOURCE_SCOPE;
CREATE TABLE IF NOT EXISTS IDN_OAUTH2_RESOURCE_SCOPE (
            RESOURCE_PATH VARCHAR(255) NOT NULL,
            SCOPE_ID INTEGER NOT NULL,
            TENANT_ID INTEGER DEFAULT -1,
            PRIMARY KEY (RESOURCE_PATH),
            FOREIGN KEY (SCOPE_ID) REFERENCES IDN_OAUTH2_SCOPE (SCOPE_ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS IDN_SCIM_GROUP;
DROP SEQUENCE IF EXISTS IDN_SCIM_GROUP_PK_SEQ;
CREATE SEQUENCE IDN_SCIM_GROUP_PK_SEQ;
CREATE TABLE IDN_SCIM_GROUP (
			ID INTEGER DEFAULT NEXTVAL('IDN_SCIM_GROUP_PK_SEQ'),
			TENANT_ID INTEGER NOT NULL,
			ROLE_NAME VARCHAR(255) NOT NULL,
            ATTR_NAME VARCHAR(1024) NOT NULL,
			ATTR_VALUE VARCHAR(1024),
            PRIMARY KEY (ID)
);
CREATE INDEX IDX_IDN_SCIM_GROUP_TI_RN ON IDN_SCIM_GROUP (TENANT_ID, ROLE_NAME);

CREATE INDEX IDX_IDN_SCIM_GROUP_TI_RN_AN ON IDN_SCIM_GROUP (TENANT_ID, ROLE_NAME, ATTR_NAME);

DROP TABLE IF EXISTS IDN_OPENID_REMEMBER_ME;
CREATE TABLE IDN_OPENID_REMEMBER_ME (
            USER_NAME VARCHAR(255) NOT NULL,
            TENANT_ID INTEGER DEFAULT 0,
            COOKIE_VALUE VARCHAR(1024),
            CREATED_TIME TIMESTAMP,
            PRIMARY KEY (USER_NAME, TENANT_ID)
);

DROP TABLE IF EXISTS IDN_OPENID_USER_RPS;
CREATE TABLE IDN_OPENID_USER_RPS (
			USER_NAME VARCHAR(255) NOT NULL,
			TENANT_ID INTEGER DEFAULT 0,
			RP_URL VARCHAR(255) NOT NULL,
			TRUSTED_ALWAYS VARCHAR(128) DEFAULT 'FALSE',
			LAST_VISIT DATE NOT NULL,
			VISIT_COUNT INTEGER DEFAULT 0,
			DEFAULT_PROFILE_NAME VARCHAR(255) DEFAULT 'DEFAULT',
			PRIMARY KEY (USER_NAME, TENANT_ID, RP_URL)
);

DROP TABLE IF EXISTS IDN_OPENID_ASSOCIATIONS;
CREATE TABLE IDN_OPENID_ASSOCIATIONS (
            HANDLE VARCHAR(255) NOT NULL,
            ASSOC_TYPE VARCHAR(255) NOT NULL,
            EXPIRE_IN TIMESTAMP NOT NULL,
            MAC_KEY VARCHAR(255) NOT NULL,
            ASSOC_STORE VARCHAR(128) DEFAULT 'SHARED',
            TENANT_ID INTEGER DEFAULT -1,
            PRIMARY KEY (HANDLE)
);

DROP TABLE IF EXISTS IDN_STS_STORE;
DROP SEQUENCE IF EXISTS IDN_STS_STORE_PK_SEQ;
CREATE SEQUENCE IDN_STS_STORE_PK_SEQ;
CREATE TABLE IDN_STS_STORE (
            ID INTEGER DEFAULT NEXTVAL('IDN_STS_STORE_PK_SEQ'),
            TOKEN_ID VARCHAR(255) NOT NULL,
            TOKEN_CONTENT BYTEA NOT NULL,
            CREATE_DATE TIMESTAMP NOT NULL,
            EXPIRE_DATE TIMESTAMP NOT NULL,
            STATE INTEGER DEFAULT 0,
            PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS IDN_IDENTITY_USER_DATA;
CREATE TABLE IDN_IDENTITY_USER_DATA (
            TENANT_ID INTEGER DEFAULT -1234,
            USER_NAME VARCHAR(255) NOT NULL,
            DATA_KEY VARCHAR(255) NOT NULL,
            DATA_VALUE VARCHAR(2048),
            PRIMARY KEY (TENANT_ID, USER_NAME, DATA_KEY)
);

DROP TABLE IF EXISTS IDN_IDENTITY_META_DATA;
CREATE TABLE IDN_IDENTITY_META_DATA (
            USER_NAME VARCHAR(255) NOT NULL,
            TENANT_ID INTEGER DEFAULT -1234,
            METADATA_TYPE VARCHAR(255) NOT NULL,
            METADATA VARCHAR(255) NOT NULL,
            VALID VARCHAR(255) NOT NULL,
            PRIMARY KEY (TENANT_ID, USER_NAME, METADATA_TYPE,METADATA)
);

DROP TABLE IF EXISTS IDN_THRIFT_SESSION;
CREATE TABLE IDN_THRIFT_SESSION (
            SESSION_ID VARCHAR(255) NOT NULL,
            USER_NAME VARCHAR(255) NOT NULL,
            CREATED_TIME VARCHAR(255) NOT NULL,
            LAST_MODIFIED_TIME VARCHAR(255) NOT NULL,
            TENANT_ID INTEGER DEFAULT -1,
            PRIMARY KEY (SESSION_ID)
);

DROP TABLE IF EXISTS IDN_AUTH_SESSION_STORE;
CREATE TABLE IDN_AUTH_SESSION_STORE (
            SESSION_ID VARCHAR(100) NOT NULL,
            SESSION_TYPE VARCHAR(100) NOT NULL,
            OPERATION VARCHAR(10) NOT NULL,
            SESSION_OBJECT BYTEA,
            TIME_CREATED BIGINT,
            TENANT_ID INTEGER DEFAULT -1,
            EXPIRY_TIME BIGINT,
            PRIMARY KEY (SESSION_ID, SESSION_TYPE, TIME_CREATED, OPERATION)
	);

CREATE INDEX IDX_IDN_AUTH_SESSION_STORE_TIME ON IDN_AUTH_SESSION_STORE (TIME_CREATED);


DROP TABLE IF EXISTS IDN_AUTH_TEMP_SESSION_STORE;
CREATE TABLE IDN_AUTH_TEMP_SESSION_STORE (
            SESSION_ID VARCHAR(100) NOT NULL,
            SESSION_TYPE VARCHAR(100) NOT NULL,
            OPERATION VARCHAR(10) NOT NULL,
            SESSION_OBJECT BYTEA,
            TIME_CREATED BIGINT,
            TENANT_ID INTEGER DEFAULT -1,
            EXPIRY_TIME BIGINT,
            PRIMARY KEY (SESSION_ID, SESSION_TYPE, TIME_CREATED, OPERATION)
);

CREATE INDEX IDX_IDN_AUTH_TEMP_SESSION_STORE_TIME ON IDN_AUTH_TEMP_SESSION_STORE (TIME_CREATED);


DROP TABLE IF EXISTS SP_APP;
DROP SEQUENCE IF EXISTS SP_APP_SEQ;
CREATE SEQUENCE SP_APP_SEQ;
CREATE TABLE SP_APP (
            ID INTEGER DEFAULT NEXTVAL('SP_APP_SEQ'),
            TENANT_ID INTEGER NOT NULL,
            APP_NAME VARCHAR (255) NOT NULL ,
            USER_STORE VARCHAR (255) NOT NULL,
            USERNAME VARCHAR (255) NOT NULL ,
            DESCRIPTION VARCHAR (1024),
	    	    ROLE_CLAIM VARCHAR (512),
            AUTH_TYPE VARCHAR (255) NOT NULL,
            PROVISIONING_USERSTORE_DOMAIN VARCHAR (512),
            IS_LOCAL_CLAIM_DIALECT CHAR(1) DEFAULT '1',
            IS_SEND_LOCAL_SUBJECT_ID CHAR(1) DEFAULT '0',
            IS_SEND_AUTH_LIST_OF_IDPS CHAR(1) DEFAULT '0',
            IS_USE_TENANT_DOMAIN_SUBJECT CHAR(1) DEFAULT '1',
            IS_USE_USER_DOMAIN_SUBJECT CHAR(1) DEFAULT '1',
            ENABLE_AUTHORIZATION CHAR(1) DEFAULT '0',
            SUBJECT_CLAIM_URI VARCHAR (512),
            IS_SAAS_APP CHAR(1) DEFAULT '0',
            IS_DUMB_MODE CHAR(1) DEFAULT '0',
            PRIMARY KEY (ID));

ALTER TABLE SP_APP ADD CONSTRAINT APPLICATION_NAME_CONSTRAINT UNIQUE(APP_NAME, TENANT_ID);

DROP TABLE IF EXISTS SP_METADATA;
DROP SEQUENCE IF EXISTS SP_METADATA_SEQ;
CREATE SEQUENCE SP_METADATA_SEQ;
CREATE TABLE SP_METADATA (
            ID INTEGER DEFAULT NEXTVAL('SP_METADATA_SEQ'),
            SP_ID INTEGER,
            NAME VARCHAR(255) NOT NULL,
            VALUE VARCHAR(255) NOT NULL,
            DISPLAY_NAME VARCHAR(255),
            TENANT_ID INTEGER DEFAULT -1,
            PRIMARY KEY (ID),
            CONSTRAINT SP_METADATA_CONSTRAINT UNIQUE (SP_ID, NAME),
            FOREIGN KEY (SP_ID) REFERENCES SP_APP(ID) ON DELETE CASCADE);

DROP TABLE IF EXISTS SP_INBOUND_AUTH;
DROP SEQUENCE IF EXISTS SP_INBOUND_AUTH_SEQ;
CREATE SEQUENCE SP_INBOUND_AUTH_SEQ;
CREATE TABLE SP_INBOUND_AUTH (
            ID INTEGER DEFAULT NEXTVAL('SP_INBOUND_AUTH_SEQ'),
            TENANT_ID INTEGER NOT NULL,
            INBOUND_AUTH_KEY VARCHAR (255),
            INBOUND_AUTH_TYPE VARCHAR (255) NOT NULL,
            INBOUND_CONFIG_TYPE VARCHAR (255) NOT NULL,
            PROP_NAME VARCHAR (255),
            PROP_VALUE VARCHAR (1024) ,
            APP_ID INTEGER NOT NULL,
            PRIMARY KEY (ID));

ALTER TABLE SP_INBOUND_AUTH ADD CONSTRAINT APPLICATION_ID_CONSTRAINT FOREIGN KEY (APP_ID) REFERENCES SP_APP (ID) ON DELETE CASCADE;

DROP TABLE IF EXISTS SP_AUTH_STEP;
DROP SEQUENCE IF EXISTS SP_AUTH_STEP_SEQ;
CREATE SEQUENCE SP_AUTH_STEP_SEQ;
CREATE TABLE SP_AUTH_STEP (
            ID INTEGER DEFAULT NEXTVAL('SP_AUTH_STEP_SEQ'),
            TENANT_ID INTEGER NOT NULL,
	     	STEP_ORDER INTEGER DEFAULT 1,
            APP_ID INTEGER NOT NULL,
            IS_SUBJECT_STEP CHAR(1) DEFAULT '0',
            IS_ATTRIBUTE_STEP CHAR(1) DEFAULT '0',
            PRIMARY KEY (ID));

ALTER TABLE SP_AUTH_STEP ADD CONSTRAINT APPLICATION_ID_CONSTRAINT_STEP FOREIGN KEY (APP_ID) REFERENCES SP_APP (ID) ON DELETE CASCADE;

DROP TABLE IF EXISTS SP_FEDERATED_IDP;
CREATE TABLE SP_FEDERATED_IDP (
            ID INTEGER NOT NULL,
            TENANT_ID INTEGER NOT NULL,
            AUTHENTICATOR_ID INTEGER NOT NULL,
            PRIMARY KEY (ID, AUTHENTICATOR_ID));

ALTER TABLE SP_FEDERATED_IDP ADD CONSTRAINT STEP_ID_CONSTRAINT FOREIGN KEY (ID) REFERENCES SP_AUTH_STEP (ID) ON DELETE CASCADE;

DROP TABLE IF EXISTS SP_CLAIM_DIALECT;
DROP SEQUENCE IF EXISTS SP_CLAIM_DIALECT_SEQ;
CREATE SEQUENCE SP_CLAIM_DIALECT_SEQ;
CREATE TABLE SP_CLAIM_DIALECT (
	    	ID INTEGER DEFAULT NEXTVAL('SP_CLAIM_DIALECT_SEQ'),
	    	TENANT_ID INTEGER NOT NULL,
	    	SP_DIALECT VARCHAR (512) NOT NULL,
	   		APP_ID INTEGER NOT NULL,
        PRIMARY KEY (ID));

ALTER TABLE SP_CLAIM_DIALECT ADD CONSTRAINT DIALECTID_APPID_CONSTRAINT FOREIGN KEY (APP_ID) REFERENCES SP_APP (ID) ON DELETE CASCADE;

DROP TABLE IF EXISTS SP_CLAIM_MAPPING;
DROP SEQUENCE IF EXISTS SP_CLAIM_MAPPING_SEQ;
CREATE SEQUENCE SP_CLAIM_MAPPING_SEQ;
CREATE TABLE SP_CLAIM_MAPPING (
	    	ID INTEGER DEFAULT NEXTVAL('SP_CLAIM_MAPPING_SEQ'),
	    	TENANT_ID INTEGER NOT NULL,
	    	IDP_CLAIM VARCHAR (512) NOT NULL ,
            SP_CLAIM VARCHAR (512) NOT NULL ,
	   		APP_ID INTEGER NOT NULL,
	    	IS_REQUESTED VARCHAR(128) DEFAULT '0',
		IS_MANDATORY VARCHAR(128) DEFAULT '0',
	    	DEFAULT_VALUE VARCHAR(255),
            PRIMARY KEY (ID));

ALTER TABLE SP_CLAIM_MAPPING ADD CONSTRAINT CLAIMID_APPID_CONSTRAINT FOREIGN KEY (APP_ID) REFERENCES SP_APP (ID) ON DELETE CASCADE;

DROP TABLE IF EXISTS SP_ROLE_MAPPING;
DROP SEQUENCE IF EXISTS SP_ROLE_MAPPING_SEQ;
CREATE SEQUENCE SP_ROLE_MAPPING_SEQ;
CREATE TABLE SP_ROLE_MAPPING (
	    	ID INTEGER DEFAULT NEXTVAL('SP_ROLE_MAPPING_SEQ'),
	    	TENANT_ID INTEGER NOT NULL,
	    	IDP_ROLE VARCHAR (255) NOT NULL ,
            SP_ROLE VARCHAR (255) NOT NULL ,
	    	APP_ID INTEGER NOT NULL,
            PRIMARY KEY (ID));

ALTER TABLE SP_ROLE_MAPPING ADD CONSTRAINT ROLEID_APPID_CONSTRAINT FOREIGN KEY (APP_ID) REFERENCES SP_APP (ID) ON DELETE CASCADE;

DROP TABLE IF EXISTS SP_REQ_PATH_AUTH;
DROP SEQUENCE IF EXISTS SP_REQ_PATH_AUTH_SEQ;
CREATE SEQUENCE SP_REQ_PATH_AUTH_SEQ;
CREATE TABLE SP_REQ_PATH_AUTHENTICATOR (
	    	ID INTEGER DEFAULT NEXTVAL('SP_REQ_PATH_AUTH_SEQ'),
	    	TENANT_ID INTEGER NOT NULL,
	    	AUTHENTICATOR_NAME VARCHAR (255) NOT NULL ,
	    	APP_ID INTEGER NOT NULL,
            PRIMARY KEY (ID));

ALTER TABLE SP_REQ_PATH_AUTHENTICATOR ADD CONSTRAINT REQ_AUTH_APPID_CONSTRAINT FOREIGN KEY (APP_ID) REFERENCES SP_APP (ID) ON DELETE CASCADE;

DROP TABLE IF EXISTS SP_PROV_CONNECTOR;
DROP SEQUENCE IF EXISTS SP_PROV_CONNECTOR_SEQ;
CREATE SEQUENCE SP_PROV_CONNECTOR_SEQ;
CREATE TABLE SP_PROVISIONING_CONNECTOR (
	    	ID INTEGER DEFAULT NEXTVAL('SP_PROV_CONNECTOR_SEQ'),
	    	TENANT_ID INTEGER NOT NULL,
            IDP_NAME VARCHAR (255) NOT NULL ,
	    	CONNECTOR_NAME VARCHAR (255) NOT NULL ,
	    	APP_ID INTEGER NOT NULL,
	    	IS_JIT_ENABLED CHAR(1) NOT NULL DEFAULT '0',
		    BLOCKING CHAR(1) NOT NULL DEFAULT '0',
		    RULE_ENABLED CHAR(1) NOT NULL DEFAULT '0',
            PRIMARY KEY (ID));

ALTER TABLE SP_PROVISIONING_CONNECTOR ADD CONSTRAINT PRO_CONNECTOR_APPID_CONSTRAINT FOREIGN KEY (APP_ID) REFERENCES SP_APP (ID) ON DELETE CASCADE;

DROP TABLE IF EXISTS SP_AUTH_SCRIPT;
DROP SEQUENCE IF EXISTS SP_AUTH_SCRIPT_SEQ;
CREATE SEQUENCE SP_AUTH_SCRIPT_SEQ;
CREATE TABLE SP_AUTH_SCRIPT (
  ID         INTEGER      NOT NULL DEFAULT NEXTVAL('SP_AUTH_SCRIPT_SEQ'),
  TENANT_ID  INTEGER      NOT NULL,
  APP_ID     INTEGER      NOT NULL,
  TYPE       VARCHAR(255) NOT NULL,
  CONTENT    BYTEA                 DEFAULT NULL,
  IS_ENABLED CHAR(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS IDP;
DROP SEQUENCE IF EXISTS IDP_SEQ;
CREATE SEQUENCE IDP_SEQ;
CREATE TABLE IDP (
			ID INTEGER DEFAULT NEXTVAL('IDP_SEQ'),
			TENANT_ID INTEGER,
			NAME VARCHAR(254) NOT NULL,
			IS_ENABLED CHAR(1) NOT NULL DEFAULT '1',
			IS_PRIMARY CHAR(1) NOT NULL DEFAULT '0',
			HOME_REALM_ID VARCHAR(254),
			IMAGE BYTEA,
			CERTIFICATE BYTEA,
			ALIAS VARCHAR(254),
			INBOUND_PROV_ENABLED CHAR (1) NOT NULL DEFAULT '0',
			INBOUND_PROV_USER_STORE_ID VARCHAR(254),
 			USER_CLAIM_URI VARCHAR(254),
 			ROLE_CLAIM_URI VARCHAR(254),
  			DESCRIPTION VARCHAR (1024),
 			DEFAULT_AUTHENTICATOR_NAME VARCHAR(254),
 			DEFAULT_PRO_CONNECTOR_NAME VARCHAR(254),
 			PROVISIONING_ROLE VARCHAR(128),
 			IS_FEDERATION_HUB CHAR(1) NOT NULL DEFAULT '0',
 			IS_LOCAL_CLAIM_DIALECT CHAR(1) NOT NULL DEFAULT '0',
	                DISPLAY_NAME VARCHAR(255),
			PRIMARY KEY (ID),
			UNIQUE (TENANT_ID, NAME));

DROP TABLE IF EXISTS IDP_ROLE;
DROP SEQUENCE IF EXISTS IDP_ROLE_SEQ;
CREATE SEQUENCE IDP_ROLE_SEQ;
CREATE TABLE IDP_ROLE (
			ID INTEGER DEFAULT NEXTVAL('IDP_ROLE_SEQ'),
			IDP_ID INTEGER,
			TENANT_ID INTEGER,
			ROLE VARCHAR(254),
			PRIMARY KEY (ID),
			UNIQUE (IDP_ID, ROLE),
			FOREIGN KEY (IDP_ID) REFERENCES IDP(ID) ON DELETE CASCADE);

DROP TABLE IF EXISTS IDP_ROLE_MAPPING;
DROP SEQUENCE IF EXISTS IDP_ROLE_MAPPING_SEQ;
CREATE SEQUENCE IDP_ROLE_MAPPING_SEQ;
CREATE TABLE IDP_ROLE_MAPPING (
			ID INTEGER DEFAULT NEXTVAL('IDP_ROLE_MAPPING_SEQ'),
			IDP_ROLE_ID INTEGER,
			TENANT_ID INTEGER,
			USER_STORE_ID VARCHAR (253),
			LOCAL_ROLE VARCHAR(253),
			PRIMARY KEY (ID),
			UNIQUE (IDP_ROLE_ID, TENANT_ID, USER_STORE_ID, LOCAL_ROLE),
			FOREIGN KEY (IDP_ROLE_ID) REFERENCES IDP_ROLE(ID) ON DELETE CASCADE);

DROP TABLE IF EXISTS IDP_CLAIM;
DROP SEQUENCE IF EXISTS IDP_CLAIM_SEQ;
CREATE SEQUENCE IDP_CLAIM_SEQ;
CREATE TABLE IDP_CLAIM (
			ID INTEGER DEFAULT NEXTVAL('IDP_CLAIM_SEQ'),
			IDP_ID INTEGER,
			TENANT_ID INTEGER,
			CLAIM VARCHAR(254),
			PRIMARY KEY (ID),
			UNIQUE (IDP_ID, CLAIM),
			FOREIGN KEY (IDP_ID) REFERENCES IDP(ID) ON DELETE CASCADE);

DROP TABLE IF EXISTS IDP_CLAIM_MAPPING;
DROP SEQUENCE IF EXISTS IDP_CLAIM_MAPPING_SEQ;
CREATE SEQUENCE IDP_CLAIM_MAPPING_SEQ;
CREATE TABLE IDP_CLAIM_MAPPING (
			ID INTEGER DEFAULT NEXTVAL('IDP_CLAIM_MAPPING_SEQ'),
			IDP_CLAIM_ID INTEGER,
			TENANT_ID INTEGER,
			LOCAL_CLAIM VARCHAR(253),
		    DEFAULT_VALUE VARCHAR(255),
	    	IS_REQUESTED VARCHAR(128) DEFAULT '0',
			PRIMARY KEY (ID),
			UNIQUE (IDP_CLAIM_ID, TENANT_ID, LOCAL_CLAIM),
			FOREIGN KEY (IDP_CLAIM_ID) REFERENCES IDP_CLAIM(ID) ON DELETE CASCADE);

DROP TABLE IF EXISTS IDP_AUTHENTICATOR;
DROP SEQUENCE IF EXISTS IDP_AUTHENTICATOR_SEQ;
CREATE SEQUENCE IDP_AUTHENTICATOR_SEQ;
CREATE TABLE IDP_AUTHENTICATOR (
            ID INTEGER DEFAULT NEXTVAL('IDP_AUTHENTICATOR_SEQ'),
            TENANT_ID INTEGER,
            IDP_ID INTEGER,
            NAME VARCHAR(255) NOT NULL,
            IS_ENABLED CHAR (1) DEFAULT '1',
            DISPLAY_NAME VARCHAR(255),
            PRIMARY KEY (ID),
            UNIQUE (TENANT_ID, IDP_ID, NAME),
            FOREIGN KEY (IDP_ID) REFERENCES IDP(ID) ON DELETE CASCADE);

DROP TABLE IF EXISTS IDP_METADATA;
DROP SEQUENCE IF EXISTS IDP_METADATA_SEQ;
CREATE SEQUENCE IDP_METADATA_SEQ;
CREATE TABLE IDP_METADATA (
            ID INTEGER DEFAULT NEXTVAL('IDP_METADATA_SEQ'),
            IDP_ID INTEGER,
            NAME VARCHAR(255) NOT NULL,
            VALUE VARCHAR(255) NOT NULL,
            DISPLAY_NAME VARCHAR(255),
            TENANT_ID INTEGER DEFAULT -1,
            PRIMARY KEY (ID),
            CONSTRAINT IDP_METADATA_CONSTRAINT UNIQUE (IDP_ID, NAME),
            FOREIGN KEY (IDP_ID) REFERENCES IDP(ID) ON DELETE CASCADE);

DROP TABLE IF EXISTS IDP_AUTHENTICATOR_PROP;
DROP SEQUENCE IF EXISTS IDP_AUTHENTICATOR_PROP_SEQ;
CREATE SEQUENCE IDP_AUTHENTICATOR_PROP_SEQ;
CREATE TABLE IDP_AUTHENTICATOR_PROPERTY (
            ID INTEGER DEFAULT NEXTVAL('IDP_AUTHENTICATOR_PROP_SEQ'),
            TENANT_ID INTEGER,
            AUTHENTICATOR_ID INTEGER,
            PROPERTY_KEY VARCHAR(255) NOT NULL,
            PROPERTY_VALUE VARCHAR(2047),
            IS_SECRET CHAR (1) DEFAULT '0',
            PRIMARY KEY (ID),
            UNIQUE (TENANT_ID, AUTHENTICATOR_ID, PROPERTY_KEY),
            FOREIGN KEY (AUTHENTICATOR_ID) REFERENCES IDP_AUTHENTICATOR(ID) ON DELETE CASCADE);

DROP TABLE IF EXISTS IDP_PROV_CONFIG;
DROP SEQUENCE IF EXISTS IDP_PROV_CONFIG_SEQ;
CREATE SEQUENCE IDP_PROV_CONFIG_SEQ;
CREATE TABLE IDP_PROVISIONING_CONFIG (
            ID INTEGER DEFAULT NEXTVAL('IDP_PROV_CONFIG_SEQ'),
            TENANT_ID INTEGER,
            IDP_ID INTEGER,
            PROVISIONING_CONNECTOR_TYPE VARCHAR(255) NOT NULL,
            IS_ENABLED CHAR (1) DEFAULT '0',
            IS_BLOCKING CHAR (1) DEFAULT '0',
            IS_RULES_ENABLED CHAR (1) DEFAULT '0',
            PRIMARY KEY (ID),
            UNIQUE (TENANT_ID, IDP_ID, PROVISIONING_CONNECTOR_TYPE),
            FOREIGN KEY (IDP_ID) REFERENCES IDP(ID) ON DELETE CASCADE);

DROP TABLE IF EXISTS IDP_PROV_CONFIG_PROP;
DROP SEQUENCE IF EXISTS IDP_PROV_CONFIG_PROP_SEQ;
CREATE SEQUENCE IDP_PROV_CONFIG_PROP_SEQ;
CREATE TABLE IDP_PROV_CONFIG_PROPERTY (
            ID INTEGER DEFAULT NEXTVAL('IDP_PROV_CONFIG_PROP_SEQ'),
            TENANT_ID INTEGER,
            PROVISIONING_CONFIG_ID INTEGER,
            PROPERTY_KEY VARCHAR(255) NOT NULL,
            PROPERTY_VALUE VARCHAR(2048),
            PROPERTY_BLOB_VALUE BYTEA,
            PROPERTY_TYPE CHAR(32) NOT NULL,
            IS_SECRET CHAR (1) DEFAULT '0',
            PRIMARY KEY (ID),
            UNIQUE (TENANT_ID, PROVISIONING_CONFIG_ID, PROPERTY_KEY),
            FOREIGN KEY (PROVISIONING_CONFIG_ID) REFERENCES IDP_PROVISIONING_CONFIG(ID) ON DELETE CASCADE);

DROP TABLE IF EXISTS IDP_PROV_ENTITY;
DROP SEQUENCE IF EXISTS IDP_PROV_ENTITY_SEQ;
CREATE SEQUENCE IDP_PROV_ENTITY_SEQ;
CREATE TABLE IDP_PROVISIONING_ENTITY (
            ID INTEGER DEFAULT NEXTVAL('IDP_PROV_ENTITY_SEQ'),
            PROVISIONING_CONFIG_ID INTEGER,
            ENTITY_TYPE VARCHAR(255) NOT NULL,
            ENTITY_LOCAL_USERSTORE VARCHAR(255) NOT NULL,
            ENTITY_NAME VARCHAR(255) NOT NULL,
            ENTITY_VALUE VARCHAR(255),
            TENANT_ID INTEGER,
            ENTITY_LOCAL_ID VARCHAR(255),
            PRIMARY KEY (ID),
            UNIQUE (ENTITY_TYPE, TENANT_ID, ENTITY_LOCAL_USERSTORE, ENTITY_NAME, PROVISIONING_CONFIG_ID),
            UNIQUE (PROVISIONING_CONFIG_ID, ENTITY_TYPE, ENTITY_VALUE),
            FOREIGN KEY (PROVISIONING_CONFIG_ID) REFERENCES IDP_PROVISIONING_CONFIG(ID) ON DELETE CASCADE);

DROP TABLE IF EXISTS IDP_LOCAL_CLAIM;
DROP SEQUENCE IF EXISTS IDP_LOCAL_CLAIM_SEQ;
CREATE SEQUENCE IDP_LOCAL_CLAIM_SEQ;
CREATE TABLE IF NOT EXISTS IDP_LOCAL_CLAIM(
            ID INTEGER DEFAULT NEXTVAL('IDP_LOCAL_CLAIM_SEQ'),
            TENANT_ID INTEGER,
            IDP_ID INTEGER,
            CLAIM_URI VARCHAR(255) NOT NULL,
            DEFAULT_VALUE VARCHAR(255),
	        IS_REQUESTED VARCHAR(128) DEFAULT '0',
            PRIMARY KEY (ID),
            UNIQUE (TENANT_ID, IDP_ID, CLAIM_URI),
            FOREIGN KEY (IDP_ID) REFERENCES IDP(ID) ON DELETE CASCADE);

DROP TABLE IF EXISTS IDN_ASSOCIATED_ID;
DROP SEQUENCE IF EXISTS IDN_ASSOCIATED_ID_SEQ;
CREATE SEQUENCE IDN_ASSOCIATED_ID_SEQ;
CREATE TABLE IDN_ASSOCIATED_ID (
            ID INTEGER DEFAULT NEXTVAL('IDN_ASSOCIATED_ID_SEQ'),
	    IDP_USER_ID VARCHAR(255) NOT NULL,
            TENANT_ID INTEGER DEFAULT -1234,
	    IDP_ID INTEGER NOT NULL,
            DOMAIN_NAME VARCHAR(255) NOT NULL,
 	    USER_NAME VARCHAR(255) NOT NULL,
	    PRIMARY KEY (ID),
            UNIQUE(IDP_USER_ID, TENANT_ID, IDP_ID),
            FOREIGN KEY (IDP_ID) REFERENCES IDP(ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS IDN_USER_ACCOUNT_ASSOCIATION;
CREATE TABLE IDN_USER_ACCOUNT_ASSOCIATION (
            ASSOCIATION_KEY VARCHAR(255) NOT NULL,
            TENANT_ID INTEGER,
            DOMAIN_NAME VARCHAR(255) NOT NULL,
            USER_NAME VARCHAR(255) NOT NULL,
            PRIMARY KEY (TENANT_ID, DOMAIN_NAME, USER_NAME));

DROP TABLE IF EXISTS FIDO_DEVICE_STORE;
CREATE TABLE FIDO_DEVICE_STORE (
        TENANT_ID INTEGER,
        DOMAIN_NAME VARCHAR(255) NOT NULL,
        USER_NAME VARCHAR(45) NOT NULL,
	TIME_REGISTERED TIMESTAMP,
        KEY_HANDLE VARCHAR(200) NOT NULL,
        DEVICE_DATA VARCHAR(2048) NOT NULL,
      PRIMARY KEY (TENANT_ID, DOMAIN_NAME, USER_NAME, KEY_HANDLE));

DROP TABLE IF EXISTS WF_REQUEST;
CREATE TABLE WF_REQUEST (
    UUID VARCHAR (45),
    CREATED_BY VARCHAR (255),
    TENANT_ID INTEGER DEFAULT -1,
    OPERATION_TYPE VARCHAR (50),
    CREATED_AT TIMESTAMP,
    UPDATED_AT TIMESTAMP,
    STATUS VARCHAR (30),
    REQUEST BYTEA,
    PRIMARY KEY (UUID)
);

DROP TABLE IF EXISTS WF_BPS_PROFILE;
CREATE TABLE WF_BPS_PROFILE (
    PROFILE_NAME VARCHAR(45),
    HOST_URL_MANAGER VARCHAR(255),
    HOST_URL_WORKER VARCHAR(255),
    USERNAME VARCHAR(45),
    PASSWORD VARCHAR(1023),
    CALLBACK_HOST VARCHAR (45),
    TENANT_ID INTEGER DEFAULT -1,
    PRIMARY KEY (PROFILE_NAME, TENANT_ID)
);

DROP TABLE IF EXISTS WF_WORKFLOW;
CREATE TABLE WF_WORKFLOW(
    ID VARCHAR (45),
    WF_NAME VARCHAR (45),
    DESCRIPTION VARCHAR (255),
    TEMPLATE_ID VARCHAR (45),
    IMPL_ID VARCHAR (45),
    TENANT_ID INTEGER DEFAULT -1,
    PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS WF_WORKFLOW_ASSOCIATION;
DROP SEQUENCE IF EXISTS WF_WORKFLOW_ASSOCIATION_PK_SEQ;
CREATE SEQUENCE WF_WORKFLOW_ASSOCIATION_PK_SEQ;
CREATE TABLE WF_WORKFLOW_ASSOCIATION(
    ID INTEGER DEFAULT NEXTVAL('WF_WORKFLOW_ASSOCIATION_PK_SEQ'),
    ASSOC_NAME VARCHAR (45),
    EVENT_ID VARCHAR(45),
    ASSOC_CONDITION VARCHAR (2000),
    WORKFLOW_ID VARCHAR (45),
    IS_ENABLED CHAR (1) DEFAULT '1',
    TENANT_ID INTEGER DEFAULT -1,
    PRIMARY KEY(ID),
    FOREIGN KEY (WORKFLOW_ID) REFERENCES WF_WORKFLOW(ID)ON DELETE CASCADE
);

DROP TABLE IF EXISTS WF_WORKFLOW_CONFIG_PARAM;
CREATE TABLE WF_WORKFLOW_CONFIG_PARAM(
    WORKFLOW_ID VARCHAR (45),
    PARAM_NAME VARCHAR (45),
    PARAM_VALUE VARCHAR (1000),
    PARAM_QNAME VARCHAR (45),
    PARAM_HOLDER VARCHAR (45),
    TENANT_ID INTEGER DEFAULT -1,
    PRIMARY KEY (WORKFLOW_ID, PARAM_NAME, PARAM_QNAME, PARAM_HOLDER),
    FOREIGN KEY (WORKFLOW_ID) REFERENCES WF_WORKFLOW(ID)ON DELETE CASCADE
);

DROP TABLE IF EXISTS WF_REQUEST_ENTITY_RELATIONSHIP;
CREATE TABLE WF_REQUEST_ENTITY_RELATIONSHIP(
  REQUEST_ID VARCHAR (45),
  ENTITY_NAME VARCHAR (255),
  ENTITY_TYPE VARCHAR (50),
  TENANT_ID INTEGER DEFAULT -1,
  PRIMARY KEY(REQUEST_ID, ENTITY_NAME, ENTITY_TYPE, TENANT_ID),
  FOREIGN KEY (REQUEST_ID) REFERENCES WF_REQUEST(UUID)ON DELETE CASCADE
);

DROP TABLE IF EXISTS WF_WORKFLOW_REQUEST_RELATION;
CREATE TABLE WF_WORKFLOW_REQUEST_RELATION(
  RELATIONSHIP_ID VARCHAR (45),
  WORKFLOW_ID VARCHAR (45),
  REQUEST_ID VARCHAR (45),
  UPDATED_AT TIMESTAMP,
  STATUS VARCHAR (30),
  TENANT_ID INTEGER DEFAULT -1,
  PRIMARY KEY (RELATIONSHIP_ID),
  FOREIGN KEY (WORKFLOW_ID) REFERENCES WF_WORKFLOW(ID)ON DELETE CASCADE,
  FOREIGN KEY (REQUEST_ID) REFERENCES WF_REQUEST(UUID)ON DELETE CASCADE
);

DROP TABLE IF EXISTS IDN_RECOVERY_DATA;
CREATE TABLE IDN_RECOVERY_DATA (
  USER_NAME VARCHAR(255) NOT NULL,
  USER_DOMAIN VARCHAR(127) NOT NULL,
  TENANT_ID INTEGER DEFAULT -1,
  CODE VARCHAR(255) NOT NULL,
  SCENARIO VARCHAR(255) NOT NULL,
  STEP VARCHAR(127) NOT NULL,
  TIME_CREATED TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  REMAINING_SETS VARCHAR(2500) DEFAULT NULL,
  PRIMARY KEY(USER_NAME, USER_DOMAIN, TENANT_ID, SCENARIO,STEP),
  UNIQUE(CODE)
);

DROP TABLE IF EXISTS IDN_PASSWORD_HISTORY_DATA;
CREATE SEQUENCE IDN_PASSWORD_HISTORY_DATA_PK_SEQ;
CREATE TABLE IDN_PASSWORD_HISTORY_DATA (
  ID INTEGER DEFAULT NEXTVAL('IDN_PASSWORD_HISTORY_DATA_PK_SEQ'),
  USER_NAME   VARCHAR(255) NOT NULL,
  USER_DOMAIN VARCHAR(127) NOT NULL,
  TENANT_ID   INTEGER DEFAULT -1,
  SALT_VALUE  VARCHAR(255),
  HASH        VARCHAR(255) NOT NULL,
  TIME_CREATED TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (ID),
  UNIQUE (USER_NAME,USER_DOMAIN,TENANT_ID,SALT_VALUE,HASH)
);

DROP TABLE IF EXISTS IDN_CLAIM_DIALECT;
DROP SEQUENCE IF EXISTS IDN_CLAIM_DIALECT_SEQ;
CREATE SEQUENCE IDN_CLAIM_DIALECT_SEQ;
CREATE TABLE IDN_CLAIM_DIALECT (
  ID INTEGER DEFAULT NEXTVAL('IDN_CLAIM_DIALECT_SEQ'),
  DIALECT_URI VARCHAR (255) NOT NULL,
  TENANT_ID INTEGER NOT NULL,
  PRIMARY KEY (ID),
  CONSTRAINT DIALECT_URI_CONSTRAINT UNIQUE (DIALECT_URI, TENANT_ID)
);

DROP TABLE IF EXISTS IDN_CLAIM;
DROP SEQUENCE IF EXISTS IDN_CLAIM_SEQ;
CREATE SEQUENCE IDN_CLAIM_SEQ;
CREATE TABLE IDN_CLAIM (
  ID INTEGER DEFAULT NEXTVAL('IDN_CLAIM_SEQ'),
  DIALECT_ID INTEGER,
  CLAIM_URI VARCHAR (255) NOT NULL,
  TENANT_ID INTEGER NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (DIALECT_ID) REFERENCES IDN_CLAIM_DIALECT(ID) ON DELETE CASCADE,
  CONSTRAINT CLAIM_URI_CONSTRAINT UNIQUE (DIALECT_ID, CLAIM_URI, TENANT_ID)
);

DROP TABLE IF EXISTS IDN_CLAIM_MAPPED_ATTRIBUTE;
DROP SEQUENCE IF EXISTS IDN_CLAIM_MAPPED_ATTRIBUTE_SEQ;
CREATE SEQUENCE IDN_CLAIM_MAPPED_ATTRIBUTE_SEQ;
CREATE TABLE IDN_CLAIM_MAPPED_ATTRIBUTE (
  ID INTEGER DEFAULT NEXTVAL('IDN_CLAIM_MAPPED_ATTRIBUTE_SEQ'),
  LOCAL_CLAIM_ID INTEGER,
  USER_STORE_DOMAIN_NAME VARCHAR (255) NOT NULL,
  ATTRIBUTE_NAME VARCHAR (255) NOT NULL,
  TENANT_ID INTEGER NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (LOCAL_CLAIM_ID) REFERENCES IDN_CLAIM(ID) ON DELETE CASCADE,
  CONSTRAINT USER_STORE_DOMAIN_CONSTRAINT UNIQUE (LOCAL_CLAIM_ID, USER_STORE_DOMAIN_NAME, TENANT_ID)
);

DROP TABLE IF EXISTS IDN_CLAIM_PROPERTY;
DROP SEQUENCE IF EXISTS IDN_CLAIM_PROPERTY_SEQ;
CREATE SEQUENCE IDN_CLAIM_PROPERTY_SEQ;
CREATE TABLE IDN_CLAIM_PROPERTY (
  ID INTEGER DEFAULT NEXTVAL('IDN_CLAIM_PROPERTY_SEQ'),
  LOCAL_CLAIM_ID INTEGER,
  PROPERTY_NAME VARCHAR (255) NOT NULL,
  PROPERTY_VALUE VARCHAR (255) NOT NULL,
  TENANT_ID INTEGER NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (LOCAL_CLAIM_ID) REFERENCES IDN_CLAIM(ID) ON DELETE CASCADE,
  CONSTRAINT PROPERTY_NAME_CONSTRAINT UNIQUE (LOCAL_CLAIM_ID, PROPERTY_NAME, TENANT_ID)
);

DROP TABLE IF EXISTS IDN_CLAIM_MAPPING;
DROP SEQUENCE IF EXISTS IDN_CLAIM_MAPPING_SEQ;
CREATE SEQUENCE IDN_CLAIM_MAPPING_SEQ;
CREATE TABLE IDN_CLAIM_MAPPING (
  ID INTEGER DEFAULT NEXTVAL('IDN_CLAIM_MAPPING_SEQ'),
  EXT_CLAIM_ID INTEGER NOT NULL,
  MAPPED_LOCAL_CLAIM_ID INTEGER NOT NULL,
  TENANT_ID INTEGER NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (EXT_CLAIM_ID) REFERENCES IDN_CLAIM(ID) ON DELETE CASCADE,
  FOREIGN KEY (MAPPED_LOCAL_CLAIM_ID) REFERENCES IDN_CLAIM(ID) ON DELETE CASCADE,
  CONSTRAINT EXT_TO_LOC_MAPPING_CONSTRN UNIQUE (EXT_CLAIM_ID, TENANT_ID)
);

DROP TABLE IF EXISTS IDN_SAML2_ASSERTION_STORE;
DROP SEQUENCE IF EXISTS IDN_SAML2_ASSERTION_STORE_SEQ;
CREATE SEQUENCE IDN_SAML2_ASSERTION_STORE_SEQ;
CREATE TABLE IDN_SAML2_ASSERTION_STORE (
  ID INTEGER DEFAULT NEXTVAL('IDN_SAML2_ASSERTION_STORE_SEQ'),
  SAML2_ID  VARCHAR(255) ,
  SAML2_ISSUER  VARCHAR(255) ,
  SAML2_SUBJECT  VARCHAR(255) ,
  SAML2_SESSION_INDEX  VARCHAR(255) ,
  SAML2_AUTHN_CONTEXT_CLASS_REF  VARCHAR(255) ,
  SAML2_ASSERTION  VARCHAR(4096) ,
  PRIMARY KEY (ID)
);
DROP TABLE IF EXISTS IDN_OIDC_JTI;
CREATE TABLE IDN_OIDC_JTI (
  JWT_ID VARCHAR(255) NOT NULL,
  EXP_TIME TIMESTAMP NOT NULL,
  TIME_CREATED TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (JWT_ID)
);

DROP TABLE IF EXISTS IDN_OIDC_PROPERTY;
DROP SEQUENCE IF EXISTS IDN_OIDC_PROPERTY_SEQ;
CREATE SEQUENCE IDN_OIDC_PROPERTY_SEQ;
CREATE TABLE IDN_OIDC_PROPERTY (
  ID INTEGER DEFAULT NEXTVAL('IDN_OIDC_PROPERTY_SEQ'),
  TENANT_ID  INTEGER,
  CONSUMER_KEY  VARCHAR(255) ,
  PROPERTY_KEY  VARCHAR(255) NOT NULL,
  PROPERTY_VALUE  VARCHAR(2047) ,
  PRIMARY KEY (ID) ,
  FOREIGN KEY (CONSUMER_KEY) REFERENCES IDN_OAUTH_CONSUMER_APPS(CONSUMER_KEY) ON DELETE CASCADE
);
DROP TABLE IF EXISTS IDN_OIDC_REQ_OBJECT_REFERENCE;
DROP SEQUENCE IF EXISTS IDN_OIDC_REQUEST_OBJECT_REF_SEQ;
CREATE SEQUENCE IDN_OIDC_REQUEST_OBJECT_REF_SEQ;
CREATE TABLE IDN_OIDC_REQ_OBJECT_REFERENCE (
  ID INTEGER DEFAULT NEXTVAL('IDN_OIDC_REQUEST_OBJECT_REF_SEQ'),
  CONSUMER_KEY_ID INTEGER ,
  CODE_ID VARCHAR(255) ,
  TOKEN_ID VARCHAR(255) ,
  SESSION_DATA_KEY VARCHAR(255),
  PRIMARY KEY (ID),
  FOREIGN KEY (CONSUMER_KEY_ID) REFERENCES IDN_OAUTH_CONSUMER_APPS(ID) ON DELETE CASCADE,
  FOREIGN KEY (TOKEN_ID) REFERENCES IDN_OAUTH2_ACCESS_TOKEN(TOKEN_ID) ON DELETE CASCADE,
  FOREIGN KEY (CODE_ID) REFERENCES IDN_OAUTH2_AUTHORIZATION_CODE(CODE_ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS IDN_OIDC_REQ_OBJECT_CLAIMS;
DROP SEQUENCE IF EXISTS IDN_OIDC_REQ_OBJECT_CLAIMS_SEQ;
CREATE SEQUENCE IDN_OIDC_REQ_OBJECT_CLAIMS_SEQ;
CREATE TABLE IDN_OIDC_REQ_OBJECT_CLAIMS (
  ID INTEGER DEFAULT NEXTVAL('IDN_OIDC_REQ_OBJECT_CLAIMS_SEQ'),
  REQ_OBJECT_ID INTEGER,
  CLAIM_ATTRIBUTE VARCHAR(255) ,
  ESSENTIAL CHAR(1) NOT NULL DEFAULT '0' ,
  VALUE VARCHAR(255) ,
  IS_USERINFO CHAR(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (ID),
  FOREIGN KEY (REQ_OBJECT_ID) REFERENCES IDN_OIDC_REQ_OBJECT_REFERENCE (ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS IDN_OIDC_REQ_OBJ_CLAIM_VALUES;
DROP SEQUENCE IF EXISTS IDN_OIDC_REQ_OBJECT_CLAIM_VALUES_SEQ;
CREATE SEQUENCE IDN_OIDC_REQ_OBJECT_CLAIM_VALUES_SEQ;
CREATE TABLE IDN_OIDC_REQ_OBJ_CLAIM_VALUES (
  ID INTEGER DEFAULT NEXTVAL('IDN_OIDC_REQ_OBJECT_CLAIM_VALUES_SEQ'),
  REQ_OBJECT_CLAIMS_ID INTEGER ,
  CLAIM_VALUES VARCHAR(255) ,
  PRIMARY KEY (ID),
  FOREIGN KEY (REQ_OBJECT_CLAIMS_ID) REFERENCES IDN_OIDC_REQ_OBJECT_CLAIMS(ID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS IDN_CERTIFICATE;
DROP SEQUENCE IF EXISTS IDN_CERTIFICATE_PK_SEQ;
CREATE SEQUENCE IDN_CERTIFICATE_PK_SEQ;
CREATE TABLE IDN_CERTIFICATE (
            ID INTEGER DEFAULT NEXTVAL('IDN_CERTIFICATE_PK_SEQ'),
            NAME VARCHAR(100),
            CERTIFICATE_IN_PEM BYTEA,
            TENANT_ID INTEGER DEFAULT 0,
            CONSTRAINT CERTIFICATE_UNIQUE_KEY UNIQUE (NAME, TENANT_ID),
            PRIMARY KEY (ID)
);


-- End of IDENTITY Tables--

-- Start of CONSENT-MGT Tables --

DROP TABLE IF EXISTS CM_PII_CATEGORY;
DROP SEQUENCE IF EXISTS CM_PII_CATEGORY_PK_SEQ;
CREATE SEQUENCE CM_PII_CATEGORY_PK_SEQ;
CREATE TABLE CM_PII_CATEGORY (
  ID           INTEGER DEFAULT NEXTVAL('CM_PII_CATEGORY_PK_SEQ'),
  NAME         VARCHAR(255) NOT NULL,
  DESCRIPTION  VARCHAR(1023),
  DISPLAY_NAME VARCHAR(255),
  IS_SENSITIVE INTEGER      NOT NULL,
  TENANT_ID    INTEGER DEFAULT '-1234',
  CONSTRAINT CM_PII_CATEGORY_CNT UNIQUE (NAME, TENANT_ID),
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS CM_RECEIPT;
CREATE TABLE CM_RECEIPT (
  CONSENT_RECEIPT_ID  VARCHAR(255) NOT NULL,
  VERSION             VARCHAR(255) NOT NULL,
  JURISDICTION        VARCHAR(255) NOT NULL,
  CONSENT_TIMESTAMP   TIMESTAMP    NOT NULL,
  COLLECTION_METHOD   VARCHAR(255) NOT NULL,
  LANGUAGE            VARCHAR(255) NOT NULL,
  PII_PRINCIPAL_ID    VARCHAR(255) NOT NULL,
  PRINCIPAL_TENANT_ID INTEGER DEFAULT '-1234',
  POLICY_URL          VARCHAR(255) NOT NULL,
  STATE               VARCHAR(255) NOT NULL,
  PII_CONTROLLER      VARCHAR(2048) NOT NULL,
  PRIMARY KEY (CONSENT_RECEIPT_ID)
);

DROP TABLE IF EXISTS CM_PURPOSE;
DROP SEQUENCE IF EXISTS CM_PURPOSE_PK_SEQ;
CREATE SEQUENCE CM_PURPOSE_PK_SEQ;
CREATE TABLE CM_PURPOSE (
  ID          INTEGER DEFAULT NEXTVAL('CM_PURPOSE_PK_SEQ'),
  NAME        VARCHAR(255) NOT NULL,
  DESCRIPTION VARCHAR(1023),
  TENANT_ID   INTEGER DEFAULT '-1234',
  CONSTRAINT CM_PURPOSE_CNT UNIQUE  (NAME, TENANT_ID),
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS CM_PURPOSE_CATEGORY;
DROP SEQUENCE IF EXISTS CM_PURPOSE_CATEGORY_PK_SEQ;
CREATE SEQUENCE CM_PURPOSE_CATEGORY_PK_SEQ;
CREATE TABLE CM_PURPOSE_CATEGORY (
  ID          INTEGER DEFAULT NEXTVAL('CM_PURPOSE_CATEGORY_PK_SEQ'),
  NAME        VARCHAR(255) NOT NULL,
  DESCRIPTION VARCHAR(1023),
  TENANT_ID   INTEGER DEFAULT '-1234',
  CONSTRAINT CM_PURPOSE_CATEGORY_CNT UNIQUE  (NAME, TENANT_ID),
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS CM_RECEIPT_SP_ASSOC;
DROP SEQUENCE IF EXISTS CM_RECEIPT_SP_ASSOC_PK_SEQ;
CREATE SEQUENCE CM_RECEIPT_SP_ASSOC_PK_SEQ;
CREATE TABLE CM_RECEIPT_SP_ASSOC (
  ID                 INTEGER DEFAULT NEXTVAL('CM_RECEIPT_SP_ASSOC_PK_SEQ'),
  CONSENT_RECEIPT_ID VARCHAR(255) NOT NULL,
  SP_NAME            VARCHAR(255) NOT NULL,
  SP_DISPLAY_NAME    VARCHAR(255),
  SP_DESCRIPTION     VARCHAR(255),
  SP_TENANT_ID       INTEGER DEFAULT '-1234',
  CONSTRAINT CM_RECEIPT_SP_ASSOC_CNT UNIQUE  (CONSENT_RECEIPT_ID, SP_NAME, SP_TENANT_ID),
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS CM_SP_PURPOSE_ASSOC;
DROP SEQUENCE IF EXISTS CM_SP_PURPOSE_ASSOC_PK_SEQ;
CREATE SEQUENCE CM_SP_PURPOSE_ASSOC_PK_SEQ;
CREATE TABLE CM_SP_PURPOSE_ASSOC (
  ID                     INTEGER DEFAULT NEXTVAL('CM_SP_PURPOSE_ASSOC_PK_SEQ'),
  RECEIPT_SP_ASSOC       INTEGER      NOT NULL,
  PURPOSE_ID             INTEGER      NOT NULL,
  CONSENT_TYPE           VARCHAR(255) NOT NULL,
  IS_PRIMARY_PURPOSE     INTEGER      NOT NULL,
  TERMINATION            VARCHAR(255) NOT NULL,
  THIRD_PARTY_DISCLOSURE INTEGER      NOT NULL,
  THIRD_PARTY_NAME       VARCHAR(255),
  CONSTRAINT CM_SP_PURPOSE_ASSOC_CNT UNIQUE  (RECEIPT_SP_ASSOC, PURPOSE_ID),
  PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS CM_SP_PURPOSE_PURPOSE_CAT_ASSC;
CREATE TABLE CM_SP_PURPOSE_PURPOSE_CAT_ASSC (
  SP_PURPOSE_ASSOC_ID INTEGER NOT NULL,
  PURPOSE_CATEGORY_ID INTEGER NOT NULL,
  CONSTRAINT CM_SP_PURPOSE_PURPOSE_CAT_ASSC_CNT UNIQUE  (SP_PURPOSE_ASSOC_ID, PURPOSE_CATEGORY_ID)
);

DROP TABLE IF EXISTS CM_PURPOSE_PII_CAT_ASSOC;
CREATE TABLE CM_PURPOSE_PII_CAT_ASSOC (
  PURPOSE_ID         INTEGER NOT NULL,
  CM_PII_CATEGORY_ID INTEGER NOT NULL,
  CONSTRAINT CM_PURPOSE_PII_CAT_ASSOC_CNT UNIQUE  (PURPOSE_ID, CM_PII_CATEGORY_ID)
);

DROP TABLE IF EXISTS CM_SP_PURPOSE_PII_CAT_ASSOC;
CREATE TABLE CM_SP_PURPOSE_PII_CAT_ASSOC (
  SP_PURPOSE_ASSOC_ID INTEGER NOT NULL,
  PII_CATEGORY_ID     INTEGER NOT NULL,
  VALIDITY            VARCHAR(1023),
  CONSTRAINT CM_SP_PURPOSE_PII_CAT_ASSOC_CNT UNIQUE  (SP_PURPOSE_ASSOC_ID, PII_CATEGORY_ID)
);

DROP TABLE IF EXISTS CM_CONSENT_RECEIPT_PROPERTY;
CREATE TABLE CM_CONSENT_RECEIPT_PROPERTY (
  CONSENT_RECEIPT_ID VARCHAR(255)  NOT NULL,
  NAME               VARCHAR(255)  NOT NULL,
  VALUE              VARCHAR(1023) NOT NULL,
  CONSTRAINT CM_CONSENT_RECEIPT_PROPERTY_CNT UNIQUE  (CONSENT_RECEIPT_ID, NAME)
);

ALTER TABLE CM_RECEIPT_SP_ASSOC
  ADD CONSTRAINT CM_RECEIPT_SP_ASSOC_fk0 FOREIGN KEY (CONSENT_RECEIPT_ID) REFERENCES CM_RECEIPT (CONSENT_RECEIPT_ID);

ALTER TABLE CM_SP_PURPOSE_ASSOC
  ADD CONSTRAINT CM_SP_PURPOSE_ASSOC_fk0 FOREIGN KEY (RECEIPT_SP_ASSOC) REFERENCES CM_RECEIPT_SP_ASSOC (ID);

ALTER TABLE CM_SP_PURPOSE_ASSOC
  ADD CONSTRAINT CM_SP_PURPOSE_ASSOC_fk1 FOREIGN KEY (PURPOSE_ID) REFERENCES CM_PURPOSE (ID);

ALTER TABLE CM_SP_PURPOSE_PURPOSE_CAT_ASSC
  ADD CONSTRAINT CM_SP_P_P_CAT_ASSOC_fk0 FOREIGN KEY (SP_PURPOSE_ASSOC_ID) REFERENCES CM_SP_PURPOSE_ASSOC (ID);

ALTER TABLE CM_SP_PURPOSE_PURPOSE_CAT_ASSC
  ADD CONSTRAINT CM_SP_P_P_CAT_ASSOC_fk1 FOREIGN KEY (PURPOSE_CATEGORY_ID) REFERENCES CM_PURPOSE_CATEGORY (ID);

ALTER TABLE CM_SP_PURPOSE_PII_CAT_ASSOC
  ADD CONSTRAINT CM_SP_P_PII_CAT_ASSOC_fk0 FOREIGN KEY (SP_PURPOSE_ASSOC_ID) REFERENCES CM_SP_PURPOSE_ASSOC (ID);

ALTER TABLE CM_SP_PURPOSE_PII_CAT_ASSOC
  ADD CONSTRAINT CM_SP_P_PII_CAT_ASSOC_fk1 FOREIGN KEY (PII_CATEGORY_ID) REFERENCES CM_PII_CATEGORY (ID);

ALTER TABLE CM_CONSENT_RECEIPT_PROPERTY
  ADD CONSTRAINT CM_CONSENT_RECEIPT_PRT_fk0 FOREIGN KEY (CONSENT_RECEIPT_ID) REFERENCES CM_RECEIPT (CONSENT_RECEIPT_ID);

INSERT INTO CM_PURPOSE (NAME, DESCRIPTION, TENANT_ID) values ('DEFAULT', 'For core functionalities of the product', '-1234');

INSERT INTO CM_PURPOSE_CATEGORY (NAME, DESCRIPTION, TENANT_ID) VALUES ('DEFAULT','For core functionalities of the product', '-1234');

-- End of CONSENT-MGT Tables --

CREATE SEQUENCE AM_SUBSCRIBER_SEQUENCE START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_SUBSCRIBER (
    SUBSCRIBER_ID INTEGER DEFAULT nextval('am_subscriber_sequence'),
    USER_ID VARCHAR(50) NOT NULL,
    TENANT_ID INTEGER NOT NULL,
    EMAIL_ADDRESS VARCHAR(256) NULL,
    DATE_SUBSCRIBED DATE NOT NULL,
    CREATED_BY VARCHAR(100),
    CREATED_TIME DATE,
    UPDATED_BY VARCHAR(100),
    UPDATED_TIME DATE,
    PRIMARY KEY (SUBSCRIBER_ID),
    UNIQUE (TENANT_ID,USER_ID)
)
;

CREATE SEQUENCE AM_APPLICATION_SEQUENCE START WITH 1 INCREMENT BY 1 ;
CREATE TABLE IF NOT EXISTS AM_APPLICATION (
    APPLICATION_ID INTEGER DEFAULT nextval('am_application_sequence'),
    NAME VARCHAR(100),
    SUBSCRIBER_ID INTEGER,
    APPLICATION_TIER VARCHAR(50) DEFAULT 'Unlimited',
    CALLBACK_URL VARCHAR(512),
    DESCRIPTION VARCHAR(512),
    APPLICATION_STATUS VARCHAR(50) DEFAULT 'APPROVED',
    GROUP_ID VARCHAR(100),
    CREATED_BY VARCHAR(100),
    CREATED_TIME DATE,
    UPDATED_BY VARCHAR(100),
    UPDATED_TIME DATE,
    UUID VARCHAR(256),
    TOKEN_TYPE VARCHAR(10),
    FOREIGN KEY(SUBSCRIBER_ID) REFERENCES AM_SUBSCRIBER(SUBSCRIBER_ID) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY(APPLICATION_ID),
    UNIQUE (NAME,SUBSCRIBER_ID),
    UNIQUE (UUID)
)
;

CREATE SEQUENCE AM_API_SEQUENCE START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_API (
    API_ID INTEGER DEFAULT nextval('am_api_sequence'),
    API_PROVIDER VARCHAR(256),
    API_NAME VARCHAR(256),
    API_VERSION VARCHAR(30),
    CONTEXT VARCHAR(256),
    CONTEXT_TEMPLATE VARCHAR(256),
    API_TIER VARCHAR(256),
    CREATED_BY VARCHAR(100),
    CREATED_TIME DATE,
    UPDATED_BY VARCHAR(100),
    UPDATED_TIME DATE,
    PRIMARY KEY(API_ID),
    UNIQUE (API_PROVIDER,API_NAME,API_VERSION)
);

CREATE SEQUENCE AM_API_URL_MAPPING_SEQUENCE START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_API_URL_MAPPING (
    URL_MAPPING_ID INTEGER DEFAULT nextval('am_api_url_mapping_sequence'),
    API_ID INTEGER NOT NULL,
    HTTP_METHOD VARCHAR(20) NULL,
    AUTH_SCHEME VARCHAR(50) NULL,
    URL_PATTERN VARCHAR(512) NULL,
    THROTTLING_TIER varchar(512) DEFAULT NULL,
    MEDIATION_SCRIPT BYTEA,
    PRIMARY KEY(URL_MAPPING_ID)
)
;

CREATE SEQUENCE AM_SUBSCRIPTION_SEQUENCE START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_SUBSCRIPTION (
    SUBSCRIPTION_ID INTEGER DEFAULT nextval('am_subscription_sequence'),
    TIER_ID VARCHAR(50),
    API_ID INTEGER,
    LAST_ACCESSED DATE NULL,
    APPLICATION_ID INTEGER,
    SUB_STATUS VARCHAR(50),
    SUBS_CREATE_STATE VARCHAR(50) DEFAULT 'SUBSCRIBE',
    CREATED_BY VARCHAR(100),
    CREATED_TIME DATE,
    UPDATED_BY VARCHAR(100),
    UPDATED_TIME DATE,
    UUID VARCHAR(256),
    FOREIGN KEY(APPLICATION_ID) REFERENCES AM_APPLICATION(APPLICATION_ID) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY(API_ID) REFERENCES AM_API(API_ID) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY (SUBSCRIPTION_ID),
    UNIQUE (UUID)
)
;

CREATE TABLE IF NOT EXISTS AM_SUBSCRIPTION_KEY_MAPPING (
    SUBSCRIPTION_ID INTEGER,
    ACCESS_TOKEN VARCHAR(512),
    KEY_TYPE VARCHAR(512) NOT NULL,
    FOREIGN KEY(SUBSCRIPTION_ID) REFERENCES AM_SUBSCRIPTION(SUBSCRIPTION_ID) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY(SUBSCRIPTION_ID,ACCESS_TOKEN)
)
;

CREATE TABLE AM_APPLICATION_KEY_MAPPING (
    APPLICATION_ID INTEGER,
    CONSUMER_KEY VARCHAR(512),
    KEY_TYPE VARCHAR(512) NOT NULL,
    STATE VARCHAR(30),
    CREATE_MODE VARCHAR(30) DEFAULT 'CREATED',
    FOREIGN KEY(APPLICATION_ID) REFERENCES AM_APPLICATION(APPLICATION_ID) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY(APPLICATION_ID,KEY_TYPE)
)
;

CREATE SEQUENCE AM_APPLICATION_REGISTRATION_SEQUENCE START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_APPLICATION_REGISTRATION (
    REG_ID INTEGER DEFAULT nextval('am_application_registration_sequence'),
    SUBSCRIBER_ID INT,
    WF_REF VARCHAR(255) NOT NULL,
    APP_ID INT,
    TOKEN_TYPE VARCHAR(30),
    TOKEN_SCOPE VARCHAR(1500) DEFAULT 'default',
    INPUTS VARCHAR(1000),
    ALLOWED_DOMAINS VARCHAR(256),
    VALIDITY_PERIOD BIGINT,
    UNIQUE (SUBSCRIBER_ID,APP_ID,TOKEN_TYPE),
    FOREIGN KEY(SUBSCRIBER_ID) REFERENCES AM_SUBSCRIBER(SUBSCRIBER_ID) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY(APP_ID) REFERENCES AM_APPLICATION(APPLICATION_ID) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY (REG_ID)
)
;



CREATE SEQUENCE AM_API_LC_EVENT_SEQUENCE START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_API_LC_EVENT (
    EVENT_ID INTEGER DEFAULT nextval('am_api_lc_event_sequence'),
    API_ID INTEGER NOT NULL,
    PREVIOUS_STATE VARCHAR(50),
    NEW_STATE VARCHAR(50) NOT NULL,
    USER_ID VARCHAR(50) NOT NULL,
    TENANT_ID INTEGER NOT NULL,
    EVENT_DATE DATE NOT NULL,
    FOREIGN KEY(API_ID) REFERENCES AM_API(API_ID) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY (EVENT_ID)
)
;

CREATE TABLE IF NOT EXISTS AM_APP_KEY_DOMAIN_MAPPING (
   CONSUMER_KEY VARCHAR(255),
   AUTHZ_DOMAIN VARCHAR(255) DEFAULT 'ALL',
   PRIMARY KEY (CONSUMER_KEY,AUTHZ_DOMAIN)
)
;

CREATE SEQUENCE AM_API_COMMENTS_SEQUENCE START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_API_COMMENTS (
    COMMENT_ID INTEGER DEFAULT nextval('am_api_comments_sequence'),
    COMMENT_TEXT VARCHAR(512),
    COMMENTED_USER VARCHAR(255),
    DATE_COMMENTED DATE NOT NULL,
    API_ID INTEGER NOT NULL,
    FOREIGN KEY(API_ID) REFERENCES AM_API(API_ID) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY (COMMENT_ID)
)
;

CREATE SEQUENCE AM_WORKFLOWS_SEQUENCE START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_WORKFLOWS(
    WF_ID INTEGER DEFAULT nextval('am_workflows_sequence'),
    WF_REFERENCE VARCHAR(255) NOT NULL,
    WF_TYPE VARCHAR(255) NOT NULL,
    WF_STATUS VARCHAR(255) NOT NULL,
    WF_CREATED_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    WF_UPDATED_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP ,
    WF_STATUS_DESC VARCHAR(1000),
    TENANT_ID INTEGER,
    TENANT_DOMAIN VARCHAR(255),
    WF_EXTERNAL_REFERENCE VARCHAR(255) NOT NULL,
    PRIMARY KEY (WF_ID),
    UNIQUE (WF_EXTERNAL_REFERENCE)
)
;

CREATE SEQUENCE AM_API_RATINGS_SEQUENCE START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_API_RATINGS (
    RATING_ID INTEGER DEFAULT nextval('am_api_ratings_sequence'),
    API_ID INTEGER,
    RATING INTEGER,
    SUBSCRIBER_ID INTEGER,
    FOREIGN KEY(API_ID) REFERENCES AM_API(API_ID) ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY(SUBSCRIBER_ID) REFERENCES AM_SUBSCRIBER(SUBSCRIBER_ID) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY (RATING_ID)
)
;

CREATE SEQUENCE AM_TIER_PERMISSIONS_SEQUENCE START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_TIER_PERMISSIONS (
    TIER_PERMISSIONS_ID INTEGER DEFAULT nextval('am_tier_permissions_sequence'),
    TIER VARCHAR(50) NOT NULL,
    PERMISSIONS_TYPE VARCHAR(50) NOT NULL,
    ROLES VARCHAR(512) NOT NULL,
    TENANT_ID INTEGER NOT NULL,
    PRIMARY KEY(TIER_PERMISSIONS_ID)
);

CREATE SEQUENCE AM_EXTERNAL_STORES_SEQUENCE START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_EXTERNAL_STORES (
    APISTORE_ID INTEGER DEFAULT nextval('am_external_stores_sequence'),
    API_ID INTEGER,
    STORE_ID VARCHAR(255) NOT NULL,
    STORE_DISPLAY_NAME VARCHAR(255) NOT NULL,
    STORE_ENDPOINT VARCHAR(255) NOT NULL,
    STORE_TYPE VARCHAR(255) NOT NULL,
    FOREIGN KEY(API_ID) REFERENCES AM_API(API_ID) ON UPDATE CASCADE ON DELETE RESTRICT,
    PRIMARY KEY (APISTORE_ID)
)
;


CREATE TABLE IF NOT EXISTS AM_API_SCOPES (
   API_ID  INTEGER NOT NULL,
   SCOPE_ID  INTEGER NOT NULL,
   FOREIGN KEY (API_ID) REFERENCES AM_API (API_ID) ON DELETE CASCADE  ON UPDATE CASCADE,
   FOREIGN KEY (SCOPE_ID) REFERENCES IDN_OAUTH2_SCOPE (SCOPE_ID) ON DELETE CASCADE ON UPDATE CASCADE,
   PRIMARY KEY (API_ID, SCOPE_ID)
);


CREATE SEQUENCE AM_API_DEFAULT_VERSION_PK_SEQ;
CREATE TABLE IF NOT EXISTS AM_API_DEFAULT_VERSION (
            DEFAULT_VERSION_ID INTEGER DEFAULT NEXTVAL('am_api_default_version_pk_seq'), 
            API_NAME VARCHAR(256) NOT NULL ,
            API_PROVIDER VARCHAR(256) NOT NULL , 
            DEFAULT_API_VERSION VARCHAR(30) , 
            PUBLISHED_DEFAULT_API_VERSION VARCHAR(30) ,
            PRIMARY KEY (DEFAULT_VERSION_ID)
);


CREATE INDEX IDX_SUB_APP_ID ON AM_SUBSCRIPTION (APPLICATION_ID, SUBSCRIPTION_ID)
;

CREATE SEQUENCE AM_ALERT_TYPES_SEQ START WITH 1 INCREMENT BY 1;

CREATE TABLE IF NOT EXISTS AM_ALERT_TYPES (
            ALERT_TYPE_ID INTEGER DEFAULT NEXTVAL('am_alert_types_seq'),
            ALERT_TYPE_NAME VARCHAR(255) NOT NULL ,
	    STAKE_HOLDER VARCHAR(100) NOT NULL,           
            PRIMARY KEY (ALERT_TYPE_ID)
);

CREATE TABLE IF NOT EXISTS AM_ALERT_TYPES_VALUES (
            ALERT_TYPE_ID INTEGER, 
            USER_NAME VARCHAR(255) NOT NULL ,
	    STAKE_HOLDER VARCHAR(100) NOT NULL ,
            CONSTRAINT AM_ALERT_TYPES_VALUES_CONST UNIQUE (ALERT_TYPE_ID,USER_NAME,STAKE_HOLDER)
);

CREATE SEQUENCE AM_ALERT_EMAILLIST_SEQ START WITH 1 INCREMENT BY 1;

CREATE TABLE IF NOT EXISTS AM_ALERT_EMAILLIST (  
	    EMAIL_LIST_ID INTEGER DEFAULT NEXTVAL('am_alert_emaillist_seq'),  
            USER_NAME VARCHAR(255) NOT NULL ,	    
	    STAKE_HOLDER VARCHAR(100) NOT NULL ,
            CONSTRAINT AM_ALERT_EMAILLIST_CONST UNIQUE (EMAIL_LIST_ID,USER_NAME,STAKE_HOLDER),
            PRIMARY KEY (EMAIL_LIST_ID)
);

CREATE TABLE IF NOT EXISTS  AM_ALERT_EMAILLIST_DETAILS (             
            EMAIL_LIST_ID INTEGER,
	    EMAIL VARCHAR(255),	    
            CONSTRAINT AM_ALERT_EMAILLIST_DETAILS_CONST UNIQUE (EMAIL_LIST_ID,EMAIL)
);

INSERT INTO AM_ALERT_TYPES (ALERT_TYPE_NAME, STAKE_HOLDER) VALUES ('abnormalResponseTime', 'publisher');
INSERT INTO AM_ALERT_TYPES (ALERT_TYPE_NAME, STAKE_HOLDER) VALUES ('abnormalBackendTime', 'publisher');
INSERT INTO AM_ALERT_TYPES (ALERT_TYPE_NAME, STAKE_HOLDER) VALUES ('abnormalRequestsPerMin', 'subscriber');
INSERT INTO AM_ALERT_TYPES (ALERT_TYPE_NAME, STAKE_HOLDER) VALUES ('RequestPatternChanged', 'subscriber');
INSERT INTO AM_ALERT_TYPES (ALERT_TYPE_NAME, STAKE_HOLDER) VALUES ('UnusualIPAccessAlert', 'subscriber');
INSERT INTO AM_ALERT_TYPES (ALERT_TYPE_NAME, STAKE_HOLDER) VALUES ('FrequentTierHittingAlert', 'subscriber');
INSERT INTO AM_ALERT_TYPES (ALERT_TYPE_NAME, STAKE_HOLDER) VALUES ('AbnormalTierUsage', 'publisher');
INSERT INTO AM_ALERT_TYPES (ALERT_TYPE_NAME, STAKE_HOLDER) VALUES ('healthAvailabilityPerMin', 'publisher');



-- AM Throttling tables --
CREATE SEQUENCE AM_POLICY_SUBSCRIPTION_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_POLICY_SUBSCRIPTION (
            POLICY_ID INTEGER DEFAULT NEXTVAL('AM_POLICY_SUBSCRIPTION_SEQ'),
            NAME VARCHAR(512) NOT NULL,
            DISPLAY_NAME VARCHAR(512) NULL DEFAULT NULL,
            TENANT_ID INTEGER NOT NULL,
            DESCRIPTION VARCHAR(1024) NULL DEFAULT NULL,
            QUOTA_TYPE VARCHAR(25) NOT NULL,
            QUOTA INTEGER NOT NULL,
            QUOTA_UNIT VARCHAR(10) NULL,
            UNIT_TIME INTEGER NOT NULL,
            TIME_UNIT VARCHAR(25) NOT NULL,
            RATE_LIMIT_COUNT INTEGER NULL DEFAULT NULL,
            RATE_LIMIT_TIME_UNIT VARCHAR(25) NULL DEFAULT NULL,
            IS_DEPLOYED BOOLEAN NOT NULL DEFAULT '0',
			      CUSTOM_ATTRIBUTES BYTEA DEFAULT NULL,
            STOP_ON_QUOTA_REACH BOOLEAN NOT NULL DEFAULT '0',
            BILLING_PLAN VARCHAR(20) NOT NULL,
            UUID VARCHAR(256),
            PRIMARY KEY (POLICY_ID),
            UNIQUE (NAME, TENANT_ID),
            UNIQUE (UUID)
);

CREATE SEQUENCE AM_POLICY_APPLICATION_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_POLICY_APPLICATION (
            POLICY_ID INTEGER DEFAULT NEXTVAL('AM_POLICY_APPLICATION_SEQ'),
            NAME VARCHAR(512) NOT NULL,
            DISPLAY_NAME VARCHAR(512) NULL DEFAULT NULL,
            TENANT_ID INTEGER NOT NULL,
            DESCRIPTION VARCHAR(1024) NULL DEFAULT NULL,
            QUOTA_TYPE VARCHAR(25) NOT NULL,
            QUOTA INTEGER NOT NULL,
            QUOTA_UNIT VARCHAR(10) NULL DEFAULT NULL,
            UNIT_TIME INTEGER NOT NULL,
            TIME_UNIT VARCHAR(25) NOT NULL,
            IS_DEPLOYED BOOLEAN NOT NULL DEFAULT '0',
			CUSTOM_ATTRIBUTES BYTEA DEFAULT NULL,
			      UUID VARCHAR(256),
            PRIMARY KEY (POLICY_ID),
            UNIQUE  (NAME, TENANT_ID),
            UNIQUE (UUID)
);

CREATE SEQUENCE AM_POLICY_HARD_THROTTLING_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_POLICY_HARD_THROTTLING (
            POLICY_ID INTEGER DEFAULT NEXTVAL('AM_POLICY_HARD_THROTTLING_SEQ'),
            NAME VARCHAR(512) NOT NULL,
            TENANT_ID INTEGER NOT NULL,
            DESCRIPTION VARCHAR(1024) NULL DEFAULT NULL,
            QUOTA_TYPE VARCHAR(25) NOT NULL,
            QUOTA INTEGER NOT NULL,
            QUOTA_UNIT VARCHAR(10) NULL DEFAULT NULL,
            UNIT_TIME INTEGER NOT NULL,
            TIME_UNIT VARCHAR(25) NOT NULL,
            IS_DEPLOYED BOOLEAN NOT NULL DEFAULT '0',
            PRIMARY KEY (POLICY_ID),
            UNIQUE  (NAME, TENANT_ID)
);

CREATE SEQUENCE AM_API_THROTTLE_POLICY_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_API_THROTTLE_POLICY (
            POLICY_ID INTEGER DEFAULT NEXTVAL('AM_API_THROTTLE_POLICY_SEQ'),
            NAME VARCHAR(512) NOT NULL,
            DISPLAY_NAME VARCHAR(512) NULL DEFAULT NULL,
            TENANT_ID INTEGER NOT NULL,
            DESCRIPTION VARCHAR (1024),
            DEFAULT_QUOTA_TYPE VARCHAR(25) NOT NULL,
            DEFAULT_QUOTA INTEGER NOT NULL,
            DEFAULT_QUOTA_UNIT VARCHAR(10) NULL,
            DEFAULT_UNIT_TIME INTEGER NOT NULL,
            DEFAULT_TIME_UNIT VARCHAR(25) NOT NULL,
            APPLICABLE_LEVEL VARCHAR(25) NOT NULL,
            IS_DEPLOYED BOOLEAN NOT NULL DEFAULT '0',
            UUID VARCHAR(256),
            PRIMARY KEY (POLICY_ID),
            UNIQUE  (NAME, TENANT_ID),
            UNIQUE (UUID)
);

CREATE SEQUENCE AM_CONDITION_GROUP_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_CONDITION_GROUP (
            CONDITION_GROUP_ID INTEGER DEFAULT NEXTVAL('AM_CONDITION_GROUP_SEQ'),
            POLICY_ID INTEGER NOT NULL,
            QUOTA_TYPE VARCHAR(25),
            QUOTA INTEGER NOT NULL,
            QUOTA_UNIT VARCHAR(10) NULL DEFAULT NULL,
            UNIT_TIME INTEGER NOT NULL,
            TIME_UNIT VARCHAR(25) NOT NULL,
            DESCRIPTION VARCHAR (1024) NULL DEFAULT NULL,
            PRIMARY KEY (CONDITION_GROUP_ID),
            FOREIGN KEY (POLICY_ID) REFERENCES AM_API_THROTTLE_POLICY(POLICY_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE SEQUENCE AM_QUERY_PARAMETER_CONDITION_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_QUERY_PARAMETER_CONDITION (
            QUERY_PARAMETER_ID INTEGER DEFAULT NEXTVAL('AM_QUERY_PARAMETER_CONDITION_SEQ'),
            CONDITION_GROUP_ID INTEGER NOT NULL,
            PARAMETER_NAME VARCHAR(255) DEFAULT NULL,
            PARAMETER_VALUE VARCHAR(255) DEFAULT NULL,
	    	IS_PARAM_MAPPING BOOLEAN DEFAULT '1',
            PRIMARY KEY (QUERY_PARAMETER_ID),
            FOREIGN KEY (CONDITION_GROUP_ID) REFERENCES AM_CONDITION_GROUP(CONDITION_GROUP_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE SEQUENCE AM_HEADER_FIELD_CONDITION_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_HEADER_FIELD_CONDITION (
            HEADER_FIELD_ID INTEGER DEFAULT NEXTVAL('AM_HEADER_FIELD_CONDITION_SEQ'),
            CONDITION_GROUP_ID INTEGER NOT NULL,
            HEADER_FIELD_NAME VARCHAR(255) DEFAULT NULL,
            HEADER_FIELD_VALUE VARCHAR(255) DEFAULT NULL,
	    	IS_HEADER_FIELD_MAPPING BOOLEAN DEFAULT '1',
            PRIMARY KEY (HEADER_FIELD_ID),
            FOREIGN KEY (CONDITION_GROUP_ID) REFERENCES AM_CONDITION_GROUP(CONDITION_GROUP_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE SEQUENCE AM_JWT_CLAIM_CONDITION_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_JWT_CLAIM_CONDITION (
            JWT_CLAIM_ID INTEGER DEFAULT NEXTVAL('AM_JWT_CLAIM_CONDITION_SEQ'),
            CONDITION_GROUP_ID INTEGER NOT NULL,
            CLAIM_URI VARCHAR(512) DEFAULT NULL,
            CLAIM_ATTRIB VARCHAR(1024) DEFAULT NULL,
	    IS_CLAIM_MAPPING BOOLEAN DEFAULT '1',
            PRIMARY KEY (JWT_CLAIM_ID),
            FOREIGN KEY (CONDITION_GROUP_ID) REFERENCES AM_CONDITION_GROUP(CONDITION_GROUP_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE SEQUENCE AM_IP_CONDITION_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_IP_CONDITION (
  AM_IP_CONDITION_ID INTEGER DEFAULT NEXTVAL('AM_IP_CONDITION_SEQ'),
  STARTING_IP VARCHAR(45) NULL,
  ENDING_IP VARCHAR(45) NULL,
  SPECIFIC_IP VARCHAR(45) NULL,
  WITHIN_IP_RANGE BOOLEAN DEFAULT '1',
  CONDITION_GROUP_ID INT NULL,
  PRIMARY KEY (AM_IP_CONDITION_ID),
  FOREIGN KEY (CONDITION_GROUP_ID)
    REFERENCES AM_CONDITION_GROUP (CONDITION_GROUP_ID)   ON DELETE CASCADE ON UPDATE CASCADE);

CREATE SEQUENCE AM_POLICY_GLOBAL_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_POLICY_GLOBAL (
            POLICY_ID INTEGER DEFAULT NEXTVAL('AM_POLICY_GLOBAL_SEQ'),
            NAME VARCHAR(512) NOT NULL,
            KEY_TEMPLATE VARCHAR(512) NOT NULL,
            TENANT_ID INTEGER NOT NULL,
            DESCRIPTION VARCHAR(1024) NULL DEFAULT NULL,
            SIDDHI_QUERY BYTEA DEFAULT NULL,
            IS_DEPLOYED BOOLEAN NOT NULL DEFAULT '0',
            UUID VARCHAR(256),
            PRIMARY KEY (POLICY_ID),
            UNIQUE (UUID)
);

CREATE SEQUENCE AM_THROTTLE_TIER_PERMISSIONS_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE IF NOT EXISTS AM_THROTTLE_TIER_PERMISSIONS (
  THROTTLE_TIER_PERMISSIONS_ID INTEGER DEFAULT NEXTVAL('AM_THROTTLE_TIER_PERMISSIONS_SEQ'),
  TIER VARCHAR(50) NULL,
  PERMISSIONS_TYPE VARCHAR(50) NULL,
  ROLES VARCHAR(512) NULL,
  TENANT_ID INTEGER NULL,
  PRIMARY KEY (THROTTLE_TIER_PERMISSIONS_ID));

CREATE SEQUENCE AM_BLOCK_CONDITIONS_SEQ START WITH 1 INCREMENT BY 1;
CREATE TABLE AM_BLOCK_CONDITIONS (
  CONDITION_ID INTEGER DEFAULT NEXTVAL('AM_BLOCK_CONDITIONS_SEQ'),
  TYPE varchar(45) DEFAULT NULL,
  VALUE varchar(512) DEFAULT NULL,
  ENABLED varchar(45) DEFAULT NULL,
  DOMAIN varchar(45) DEFAULT NULL,
  UUID VARCHAR(256),
  PRIMARY KEY (CONDITION_ID),
  UNIQUE (UUID)
);

DROP TABLE IF EXISTS AM_CERTIFICATE_METADATA;
CREATE TABLE AM_CERTIFICATE_METADATA (
  TENANT_ID INTEGER NOT NULL,
  ALIAS VARCHAR(45) NOT NULL,
  END_POINT VARCHAR(45) NOT NULL,
  CONSTRAINT PK_ALIAS PRIMARY KEY (ALIAS),
  CONSTRAINT END_POINT_CONSTRAINT UNIQUE (END_POINT)
);

DROP TABLE IF EXISTS AM_APPLICATION_GROUP_MAPPING;
CREATE TABLE AM_APPLICATION_GROUP_MAPPING (
    APPLICATION_ID INTEGER NOT NULL,
    GROUP_ID VARCHAR(512) NOT NULL,
    TENANT VARCHAR(255),
    PRIMARY KEY (APPLICATION_ID,GROUP_ID,TENANT),
    FOREIGN KEY (APPLICATION_ID) REFERENCES AM_APPLICATION(APPLICATION_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS AM_USAGE_UPLOADED_FILES;
CREATE TABLE AM_USAGE_UPLOADED_FILES (
  TENANT_DOMAIN VARCHAR(255) NOT NULL,
  FILE_NAME VARCHAR(255) NOT NULL,
  FILE_TIMESTAMP TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FILE_PROCESSED INTEGER DEFAULT 0,
  FILE_CONTENT BYTEA DEFAULT NULL,
  PRIMARY KEY (TENANT_DOMAIN, FILE_NAME, FILE_TIMESTAMP)
);

DROP TABLE IF EXISTS AM_API_LC_PUBLISH_EVENTS;
DROP SEQUENCE IF EXISTS AM_API_LC_PUBLISH_EVENTS_PK_SEQ;
CREATE SEQUENCE AM_API_LC_PUBLISH_EVENTS_PK_SEQ;
CREATE TABLE IF NOT EXISTS AM_API_LC_PUBLISH_EVENTS (
    ID INTEGER NOT NULL DEFAULT NEXTVAL('AM_API_LC_PUBLISH_EVENTS_PK_SEQ'),
    TENANT_DOMAIN VARCHAR(500) NOT NULL,
    API_ID VARCHAR(500) NOT NULL,
    EVENT_TIME TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS AM_APPLICATION_ATTRIBUTES;
CREATE TABLE IF NOT EXISTS AM_APPLICATION_ATTRIBUTES (
  APPLICATION_ID INTEGER NOT NULL,
  NAME VARCHAR(255) NOT NULL,
  VALUE VARCHAR(1024) NOT NULL,
  TENANT_ID INTEGER NOT NULL,
  PRIMARY KEY (APPLICATION_ID,NAME),
  FOREIGN KEY (APPLICATION_ID) REFERENCES AM_APPLICATION (APPLICATION_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS AM_LABELS;
CREATE TABLE IF NOT EXISTS AM_LABELS (
  LABEL_ID VARCHAR(50),
  NAME VARCHAR(255),
  DESCRIPTION VARCHAR(1024),
  TENANT_DOMAIN VARCHAR(255),
  UNIQUE (NAME,TENANT_DOMAIN),
  PRIMARY KEY (LABEL_ID)
);

DROP TABLE IF EXISTS AM_LABEL_URLS;
CREATE TABLE IF NOT EXISTS AM_LABEL_URLS (
  LABEL_ID VARCHAR(50),
  ACCESS_URL VARCHAR(255),
  PRIMARY KEY (LABEL_ID,ACCESS_URL),
  FOREIGN KEY (LABEL_ID) REFERENCES AM_LABELS(LABEL_ID) ON UPDATE CASCADE ON DELETE CASCADE
);
-- End of API-MGT Tables --

-- Performance indexes start--

create index IDX_ITS_LMT on IDN_THRIFT_SESSION (LAST_MODIFIED_TIME);
create index IDX_IOAT_UT on IDN_OAUTH2_ACCESS_TOKEN (USER_TYPE);
create index IDX_AAI_CTX on AM_API (CONTEXT);
create index IDX_AAKM_CK on AM_APPLICATION_KEY_MAPPING (CONSUMER_KEY);
create index IDX_AAUM_AI on AM_API_URL_MAPPING (API_ID);
create index IDX_AAUM_TT on AM_API_URL_MAPPING (THROTTLING_TIER);
create index IDX_AATP_DQT on AM_API_THROTTLE_POLICY (DEFAULT_QUOTA_TYPE);
create index IDX_ACG_QT on AM_CONDITION_GROUP (QUOTA_TYPE);
create index IDX_APS_QT on AM_POLICY_SUBSCRIPTION (QUOTA_TYPE);
create index IDX_AS_AITIAI on AM_SUBSCRIPTION (API_ID,TIER_ID,APPLICATION_ID);
create index IDX_APA_QT on AM_POLICY_APPLICATION (QUOTA_TYPE);
create index IDX_AA_AT_CB on AM_APPLICATION (APPLICATION_TIER,CREATED_BY);

-- Performance indexes end--


commit;

-- create WSO2AM_METRICS_DB

\c wso2am_metrics_db;

\echo 'create WSO2AM_METRICS_DB data';


CREATE SEQUENCE METRIC_GAUGE_SEQUENCE START WITH 1 INCREMENT BY 1;

CREATE TABLE METRIC_GAUGE (
    ID BIGINT DEFAULT nextval('METRIC_GAUGE_SEQUENCE') PRIMARY KEY,
    SOURCE VARCHAR(255) NOT NULL,
    TIMESTAMP BIGINT NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    VALUE VARCHAR(100) NOT NULL
);

CREATE SEQUENCE METRIC_COUNTER_SEQUENCE START WITH 1 INCREMENT BY 1;

CREATE TABLE METRIC_COUNTER (
    ID BIGINT DEFAULT nextval('METRIC_COUNTER_SEQUENCE') PRIMARY KEY,
    SOURCE VARCHAR(255) NOT NULL,
    TIMESTAMP BIGINT NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    COUNT BIGINT NOT NULL
);

CREATE SEQUENCE METRIC_METER_SEQUENCE START WITH 1 INCREMENT BY 1;

CREATE TABLE METRIC_METER (
    ID BIGINT DEFAULT nextval('METRIC_METER_SEQUENCE') PRIMARY KEY,
    SOURCE VARCHAR(255) NOT NULL,
    TIMESTAMP BIGINT NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    COUNT BIGINT NOT NULL,
    MEAN_RATE NUMERIC(50,25) NOT NULL,
    M1_RATE NUMERIC(50,25) NOT NULL,
    M5_RATE NUMERIC(50,25) NOT NULL,
    M15_RATE NUMERIC(50,25) NOT NULL,
    RATE_UNIT VARCHAR(50) NOT NULL
);

CREATE SEQUENCE METRIC_HISTOGRAM_SEQUENCE START WITH 1 INCREMENT BY 1;

CREATE TABLE METRIC_HISTOGRAM (
    ID BIGINT DEFAULT nextval('METRIC_HISTOGRAM_SEQUENCE') PRIMARY KEY,
    SOURCE VARCHAR(255) NOT NULL,
    TIMESTAMP BIGINT NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    COUNT BIGINT NOT NULL,
    MAX NUMERIC(50,25) NOT NULL,
    MEAN NUMERIC(50,25) NOT NULL,
    MIN NUMERIC(50,25) NOT NULL,
    STDDEV NUMERIC(50,25) NOT NULL,
    P50 NUMERIC(50,25) NOT NULL,
    P75 NUMERIC(50,25) NOT NULL,
    P95 NUMERIC(50,25) NOT NULL,
    P98 NUMERIC(50,25) NOT NULL,
    P99 NUMERIC(50,25) NOT NULL,
    P999 NUMERIC(50,25) NOT NULL
);

CREATE SEQUENCE METRIC_TIMER_SEQUENCE START WITH 1 INCREMENT BY 1;

CREATE TABLE METRIC_TIMER (
    ID BIGINT DEFAULT nextval('METRIC_TIMER_SEQUENCE') PRIMARY KEY,
    SOURCE VARCHAR(255) NOT NULL,
    TIMESTAMP BIGINT NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    COUNT BIGINT NOT NULL,
    MAX NUMERIC(50,25) NOT NULL,
    MEAN NUMERIC(50,25) NOT NULL,
    MIN NUMERIC(50,25) NOT NULL,
    STDDEV NUMERIC(50,25) NOT NULL,
    P50 NUMERIC(50,25) NOT NULL,
    P75 NUMERIC(50,25) NOT NULL,
    P95 NUMERIC(50,25) NOT NULL,
    P98 NUMERIC(50,25) NOT NULL,
    P99 NUMERIC(50,25) NOT NULL,
    P999 NUMERIC(50,25) NOT NULL,
    MEAN_RATE NUMERIC(50,25) NOT NULL,
    M1_RATE NUMERIC(50,25) NOT NULL,
    M5_RATE NUMERIC(50,25) NOT NULL,
    M15_RATE NUMERIC(50,25) NOT NULL,
    RATE_UNIT VARCHAR(50) NOT NULL,
    DURATION_UNIT VARCHAR(50) NOT NULL
);

CREATE INDEX IDX_TIMESTAMP_GAUGE ON METRIC_GAUGE (TIMESTAMP);
CREATE INDEX IDX_TIMESTAMP_COUNTER ON METRIC_COUNTER (TIMESTAMP);
CREATE INDEX IDX_TIMESTAMP_METER ON METRIC_METER (TIMESTAMP);
CREATE INDEX IDX_TIMESTAMP_HISTOGRAM ON METRIC_HISTOGRAM (TIMESTAMP);
CREATE INDEX IDX_TIMESTAMP_TIMER ON METRIC_TIMER (TIMESTAMP);



-- create WSO2BPS_IS_KM_DB


\c wso2bps_is_km_db;


\echo 'Create WSO2BPS_IS_KM_DB';
--
-- BPEL Related SQL Scripts
--

CREATE TABLE ODE_SCHEMA_VERSION (VERSION INTEGER, PRIMARY KEY (VERSION));
INSERT INTO ODE_SCHEMA_VERSION VALUES (6);

DROP TABLE IF EXISTS ODE_JOB;

CREATE TABLE ODE_JOB (
  jobid char(64)  PRIMARY KEY DEFAULT '',
  ts bigint  NOT NULL DEFAULT 0,
  nodeid char(64)  NULL,
  scheduled int  NOT NULL DEFAULT 0,
  transacted int  NOT NULL DEFAULT 0,

  instanceId BIGINT,
  mexId varchar(255),
  processId varchar(255),
  type varchar(255),
  channel varchar(255),
  correlatorId varchar(255),
  correlationKeySet varchar(255),
  retryCount int,
  inMem int,
  detailsExt oid
);

CREATE INDEX IDX_ODE_JOB_TS on ODE_JOB(ts);
CREATE INDEX IDX_ODE_JOB_NODEID on ODE_JOB(nodeid);


CREATE TABLE TASK_ATTACHMENT (ATTACHMENT_ID BIGINT NOT NULL, MESSAGE_EXCHANGE_ID VARCHAR(255), PRIMARY KEY (ATTACHMENT_ID));
CREATE TABLE ODE_ACTIVITY_RECOVERY (ID BIGINT NOT NULL, ACTIONS VARCHAR(255), ACTIVITY_ID BIGINT, CHANNEL VARCHAR(255), DATE_TIME ABSTIME, DETAILS TEXT, INSTANCE_ID BIGINT, REASON VARCHAR(255), RETRIES INTEGER, PRIMARY KEY (ID));
CREATE TABLE ODE_CORRELATION_SET (CORRELATION_SET_ID BIGINT NOT NULL, CORRELATION_KEY VARCHAR(255), NAME VARCHAR(255), SCOPE_ID BIGINT, PRIMARY KEY (CORRELATION_SET_ID));
CREATE TABLE ODE_CORRELATOR (CORRELATOR_ID BIGINT NOT NULL, CORRELATOR_KEY VARCHAR(255), PROC_ID BIGINT, PRIMARY KEY (CORRELATOR_ID));
CREATE TABLE ODE_CORSET_PROP (ID BIGINT NOT NULL, CORRSET_ID BIGINT, PROP_KEY VARCHAR(255), PROP_VALUE VARCHAR(255), PRIMARY KEY (ID));
CREATE TABLE ODE_EVENT (EVENT_ID BIGINT NOT NULL, DETAIL VARCHAR(255), DATA BYTEA, SCOPE_ID BIGINT, TSTAMP ABSTIME, TYPE VARCHAR(255), INSTANCE_ID BIGINT, PROCESS_ID BIGINT, PRIMARY KEY (EVENT_ID));
CREATE TABLE ODE_FAULT (FAULT_ID BIGINT NOT NULL, ACTIVITY_ID INTEGER, DATA TEXT, MESSAGE VARCHAR(4000), LINE_NUMBER INTEGER, NAME VARCHAR(255), PRIMARY KEY (FAULT_ID));
CREATE TABLE ODE_MESSAGE (MESSAGE_ID BIGINT NOT NULL, DATA TEXT, HEADER TEXT, TYPE VARCHAR(255), MESSAGE_EXCHANGE_ID VARCHAR(255), PRIMARY KEY (MESSAGE_ID));
CREATE TABLE ODE_MESSAGE_EXCHANGE (MESSAGE_EXCHANGE_ID VARCHAR(255) NOT NULL, CALLEE VARCHAR(255), CHANNEL VARCHAR(255), CORRELATION_ID VARCHAR(255), CORRELATION_KEYS VARCHAR(255), CORRELATION_STATUS VARCHAR(255), CREATE_TIME ABSTIME, DIRECTION INTEGER, EPR TEXT, FAULT VARCHAR(255), FAULT_EXPLANATION VARCHAR(255), OPERATION VARCHAR(255), PARTNER_LINK_MODEL_ID INTEGER, PATTERN VARCHAR(255), PIPED_ID VARCHAR(255), PORT_TYPE VARCHAR(255), PROPAGATE_TRANS BOOL, STATUS VARCHAR(255), SUBSCRIBER_COUNT INTEGER, CORR_ID BIGINT, PARTNER_LINK_ID BIGINT, PROCESS_ID BIGINT, PROCESS_INSTANCE_ID BIGINT, REQUEST_MESSAGE_ID BIGINT, RESPONSE_MESSAGE_ID BIGINT, PRIMARY KEY (MESSAGE_EXCHANGE_ID));
CREATE TABLE ODE_MESSAGE_ROUTE (MESSAGE_ROUTE_ID BIGINT NOT NULL, CORRELATION_KEY VARCHAR(255), GROUP_ID VARCHAR(255), ROUTE_INDEX INTEGER, PROCESS_INSTANCE_ID INTEGER, ROUTE_POLICY VARCHAR(16), CORR_ID BIGINT, PRIMARY KEY (MESSAGE_ROUTE_ID));
CREATE TABLE ODE_MEX_PROP (ID BIGINT NOT NULL, MEX_ID VARCHAR(255), PROP_KEY VARCHAR(255), PROP_VALUE VARCHAR(2000), PRIMARY KEY (ID));
CREATE TABLE ODE_PARTNER_LINK (PARTNER_LINK_ID BIGINT NOT NULL, MY_EPR TEXT, MY_ROLE_NAME VARCHAR(255), MY_ROLE_SERVICE_NAME VARCHAR(255), MY_SESSION_ID VARCHAR(255), PARTNER_EPR TEXT, PARTNER_LINK_MODEL_ID INTEGER, PARTNER_LINK_NAME VARCHAR(255), PARTNER_ROLE_NAME VARCHAR(255), PARTNER_SESSION_ID VARCHAR(255), SCOPE_ID BIGINT, PRIMARY KEY (PARTNER_LINK_ID));
CREATE TABLE ODE_PROCESS (ID BIGINT NOT NULL, GUID VARCHAR(255), PROCESS_ID VARCHAR(255), PROCESS_TYPE VARCHAR(255), VERSION BIGINT, PRIMARY KEY (ID));
CREATE TABLE ODE_PROCESS_INSTANCE (ID BIGINT NOT NULL, DATE_CREATED ABSTIME, EXECUTION_STATE BYTEA, FAULT_ID BIGINT, LAST_ACTIVE_TIME ABSTIME, LAST_RECOVERY_DATE ABSTIME, PREVIOUS_STATE SMALLINT, SEQUENCE BIGINT, INSTANCE_STATE SMALLINT, INSTANTIATING_CORRELATOR_ID BIGINT, PROCESS_ID BIGINT, ROOT_SCOPE_ID BIGINT, PRIMARY KEY (ID));
CREATE TABLE ODE_SCOPE (SCOPE_ID BIGINT NOT NULL, MODEL_ID INTEGER, SCOPE_NAME VARCHAR(255), SCOPE_STATE VARCHAR(255), PROCESS_INSTANCE_ID BIGINT, PARENT_SCOPE_ID BIGINT, PRIMARY KEY (SCOPE_ID));
CREATE TABLE ODE_XML_DATA (XML_DATA_ID BIGINT NOT NULL, DATA TEXT, IS_SIMPLE_TYPE BOOL, NAME VARCHAR(255), SCOPE_ID BIGINT, PRIMARY KEY (XML_DATA_ID));
CREATE TABLE ODE_XML_DATA_PROP (ID BIGINT NOT NULL, XML_DATA_ID BIGINT, PROP_KEY VARCHAR(255), PROP_VALUE VARCHAR(255), PRIMARY KEY (ID));
CREATE TABLE OPENJPA_SEQUENCE_TABLE (ID SMALLINT NOT NULL, SEQUENCE_VALUE BIGINT, PRIMARY KEY (ID));
CREATE TABLE STORE_DU (NAME VARCHAR(255) NOT NULL, DEPLOYDT ABSTIME, DEPLOYER VARCHAR(255), DIR VARCHAR(255), PRIMARY KEY (NAME));
CREATE TABLE STORE_PROCESS (PID VARCHAR(255) NOT NULL, STATE VARCHAR(255), TYPE VARCHAR(255), VERSION BIGINT, DU VARCHAR(255), PRIMARY KEY (PID));
CREATE TABLE STORE_PROCESS_PROP (id BIGINT NOT NULL, PROP_KEY VARCHAR(255), PROP_VAL VARCHAR(255), PRIMARY KEY (id));
CREATE TABLE STORE_PROC_TO_PROP (PROCESSCONFDAOIMPL_PID VARCHAR(255), ELEMENT_ID BIGINT);
CREATE TABLE STORE_VERSIONS (id BIGINT NOT NULL, VERSION BIGINT, PRIMARY KEY (id));
CREATE INDEX I_D_TASK_ATTACMENT ON TASK_ATTACHMENT (MESSAGE_EXCHANGE_ID);
CREATE INDEX I_D_CTVRY_INSTANCE ON ODE_ACTIVITY_RECOVERY (INSTANCE_ID);
CREATE INDEX I_D_CR_ST_SCOPE ON ODE_CORRELATION_SET (SCOPE_ID);
CREATE INDEX I_D_CRLTR_PROCESS ON ODE_CORRELATOR (PROC_ID);
CREATE INDEX I_D_CRPRP_CORRSET ON ODE_CORSET_PROP (CORRSET_ID);
CREATE INDEX I_OD_VENT_INSTANCE ON ODE_EVENT (INSTANCE_ID);
CREATE INDEX I_OD_VENT_PROCESS ON ODE_EVENT (PROCESS_ID);
CREATE INDEX I_OD_MSSG_MESSAGEEXCHANGE ON ODE_MESSAGE (MESSAGE_EXCHANGE_ID);
CREATE INDEX I_D_MSHNG_CORRELATOR ON ODE_MESSAGE_EXCHANGE (CORR_ID);
CREATE INDEX I_D_MSHNG_PARTNERLINK ON ODE_MESSAGE_EXCHANGE (PARTNER_LINK_ID);
CREATE INDEX I_D_MSHNG_PROCESS ON ODE_MESSAGE_EXCHANGE (PROCESS_ID);
CREATE INDEX I_D_MSHNG_PROCESSINST ON ODE_MESSAGE_EXCHANGE (PROCESS_INSTANCE_ID);
CREATE INDEX I_D_MSHNG_REQUEST ON ODE_MESSAGE_EXCHANGE (REQUEST_MESSAGE_ID);
CREATE INDEX I_D_MSHNG_RESPONSE ON ODE_MESSAGE_EXCHANGE (RESPONSE_MESSAGE_ID);
CREATE INDEX I_D_MS_RT_CORRELATOR ON ODE_MESSAGE_ROUTE (CORR_ID);
CREATE INDEX I_D_MS_RT_PROCESSINST ON ODE_MESSAGE_ROUTE (PROCESS_INSTANCE_ID);
CREATE INDEX I_D_MXPRP_MEX ON ODE_MEX_PROP (MEX_ID);
CREATE INDEX I_D_PRLNK_SCOPE ON ODE_PARTNER_LINK (SCOPE_ID);
CREATE INDEX I_D_PRTNC_FAULT ON ODE_PROCESS_INSTANCE (FAULT_ID);
CREATE INDEX I_D_PRTNC_INSTANTIATINGCORRELATOR ON ODE_PROCESS_INSTANCE (INSTANTIATING_CORRELATOR_ID);
CREATE INDEX I_D_PRTNC_PROCESS ON ODE_PROCESS_INSTANCE (PROCESS_ID);
CREATE INDEX I_D_PRTNC_ROOTSCOPE ON ODE_PROCESS_INSTANCE (ROOT_SCOPE_ID);
CREATE INDEX I_OD_SCOP_PARENTSCOPE ON ODE_SCOPE (PARENT_SCOPE_ID);
CREATE INDEX I_OD_SCOP_PROCESSINSTANCE ON ODE_SCOPE (PROCESS_INSTANCE_ID);
CREATE INDEX I_D_XM_DT_SCOPE ON ODE_XML_DATA (SCOPE_ID);
CREATE INDEX I_D_XMPRP_XMLDATA ON ODE_XML_DATA_PROP (XML_DATA_ID);
CREATE INDEX I_STR_CSS_DU ON STORE_PROCESS (DU);
CREATE INDEX I_STR_PRP_ELEMENT ON STORE_PROC_TO_PROP (ELEMENT_ID);
CREATE INDEX I_STR_PRP_PROCESSCONFDAOIMPL_PID ON STORE_PROC_TO_PROP (PROCESSCONFDAOIMPL_PID);


--
-- Human Task Related SQL Scripts
--

CREATE TABLE HT_DEADLINE (id BIGINT NOT NULL, DEADLINE_DATE TIMESTAMP NOT NULL, DEADLINE_NAME VARCHAR(255) NOT NULL, STATUS_TOBE_ACHIEVED VARCHAR(255) NOT NULL, TASK_ID BIGINT, PRIMARY KEY (id));
CREATE TABLE HT_DEPLOYMENT_UNIT (id BIGINT NOT NULL, CHECKSUM VARCHAR(255) NOT NULL, DEPLOYED_ON TIMESTAMP, DEPLOY_DIR VARCHAR(255) NOT NULL, NAME VARCHAR(255) NOT NULL, PACKAGE_NAME VARCHAR(255) NOT NULL, STATUS VARCHAR(255) NOT NULL, TENANT_ID BIGINT NOT NULL, VERSION BIGINT NOT NULL, PRIMARY KEY (id));
CREATE TABLE HT_EVENT (id BIGINT NOT NULL, EVENT_DETAILS VARCHAR(255), NEW_STATE VARCHAR(255), OLD_STATE VARCHAR(255), EVENT_TIMESTAMP TIMESTAMP NOT NULL, EVENT_TYPE VARCHAR(255) NOT NULL, EVENT_USER VARCHAR(255) NOT NULL, TASK_ID BIGINT, PRIMARY KEY (id));
CREATE TABLE HT_GENERIC_HUMAN_ROLE (GHR_ID BIGINT NOT NULL, GHR_TYPE VARCHAR(255), TASK_ID BIGINT, PRIMARY KEY (GHR_ID));
CREATE TABLE HT_HUMANROLE_ORGENTITY (HUMANROLE_ID BIGINT, ORGENTITY_ID BIGINT);
CREATE TABLE HT_JOB (id BIGINT NOT NULL, JOB_DETAILS VARCHAR(4000), JOB_NAME VARCHAR(255), NODEID VARCHAR(255), SCHEDULED VARCHAR(1) NOT NULL, TASKID BIGINT NOT NULL, JOB_TIME BIGINT NOT NULL, TRANSACTED VARCHAR(1) NOT NULL, JOB_TYPE VARCHAR(255) NOT NULL, PRIMARY KEY (id));
CREATE TABLE HT_MESSAGE (MESSAGE_ID BIGINT NOT NULL, MESSAGE_DATA TEXT, MESSAGE_HEADER TEXT, MESSAGE_TYPE VARCHAR(255), MESSAGE_NAME VARCHAR(512), TASK_ID BIGINT, PRIMARY KEY (MESSAGE_ID));
CREATE TABLE HT_ORG_ENTITY (ORG_ENTITY_ID BIGINT NOT NULL, ORG_ENTITY_NAME VARCHAR(255), ORG_ENTITY_TYPE VARCHAR(255), PRIMARY KEY (ORG_ENTITY_ID));
CREATE TABLE HT_PRESENTATION_ELEMENT (id BIGINT NOT NULL, PE_CONTENT VARCHAR(2000), XML_LANG VARCHAR(255), PE_TYPE VARCHAR(31), CONTENT_TYPE VARCHAR(255), TASK_ID BIGINT, PRIMARY KEY (id));
CREATE TABLE HT_PRESENTATION_PARAM (id BIGINT NOT NULL, PARAM_NAME VARCHAR(255), PARAM_TYPE VARCHAR(255), PARAM_VALUE VARCHAR(2000), TASK_ID BIGINT, PRIMARY KEY (id));
CREATE TABLE HT_TASK (id BIGINT NOT NULL, ACTIVATION_TIME TIMESTAMP, COMPLETE_BY_TIME TIMESTAMP, CREATED_ON TIMESTAMP, ESCALATED VARCHAR(1), EXPIRATION_TIME TIMESTAMP, TASK_NAME VARCHAR(255) NOT NULL, PACKAGE_NAME VARCHAR(255) NOT NULL, PRIORITY INTEGER NOT NULL, SKIPABLE VARCHAR(1), START_BY_TIME TIMESTAMP, STATUS VARCHAR(255) NOT NULL, STATUS_BEFORE_SUSPENSION VARCHAR(255), TASK_DEF_NAME VARCHAR(255) NOT NULL, TASK_VERSION BIGINT NOT NULL, TENANT_ID INTEGER NOT NULL, TASK_TYPE VARCHAR(255) NOT NULL, UPDATED_ON TIMESTAMP, FAILURE_MESSAGE BIGINT, INPUT_MESSAGE BIGINT, OUTPUT_MESSAGE BIGINT, PARENTTASK_ID BIGINT, PRIMARY KEY (id));
CREATE TABLE HT_TASK_ATTACHMENT (id BIGINT NOT NULL, ACCESS_TYPE VARCHAR(255), ATTACHED_AT TIMESTAMP, CONTENT_TYPE VARCHAR(255), ATTACHMENT_NAME VARCHAR(255), ATTACHMENT_VALUE VARCHAR(255), TASK_ID BIGINT, ATTACHED_BY BIGINT, PRIMARY KEY (id));
CREATE TABLE HT_TASK_COMMENT (id BIGINT NOT NULL, COMMENT_TEXT VARCHAR(4000), COMMENTED_BY VARCHAR(100), COMMENTED_ON TIMESTAMP, MODIFIED_BY VARCHAR(100), MODIFIED_ON TIMESTAMP, TASK_ID BIGINT, PRIMARY KEY (id));
CREATE TABLE HT_VERSIONS (id BIGINT NOT NULL, TASK_VERSION BIGINT NOT NULL, PRIMARY KEY (id));
CREATE INDEX I_HT_DDLN_TASK ON HT_DEADLINE (TASK_ID);
CREATE INDEX I_HT_VENT_TASK ON HT_EVENT (TASK_ID);
CREATE INDEX I_HT_G_RL_TASK ON HT_GENERIC_HUMAN_ROLE (TASK_ID);
CREATE INDEX I_HT_HTTY_ELEMENT ON HT_HUMANROLE_ORGENTITY (ORGENTITY_ID);
CREATE INDEX I_HT_HTTY_HUMANROLE_ID ON HT_HUMANROLE_ORGENTITY (HUMANROLE_ID);
CREATE INDEX I_HT_MSSG_TASK ON HT_MESSAGE (TASK_ID);
CREATE INDEX I_HT_PMNT_DTYPE ON HT_PRESENTATION_ELEMENT (PE_TYPE);
CREATE INDEX I_HT_PMNT_TASK ON HT_PRESENTATION_ELEMENT (TASK_ID);
CREATE INDEX I_HT_PPRM_TASK ON HT_PRESENTATION_PARAM (TASK_ID);
CREATE INDEX I_HT_TASK_FAILUREMESSAGE ON HT_TASK (FAILURE_MESSAGE);
CREATE INDEX I_HT_TASK_INPUTMESSAGE ON HT_TASK (INPUT_MESSAGE);
CREATE INDEX I_HT_TASK_OUTPUTMESSAGE ON HT_TASK (OUTPUT_MESSAGE);
CREATE INDEX I_HT_TASK_PARENTTASK ON HT_TASK (PARENTTASK_ID);
CREATE INDEX I_HT_TMNT_ATTACHEDBY ON HT_TASK_ATTACHMENT (ATTACHED_BY);
CREATE INDEX I_HT_TMNT_TASK ON HT_TASK_ATTACHMENT (TASK_ID);
CREATE INDEX I_HT_TMNT_TASK1 ON HT_TASK_COMMENT (TASK_ID);


--
-- Attachment Management Related SQL Scripts
--
CREATE TABLE ATTACHMENT (
	id BIGINT NOT NULL,
	ATTACHMENT_CONTENT BYTEA,
	CONTENT_TYPE VARCHAR(255) NOT NULL,
	CREATED_BY VARCHAR(255) NOT NULL,
	CREATED_TIME Timestamp NOT NULL DEFAULT current_timestamp,
	ATTACHMENT_NAME VARCHAR(255) NOT NULL,
	ATTACHMENT_URL VARCHAR(2048) NOT NULL,
	PRIMARY KEY (id)
);


--
-- B4P Related SQL Scripts
--
CREATE TABLE HT_COORDINATION_DATA (MESSAGE_ID VARCHAR(255) NOT NULL, PROCESS_INSTANCE_ID VARCHAR(255), PROTOCOL_HANDlER_URL VARCHAR(255) NOT NULL, TASK_ID VARCHAR(255), PRIMARY KEY (MESSAGE_ID));



-- create WSO2_METRIKS_IS_KM_DB


\c wso2_metriks_is_km_db;

\echo 'CREATE WSO2_METRIKS_IS_KM_DB';

CREATE SEQUENCE METRIC_GAUGE_SEQUENCE START WITH 1 INCREMENT BY 1;

CREATE TABLE METRIC_GAUGE (
    ID BIGINT DEFAULT nextval('METRIC_GAUGE_SEQUENCE') PRIMARY KEY,
    SOURCE VARCHAR(255) NOT NULL,
    TIMESTAMP BIGINT NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    VALUE VARCHAR(100) NOT NULL
);

CREATE SEQUENCE METRIC_COUNTER_SEQUENCE START WITH 1 INCREMENT BY 1;

CREATE TABLE METRIC_COUNTER (
    ID BIGINT DEFAULT nextval('METRIC_COUNTER_SEQUENCE') PRIMARY KEY,
    SOURCE VARCHAR(255) NOT NULL,
    TIMESTAMP BIGINT NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    COUNT BIGINT NOT NULL
);

CREATE SEQUENCE METRIC_METER_SEQUENCE START WITH 1 INCREMENT BY 1;

CREATE TABLE METRIC_METER (
    ID BIGINT DEFAULT nextval('METRIC_METER_SEQUENCE') PRIMARY KEY,
    SOURCE VARCHAR(255) NOT NULL,
    TIMESTAMP BIGINT NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    COUNT BIGINT NOT NULL,
    MEAN_RATE NUMERIC(50,25) NOT NULL,
    M1_RATE NUMERIC(50,25) NOT NULL,
    M5_RATE NUMERIC(50,25) NOT NULL,
    M15_RATE NUMERIC(50,25) NOT NULL,
    RATE_UNIT VARCHAR(50) NOT NULL
);

CREATE SEQUENCE METRIC_HISTOGRAM_SEQUENCE START WITH 1 INCREMENT BY 1;

CREATE TABLE METRIC_HISTOGRAM (
    ID BIGINT DEFAULT nextval('METRIC_HISTOGRAM_SEQUENCE') PRIMARY KEY,
    SOURCE VARCHAR(255) NOT NULL,
    TIMESTAMP BIGINT NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    COUNT BIGINT NOT NULL,
    MAX NUMERIC(50,25) NOT NULL,
    MEAN NUMERIC(50,25) NOT NULL,
    MIN NUMERIC(50,25) NOT NULL,
    STDDEV NUMERIC(50,25) NOT NULL,
    P50 NUMERIC(50,25) NOT NULL,
    P75 NUMERIC(50,25) NOT NULL,
    P95 NUMERIC(50,25) NOT NULL,
    P98 NUMERIC(50,25) NOT NULL,
    P99 NUMERIC(50,25) NOT NULL,
    P999 NUMERIC(50,25) NOT NULL
);

CREATE SEQUENCE METRIC_TIMER_SEQUENCE START WITH 1 INCREMENT BY 1;

CREATE TABLE METRIC_TIMER (
    ID BIGINT DEFAULT nextval('METRIC_TIMER_SEQUENCE') PRIMARY KEY,
    SOURCE VARCHAR(255) NOT NULL,
    TIMESTAMP BIGINT NOT NULL,
    NAME VARCHAR(255) NOT NULL,
    COUNT BIGINT NOT NULL,
    MAX NUMERIC(50,25) NOT NULL,
    MEAN NUMERIC(50,25) NOT NULL,
    MIN NUMERIC(50,25) NOT NULL,
    STDDEV NUMERIC(50,25) NOT NULL,
    P50 NUMERIC(50,25) NOT NULL,
    P75 NUMERIC(50,25) NOT NULL,
    P95 NUMERIC(50,25) NOT NULL,
    P98 NUMERIC(50,25) NOT NULL,
    P99 NUMERIC(50,25) NOT NULL,
    P999 NUMERIC(50,25) NOT NULL,
    MEAN_RATE NUMERIC(50,25) NOT NULL,
    M1_RATE NUMERIC(50,25) NOT NULL,
    M5_RATE NUMERIC(50,25) NOT NULL,
    M15_RATE NUMERIC(50,25) NOT NULL,
    RATE_UNIT VARCHAR(50) NOT NULL,
    DURATION_UNIT VARCHAR(50) NOT NULL
);

CREATE INDEX IDX_TIMESTAMP_GAUGE ON METRIC_GAUGE (TIMESTAMP);
CREATE INDEX IDX_TIMESTAMP_COUNTER ON METRIC_COUNTER (TIMESTAMP);
CREATE INDEX IDX_TIMESTAMP_METER ON METRIC_METER (TIMESTAMP);
CREATE INDEX IDX_TIMESTAMP_HISTOGRAM ON METRIC_HISTOGRAM (TIMESTAMP);
CREATE INDEX IDX_TIMESTAMP_TIMER ON METRIC_TIMER (TIMESTAMP);
