# Tracker

Part 1 design decisions:


The index is the login page, but the "main" page is /tasks. This will look kind of like a Jira page, with "todo" and "completed" tasks in 2 different columns. I decided to have cards representing tasks have an Edit and Delete button. Also, most buttons that operate on tasks (such as the Save button or delete button) will redirect back to the /tasks page. I accidentally named the resource for Tasks "Posts" but I tried to hide that on the front-end

Part 2 design decisions:

I ended up representing manager as just an integer field. It didn't really occur to me to have it represented as an actual User. That being said, this doesn't lead to any complications.
I guess not including timestamps at all is technically a design decision.
