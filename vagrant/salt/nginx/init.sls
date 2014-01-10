nginx:
  pkg:
    - installed

/etc/nginx/sites-enabled/default:
  file.absent

/etc/nginx/sites-enabled/my-app:
  file.managed:
    - source: salt://nginx/my-app

nginx-service:
  service:
    - name: nginx
    - running
    - reload: True
    - watch:
      - file: /etc/nginx/sites-enabled/my-app