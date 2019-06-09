<?php
	/*
		Plugin Name: View Activities
		Author: Seth
		Version: 1.0.2
		Description: This table display all activities available in the database and allows to modify or delete any activity.
	*/
	function DBP_add_front_page_view_activities(){
		include_once('activities_views.php');
	}
	if (!defined('ABSPATH')) {
		define('ABSPATH', dirname(__FILE__).'/');
	}

	define('DBP_dir', dirname(__FILE__));
	define('DBP_url', plugins_url('',__FILE__));

	add_action('admin_menu','DBP_add_menu_function_view_activities');
	add_action('admin_enqueue_scripts','table_style_activities');
	add_action('admin_enqueue_scripts','table_scripts_activities');

	function table_style_activities()
	{
		if ($_GET['page'] == 'View activities') {
			wp_enqueue_style('DBP_styles',DBP_url.'../../customized-plugins/css/bootstrap4.css');
		}
	}
	function table_scripts_activities()
	{
		wp_enqueue_script('DBP_script',DBP_url.'../../customized-plugins/js/bootstrap.js');
		wp_enqueue_script('DBP_script',DBP_url.'../../customized-plugins/js/jquery.js');
	}
	function DBP_add_menu_function_view_activities(){
		add_menu_page(
			'View activities',
			'View activities',
			'manage_options',
			'View activities',
			'DBP_add_front_page_view_activities',
			DBP_url.'../../customized-plugins/images/icon.png'
		);
	}
?>