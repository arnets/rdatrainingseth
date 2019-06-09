<?php
	/*
		Plugin Name: About us plugin
		Author: Seth
		Version: 0.0.1
		Description: This is the form for adding about us information
	*/
	function DBP_add_front_page_about_us(){
		include_once('about_us.php');
	}
	if (!defined('ABSPATH')) {
		define('ABSPATH', dirname(__FILE__).'/');
	}

	define('DBP_dir', dirname(__FILE__));
	define('DBP_url', plugins_url('',__FILE__));

	add_action('admin_menu','DBP_add_menu_function_about_us');
	add_action('admin_enqueue_scripts','form_about_us_style');
	add_action('admin_enqueue_scripts','form_about_us_scripts');

	function form_about_us_style()
	{
		if ($_GET['page'] == 'About_us') {
			wp_enqueue_style('DBP_styles',DBP_url.'../../customized-plugins/css/bootstrap4.css');
		}
	}
	function form_about_us_scripts()
	{
		wp_enqueue_script('DBP_script',DBP_url.'../..customized-plugins//js/bootstrap.js');
		wp_enqueue_script('DBP_script',DBP_url.'../../customized-plugins/js/jquery.js');
	}
	function DBP_add_menu_function_about_us(){
		add_menu_page(
			'About_us',
			'About_us',
			'manage_options',
			'About_us',
			'DBP_add_front_page_about_us',
			DBP_url.'../../customized-plugins/images/icon.png'
		);
	}
?>