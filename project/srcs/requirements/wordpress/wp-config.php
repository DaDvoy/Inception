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
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'lmushroo' );

/** MySQL database password */
define( 'DB_PASSWORD', 'something' );

/** MySQL hostname */
define( 'DB_HOST', 'mariadb' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

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
define('AUTH_KEY',         'H0Y:141m(AJU5+I`{NT=c76#:<hnhu#^rXN13~h+.@@*6=K<V%G}X@7xq(+~{uMn');
define('SECURE_AUTH_KEY',  '(tv3]kRhkdpC%W$6A}wp1U7+CD@=phW><=;8}fmN??&3^Ui(|. :T3-|NJkJ3<k-');
define('LOGGED_IN_KEY',    'WuslPqX:NMm)E1w/n=iP:&BvC6uNmLd$ug$[7m!r6+jzt1UZwu#+zB^,LO<+i!Yp');
define('NONCE_KEY',        '3kG{_BrlvimJjp yBf5X:(y>-?vD4d0sDIW}S8mc[ji9l0T3Ft5:>!qtP:#<y)UG');
define('AUTH_SALT',        'k$lCOrfBtS_)|=9sO2SFu <P4|!@JmjyQ/vZETo{Bw#2^OPQ)9~wAy`jBtmWTWpt');
define('SECURE_AUTH_SALT', '+bf%:*ZPE!xkc?z,DI_gt42-*x#V#j1-)7]U-LWqNq-n&l}@)K)tQ{#t?V1R&&Po');
define('LOGGED_IN_SALT',   '@)}OTn&|No{]]|r.n/$;qU|rwUKqIY&U_kd6SS?S|bZv[?eU c#)P[mhH9,s@<C(');
define('NONCE_SALT',       '/Uq/7ryUFA@@e*A4^.,0=7kvhgysFH&DRow@B}-U+-Sg{)alwUNC+13s;Q--395Y');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true);
define( 'WP_DEBUG_LOG', true);

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';