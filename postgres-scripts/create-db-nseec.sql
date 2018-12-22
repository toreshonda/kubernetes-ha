-- Instruction  -----------------------------------------------------------------------------------------------------------------------------------

-- Format
--  ALTER TABLE , Author , Comment , Date.

-- Edit column type
--ALTER TABLE conf.jms ALTER COLUMN port TYPE int4 USING port::int4;

-- Add/remove column
--ALTER TABLE conf.jms DROP COLUMN IF EXISTS pswrd;
--ALTER TABLE conf.jms ADD COLUMN IF NOT  EXISTS pswrd varchar(64)  NULL;

-- Rename column
--ALTER TABLE  conf.jms RENAME COLUMN  pswrd TO pswrd1;

-- Rename columt with NOT EXIST
--DO $$
--BEGIN
--  IF NOT EXISTS(SELECT *
--    FROM schema.columns
--    WHERE table_name='my_table' and column_name='my_column')
--  THEN
--      ALTER TABLE "public"."my_table" RENAME COLUMN "my_column" TO "my_new_column";
--  END IF;
--END $$;
CREATE DATABASE nseec;

\c nseec;

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

