reset:
	sudo truncate --size 0 /var/log/nginx/access.log
	sudo truncate --size 0 /var/log/mysql/slow.log

alplog:
	sudo cat /var/log/nginx/access.log | alp -c /home/isucon/webapp/alp.yml ltsv > ~/alp.log
