# What is localisation ?
In Linux, localization refers to the process of adapting the system and its applications to a specific language, region, or culture. This involves setting various environmental variables, configuration files, and system settings to conform to the conventions of a target locale.Applications depend on environment vairiables and commands to decide the proper time and language to use
some basc commands include :
- [x] ``date`` :
 which shows time and date , we could also specify what is should output such as;
date + '%[Y,M,D,C]' For year ,month , day , and century respectively
- [x] ``cal `` :
   shows the calendar and cal -# would show you the previous and next months in accordance with #
- [x] ``timedatectl`` :
 which shows local time , timezone ,UTC (Coordinated Universal Time) and other important timezone info
* note that the ``/etc/timezone`` is the file that stores your timezone
- [x] ``tzselect`` :
 This command provides an interactive method of choosing a default timezone .
 ``TZ`` is the envronment variable responsible for holdin the timezone for the shell session
 * note that the ``/etc/localtime"`` contains data needed by the OS to adjust its clock accordingly 
 * also ``/usr/share/zoneinfo`` is a directory that stores all timezones so that ``/etc/localtime`` can just symbolically link to it . This means that someone in Africa,Douala is under the file ``/usr/share/zoneinfo/Africa/Douala`` 
 #### LANGUAGE AND CHARACTER ENCODING 
  A set of parameterrs that define the user's language , country and any special variant preferences is known as the __Locale__
``LANG`` is the  environment variable storing basic locale configuration . This value take the format ab_CB where ab --> language code and CD --> region code . The system wide local settings are configured and stored in the  ``/etc/locale.gen`` file
- [x] ``localectl``: 
 available on systemd system manager can be used to change the system locale . This locale contains other sub environment variables which can be displayed using the ``locale`` command  This environment variables include ;
- LC_COLLATE :
 stes the alphabetical ordering
- LC_CTYPE :
 stes how the system will treat certain sets of characters
 - LC_MESSAGES :
 sets the numerical format for non-monetary value
 - LC_PAPER :
sets the standar paper size
 - LC_TIME :
sets the time and date format 
 - LC_ALL :
overides all other variables
#### ENCODING CONVERSION
Text may appear with unintelligible characters when displayed on a system with a character
encoding configuration other than the system where the text was created. The command iconv
can be used to solve this issue . For example say a file named original.txt from the ISO-8859-1 encoding needs to be converted to converted.txt using UTF-8 encoding . 
We can simply use the command ``iconv -f ISO-8859-1 -t UTF-8 original.txt > converted.txt``  
* test example 
say this is the ISO-8859-1 encoded file named example.txt
```
Bonjour, comment allez-vous?

Das ist ein Beispieltext auf Deutsch.

Este es un ejemplo de texto en español.

ƒ (U+0192) is a special character.

€ (U+20AC) is another special character.
```
and you want to convert it to UTF-8  
__THE END___
:)
