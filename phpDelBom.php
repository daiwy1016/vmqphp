<?php 

$path = dirname(__FILE__);
 
echo $path;

scandDir($path);
 
 
function bomtoutf8($filename)
{
	$ef = 239;
	$bb = 187;
	$bf = 191;
 
	if (is_dir($filename)) return;
	$fd = fopen($filename, "rb");
	if (!$fd) exit($filename);
	$headers = fread($fd, 3);
	fclose($fd);
	
	if (strlen($headers) < 3) return;
 
	if (ord($headers[0]) == $ef && 
		ord($headers[1]) == $bb &&
		ord($headers[2]) == $bf
		) {
		echo $filename, "\n";
		$content = file_get_contents($filename);
		if (!$content) {
			exit("file get contents failed");
		}
		$len = strlen($content);
		$content = substr($content, 3);
 
		if ($content === false && $len!=3) {
			exit("sbustr failed");
		} else if ($content === false && $len==3){
			$content = "";
		}
		$ret = file_put_contents($filename, $content, LOCK_EX);
		if ($ret === false) {
			exit("file put contents failed");
		}
		echo "successed file ", $filename, "\n";
	}
 
 
}
 
function scandDir($path)
{
	$d = dir($path);
	if (!$d) exit("dir failed");
 
	while (false !== ($entry = $d->read())) {
		if ($entry == '.' || $entry == '..') {
			continue;
		}
		$filename = $path . DIRECTORY_SEPARATOR . $entry;
	//	echo $filename, "\n";
		if (is_dir($filename)) {
            //echo 'scandDir:'.$filename;
			scandDir($filename);
		} else {
            //echo $filename;
			bomtoutf8($filename);
		}
	}
}