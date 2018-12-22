-- Alexey Mozgo , Add DB logs and table log, 26.10.2018 14:57

-- SELECT pg_terminate_backend(pg_stat_activity.pid)
-- FROM pg_stat_activity
-- WHERE pg_stat_activity.datname = 'logs' 
-- AND pid <> pg_backend_pid();

CREATE DATABASE logs;

\c logs;

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


-- Edit column type public.processing_logs.log_message text , Denis Arteshkevich 20.12.2018 14:10
ALTER TABLE public.processing_logs ALTER COLUMN log_message TYPE text USING log_message::text;