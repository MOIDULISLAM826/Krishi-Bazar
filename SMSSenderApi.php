<?php 

class SMSSenderApi
{

	private $SERVER  =  "https://sms.tnrsoft.com";
	private $API_KEY = "441ed028b1f065c1f39e6a31386af823dbb2f476";
	private $defaultDevice = '1110|0';
	private $number;
	private $message;
	private $deviveId;
	private $sim;
	private $messageModel;
	
	function __construct()
	{
		//$this->number = $this->message = null;
		//$this->messageModel = new MessageModel();
	}

	function toNumber($number=null)
	{
		$this->number = $number;
	}

	function message($message=null)
	{
		$this->message = $message;
	}

	function setDeviveId($deviveId=null) 
	{ 
		$this->deviveId = $deviveId; 
	}

	function setSim($sim=null) 
	{
		$this->sim = $sim; 
	}


	function send()
	{

		if ($this->sim != null || $this->deviveId != null) {
			$device = $this->deviveId."|".$this->sim;
		}
		else{
			$device = $this->defaultDevice;
		}

	    //echo "here";
	    $phoneNumber = trim($this->number);
	    $message = urlencode($this->message);
	    if($message !=null && $phoneNumber !=null){
			$url = $this->SERVER."/services/send.php?key=".$this->API_KEY."&devices=".$device."&number=".$phoneNumber."&message=".$message;
			//echo $url;

			$curl = curl_init($url);
			curl_setopt($curl,CURLOPT_RETURNTRANSFER, true);
			$curl_response = curl_exec($curl);

			if($curl_response === false){
				$info = curl_getinfo($curl);
				curl_close($curl);
				die('Error occurred'.var_export($info));
			}

			curl_close($curl);

			$response  = json_decode($curl_response);
			if($response->success == 'true'){
				//echo 'Message has been sent';
				
				//$res = (object)array("success"=>true); //Return Json
				//$res = (object)array("code"=>'1',"status"=>'success',"phone"=>$phoneNumber); //Return Json
				//$mJSON = json_encode($res);

				//echo $mJSON;
				return true;

			}else{
				//$res = (object)array("code"=>'0',"status"=>'failed',"phone"=>$phoneNumber); //Return Json
				//$mJSON = json_encode($res);

				//echo $mJSON;
				return false;
			}
		}
	}

}


?>