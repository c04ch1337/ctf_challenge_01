<?php
echo "<h1>Debug Page</h1>";
echo "<p>This page is for debugging purposes only. Do not expose in production!</p>";

// Simulated user data
$users = [
    [
        'username' => 'testuser',
        'password_hash' => '482c811da5d5b4bc6d497ffa98491e38', // MD5 hash of 'password123'
    ],
];

echo "<h2>User Data</h2>";
echo "<table border='1'>";
echo "<tr><th>Username</th><th>Password Hash</th></tr>";
foreach ($users as $user) {
    echo "<tr>";
    echo "<td>" . htmlspecialchars($user['username']) . "</td>";
    echo "<td>" . htmlspecialchars($user['password_hash']) . "</td>";
    echo "</tr>";
}
echo "</table>";
?>
