<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

return array(
	'components' => array(
		'db' => array(
			'connectionString' => 'pgsql:host=' . getenv("LS_DB_HOST") . ';port=5432;user=' . getenv("LS_DB_USER") . ';password=' . getenv("LS_DB_PASS") . ';dbname=' . getenv("LS_DB_NAME") . ';',
			'emulatePrepare' => true,
			'username' => getenv("LS_DB_USER"),
			'password' => getenv("LS_DB_PASS"),
			'charset' => 'utf8',
			'tablePrefix' => 'lime_',
		),
		
		// Uncomment the following line if you need table-based sessions
		'session' => array (
			'class' => 'application.core.web.DbHttpSession',
			'connectionID' => 'db',
			'sessionTableName' => '{{sessions}}',
		),
		
		'urlManager' => array(
			'urlFormat' => 'get',
			'rules' => array(
				// You can add your own rules here
			),
			'showScriptName' => true,
		),
	
	),
	'config'=>array(
		'debug'=>0,
		'debugsql'=>0, // Set this to 1 to enanble sql logging, only active when debug = 2
		'siteadminemail'=>'stefan@savvy.ch',
		'siteadminbounce'=>'stefan@savvy.ch',
		'siteadminname'=>'Stefan Thöni',
		'emailmethod'=>'smtp',
		'protocol'=>'smtp',
		'emailsmtphost'=>'172.17.0.1',
	)
);
/* End of file config.php */
/* Location: ./application/config/config.php */
