<?php
	/*
		Plugin Name: Add Interest
		Author: Seth
		Version: 1.0.2
		Description: This is the form for adding New Interest
	*/
	function DBP_add_front_page_interest(){
		include_once('Add_interest.php');
	}
	if (!defined('ABSPATH')) {
		define('ABSPATH', dirname(__FILE__).'/');
	}

	define('DBP_dir', dirname(__FILE__));
	define('DBP_url', plugins_url('',__FILE__));

	add_action('admin_menu','DBP_add_menu_function_interest');
	add_action('admin_enqueue_scripts','form_style_interest');
	add_action('admin_enqueue_scripts','form_scripts_interest');

	function form_style_interest()
	{
		if ($_GET['page'] == 'Add Interest') {
			wp_enqueue_style('DBP_styles',DBP_url.'../../customized-plugins/css/bootstrap4.css');
		}
	}
	function form_scripts_interest()
	{
		wp_enqueue_script('DBP_script',DBP_url.'../..customized-plugins//js/bootstrap.js');
		wp_enqueue_script('DBP_script',DBP_url.'../../customized-plugins/js/jquery.js');
	}
	function DBP_add_menu_function_interest(){
		add_menu_page(
			'Add interest',
			'Add interest',
			'manage_options',
			'Add Interest',
			'DBP_add_front_page_interest',
			DBP_url.'../../customized-plugins/images/icon.png'
		);
	}
?>