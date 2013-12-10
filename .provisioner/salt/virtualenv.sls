include:
  - python

# Create the Python Virtual enviroment.
/home/vagrant/.virtual-env/:
  virtualenv.managed:
    - requirements: /vagrant/requirements.txt
    - python: python2.7
    - require:
      - pkg: python2.7

# Make it so we automatically activate the virtualenv.
auto_venv:
  file.append:
    - name: /home/vagrant/.bashrc
    - text:
      - source /home/vagrant/.virtual-env/bin/activate
