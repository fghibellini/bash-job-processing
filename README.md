
# How to parallelize bash scripts

This shows how you can make `xargs` run `n` jobs in parallel at any given time.

## Tour

[`jobs.csv`](./jobs.csv) is a list of jobs we want do perform. In our case just a list of letters:

```
a
b
c
...
z
```

[`job.sh`](./job.sh) represents the operation we want to perform for each job. In our case the job simply:

1. print `<job_name> [starting]`
2. sleep for random time between 3 and 15 seconds
3. print `<job_name> [done]`

[`scheduler.sh`](./scheduler.sh) will try to **run 6 jobs running at any given moment**.

```bash
$ ./scheduler.sh
a [starting]
b [starting]
c [starting]
d [starting]
e [starting]
f [starting]
b [done]
g [starting]
e [done]
...
```

[`currently-running.sh`](./currently-running.sh) can be used to actively monitor the tasks that are running right now.

```bash
$ ./scheduler | ./currently-running.sh
RUNNING:
  a b f i j k
```
