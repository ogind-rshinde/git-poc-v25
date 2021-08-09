@ECHO OFF

ECHO Stopping services...
CALL E:\vm\tools\stop_financials_software.bat

E:
mklink /D E:\DB2 D:\DB2
mklink /D E:\OnlineBackup D:\OnlineBackup
mklink /D E:\Stw_Nightly_backup D:\Stw_Nightly_backup
mklink /D E:\ibm P:\ibm
mklink /D "E:\Program Files (x86)" "P:\Program Files (x86)"

REM mklink /D "E:\.git" "\\vmware-host\Shared Folders\financials\.git"
REM mklink /D "E:\.github" "\\vmware-host\Shared Folders\financials\.github"
REM mklink /D "E:\ac-test-core" "\\vmware-host\Shared Folders\financials\ac-test-core"
REM mklink /D "E:\payments" "\\vmware-host\Shared Folders\financials\payments"
REM mklink /D "E:\php-win" "\\vmware-host\Shared Folders\financials\php-win"
REM mklink /D "E:\php2" "\\vmware-host\Shared Folders\financials\php2"
REM mklink /D "E:\phpunit" "\\vmware-host\Shared Folders\financials\phpunit"
REM mklink /D "E:\stw_config" "\\vmware-host\Shared Folders\financials\stw_config"
REM mklink /D "E:\stw" "\\vmware-host\Shared Folders\financials\stw"
REM mklink "E:\.gitattributes" "\\vmware-host\Shared Folders\financials\.gitattributes"
REM mklink "E:\.gitignore" "\\vmware-host\Shared Folders\financials\.gitignore"
REM mklink "E:\.npmrc" "\\vmware-host\Shared Folders\financials\.npmrc"
REM mklink "E:\.nvmrc" "\\vmware-host\Shared Folders\financials\.nvmrc"
REM mklink "E:\.prettierignore" "\\vmware-host\Shared Folders\financials\.prettierignore"
REM mklink "E:\.prettierrc.js" "\\vmware-host\Shared Folders\financials\.prettierrc.js"
REM mklink "E:\.update.yarnrc" "\\vmware-host\Shared Folders\financials\.update.yarnrc"
REM mklink "E:\.yarnrc" "\\vmware-host\Shared Folders\financials\.yarnrc"
REM mklink "E:\jsconfig.json" "\\vmware-host\Shared Folders\financials\jsconfig.json"
REM mklink "E:\lerna.json" "\\vmware-host\Shared Folders\financials\lerna.json"
REM mklink "E:\package.json" "\\vmware-host\Shared Folders\financials\package.json"
REM mklink "E:\README.md" "\\vmware-host\Shared Folders\financials\README.md"
REM mklink "E:\setup-vm.bat" "\\vmware-host\Shared Folders\financials\setup-vm.bat"
REM mklink "E:\tslint.json" "\\vmware-host\Shared Folders\financials\tslint.json"


mkdir E:\payments\stw\shared\eportal
mkdir E:\php-win\cfg
mkdir E:\php-win\extras\pdf-related
mkdir E:\php-win\PEAR\.registry\.channel.__uri
mkdir E:\php-win\PEAR\.registry\.channel.doc.php.net
mkdir E:\php-win\PEAR\.registry\.channel.pecl.php.net
mkdir E:\php-win\sessiondata
mkdir E:\php-win\uploadtemp
mkdir E:\php-win\www
mkdir E:\stw\aspnet_client\system_web\2_0_50727
mkdir E:\stw\aspnet_client\system_web\4_0_30319
mkdir E:\stw\shared\Logs\PHP_Logs
mkdir E:\stw\stw_data\stwspd\logs\spooler_service
mkdir E:\stw\stw_php\docs\UserGuides\pdf\AP
mkdir E:\stw\stw_php\docs\UserGuides\pdf\AR
mkdir E:\stw\stw_php\docs\UserGuides\pdf\BD
mkdir E:\stw\stw_php\docs\UserGuides\pdf\CM
mkdir E:\stw\stw_php\docs\UserGuides\pdf\CR
mkdir E:\stw\stw_php\docs\UserGuides\pdf\FA
mkdir E:\stw\stw_php\docs\UserGuides\pdf\GL
mkdir E:\stw\stw_php\docs\UserGuides\pdf\PB
mkdir E:\stw\stw_php\docs\UserGuides\pdf\PC
mkdir E:\stw\stw_php\docs\UserGuides\pdf\PR
mkdir E:\stw\stw_php\docs\UserGuides\pdf\RD
mkdir E:\stw\stw_php\docs\UserGuides\pdf\RQ
mkdir E:\stw\stw_php\docs\UserGuides\pdf\SA
mkdir E:\stw\stw_php\docs\UserGuides\pdf\SC
mkdir E:\stw\stw_php\docs\UserGuides\pdf\SP
mkdir E:\stw\stw_php\docs\UserGuides\pdf\UB
mkdir E:\stw\stw_php\docs\UserGuides\pdf\UB\ProcessFlows
mkdir E:\stw\stw_php\stwap\powerhouse\positive_pay
mkdir E:\stw\stw_php\stwap\SQL_changes\subfiles
mkdir E:\stw\stw_php\stwap2\docs
mkdir E:\stw\stw_php\stwap2\flash
mkdir E:\stw\stw_php\stwap2\images
mkdir E:\stw\stw_php\stwap2\styles
mkdir E:\stw\stw_php\stwar\Update_Programs\subfiles
mkdir E:\stw\stw_php\stwar\Updates\subfiles
mkdir E:\stw\stw_php\stwbm\docs
mkdir E:\stw\stw_php\stwbm\styles
mkdir E:\stw\stw_php\stwbm\Update_Programs\subfiles
mkdir E:\stw\stw_php\stwcr\data
mkdir E:\stw\stw_php\stwcr\powerhouse\temp
mkdir E:\stw\stw_php\stwcr\receipts
mkdir E:\stw\stw_php\stwcr\Update_Programs\subfiles
mkdir E:\stw\stw_php\stwcr\Updates
mkdir E:\stw\stw_php\stwfa\powerhouse\temp
mkdir E:\stw\stw_php\stwip
mkdir E:\stw\stw_php\stwpb\powerhouse\subfiles
mkdir E:\stw\stw_php\stwpc\data
mkdir E:\stw\stw_php\stwpc\flash
mkdir E:\stw\stw_php\stwpt\data\Employees
mkdir E:\stw\stw_php\stwpt\PHP_Backup
mkdir E:\stw\stw_php\stwpt\powerhouse\temp
mkdir E:\stw\stw_php\stwpt\temp\stwptdb
mkdir E:\stw\stw_php\stwrq\Update_Programs\subfiles
mkdir E:\stw\stw_php\stwsa\job_logs
mkdir E:\stw\stw_php\stwsa\logs
mkdir E:\stw\stw_php\stwsp\print\printing
mkdir E:\stw\stw_php\stwsp\Spooler\print
mkdir E:\stw\stw_php\stwsp\Spooler\PrtCabs
mkdir E:\stw\stw_php\stwub\docs\weekly_updates
mkdir E:\stw\stw_php\stwwg\docs
mkdir E:\stw\stw_php\stwwg\mvcs\app\models
mkdir E:\stw\stw_php\stwwg\mvcs\tmp
mkdir E:\stw\stw_php\stwwg\powerhouse\subfiles
mkdir E:\stw\stw_php\stwwg\Updates
mkdir E:\stw\stw_php\utilities\Rad_Upload_Plus\web
mkdir E:\stw\stw_reports
mkdir E:\stw\stw_work
mkdir E:\stw\stwcs\stwapcs\images\APMEN0
mkdir E:\stw\stwcs\stwapcs\styles
mkdir E:\stw\stwcs\stwarcs\includes
mkdir E:\stw\stwcs\stwarcs\powerhouse
mkdir E:\stw\stwcs\stwarcs\styles
mkdir E:\stw\stwcs\stwarcs\subfiles
mkdir E:\stw\stwcs\stwbdcs\flash
mkdir E:\stw\stwcs\stwbdcs\images
mkdir E:\stw\stwcs\stwbdcs\powerhouse
mkdir E:\stw\stwcs\stwbdcs\styles
mkdir E:\stw\stwcs\stwbmcs\includes
mkdir E:\stw\stwcs\stwbmcs\powerhouse
mkdir E:\stw\stwcs\stwbmcs\styles
mkdir E:\stw\stwcs\stwcrcs\powerhouse
mkdir E:\stw\stwcs\stwcrcs\styles
mkdir E:\stw\stwcs\stwcrcs\subfiles
mkdir E:\stw\stwcs\stwfacs\powerhouse
mkdir E:\stw\stwcs\stwfacs\styles
mkdir E:\stw\stwcs\stwfacs\subfiles
mkdir E:\stw\stwcs\stwglcs\flash
mkdir E:\stw\stwcs\stwglcs\images
mkdir E:\stw\stwcs\stwglcs\includes
mkdir E:\stw\stwcs\stwglcs\styles
mkdir E:\stw\stwcs\stwpbcs\powerhouse
mkdir E:\stw\stwcs\stwpbcs\styles
mkdir E:\stw\stwcs\stwpbcs\subfiles
mkdir E:\stw\stwcs\stwpccs\includes
mkdir E:\stw\stwcs\stwpccs\styles
mkdir E:\stw\stwcs\stwpccs\subfiles
mkdir E:\stw\stwcs\stwprcs\flash
mkdir E:\stw\stwcs\stwprcs\includes
mkdir E:\stw\stwcs\stwprcs\powerhouse
mkdir E:\stw\stwcs\stwprcs\styles
mkdir E:\stw\stwcs\stwptcs\flash
mkdir E:\stw\stwcs\stwptcs\images
mkdir E:\stw\stwcs\stwptcs\powerhouse
mkdir E:\stw\stwcs\stwptcs\styles
mkdir E:\stw\stwcs\stwrqcs\includes
mkdir E:\stw\stwcs\stwrqcs\powerhouse
mkdir E:\stw\stwcs\stwrqcs\styles
mkdir E:\stw\stwcs\stwubcs\styles
mkdir E:\stw\stwcs\stwubcs\subfiles

ECHO Setting up Node
START "" "%PROGRAMFILES%\Git\bin\sh.exe" --login -i -c "cd /E && ./setup-node.sh"

ECHO Starting services...
CALL E:\vm\tools\start_financials_software.bat
