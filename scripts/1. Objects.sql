CREATE SEQUENCE public."SQ_JOB"
    INCREMENT 1
    START 1
    MINVALUE 0
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."SQ_JOB" OWNER TO postgres;

CREATE SEQUENCE public."SQ_MACHINE"
    INCREMENT 1
    START 1
    MINVALUE 0
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."SQ_MACHINE" OWNER TO postgres;
 

CREATE SEQUENCE public."SQ_TASK"
    INCREMENT 1
    START 1
    MINVALUE 0
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."SQ_TASK" OWNER TO postgres;
 
CREATE SEQUENCE public."SQ_TASK_QUEUE"
    INCREMENT 1
    START 1
    MINVALUE 0
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public."SQ_TASK_QUEUE"
    OWNER TO postgres;	

--Tables
-- Table: public."Job"
CREATE TABLE public."Job"
(
    id integer NOT NULL DEFAULT nextval('"SQ_JOB"'::regclass),
    name text COLLATE pg_catalog."default",
    CONSTRAINT "PK_JOB" PRIMARY KEY (id)
)TABLESPACE pg_default;

ALTER TABLE public."Job" OWNER to postgres;

COMMENT ON COLUMN public."Job".id IS 'Job id';
COMMENT ON COLUMN public."Job".name IS 'Name of the job';	
	
-- Table: public."Machine"
CREATE TABLE public."Machine"
(
    id integer NOT NULL DEFAULT nextval('"SQ_MACHINE"'::regclass),
    name character varying(30) COLLATE pg_catalog."default",
    enabled boolean DEFAULT true,
    type character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT "PK_MACHINE" PRIMARY KEY (id)
)TABLESPACE pg_default;

ALTER TABLE public."Machine" OWNER to postgres;

COMMENT ON COLUMN public."Machine".id IS 'Machine ID';
COMMENT ON COLUMN public."Machine".name IS 'Name of the machine';
COMMENT ON COLUMN public."Machine".enabled IS 'If the machine is on/off';
COMMENT ON COLUMN public."Machine".type IS 'The type of process can be handled by this machine. E.g. ‘Task A’';	

-- Table: public."Task"
CREATE TABLE public."Task"
(
    id integer NOT NULL DEFAULT nextval('"SQ_TASK"'::regclass),
    name character varying(30) COLLATE pg_catalog."default",
    job_id integer,
    sequence integer,
    CONSTRAINT "PK_TASK" PRIMARY KEY (id)
)TABLESPACE pg_default;

ALTER TABLE public."Task" OWNER to postgres;

COMMENT ON COLUMN public."Task".id IS 'Task id';
COMMENT ON COLUMN public."Task".name IS 'Name of the task';
COMMENT ON COLUMN public."Task".job_id IS 'Belonged to which job';
COMMENT ON COLUMN public."Task".sequence IS 'The execution sequence of this task';

-- Table: public."Task_queue"
CREATE TABLE public."Task_queue"
(
    id integer NOT NULL DEFAULT nextval('"SQ_TASK_QUEUE"'::regclass),
    machine_id integer,
    task_id integer,
    status character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT "PK_TASK_QUEUE" PRIMARY KEY (id)
) TABLESPACE pg_default;

ALTER TABLE public."Task_queue" OWNER to postgres;

COMMENT ON COLUMN public."Task_queue".status IS 'The status of task. E.g. “Running”, “Waiting”, “Complete”';
 