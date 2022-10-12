# [Detection , Reponse and Analysis]
# SECURITY -08

## Key terminology

RPO - Recovery Point Objective  
RPO is a measure of dataloss. RPO varies with the type of business.
For example, For the bank transactions backup should be taken every minute or in other words, the backup should be online/realtime. In this case the RPO will be 0.  And if the nature of business is small scale, where only 2-3 transactions are done in 24 hours, it is normal to take the backup every 24 hours. In case of disruption, the last backup will be used to recover the system. In this case the RPO will be 24 hours.
RPO focusses on the amount of data lost after the last backup activity.


RTO - Recovery Time Objective   
RTO defines how fast the system can recover from a disaster. In RTO we calculate the total time taken to bring the business back from the time of notification of the crash/incident/disaster. RTO varies for every incident like with calamity it can be longer or a small outage mey be recovered in few hours.
The expected time taken is always defined in the SLA(Service Level agreement)
RTO reflects the downtime of the application and processes.


## Exercise

1. A Company makes daily backups of their database. The database is automatically recovered when a failure happens using the most recent available backup. The recovery happens on a different physical machine than the original database, and the entire process takes about 15 minutes. What is the RPO of the database?

In this case, the RPO would be 24 hours since the backup is taken everyday. No matter, at which hour the databse failed, the recovery will be from the last backup.

2. An automatic failover to a backup web server has been configured for a website. Because the backup has to be powered on first and has to pull the newest version of the website from GitHub, the process takes about 8 minutes. What is the RTO of the website?

The RTO would be 8 minutes



## Sources

https://phoenixnap.com/blog/rto-vs-rpo-differences

https://www.rubrik.com/blog/technology/19/5/rpo-rto-disaster-recovery

https://www.youtube.com/watch?v=SeS6ke3B4Tg

https://www.liquidweb.com/blog/system-hardening/




## Overcome challenges

Need to understand many dependent concepts to reach to the answers.

## Results

Results mentioned in the exercise section.

## End of Document