postgresql-ppa:
  pkgrepo.managed:
    - name: deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main
    - key_url: http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc
    - require_in:
      - pkg: postgresql-9.2

postgresql-9.2:
  pkg:
    - installed

# Ensure postgres is running.
postgresql:
  service:
    - running
    - require:
      - pkg: postgresql-9.2


# Setups a postgres user.
db-user:
  postgres_user.present:
    - name: postgres
    - password: postgres
    - superuser: True
    - user: postgres
    - require:
      - service: postgresql

# Setups a postgres db.
# postgres://postgres:postgres@localhost/databus
db:
  postgres_database.present:
    - name: databus
    - user: postgres
    - owner: postgres
    - user: postgres
    - encoding: UTF8
    - lc_ctype: en_US.UTF8
    - lc_collate: en_US.UTF8
    - template: template0
    - require:
      - postgres_user: db-user
      - service: postgresql
