LISP = clisp

default = test0

test0:
	$(LISP) ternary_tree.lisp < tests/test-0.data > tests/test-0.out

test1:
	$(LISP) ternary_tree.lisp < tests/test-1.data > tests/test-1.out

test2:
	$(LISP) ternary_tree.lisp < tests/test-2.data > tests/test-2.out

test3:
	$(LISP) ternary_tree.lisp < tests/test-3.data > tests/test-3.out

test4:
	$(LISP) ternary_tree.lisp < tests/test-4.data > tests/test-4.out

clean:
	/bin/rm -rf tests/*.out


