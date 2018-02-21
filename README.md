# Tracker

Some design decisions I made:

The index is the login page, but the "main" page is /tasks. This will look kind of like a Jira page, with "todo" and "completed" tasks in 2 different columns. I decided to have cards representing tasks have an Edit and Delete button. Also, most buttons that operate on tasks (such as the Save button or delete button) will redirect back to the /tasks page. I accidentally named the resource for Tasks "Posts" but I tried to hide that on the front-end
