<?php
	
	FUNCTION anti_injection( $username, $password ) {
           // We'll first get rid of any special characters using a simple regex statement.
           // After that, we'll get rid of any SQL command words using a string replacment.
            $banlist = ARRAY (
                    "insert", "select", "update", "delete", "distinct", "having", "truncate", "replace",
                    "handler", "like", " as ", "or ", "procedure", "limit", "order by", "group by", "asc", "desc"
            );
            // ---------------------------------------------
            IF ( EREGI ( "[a-zA-Z0-9]+", $user ) ) {
                    $username = TRIM ( STR_REPLACE ( $banlist, '', STRTOLOWER ( $username ) ) );
            } ELSE {
                    $username = NULL;
            }
            // ---------------------------------------------
            // Now to make sure the given password is an alphanumerical string
            // devoid of any special characters. strtolower() is being used
            // because unfortunately, str_ireplace() only works with PHP5.
            IF ( EREGI ( "[a-zA-Z0-9]+", $password ) ) {
                    $password = TRIM ( STR_REPLACE ( $banlist, '', STRTOLOWER ( $password ) ) );
            } ELSE {
                    $password = NULL;
            }
            // ---------------------------------------------
            // Now to make an array so we can dump these variables into the SQL query.
            // If either user or pass is NULL (because of inclusion of illegal characters),
            // the whole script will stop dead in its tracks.
            $array = ARRAY ( 'username' => $username, 'password' => $password );
            // ---------------------------------------------
            IF ( IN_ARRAY ( NULL, $array ) ) {
                    DIE ( 'Invalid use of login and/or password. Please use a normal method.' );
            } ELSE {
                    RETURN $array;
            }
    }
	
	define('ROOT', './');
	include 'common.php';
	//include('mainheader.php');
 
	if(isset($_POST['submit'])) {
		$errors = array();
		
		$username = trim($_POST['username']);
		$password = trim($_POST['password1']);
		$remote_addr = $_SERVER['REMOTE_ADDR'];
		if(trim($_POST['password2']) != $password) {
			$errors[] = 'The passwords provided do not match.<br><br><a href="/index.php">Go Back</a>';
		}
		
				$usernameHash = usernameToHash($username);
		if($usernameHash < 0) {
			$errors[] = 'Invalid username.';
		}

$hello = $db->query("SELECT * FROM players WHERE creation_ip='$remote_addr'");
$q = "SELECT * FROM players WHERE creation_ip='$remote_addr'";
		$result = mysql_query($q);
		$noob=mysql_numrows($result);

if($noob >= 6){
			$errors[] = 'Only 5 accounts permitted per IP.<br><br><a href="register.php">Go Back</a>';
		}

if(strlen($username) > 12){
			$errors[] = 'Username can not be over 12 characters.<br><br><a href="register.php">Go Back</a>';
		}
 
		if(strlen($username) < 4){
			$errors[] = 'Username must be 4 characters long or more.<br><br><a href="register.php">Go Back</a>';
		}
		if(strlen($password) < 4){
			$errors[] = 'Password must be 4 characters long or more.<br><br><a href="register.php">Go Back</a>';
		}
 
		$result = $db->query('SELECT `username` FROM `players` WHERE `username` LIKE \''.$username.'\'');
		if($db->num_rows($result)) {
			$errors[] = 'That username is already taken.<br><br><a href="register.php">Go Back</a>';
		}
 
		if(!empty($errors)) {
			print_r($errors);
			exit;
		}

		$time = time();
		$gamepass = md5($password);
		$db->query('INSERT INTO `players`(`username`, `pass`, `creation_date`, `creation_ip`) VALUES(\''.$username.'\', \''.$gamepass.'\', \''.$time.'\', \''.$remote_addr.'\')');
			$db->query('INSERT INTO `invitems`(`user`, `id`, `amount`, `wielded`, `slot`) VALUES(\''.$username.'\', 77, 1, 1, 1)');
		$db->query('INSERT INTO `invitems`(`user`, `id`, `amount`, `wielded`, `slot`) VALUES(\''.$username.'\', 1263, 1, 0, 2)');
		$db->query('INSERT INTO `invitems`(`user`, `id`, `amount`, `wielded`, `slot`) VALUES(\''.$username.'\', 81, 1, 0, 3)');
		$db->query('INSERT INTO `invitems`(`user`, `id`, `amount`, `wielded`, `slot`) VALUES(\''.$username.'\', 10, 5000, 0, 4)');
		$db->query('INSERT INTO `experience`(`user`) VALUES(\''.$username.'\')');
		$db->query('INSERT INTO `curstats`(`user`) VALUES(\''.$username.'\')');

		echo 'User \''.htmlspecialchars($username).'\' has been created. You may now use this username and password to log into Open RSCD v4.<br><br><a href="index.php">Go Back</a>';
		$db->close();
		exit;
  
      }
		
?>
<fieldset class="menu main">
	<legend>Register</legend>
	<p><em>By registering you are agreeing to abide by our rules. Please make sure you've read them first.</em></p><br />
	<form action="register.php" method="POST">
		<table>
			<tr>
				<td>Username:</td>
				<td><input type="text" class="inputMedium" name="username" value="" /></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="text"  class="inputMedium" name="password1" value="" /></td>
			</tr>
			<tr>
				<td>Confirm Password:</td>
				<td><input type="text"  class="inputMedium" name="password2" value="" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="button" name="submit" value="Register" /></td>
			</tr>
		</table>
	</form>
</fieldset>
