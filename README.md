# password-cracker

## Motive
Created for the Group Project task for Weeks 1-2, Semester 2, year 1 of the Ethical Hacking & Cybersecurity Course at 
Coventry University. Intended to be a reasonably efficient, Haskell implementation of a single-threaded MD5 password cracker. 

## Details
By default, the salt used is "FOOBAR", as per the specifications of the task. The method of iteratively constructing 
strings is based on the common method for Haskell, of building a function to first 'rotate' through the selected set of 
characters, and then creating a function to recursively generate strings, exchausting every possible combination of the 
character set. 

## Limitations
Part of the task involves the limitation that the password cracker will be required to run on a Kali Virtual 
Machine. This limitation means that, realistically, it is not possible to use parallelisation to speed up computation.

## Current Issues
Currently, there is an issue of encoding with certain characters, cuasing potentially incorrect hashes to be calculated. 
This has been observed with the '€' character most notably. A fix is currently being developed.

## Notable Versions (+ the 'cake' benchmark)

### Version 0.1.0

- 'cake' time: 3.30 seconds

### Version 0.2.0

- 'cake' time: 2.67 seconds

### Version 0.3.0

- 'cake' time: 0.99 seconds

## Version Descriptions

### Version 0.1.0
Version 0.1.0 was the first working version of the MD5 cracker. It cracked the hashed + salted password "cake" in 
3.30 seconds. The bulk of this time, according to the profiler, was used by encoding each hashed string into 
Base16 in order for a correct comparison to be made to the given input hash.

### Version 0.2.0
Version 0.2.0 ran in approximately ~80% the time taken by Version 0.1.0. This was achieved by slightly altering the 
funciton that checked the calculated hash with the given hash. In the original version, the salt "FOOBAR" was 
concatenated to the current password, and then the total string was hashed and compared. In this new version, a hash 
context constant is calculated, already containing the hashed "FOOBAR". Now, instead of hashing the entire salt + string 
everytime, the hash context could simply be updated with the string and then finalised. 

### Version 0.3.0 
Version 0.3.0 ran in approximately ~37% the time taken by Version 0.2.0 and ~30% the time taken by Version 0.1.0. This 
speedup was achieved by altering the hash comparison function yet again. Up until Version 0.3.0, the calculated hash had 
to be encoded into Base 16 before a correct comparison could be made to the input hash. With this version, the input hash 
was instead decoded once it had been recieved as input, removing the need for each calculated string to be encoded. This 
massively reduced the overhead of the cracker, reducing the time, memory, and ticks substantially. It also may have 
introduced a bug in how it handles certain characters, such as '€'. Hashes calculated that contain this character 
seem to differ from the hash calculated by online MD5 hash calculators. I am currently working on a fix for this bug. 
