<?php
for($i = 18; $i <= 20; $i++){
	$url = "http://snow.telemed.no/axis2/services/ReportService/getReport?args0=".$i."_ALL";
	$xml = file_get_contents($url);
	$xml = strchr($xml,"&lt;Result");
	$xml = strchr($xml,"</ns:return>",true);
	$xml = str_replace("&lt;","<",$xml);
	$xml = str_replace("&gt;",">",$xml);
	$xml = "<root>".$xml."</root>";

	$data = simplexml_load_string($xml);

	$json = json_encode($data);
	$json_file = fopen("Assets/".$i."_ALL.json","w");
	fwrite($json_file,$json);
	fclose($json_file);
	
}

include("index.html");

?>