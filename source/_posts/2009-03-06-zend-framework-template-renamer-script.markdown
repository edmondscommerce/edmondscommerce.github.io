---
layout: post
status: publish
published: true
title: Zend Framework Template Renamer Script
author: admin
author_login: blogadmin
author_email: info@edmondscommerce.co.uk
author_url: http://www.edmondscommerce.co.uk
wordpress_id: 199
wordpress_url: http://www.edmondscommerce.co.uk/blog/?p=199
date: 2009-03-06 13:26:57.000000000 +00:00
categories:
- php
- zend framework
tags:
- zend framework
---
<div class="oldpost"><h4>This is post is now quite old and the the information it contains may be out of date or innacurate.</h4>
<p>
If you find any errors or have any suggestions to update the information <a href="http://edmondscommerce.github.io/contact-us/index.html">please let us know</a>
or <a href="https://github.com/edmondscommerce/edmondscommerce.github.io">create a pull request on GitHub</a>
</p>
</div>
Bit hard to describe this one, but if you use Zend Framework along with the MVC functionality, and you also use base classes for your controllers, models etc, you may find that for each controller, model etc the files are pretty much the same apart from the names of the files and the classes.

If this sounds familiar then you might be interested in this little script.

Put the script in a folder that contains a sub folder called TEMPLATE. In the template folder have a skeleton template with controllers, models and views folders. If you wanted to replicate this basic structure x amount of times for each of your controllers, this script will make that procedure a breeze.

There may be other applications for this little utility as well.

(now updated to accepted a # separated list of replacements - create your entire structure in one move :D)

```php

<?php
/* This is a simple script designed to be run in a folder that contains a TEMPLATE folder
 * 
 * the template folder shoudl contain  your folder structure for your zend framework app.
 * 
 * Normally this will be something like the format:
 * 
 * controllers/item.php
 * models/item.php
 * models/db_table/item.php
 * views/scripts/
 * 	blah.php
 * 	yada.php
 * 	etc.php
 * 
 * The script will take this template of folders and files and will find and will create a new folder structure in which all the filenames have been changed and within the files, a batch of finds and replaces have been done.
 * 
 * The idea is that this then gives you a starting point for your ZF app. This works especially well if each controller, model etc inherits from a custom base_controller or base_model.
 * 
 * hope it helps someone out :-)
 * 
 * Joseph
 * 
 * edmondscommerce.co.uk
 * 
 * */


if(!isset($_GET['replaceme'])){
?>
	<form>
<h3>Set Find and Replace - Please Input Upper Cased - lower cased will be automatically replaced as well</h3>
<b>Find:</b> <input name="findme"> <b>Replace:</b> <input name="replaceme"> <input type="submit" value="go"></form>
<h3>To Do A List of Replacemes - use a # separated list</h3>
<?php
	exit;
}
$fm = $_GET['findme'];
$rms = explode('#', $_GET['replaceme']);

error_reporting(E_ALL ^ E_NOTICE);

$debug = true;

/*
$fm = 'findMe';
$rm = 'replaceMe';
*/



/*get root current working directory*/
$cwd = getcwd();

/*output folder */
$of = 'OUTPUT';
if(is_dir($of)){
	delete($of);
}
mkdir($of);


foreach($rms as $k=>$rm){
	echo '<h1>' . $rm . '</h1>';
	/* First create a sub folder to put our new structure in */


	/*template path */
	$template = $cwd . '/TEMPLATE/';

	/*copy template to output */
	//if($k === 0){
		dir_copy('TEMPLATE', $of);
	//}
	
	/* Now get output structure */
	$dirlist = dir_list($of);
	dbug($dirlist);

	/*now jump into the output folder */
	chdir($of);

	/*Now loop through, rename the file and then find and replace the contents */
	replace_rename($dirlist, $fm, $rm);

	/* Jump back to the main cwd */
	chdir($cwd);
}


######## FUNCTIONS #########

function replace_rename($array, $fm, $rm){
	$chdir = getcwd();
	foreach($array as $k=>$v){
		if(is_int($k)){
			//its a file
			$newfile = str_replace(strtolower($fm), strtolower($rm), str_replace($fm, $rm, $v));
			h3("Renaming $v to $newfile");
			rename($v, $newfile);
			done();
			h3("Replacing Contents of $newfile");
			$fc = file_get_contents($newfile);
			if(empty($fc)){
				err("$newfile empty");
				exit;
			}
			if(!stristr($fc, $fm)){
				err("$fm not found in this file... should it have been?");
			}
			$newcontents = str_replace(strtolower($fm), strtolower($rm), str_replace($fm, $rm, $fc));
			file_put_contents($newfile, $newcontents);		
			done();	
		}else{
			$newfolder = str_replace(strtolower($fm), strtolower($rm), str_replace($fm, $rm, $k));
			h3("Renaming $k to $newfile");
			rename($k, $newfolder);
			done();
			$jumpin = $chdir . '/' . $newfolder;
			h3("Jumping to $jumpin");
			chdir($jumpin);
			done();
			//its a folder
			h3("Now Recursing into $k");
			echo '<blockquote>';
			replace_rename($v, $fm, $rm);
			echo '</blockquote>';
			done();
			chdir($chdir);
		}	
	}
	chdir($chdir);
}


// http://uk3.php.net/copy
function dir_copy($srcdir, $dstdir, $offset = '', $verbose = true)
{
    // A function to copy files from one directory to another one, including subdirectories and
    // nonexisting or newer files. Function returns number of files copied.
    // This function is PHP implementation of Windows xcopy  A:\dir1\* B:\dir2 /D /E /F /H /R /Y
    // Syntaxis: [$returnstring =] dircopy($sourcedirectory, $destinationdirectory [, $offset] [, $verbose]);
    // Example: $num = dircopy('A:\dir1', 'B:\dir2', 1);

    // Original by SkyEye.  Remake by AngelKiha.
    // Linux compatibility by marajax.
    // ([danbrown AT php DOT net): *NIX-compatibility noted by Belandi.]
    // Offset count added for the possibilty that it somehow miscounts your files.  This is NOT required.
    // Remake returns an explodable string with comma differentiables, in the order of:
    // Number copied files, Number of files which failed to copy, Total size (in bytes) of the copied files,
    // and the files which fail to copy.  Example: 5,2,150000,\SOMEPATH\SOMEFILE.EXT|\SOMEPATH\SOMEOTHERFILE.EXT
    // If you feel adventurous, or have an error reporting system that can log the failed copy files, they can be
    // exploded using the | differentiable, after exploding the result string.
    //
    if(!isset($offset)) $offset=0;
    $num = 0;
    $fail = 0;
    $sizetotal = 0;
    $fifail = '';
    if(!is_dir($dstdir)) mkdir($dstdir);
    if($curdir = opendir($srcdir)) {
        while($file = readdir($curdir)) {
            if($file != '.' && $file != '..') {
//                $srcfile = $srcdir . '\\' . $file;    # deleted by marajax
//                $dstfile = $dstdir . '\\' . $file;    # deleted by marajax
                $srcfile = $srcdir . '/' . $file;    # added by marajax
                $dstfile = $dstdir . '/' . $file;    # added by marajax
                if(is_file($srcfile)) {
                    if(is_file($dstfile)) $ow = filemtime($srcfile) - filemtime($dstfile); else $ow = 1;
                    if($ow > 0) {
                        if($verbose) echo "Copying '$srcfile' to '$dstfile'...<br />";
                        if(copy($srcfile, $dstfile)) {
                            touch($dstfile, filemtime($srcfile)); $num++;
                            chmod($dstfile, 0777);    # added by marajax
                            $sizetotal = ($sizetotal + filesize($dstfile));
                            if($verbose) echo "OK\n";
                        }
                        else {
                            echo "Error: File '$srcfile' could not be copied!<br />\n";
                            $fail++;
                            $fifail = $fifail.$srcfile.'|';
                        }
                    }
                }
                else if(is_dir($srcfile)) {
                    $res = explode(',',$ret);
//                    $ret = dircopy($srcfile, $dstfile, $verbose); # deleted by patrick
                    $ret = dir_copy($srcfile, $dstfile, $verbose); # added by patrick
                    $mod = explode(',',$ret);
                    $imp = array($res[0] + $mod[0],$mod[1] + $res[1],$mod[2] + $res[2],$mod[3].$res[3]);
                    $ret = implode(',',$imp);
                }
            }
        }
        closedir($curdir);
    }
    $red = explode(',',$ret);
    $ret = ($num + $red[0]).','.(($fail-$offset) + $red[1]).','.($sizetotal + $red[2]).','.$fifail.$red[3];
    return $ret;
} 




function dir_list($directory){
	//echo $directory;
	if ($handle = opendir($directory)) {
		while (false !== ($file = readdir($handle))) {
			if($file != '.' && $file != '..'){
				if(is_dir($directory . '/' . $file)){
					$return[$file]=dir_list($directory . '/' . $file . '/');
				}else{
					$return[] = $file;
				}
			}
		}
		closedir($handle);
		return $return;
	}else{		
		return false;
	}
}

//recursive delete file/folder
function delete($dirname, $folder_empty = 'delete'){
	// Sanity check
	if (!file_exists($dirname)) {
		echo '<h3 style="color: red;">File ' . $dirname . ' does not exist</h3>';
		//bottom();
		return false;
	}

	// Simple delete for a file
	if (is_file($dirname)) {
		return unlink($dirname);
	}

	// Loop through the folder
	$dir = dir($dirname);
	while (false !== $entry = $dir->read()) {
		// Skip pointers
		if ($entry == '.' || $entry == '..') {
			continue;
		}
		// Recurse
		delete("$dirname/$entry");
	}// end while looping

	// Clean up
	$dir->close();
	if($folder_empty == 'delete'){
		return rmdir($dirname);
	}else{
		//just empty the folder, don't actually delete it
		return true;
	}
}

//DEbug Functions

//convert tabs to spaces
function tab2space($text, $spaces = 4){
	$text = str_replace('  ', '&nbsp;&nbsp;&nbsp;&nbsp;', $text);
	$text = str_replace("\t", '&nbsp;&nbsp;&nbsp;&nbsp;', $text);
	return $text;
}

//return name of variable passed by reference
function vname(&$var, $scope=false){
    if($scope) $vals = $scope;
    else      $vals = $GLOBALS;
    $old = $var;
	$new = 'THISONE';
	$var = $new;
	$vname = false;
    foreach($vals as $key => $val) {
		if($val !=='var'){
			if($val === $new) $vname = $key;
		}
    }
    $var = $old;
    return $vname;
  }


function dbug(&$item, $scope=false){
	global $debug;
	if(!$debug){
		return false;
	}
	$vname = vname(&$item,$scope);
	echo '<hr><h3>Debug Info: $' . $vname  . '</h3>' . tab2space(nl2br(htmlentities(var_export($item, true)))) . '<hr>';	
	flush();
}

function done(){
	echo '<h3 style="color: green;">Done..</h3>';
}

function h3($text){
	echo '<h3>' . $text . '</h3>';
	flush();
}

function err($text){
	echo '<h3 style="color: red;">' . $text . '</h3>';
}


``` 
