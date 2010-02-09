
GNU Bash 2.0.3
--------------

   This is a copy of GNU Bash that has been compiled for 
  stand-alone use, basically this means that you should be
  able to use it without any of the cygnus tools.  

Installing
----------

   Simply place the bash.exe, and bash.dll file somewhere 
  on your PATH, and copy the supplied .bashrc file to your
  Home directory.


Home Directory
--------------

   Unix users automatically have a home directory, which is
  set when they login - this is not the case for Windows users,
  they should create a special home directory, and then 
  set the environmental variable HOME to point to it.

  Windows 95
  ----------
   For example, add the following line to the end of your 
  AUTOEXEC.BAT  file:-

   SET HOME=C:\Home  -- Use the appropriate directory here.

  Windows NT
  ----------
   Right Click on "My Computer", select properties, and then
  click on the environment tab.
   Add a new variable called HOME, giving it the value which
  is the name of a directory you have created for your home.


How This was Built
------------------

  These are the things I did to create this copy of bash.
  
  1.  Downloaded the source of bash.2.0.3 from http://www.gnu.org/ 

  2.  Started bash, from Cygnus b20.1, and used this to configure
     and compile it.

  3.  Editted the freshly compiled binary to rename the single 
     occurence of "cygwin1.dll" to "bash.dll\0".

  4.  Compressed both bash.exe, and the copied bash.dll.

  5.  Added some bundled utilities to the directory, and zipped.


Steve Kemp
---
http://GNUSoftware.com  -- GNU Software for Windows users.