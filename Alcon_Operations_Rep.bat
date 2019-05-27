set "param1=%1"
setlocal EnableDelayedExpansion
if "!param1!"=="" ( set UserRole='CSMAdmin' ) else (set UserRole='%param1%')
set _my_datetime=%date%_%time%
set _my_datetime=%_my_datetime: =_%
set _my_datetime=%_my_datetime::=%
set _my_datetime=%_my_datetime:/=_%
set _my_datetime=%_my_datetime:.=_%
set _filename=Result\Alcon-Ops-Rep-HTML-Report-%_my_datetime%.html
cd /d %~dp0
rem cucumber features --tags @CreateData,@OpsRep_tasks,@All-Users_Contacts,@All-Users_Leads,@All-Users_Cases,@All-Users_Accounts,@All-Users_Opportunity --expand --format html --out %_filename%  UserRole="opsrepsit"
cucumber features --tags @All-Users_Accounts,@all-users-assets,@All-Users_Contacts,@All-Users_Leads,@All-Users_Opportunity,@OpsRep_cases,@All-Users_Cases,@OpsRep_tasks --expand --format html --out %_filename%  UserRole="opsrepsit"
