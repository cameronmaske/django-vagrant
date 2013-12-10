include:
  - requirements

python-requirements:
  pkg.installed:
    - names:
      - python-software-properties
      - python-pip
      - python-virtualenv
      - python-dev
    - require:
      - pkg: requirements

python2.7:
  pkg:
    - latest
  require:
    - pkg: python-requirements

