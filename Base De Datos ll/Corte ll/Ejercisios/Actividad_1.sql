SELECT
  datname
FROM
  pg_database
WHERE
  datistemplate = false;

SELECT
  current_database ();

CREATE SCHEMA sr11_public;


CREATE TABLE sr10_public.tbr10_contacts (
  id INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY NOT NULL,
  name VARCHAR(80)
);

create user r11_user_schema with password 'halamadrid';

grant usage on schema sr10_public to r10_user_schema;

GRANT CREATE ON schema sr10_public TO r10_user_schema;

create user r11_user_table with password 'halamadrid';

grant usage on schema sr11_public to r10_user_table;

GRANT SELECT ON TABLE sr11_public.tbr10_contacts TO r10_user_table;

select * from pg_user;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO r11_user_schema;

GRANT USAGE ON SCHEMA public TO r11_user_schema;