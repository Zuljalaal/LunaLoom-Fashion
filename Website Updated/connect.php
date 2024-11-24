<?php
// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// MongoDB connection details
$servername = "localhost"; // MongoDB is typically on localhost
$port = "27017"; // Default MongoDB port

// MongoDB connection
try {
    $client = new MongoDB\Client("mongodb://$servername:$port");
    $db = $client->luna_looms; // Database name
    echo "Connected to MongoDB successfully.<br>";
} catch (Exception $e) {
    die("Connection failed: " . $e->getMessage());
}

// Inserting data (example using POST data)
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get POST data
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    // Insert data into 'users' collection
    $collection = $db->users;
    $result = $collection->insertOne([
        'firstname' => $firstname,
        'lastname' => $lastname,
        'email' => $email,
        'password' => $password
    ]);

    // Success message
    echo "Registration successful!<br>";
    echo "You can now <a href='login.php'>log in</a>.";
}
?>
