<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'db_tact' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '|0ZziMr@=]{{_<+&x7LS/WX5#zx;>d}~d4d:C@jEsS0bgb:DrSRg_^0VXy)ASdlA' );
define( 'SECURE_AUTH_KEY',  '{#C)y8%xU%o#@^?)w3p;jG Pj^V?i)cz^M0rH]r2EzYN2)C0!PRD$:zRYMaEUR2o' );
define( 'LOGGED_IN_KEY',    '=!mk.sse3!6fa7VY)+gnP8_T3bD0hr?[$k<9Y/_Z%lP`1gpJp?G4L]2zhyp/t:dq' );
define( 'NONCE_KEY',        '|7i)-w; i_?ho8iMrooPx&{L,.~v dxH{m>2C)P${nM.sMMJ3U5vgk~]LaWg^j)=' );
define( 'AUTH_SALT',        'KP=JnR)]}H7TuI>^i/<grB,6{]`A<CI+hAvfsoZ|4+Aj-^N~W5HME<6a=]]L4,g@' );
define( 'SECURE_AUTH_SALT', 'P!O;X<h4;Xt3zwIh8k9v7-P=7bHF?/Xl!XccCPBzYt,o{Ie:s+qebI?|Mu{W8e1{' );
define( 'LOGGED_IN_SALT',   ';{fHm&h!z@a?xbhp,tn-OEl?6Jl>n!3RpAz`4(b`_~^P^bC`t,g3ZIFSUk}6v~rn' );
define( 'NONCE_SALT',       'Ovrx?*Z3FyuU3vAmjE/1Mrf(S#^x4AkkC,ZpOa=}x$1(GkkY#z8j;*@QVtPxHBa1' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'tb_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
