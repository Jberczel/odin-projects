##Event Manager - jumpstart labs

My implementation of jumpstart labs Event Manager tutorial.

Program parses .csv database, cleans records, creates and writes to new files, and calculates peak hour and day with the highest number of registrants in dummy data set.

####The techniques practiced:

File input and output
Reading data from CSV files
String manipulation
Accessing Sunlight’s Congressional API through the Sunlight Congress gem
Using ERB for templating

####Requirements

Ruby Environment
Sample Data in CSV Format
Sunlight-Congress Gem

#### Output for Time and Day of Week Targeting 
data from full_event_attendees.csv file

```
PEAK HOURS:
-----------
hour: 23 count: 556 (10.7%)
hour: 22 count: 548 (10.6%)
hour: 21 count: 488 (9.4%)

PEAK DAYS
---------
Wednesday: 1319 (25.5%)
   Sunday: 1140 (22.0%)
   Friday:  719 (13.9%)
 Saturday:  585 (11.3%)
 Thursday:  498 (9.6%)
   Monday:  487 (9.4%)
  Tuesday:  427 (8.3%)
```

View tutorial at [jumpstart labs](http://tutorials.jumpstartlab.com/projects/eventmanager.html)



