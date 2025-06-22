# Bash Scripting

In many Linux shells such as `sh` or `bash`, some kind of bash
scripting is available. This scripting language on its own only gives
possibilities. But coupled with the applications that are installed
on the system, bash scripting can be very powerful.

## Useful Resources

- [W3Schools - Bash Tutorial](
    https://www.w3schools.com/bash/index.php)

## Environment Variables

Bash works directly with environment variables which are values that
can be defined in a global context which makes them available for all
applications executed in the same context.

This is how environment variables work:

```bash
var1='Hello'
var2='World!'

echo "$var1 ${var2}" # Outputs 'Hello World!'

# Make variable accessible outside the script
export VAR1="$var1"
```

## Calling Executables

Any files marked as executable can be run by using their names (if
defined in the PATH environment variable) or by pointing to their
location with a relative or absolute path.

Here is how that would look:

```bash
# Read the file example.txt
cat example.txt
# Using an absolute path
/bin/cat example.txt
# Using a relative path (from /home/<user>)
../../bin/cat example.txt
```

## Conditional Statements

Bash also has conditional statements (or so-called if statements).
These statements can be used check certain conditions and act
depending on them.

Here are a few examples:

```bash
# If-ElIf-Else
if [ $var -eq 0 ]; then
    # Do something
elif [ $var -eq 1 ]; then
    # Do something
else
    # Do something
fi

# String comparison operators: =, !=, <, >
# Comparison operators: -eq, -ne, -lt, -le, -gt, -ge
# File test operators: -e, -d, -f, -s
```

## Loops

Bash has loops, too. There are muliple types of loops in bash and they
will be explained in the following sections.

### For Loops

For loops are used when a specific task has to be repeated a certain
amount of times.

Here a few examples:

```bash
# Iterate from one through ten
for i in {1..10}; do
    echo $i # Output: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
done
```

### While Loops

### Until Loops

