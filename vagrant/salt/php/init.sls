php5-fpm:
  pkg:
    - installed
  service:
    - running

php5-extra:
  pkg.installed:
    - pkgs:
      - php5-cli
      - php5-curl
      - php5-mysql
      - php5-xdebug