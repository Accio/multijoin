# The multijoin tool

Jitao David Zhang, 04.05.2017

## Background

Often we have multiple tab-delimited files that contain key-value pairs, and we would like to organise them into one matrix.

For instance, suppose we have following three files

1. File 1

|Key | Value1|
|----|------|
|A   |  1  |
|B   |  2  |
|C   |  3  |

2. File 2

|Key | Value2|
|----|-------|
| A  |   2   |
| C  |   3   |
| D  |   4   |

3. File 3

| Key | Value3 |
|-----|--------|
|  D  |  2     |
|  B  |  3     |


Note that keys in different files may be different. 

Now we want to merge them into one matrix:

| Key | Value1 | Value2 | Value3 |
|-----|--------|--------|--------|
| A   |  1     |   2    |  NA    |
| B   |  2     |   NA   |  3     |
| C   |  3     |   3    |  NA    |
| D   |  NA    |   NA   |  NA    |
|-----|--------|--------|--------|

The multijoin tool efficiently performs this operation. 

## How

multijoin uses the 'join' command in bash to perform the job efficiently.



