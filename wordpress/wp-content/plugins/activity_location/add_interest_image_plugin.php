<?php
	/*
		Plugin Name: Add location
		Author: Seth
		Version: 0.0.1
		Description: This is the form for adding activity location and interest image.
	*/
	function DBP_add_front_page_location(){
		include_once('add_interest_image.php');
		// DBP_insert_data();
	}
	if (!defined('ABSPATH')) {
		define('ABSPATH', dirname(__FILE__).'/');
	}

	define('DBP_dir', dirname(__FILE__));
	define('DBP_url', plugins_url('',__FILE__));

	add_action('admin_menu','DBP_add_menu_function_location');
	add_action('admin_enqueue_scripts','form_location_style');
	add_action('admin_enqueue_scripts','form_location_scripts');

	function form_location_style()
	{
		if ($_GET['page'] == 'Add New location') {
			wp_enqueue_style('DBP_styles',DBP_url.'../../customized-plugins/css/bootstrap4.css');
		}
	}
	function form_location_scripts()
	{
		wp_enqueue_script('DBP_script',DBP_url.'../..customized-plugins//js/bootstrap.js');
		wp_enqueue_script('DBP_script',DBP_url.'../../customized-plugins/js/jquery.js');
	}
	function DBP_add_menu_function_location(){
		add_menu_page(
			'Add New location',
			'Add New location',
			'manage_options',
			'Add New location',
			'DBP_add_front_page_location',
			DBP_url.'../../customized-plugins/images/icon.png'
		);
	}
?>