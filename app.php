<?php
ini_set('display_errors', '1');
require 'bitly.php';

session_start();
ob_start();

$GLOBALS['config'] = array(
	'mysql' => array(
			'host' => '192.168.10.10',
			'username' => 'homestead',
			'password' => 'secret',
			'db' => 'bitly'
		),
);

class config {
	public static function get($path = null) {
		if($path) {
			$config = $GLOBALS['config'];
			$path = explode('/', $path);
			foreach($path as $bit) {
				//echo $bit,' ';
				if(isset($config[$bit])) {
					$config =$config[$bit];
				}
			}
			return $config;
		}
		return false;
	}
}

function generate_uuid() {
    return sprintf( '%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
        mt_rand( 0, 0xffff ), mt_rand( 0, 0xffff ),
        mt_rand( 0, 0xffff ),
        mt_rand( 0, 0x0C2f ) | 0x4000,
        mt_rand( 0, 0x3fff ) | 0x8000,
        mt_rand( 0, 0x2Aff ), mt_rand( 0, 0xffD3 ), mt_rand( 0, 0xff4B )
    );

}

$payment_request_id = $_GET['payment_request_id'];
$payment_id = $_GET['payment_id'];
$coupon_code = generate_uuid();

$params = array();
$params['access_token'] = '00b5c3aafecf2de827370d23c82776e985f4e96b';
$params['longUrl'] = 'http://knowabout.it?payment_request_id='.$payment_request_id.'&coupon='.$coupon_code;
$params['domain'] = 'j.mp';
$results = bitly_get('shorten', $params);
$res = json_encode($results);

$pdo = new PDO('mysql:host=' . config::get('mysql/host') .';dbname=' . config::get('mysql/db'), config::get('mysql/username'), config::get('mysql/password'));
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);
$query = $pdo->prepare("INSERT INTO `coupon_user` (`payment_request_id`, `payment_id`, `coupon_code`, `bitly_link`, `response`) VALUES (?, ?, ?, ?, ?)");
$query->bindParam(1, $payment_request_id);
$query->bindParam(2, $payment_id);
$query->bindParam(3, $coupon_code);
$query->bindParam(4, $results['data']['url']);
$query->bindParam(5, $res);
$query->execute();

?>
