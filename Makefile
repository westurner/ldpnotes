
all: test

test:
	rapper -i turtle ./http-problem.ttl -o rdfxml > /dev/null
	rapper -i turtle ./http-problem.ttl -o turtle > /dev/null

docs: clean
	rapper -i turtle ./http-problem.ttl -o dot > http-problem.dot
	dot http-problem.dot -Tpng -o http-problem.png

clean:
	rm -f http-problem.dot
