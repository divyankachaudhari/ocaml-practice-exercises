# FIXME: why are the $(for ...) expanding into empty strings

answer:
	dune build $(for i in 0*/answer/test ; do echo @$i/runtest ; done)

work:
	dune build $(for i in 0*/work/test ; do echo @$i/runtest ; done)
