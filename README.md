# FurManage
CRUD for managing (adding, update and remove) furry fandom members on a community, (targeted at groups).

Users will be able to add themselves. And the manager will be able to modify and delete them.

### Login
In this login, the hash of the password is sent to the database. If user inputs incorrect data is redirected to the same page, otherwise user can login.
![Image](https://github.com/miguelcanosantana/FurManage/blob/master/HostedImages/screenshots/4.gif)

### User Creation
Username must be UNIQUE, which means that it can't be repeated. User ID will be given automatically.
![Image](https://github.com/miguelcanosantana/FurManage/blob/master/HostedImages/screenshots/2.gif)

### Users and Fursonas pages
The main users page contains a table listing all the users.
The fursonas pages also contains a list, of characters made by people. You can see the owner name.
![Image](https://github.com/miguelcanosantana/FurManage/blob/master/HostedImages/screenshots/3.gif)

### Control panel
Inside the control panel you can (for example) remove an user (but you need to have Admin rights to do that)
You will be redirected to the user removal page. Admin fields can only accept Admin data, a normal user cant't manage or delete other users. When deleting an user you are also deleting it's fursonas. 
![Image](https://github.com/miguelcanosantana/FurManage/blob/master/HostedImages/screenshots/5.gif)
