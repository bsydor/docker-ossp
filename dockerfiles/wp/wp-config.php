<?php


// ** MySQL settings ** //
/** The name of the database for WordPress */
define('DB_NAME', getenv('DB_NAME'));

/** MySQL database username */
define('DB_USER', getenv('DB_USER'));

/** MySQL database password */
define('DB_PASSWORD', getenv('DB_PASSWORD'));

/** MySQL hostname */
define('DB_HOST', getenv('DB_HOST'));

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

define('AUTH_KEY',         ']&%-P(i,9Ri9]g@%8{|ZS;r|FQ6Baqn+M$2NV^3w9Wi!Kk3j? rF?bEc|Gc[*|~3');
define('SECURE_AUTH_KEY',  '%Z-|gu),k;2G7ISa*#B5kCNZD2>s pn*f}JZfOQmjQz8Y<S;~5q$1B$JL_;X++{C');
define('LOGGED_IN_KEY',    ',i2+(g-PxyRtP{SE>3nEjf]wH,8`+HcwS*G,!bo.[OUfT-_amyt=r_ox(5!0x(]F');
define('NONCE_KEY',        'eg]nZ!h|l~IgNy2AQ[_0*+L72cqZi^d<C*y8:Qi>l6-lnvS8T@Yyd|WYz[8_B?C~');
define('AUTH_SALT',        '~|`?)ut=`[_CFuXb&Dq6utP7]0mw.!p><k=4(OYE[)H@l9Fm2r8i(=0ZJbtc+fs,');
define('SECURE_AUTH_SALT', 'xW)/4n*g8C|?U;b@9$Y_u`rP:Y7[<|xGCUO8A/kFWBuEe@%TeY|N|V|kN93Lh-b{');
define('LOGGED_IN_SALT',   'I!4-8{e%#>$!e8ZA/r*-FN^VG.@g&D)pJBZPN:t(,B6Km9d1=B/ |T#[a)$x{U@t');
define('NONCE_SALT',       'sO0uwU?2Kn*:98E_1TXReB|SnDmhUV9!4f,^kq_r$tXWB?xohbnXKIOcq{BFF&w|');


$table_prefix = 'wp_';





/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
        define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
?>
