<link rel="stylesheet" href="CSS/snackbar.min.css"/> 
<link rel="stylesheet" href="CSS/profile.css"/> 

<div class="col-md-4 px-0">
    <ul class="list-group rounded-0">
        <li class="list-group-item" style="text-transform:capitalize;">
            <img src="Images/Profile/user.svg" height="60px" width="60px" class="mb-3" alt="No Image"> 
            <br>  
            Hello, <%= userProfile.getName()%>
        </li>
    </ul>
    <ul class="list-group my-3 pageLink rounded-0">
        <li class="list-group-item text-secondary">
            <i class="fa fa-user mr-2"></i>Account Settings
        </li>
        <a href="profile.jsp" class="list-group-item list-group-item-action" id="list1">
            Profile Information
        </a>
        <a href="address.jsp" class="list-group-item list-group-item-action" id="list2">
            Manage Address
        </a>
        <a href="password.jsp" class="list-group-item list-group-item-action" id="list3">
            Change Password
        </a>
        <a href="notification.jsp" class="list-group-item list-group-item-action" id="list4">
            All Notifications
        </a> 
    </ul>
    <ul class="list-group rounded-0" id="logoutButton">
        <a role="button" class="list-group-item list-group-item-action" id="logoutProfile">
            <i class="fas fa-power-off mr-2 text-primary"></i>Logout
        </a>
    </ul>
</div>

<script src="JS/snackbar.min.js"></script>
<script src="JS/validation.js"></script>
<script src="JS/profile.js"></script>
