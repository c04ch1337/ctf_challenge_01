Below is a step-by-step guide for obtaining all 10 flags in The Phantom App CTF Challenge. Each flag is associated with a specific vulnerability or challenge, and this guide provides detailed instructions for finding and exploiting these vulnerabilities to retrieve the flags.
Flag 1: CTF{sql_injection}
Location: /var/www/html/login.php
Vulnerability: SQL Injection
Steps:

    Navigate to the login page: http://ctf_challenge_03.yourdomain.com/login.php.

    Enter a SQL injection payload in the username or password field:

        Username: admin' OR '1'='1

        Password: password123 (or any value).

    Submit the form.

    The application will log you in and display the flag: CTF{sql_injection}.

Flag 2: CTF{hidden_directory}
Location: /var/www/html/secret/flag2.txt
Vulnerability: Directory Traversal
Steps:

    Use a directory brute-forcing tool like gobuster or dirb to find hidden directories:
    bash
    Copy

    gobuster dir -u http://ctf_challenge_03.yourdomain.com -w /path/to/wordlist.txt

    Look for a directory named secret.

    Access the directory: http://ctf_challenge_03.yourdomain.com/secret/.

    Open the flag2.txt file to retrieve the flag: CTF{hidden_directory}.

Flag 3: CTF{file_inclusion}
Location: /var/www/html/search.php
Vulnerability: Local File Inclusion (LFI)
Steps:

    Navigate to the search page: http://ctf_challenge_03.yourdomain.com/search.php.

    Use the file parameter to include a local file:

        Example: http://ctf_challenge_03.yourdomain.com/search.php?file=../../../../etc/passwd.

    Experiment with different file paths to include the flag3.txt file:

        Example: http://ctf_challenge_03.yourdomain.com/search.php?file=flag3.txt.

    The application will display the flag: CTF{file_inclusion}.

Flag 4: CTF{base64_encoded}
Location: /var/www/html/flag4.txt
Vulnerability: Base64 Encoding
Steps:

    View the page source of the homepage: http://ctf_challenge_03.yourdomain.com.

    Look for a base64-encoded string in the HTML comments or JavaScript.

    Decode the string using a base64 decoder:
    bash
    Copy

    echo "base64_encoded_string" | base64 --decode

    The decoded string will contain the flag: CTF{base64_encoded}.

Flag 5: CTF{weak_security_header}
Location: /var/www/html/admin/panel.php
Vulnerability: Misconfigured Security Headers
Steps:

    Use a tool like curl or a browser's developer tools to inspect the HTTP headers:
    bash
    Copy

    curl -I http://ctf_challenge_03.yourdomain.com/admin/panel.php

    Look for missing or weak security headers (e.g., Content-Security-Policy, X-Frame-Options).

    Exploit the misconfiguration to access the admin panel.

    The flag will be displayed on the admin panel: CTF{weak_security_header}.

Flag 6: CTF{weak_password_hash}
Location: /var/www/html/flag6.txt
Vulnerability: Weak Password Hash
Steps:

    Find a user's password hash (e.g., in the database or a leaked file).

    Use a password-cracking tool like John the Ripper or Hashcat to crack the hash:
    bash
    Copy

    john --format=raw-md5 --wordlist=/path/to/wordlist.txt hash.txt

    Once the password is cracked, log in to the application.

    Retrieve the flag from flag6.txt: CTF{weak_password_hash}.

Flag 7: CTF{command_injection}
Location: /var/www/html/admin/panel.php
Vulnerability: Command Injection
Steps:

    Navigate to the admin panel: http://ctf_challenge_03.yourdomain.com/admin/panel.php.

    Find a feature that executes system commands (e.g., a ping or traceroute tool).

    Inject a command into the input field:

        Example: ; cat /var/www/html/flag7.txt.

    The application will execute the command and display the flag: CTF{command_injection}.

Flag 8: CTF{response_header}
Location: /var/www/html/flag8.txt
Vulnerability: Response Header Manipulation
Steps:

    Use curl or a browser's developer tools to inspect the HTTP response headers:
    bash
    Copy

    curl -I http://ctf_challenge_03.yourdomain.com

    Look for a custom header containing the flag (e.g., X-Flag: CTF{response_header}).

    Alternatively, access the flag8.txt file directly: http://ctf_challenge_03.yourdomain.com/flag8.txt.

Flag 9: CTF{ssti_vulnerability}
Location: /var/www/html/flag9.txt
Vulnerability: Server-Side Template Injection (SSTI)
Steps:

    Find a feature that uses templates (e.g., a user profile or search results page).

    Inject a template payload to execute arbitrary code:

        Example: {{7*7}} (should return 49 if vulnerable).

    Use the payload to read the flag9.txt file:

        Example: {{ ''.__class__.__mro__[1].__subclasses__()[40]('/var/www/html/flag9.txt').read() }}.

    The application will display the flag: CTF{ssti_vulnerability}.

Flag 10: CTF{jwt_token}
Location: /var/www/html/flag10.txt
Vulnerability: JWT Token Manipulation
Steps:

    Log in to the application and capture the JWT token from the browser's developer tools or a proxy like Burp Suite.

    Decode the JWT token using a tool like jwt.io.

    Modify the token to escalate privileges (e.g., change the role to admin).

    Use the modified token to access restricted areas of the application.

    Retrieve the flag from flag10.txt: CTF{jwt_token}.
