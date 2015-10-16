MIX = mix

.PHONY: clean

priv/journalx_port: c_src/l2elog_port.c
	$(CC) -o $@ c_src/l2elog_port.c

clean:
	$(MIX) clean
	$(RM) priv/journalx_port

