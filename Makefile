help:
	@echo 'Makefile for Uberhip.com Jekyll Site'
	@echo ''
	@echo '  make build                   regenerates site'
	@echo '  make clean                   removes contents of _site'
	@echo '  make test_deploy             deploys site to test server'
	@echo '  make prod_deploy             deploys site to production server'

clean:
	rm -rf _site/*

build: clean
	jekyll build
	chmod -R 755 _site/*

prod_deploy: build
	rsync -a _site/ balancar.uberhip.com:/var/www/web6/web/
	notify-send 'Deploy Status' 'Deploy to production complete'

test_deploy: build
	rsync -a _site/ balancar.uberhip.com:/var/www/web3/web/
	notify-send 'Deploy Status' 'Deploy to test complete'
