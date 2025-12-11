install:
	pip install . -v --log build.log

wheel:
	pip wheel . -v -w dist --log build.log
