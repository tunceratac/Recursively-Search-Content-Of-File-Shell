# Recursively-Search-Content-Of-File-Shell

Writing Shell Script to recursively search the content of all files, which are located in a given directory. Before searching, your script will ask the user to enter the name of the directory and the keyword to be searched. The following steps will be done:

- Please implement a function that creates a folder named “Found” and copies the files containing the searched keyword there.

  * It changes file names to found _<old_file_name> (omit the angle brackets) while copying.

  * If the searched keyword is found, the user must be informed as "Files were copied to the Found directory!". In addition, display the files   which are in the “Found” directory.

  * If the searched word is not found, the user must be informed as "Keyword not found in files!”

- Please implement another function that displays modification details of the files found in the “Found” directory.

  * It shows the last modified user and modification time details of the files as follows: 

    File 1: found_file4.txt was modified by userName on March 12, 2023 at 21.00.

    File 2: found_file21.txt was modified by userName on March 16, 2023 at 08.40.

  * It will create a file named “modification_details.txt” in the “Found” directory. This file contains the modification details as depicted in    (a).

Note: The second function only works if the searched keyword is found.
