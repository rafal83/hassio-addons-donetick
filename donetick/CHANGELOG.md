<!-- https://developers.home-assistant.io/docs/add-ons/presentation#keeping-a-changelog -->
## 1.1.35
Support completing task from eAPI (i.e. Home Assistant integration)
Fix issue with the Notiitcation 

## 1.1.34
Update Error Page
Fix issue where settings page not loading 

## 1.0.33
Add Support for Webhook!
Notification and task not generate event can be consume via webhooks
Add Modal to Edit things
Add a custom 404 page
Fix Bug in Update things with Type strings
(Release Note)[https://github.com/donetick/donetick/releases/tag/v0.0.33]


## 1.0.32
* Add support for SSO with OIDC ( test with Authentik)
* fix issue with completing overdue chores


## 1.0.30
Timeout increased to 10s, build validation added, and notification ID fix implemented.
Filtering by priority/label enabled and detail view design updated.
Schedule logic simplified and Things UI refreshed.

## 1.0.30
fix bug where Only admin point redeemable
## 1.0.29
Fix issue while redeeming points 
## 1.0.28

- **Improved Main View for Large Screens (Tablet, Desktop)**:  
  The main view now includes a side calendar where you can easily see all your scheduled tasks (both assigned to you and others in your circle).  

- **Updated Configuration Loading**:  
  Added support for environment-specific overrides.  

- **API Support**:  
  You can now create tasks and chores via the API.  

- **Points System Upgrade**:  
  Introduced the ability to redeem points!  

- **Task in sentence**: I am excited about this one specifically. the focus is to minimize the click and field switching when creating a task. You would click the input field and type everything into one sentence. Donetick will attempt to parse the details and will show the modal to show you what has been processed
You will open Donetick. click on the top field and type the task once you are done press enter. and task created. you can set due dates, recurrent tasks, and priorities all in one shot.
> [!WARNING]
> This may cause tasks to fail to be scheduled or created properly. If you encounter this issue, please open an issue in the repository.


  **Usage:**  
  - **Priority**: For the highest priority, use any of the following keywords: `P1`, `Urgent`, `Important`, or `ASAP`.  
    Use `P2`, `P3`, or `P4` for lower priorities.  
  -  **Due date**: Specify dates with phrases like tomorrow, next week, Monday, or   August 1st at 12 pm.
  -  **Frequency/Reccurent**: Set recurring tasks with terms like daily, weekly, monthly,  yearly, or patterns such as every Tuesday and Thursday.

## What's Changed
* IsRolling tests by @johan-autohome in https://github.com/donetick/donetick/pull/73
* Bugfix: error when disabling push notifications by @dkhalife in https://github.com/donetick/donetick/pull/58




## 1.0.20
- Add Support for Points
- Fix Issue with NFC tag 
## 1.0.19
- Support Loading Archived Tasks
- fix issue in assignee different users for task
## 1.0.18
- Improve UI and support sorting by date
- Support Pushover
- fix bugs when attempt to send notification
- Support to disable login

## 1.0.17:
Add support for tasks api to work with homeassistant integration


## 1.0.16:
Add Support Label across the tasks
Add Label Manager

## 1.0.15:
Support Password reset
Add Priotity support for tasks

## 1.0.7:
Update to Donetick V0.0.12
Update Dockerfile and Docker image push command
Improve the My Chore UX and add filter button