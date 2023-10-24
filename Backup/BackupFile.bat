@echo off
del C:\Users\User\Documents\NetBeansProjects\Registration System\web\Backup\*.*
C:\xampp\mysql\bin\mysqldump -uroot registration_system > "C:\Users\User\Documents\NetBeansProjects\Registration System\web\Backup\registration_system.sql"