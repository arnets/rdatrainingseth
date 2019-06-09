<?php
	/*
		Plugin Name: Activity Update
		Author: Seth
		Version: 1.0.2
		Description: This is the form for updating Activity
	*/
	function DBP_add_front_page_activity_update(){
		include_once('activity_update.php');
	}
	if (!defined('ABSPATH')) {
		define('ABSPATH', dirname(__FILE__).'/');
	}

	define('DBP_dir', dirname(__FILE__));
	define('DBP_url', plugins_url('',__FILE__));

	add_action('admin_menu','DBP_add_menu_function_activity_update');
	add_action('admin_enqueue_scripts','form_style_activity_update');
	add_action('admin_enqueue_scripts','form_scripts_activity_update');

	function form_style_activity_update()
	{
		if ($_GET['page'] == 'Activity Update') {
			wp_enqueue_style('DBP_styles',DBP_url.'../../customized-plugins/css/bootstrap4.css');
		}
	}
	function form_scripts_activity_update()
	{
		wp_enqueue_script('DBP_script',DBP_url.'../..customized-plugins/js/bootstrap.js');
		wp_enqueue_script('DBP_script',DBP_url.'../../customized-plugins/js/jquery.js');
	}
	function DBP_add_menu_function_activity_update(){
		add_menu_page(
			'Activity Update',
			// 'Activity Update',
			'manage_options',
			// 'Activity Update',
			'DBP_add_front_page_activity_update',
			DBP_url.'../../customized-plugins/images/icon.png'
		);
	}
?>