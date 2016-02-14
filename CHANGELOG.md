0.1.5
-----

- Use [posix-spawn](https://github.com/rtomayko/posix-spawn) to instead of Kernel#exec to get better performance.
  > fork(2) calls slow down as the parent process uses more memory due to the need to copy page tables.
