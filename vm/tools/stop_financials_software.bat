net stop StwScheduler
net stop StwServices
taskkill /F /IM print_receipt.exe /T
taskkill /F /IM spooler_service.exe /T
taskkill /F /IM php.exe /T
IISReset /STOP
db2stop force