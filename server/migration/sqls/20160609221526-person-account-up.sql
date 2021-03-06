BEGIN;

create table give_me_time_private.person_account (
  person_id        integer not null primary key references give_me_time_public.person,
  email            character varying not null unique check (email ~* '^.+@.+\..+$'),
  pass_hash        character varying not null
);

comment on table give_me_time_private.person_account is 'Private information about a person’s account.';
comment on column give_me_time_private.person_account.person_id is 'The id of the person associated with this account.';
comment on column give_me_time_private.person_account.email is 'The email address of the person.';
comment on column give_me_time_private.person_account.pass_hash is 'An opaque hash of the person’s password.';

COMMIT;