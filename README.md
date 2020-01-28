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
