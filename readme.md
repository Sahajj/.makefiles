# Make files

### What does make files do?

They help us to create executable or the o/p files in such a manner that they take care of the compilation properly 

The purpose o the make utility is to determine automatically which pieces of a large program need to be recompiled and issue the commands to recompile them.

Make can be easily used to manage tasks in your projects.

## Executing task

let's start by simply creating a `Makefile`, and defining a `task` to run.

```makefile
task:
   date
```

if you run `make task` you will bump into the following error 

```makefile
1  /tmp ᐅ make task
2  Makefile:2: *** missing separator.  Stop.
```

and that’s because `Makefiles` use tabs to indent code. Let’s update our example by using `tab` rather than spaces and…. voila:

```makefile
make task
date
Mon  3 Apr 14:01:53 IST 2023
```

What kind of sorcery is this? well, make understood you wanted to run the section task of your makefile, and ran code (`date`) within that section in the shell, outputting both the commands and its output. if you want to skip outputting the command that’s being executed you can prefix it with an `@` 

```makefile
task:
	@date 

# in this @ is used to abstract the command from the user of make
# basically @ provides abstraction to the user.  
```

## **…in a specific order**

A lot of times you will want to execute a task before the current one — think of it as `before` or `after` hooks in your automated tests. This can be done by specifying a list of tasks right after your task’s name:

## Variables

Defining and using variables is fairly straightforward 

```makefile
	VAR=123

print_var:
	echo ${VAR}
```

```makefile
echo 123 
123 
```

but watch out as your shell variables won’t work out of the box:

```makefile
print_user:
	echo $USER
```

```makefile
make print_user
echo SER 
SER
```

as you will need to escape them with either `${VAR}` or `$$VAR`

Passing flags is also a bit different from what  you might be used to — they’re positioned as flags but use the same syntax as environment variables:

```makefile
print_foo:
	@echo $$FOO 
```

```makefile
make print_foo
echo $FOO

make print_foo FOO=bar
echo $FOO 
bar
```

## The Shell

```makefile
5.3.1 Choosing the Shell
------------------------

The program used as the shell is taken from the variable `SHELL'.  If
this variable is not set in your makefile, the program `/bin/sh' is
used as the shell.
```

Make will use `sh`  to execute code in a task, meaning some stuff might not work as you’re probably using some syntax that’s specific to bash — in order to switch you can simply specify the `SHELL` variable (in our case we would want to use `SHELL:=/bin/bash`) 

As seen before, sometimes you will need to use a quirky, custom syntax to get a regular shell command to work in `make` —just like variables need to be escaped with  a `$$` or `${…}`, you will need to use `shell` when using commands substitution:

Don’t believe me? Try removing the `shell` Instruction and here’s what you’re going to get:

```makefile
make subshell 

```

## **Conclusion**

There’s so much more `make` can do, and so many more quirky things you might need to find out to decrease the wps (*WTF per second*) when working with it :) that doesn’t erase the fact that `make` is extremely helpful took that allows us to automate workflows with ease, without having to setup very complicated pipelines, by writing tab-separated lines with a bunch of shell commands instead