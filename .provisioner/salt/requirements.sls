requirements:
  pkg.installed:
    - names:
      - libpq-dev
      - build-essential
      - git
      - language-pack-en

# Make it so we automatically cd into /vagrant/
cd_vagrant:
  file.append:
    - name: /home/vagrant/.bashrc
    - text:
      - cd /vagrant/

# Humanize the box name!
hostname vagrant:
  cmd.run