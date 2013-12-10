nodejs:
  pkgrepo.managed:
    - ppa: "chris-lea/node.js"
    - require_in:
        - pkg: nodejs
  pkg:
    - latest

# npm.installed does not currently work due to a change in recent version of nodejs.
# https://github.com/saltstack/salt/issues/8517
# work around is to run the npm install cmd manually.
grunt-cli:
  cmd.run:
    - name: npm install -g grunt-cli
    - require:
      - pkg: nodejs
