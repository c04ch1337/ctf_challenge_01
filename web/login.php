<?php
// Simulated user database (for demonstration purposes)
$users = [
    'testuser' => [
        'password_hash' => '482c811da5d5b4bc6d497ffa98491e38', // MD5 hash of 'password123'
        'flag' => 'CTF{flag6_weak_password_hash}',
    ],
];

// Handle login form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    // Check if the user exists
    if (array_key_exists($username, $users)) {
        // Verify the password hash
        if (md5($password) === $users[$username]['password_hash']) {
            // Login successful
            echo "<p>Login successful! Flag 6: " . $users[$username]['flag'] . "</p>";
        } else {
            echo "<p>Invalid password.</p>";
        }
    } else {
        echo "<p>User not found.</p>";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h1>Login</h1>
    <form method="post">
        Username: <input type="text" name="username"><br>
        Password: <input type="password" name="password"><br>
        <input type="submit" value="Login">
    </form>
</body>
</html>
