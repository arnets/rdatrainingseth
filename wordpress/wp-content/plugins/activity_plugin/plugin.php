<?php
	/*
		Plugin Name: Add Activity
		Author: Seth
		Version: 0.0.1
		Description: This is the form for adding New activity
	*/
	function DBP_add_front_page(){
		include_once('Add_activity.php');
		// DBP_insert_data();
	}
	if (!defined('ABSPATH')) {
		define('ABSPATH', dirname(__FILE__).'/');
	}

	define('DBP_dir', dirname(__FILE__));
	define('DBP_url', plugins_url('',__FILE__));

	add_action('admin_menu','DBP_add_menu_function');
	add_action('admin_enqueue_scripts','form_style');
	add_action('admin_enqueue_scripts','form_scripts');

	function form_style()
	{
		if ($_GET['page'] == 'Add Activity') {
			wp_enqueue_style('DBP_styles',DBP_url.'../../customized-plugins/css/bootstrap4.css');
		}
	}
	function form_scripts()
	{
		wp_enqueue_script('DBP_script',DBP_url.'../..customized-plugins//js/bootstrap.js');
		wp_enqueue_script('DBP_script',DBP_url.'../../customized-plugins/js/jquery.js');
	}
	function DBP_add_menu_function(){
		add_menu_page(
			'Add activity',
			'Add activity',
			'manage_options',
			'Add Activity',
			'DBP_add_front_page',
			DBP_url.'../../customized-plugins/images/icon.png'
		);
	}
?>