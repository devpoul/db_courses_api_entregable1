--! código de db diagram --

CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "password" varchar,
  "age" int8,
  "roles_id" int
);

CREATE TABLE "user_courses" (
  "id" int,
  "users_id" uuid,
  "courses_id" int,
  "percent" int
);

CREATE TABLE "courses" (
  "id" serial PRIMARY KEY,
  "title" varchar,
  "description" varchar,
  "level" varchar,
  "teacher" varchar,
  "categories_id" int
);

CREATE TABLE "course_videos" (
  "id" serial PRIMARY KEY,
  "title" varchar,
  "url" varchar,
  "courses_id" int
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "roles" (
  "id" int PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "user_courses" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "user_courses" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("roles_id") REFERENCES "roles" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("categories_id") REFERENCES "categories" ("id");


--! código de dbeaber --
insert
	into categories (
		name
	)
	values (
		'desktop develop'
	), (
		'dev ops'
	), (
		'frontend'
	), (
		'backend'
	);


insert
	into course_videos (
		title,
		url,
		courses_id 
	)
	values (
		'pimeros pasos',
		'www.video1.com',
		2
	), (
		'conociendo la interfaz',
		'www.video2.com',
		2
	), (
		'ejercicio de práctica',
		'www.video3.com',
		2
	);


insert
	into courses (
		title,
		description,
		"level",
		teacher,
		categories_id
	)
	values (
		'react',
		'desarrollo de web apps con vite',
		'intermedio',
		'Benjamin',
		2
	), (
		'Html, CSS y JS',
		'desarrollo de páginas web dinámicas',
		'principiante',
		'Bryan',
		3
	), (
		'Node js',
		'desarrollo de bases de datos',
		'intermedio',
		'Sahid',
		4
	);


insert 
	into roles (
		id,
		name
	)
	values (
		1,
		'master-admin'
	), (
		2,
		'admin'
	), (
		3,
		'teacher'
	), (
		4,
		'student'
	);


insert 
	into users (
		id,
		name,
		email,
		"password",
		age,
		roles_id
	)
	values (
		'66063421-b296-402a-b5f5-e68885bb6fe2',
		'steve muñoz',
		'steve@gmai.com',
		'qwerty123',
		27,
		4
	);

select * from users where roles_id = 4;
select * from courses inner join course_videos on courses.id = course_videos.courses_id;

	