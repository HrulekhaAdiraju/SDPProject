<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard Sidebar</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #ff6b00;
            --primary-dark: #cc5700;
            --primary-light: #ff8533;
            --background-light: #fff3e6;
            --text-color: #333333;
            --text-muted: #666666;
            --hover-background: #ffe6cc;
            --transition-speed: 0.3s;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            line-height: 1.6;
            color: var(--text-color);
            background-color: #f9f5f0;
            display: flex;
        }

        .sidebar {
            width: 260px;
            height: 100vh;
            background-color: white;
            box-shadow: 0 4px 6px -1px rgba(255, 107, 0, 0.1), 0 2px 4px -1px rgba(255, 107, 0, 0.06);
            position: fixed;
            left: 0;
            top: 0;
            overflow-y: auto;
            border-right: 2px solid var(--primary-light);
        }

        .sidebar-logo {
            padding: 20px;
            text-align: center;
            border-bottom: 1px solid var(--hover-background);
            background-color: var(--background-light);
        }

        .sidebar-logo h2 {
            color: var(--primary-color);
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .sidebar-menu {
            padding: 10px 0;
        }

        .sidebar-menu a,
        .sidebar-menu .dropdown-btn {
            display: flex;
            align-items: center;
            padding: 12px 20px;
            margin-bottom: 8px; /* Added margin for spacing between items */
            text-decoration: none;
            color: var(--text-color);
            transition: all var(--transition-speed) ease;
            cursor: pointer;
            background-color: transparent;
            border: none;
            width: 100%;
            text-align: left;
            font-size: 15px;
            position: relative;
        }

        .sidebar-menu a::before,
        .sidebar-menu .dropdown-btn::before {
            content: '';
            position: absolute;
            bottom: 0;
            left: -100%;
            width: 100%;
            height: 2px;
            background-color: var(--primary-color);
            transition: all var(--transition-speed) ease;
        }

        .sidebar-menu a:hover,
        .sidebar-menu .dropdown-btn:hover {
            background-color: var(--hover-background);
            color: var(--primary-dark);
        }

        .sidebar-menu a:hover::before,
        .sidebar-menu .dropdown-btn:hover::before {
            left: 0;
        }

        .sidebar-menu a.active,
        .sidebar-menu .dropdown-btn.active {
            background-color: var(--background-light);
            color: var(--primary-color);
            font-weight: 600;
        }

        .dropdown-container {
            display: none;
            background-color: var(--background-light);
        }

        .dropdown-container a {
            padding-left: 40px !important;
            font-size: 14px;
            color: var(--text-muted);
            margin-bottom: 8px; /* Spacing between dropdown items */
        }

        .dropdown-btn::after {
            content: '▼';
            margin-left: auto;
            font-size: 0.7em;
            color: var(--primary-color);
            transition: transform var(--transition-speed) ease;
        }

        .dropdown-btn.active::after {
            transform: rotate(180deg);
        }

        .sidebar-menu .dropdown-btn.active + .dropdown-container {
            display: block;
        }

        .content {
            margin-left: 260px;
            padding: 20px;
            width: calc(100% - 260px);
            background-color: #f9f5f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            box-sizing: border-box;
            text-align: center;
        }

        .content h1.styled-heading {
            font-size: 3rem; /* Increased size */
            font-weight: bold;
            color: var(--primary-dark); /* Dark color for emphasis */
            text-transform: uppercase; /* Uppercase letters */
            letter-spacing: 2px; /* Letter spacing */
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* Shadow effect */
            margin: 0;
            padding: 10px;
        }

        @media screen and (max-width: 700px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            .content {
                margin-left: 0;
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <div class="sidebar-logo">
            <h2>Manage Users</h2>
        </div>
        <div class="sidebar-menu">
            <a href="adminHome">Home</a>
            
            <div class="dropdown-btn">View Users</div>
            <div class="dropdown-container">
                <a href="viewAllStudents">View All</a>
                <a href="viewStudentById">View by ID</a>
                <a href="viewStudentByMail">View by Email</a>
            </div>
            
            <a href="createStudentLogin">Create User</a>
            <a href="deleteStudent">Delete User</a>
        </div>
    </div>

    <script>
        // Dropdown toggle functionality
        const dropdownBtns = document.querySelectorAll('.dropdown-btn');
        
        dropdownBtns.forEach(btn => {
            btn.addEventListener('click', function() {
                this.classList.toggle('active');
            });
        });
    </script>
</body>
</html>
