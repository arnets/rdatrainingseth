<?php
	/*
		Plugin Name: View Interest
		Author: Seth
		Version: 1.0.2
		Description: This table display all interest in the database with their corresponding activities and allows to modify or delete any activity interests
	*/
	function DBP_add_front_page_view_interests(){
		include_once('interests_views.php');
	}
	if (!defined('ABSPATH')) {
		define('ABSPATH', dirname(__FILE__).'/');
	}

	define('DBP_dir', dirname(__FILE__));
	define('DBP_url', plugins_url('',__FILE__));

	add_action('admin_menu','DBP_add_menu_function_view_interest');
	add_action('admin_enqueue_scripts','table_style_interest');
	add_action('admin_enqueue_scripts','table_scripts_interest');

	function table_style_interest()
	{
		if ($_GET['page'] == 'View interest') {
			wp_enqueue_style('DBP_styles',DBP_url.'../../customized-plugins/css/bootstrap4.css');
		}
	}
	function table_scripts_interest()
	{
		wp_enqueue_script('DBP_script',DBP_url.'../../customized-plugins/js/bootstrap.js');
		wp_enqueue_script('DBP_script',DBP_url.'../../customized-plugins/js/jquery.js');
	}
	function DBP_add_menu_function_view_interest(){
		add_menu_page(
			'View interest',
			'View interest',
			'manage_options',
			'View interest',
			'DBP_add_front_page_view_interests',
			DBP_url.'../../customized-plugins/images/icon.png'
		);
	}
?>