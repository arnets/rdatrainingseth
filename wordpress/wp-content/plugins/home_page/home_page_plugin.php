<?php
	/*
		Plugin Name: Home page plugin
		Author: Seth
		Version: 0.0.1
		Description: This is the form for adding home page information
	*/
	function DBP_add_front_page_home_page(){
		include_once('home_page.php');
	}
	if (!defined('ABSPATH')) {
		define('ABSPATH', dirname(__FILE__).'/');
	}

	define('DBP_dir', dirname(__FILE__));
	define('DBP_url', plugins_url('',__FILE__));

	add_action('admin_menu','DBP_add_menu_function_home_page');
	add_action('admin_enqueue_scripts','form_home_page_style');
	add_action('admin_enqueue_scripts','form_home_page_scripts');

	function form_home_page_style()
	{
		if ($_GET['page'] == 'Home_page') {
			wp_enqueue_style('DBP_styles',DBP_url.'../../customized-plugins/css/bootstrap4.css');
		}
	}
	function form_home_page_scripts()
	{
		wp_enqueue_script('DBP_script',DBP_url.'../..customized-plugins//js/bootstrap.js');
		wp_enqueue_script('DBP_script',DBP_url.'../../customized-plugins/js/jquery.js');
	}
	function DBP_add_menu_function_home_page(){
		add_menu_page(
			'Home_page',
			'Home_page',
			'manage_options',
			'Home_page',
			'DBP_add_front_page_home_page',
			DBP_url.'../../customized-plugins/images/icon.png'
		);
	}
?>