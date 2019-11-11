--Inserts
INSERT INTO public."Job"(name) VALUES ('Job 1');
INSERT INTO public."Job"(name) VALUES ('Job 2');
INSERT INTO public."Job"(name) VALUES ('Job 3');
COMMIT;

INSERT INTO public."Machine"(name, enabled, type) VALUES ('Machine 1', true, 'Strong');
INSERT INTO public."Machine"(name, enabled, type) VALUES ('Machine 2', true, 'Lite');
INSERT INTO public."Machine"(name, enabled, type) VALUES ('Machine 3', false, 'Expensive');
INSERT INTO public."Machine"(name, enabled, type) VALUES ('Machine 4', false, 'Strong');
INSERT INTO public."Machine"(name, enabled, type) VALUES ('Machine 5', true, 'Fast');
COMMIT;

INSERT INTO public."Task"(name, job_id, sequence) VALUES ('TASK 1', 1, 1);
INSERT INTO public."Task"(name, job_id, sequence) VALUES ('TASK 2', 1, 2);
INSERT INTO public."Task"(name, job_id, sequence) VALUES ('TASK 3', 1, 3);

INSERT INTO public."Task"(name, job_id, sequence) VALUES ('TASK A', 2, 1);
INSERT INTO public."Task"(name, job_id, sequence) VALUES ('TASK B', 2, 2);
INSERT INTO public."Task"(name, job_id, sequence) VALUES ('TASK C', 2, 3);

INSERT INTO public."Task"(name, job_id, sequence) VALUES ('TASK X', 3, 1);
INSERT INTO public."Task"(name, job_id, sequence) VALUES ('TASK Y', 3, 2);
COMMIT;

INSERT INTO public."Task_queue"(machine_id, task_id, status) VALUES (1, 1, 'Complete');
INSERT INTO public."Task_queue"(machine_id, task_id, status) VALUES (2, 2, 'Running');
INSERT INTO public."Task_queue"(machine_id, task_id, status) VALUES (5, 3, 'Waiting');
INSERT INTO public."Task_queue"(machine_id, task_id, status) VALUES (1, 4, 'Running');
INSERT INTO public."Task_queue"(machine_id, task_id, status) VALUES (2, 5, 'Waiting');
INSERT INTO public."Task_queue"(machine_id, task_id, status) VALUES (5, 6, 'Complete');
INSERT INTO public."Task_queue"(machine_id, task_id, status) VALUES (1, 7, 'Complete');

COMMIT;
