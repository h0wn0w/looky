# READ ME

* This is a semi-interactive search that uses mdfind and, in one instance, mdfind and grep. 

* You get a little specification out of the gate:
	1. "name" results in a very wide search for a file name
	2. "text" looks for a file name and then for the same exact search terms within the results. Since this is a very specific search (greps the mdfind search) and sort of the "conservative" cousin to the "liberal" search #1, it yields very few, and sometimes no, results. 
	3. "bail" is just what it sounds like and exits the script

* If there are more than 100 results, the script asks if you want to pipe them to a .txt file. 
	* The script touches the file to the desktop, which has a pre-configured but easily changed name.  

* This is my first ever script/program. It is not efficient code. 

## Installation ##

I did not write an installer for this, unless you consider the following...
>Install in `/usr/local/bin/` 

...an installer. 
So, that's where it goes. It works well enough for me, which is why I wrote it to begin with. 
Enjoy!


