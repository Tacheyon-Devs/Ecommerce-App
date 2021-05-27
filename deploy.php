<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Git:Updating</title>
</head>

<body>
<span style="color: #6BE234;">Git:</span> <span style="color: #729FCF;">Updating</span><BR>
<pre>
<?php 
/*


if(function_exists('exec')) {
    echo "exec is enabled";
}
if(function_exists('shell_exec')) {
    echo "exec is enabled";
}

echo ini_get('safe_mode');

if (ini_get('safe_mode')) {
    echo "<BR>safe mode";
}else{
    echo "<BR>no safe mode";
}
if (strtolower(ini_get('safe_mode')) != 1) {
    echo "<BR>safe mode";
}else{
    echo "<BR>no safe mode";
}
if(function_exists('exec') or exec('echo EXEC') == 'EXEC') {
    echo "<BR>exec is available";
    //print '<BR> disabled list:'.ini_get('disable_functions');
    if(!in_array('exec', array_map('trim', explode(',', ini_get('disable_functions'))))) {
          echo "<BR>exec is enable";

    }else{
	echo "<BR>exec is not enable";

    }


}else{
	echo "<BR>exec is not available";

}
*/
//echo "<BR>".shell_exec("whoami");

echo "<BR>".shell_exec("git pull 2>&1");
die(date('Y-m-d H:i:s'));

$command[0] = '/usr/bin/git pull -f 2>&1; echo $?';
$command[1] = '/usr/bin/git pull -f 2>&1';
$command[2] = '/usr/bin/git pull -f 1>&2;echo $?;';
$command[3] = '/usr/bin/git pull -f >a.txt';
$command[4] = '/usr/bin/git pull -f 1>a.txt';
$command[5] = 'git pull -f 2>&1';
$command[6] = '/usr/bin/git pull -f 2>a.txt';
$command[7] = '/usr/bin/git pull -f';


foreach($command as $ind=>$val){
	echo "<BR>$ind=>$val";
        echo "<BR>".shell_exec($val)."==========";
$myfile = fopen("a.txt", "r") or die("Unable to open file!");
echo @fread($myfile,filesize("a.txt"));
fclose($myfile);
echo "<BR>==========";
echo "<BR>".exec($command,$results);
print_r($results);
echo "<BR>==========";
$myfile = fopen("a.txt", "r") or die("Unable to open file!");
echo @fread($myfile,filesize("a.txt"));
fclose($myfile);
echo "<BR>==========";



}


echo '<BR>here<BR>';

print exec('which git');


?>
</pre>
</body>
</html>








<?php
/*
echo '<pre>';

error_reporting(E_ALL);

$resultShelExec = shell_exec('./a.sh');
echo $resultShelExec;
die;


// Outputs all the result of shellcommand "ls", and returns
// the last output line into $last_line. Stores the return value
// of the shell command in $retval.
$asdfad = `svn update` ;

$command = "sudo -i << next@dev_786|svn update";
$resultShelExec = shell_exec($command);
$resultExec = exec($command,$outputExec);
$last_line = system($command, $retval);


$command = "svn update";
$resultShelExec = shell_exec($command);
$resultExec = exec($command,$outputExec);
$last_line = system($command, $retval);

// Printing additional info

print_r($outputExec);

echo '===========================';

print_r($retval);
echo '===========================';

print_r($resultShelExec);
echo '</pre>';*/
?>