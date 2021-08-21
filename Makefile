reset:
	sudo truncate --size 0 /var/log/nginx/access.log
	sudo truncate --size 0 /var/log/mysql/slow.log
