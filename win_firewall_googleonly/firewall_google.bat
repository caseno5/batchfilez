@echo off
cd /d %~dp0

rem Windowsファイアウォールを利用してgoogleのみ接続させる

echo Windowsファイアウォールを設定します
echo;
echo ドメインプロファイルを全てブロックにします
netsh advfirewall set domainprofile firewallpolicy blockinbound,blockoutbound
echo;

echo プライベートプロファイルを全てブロックにします
netsh advfirewall set privateprofile firewallpolicy blockinbound,blockoutbound
echo;

echo パブリックプロファイルを全てブロックにします
netsh advfirewall set publicprofile firewallpolicy blockinbound,blockoutbound
echo;


echo;
echo 特例で許可されているアプリケーションがあるかも知れません
echo GUI「セキュリティが強化されたWindows Defenderファイアウォール」を開き、規則を確認して下さい。
echo 確認が終わったら

pause
echo;
echo;
echo 次にIPアドレスの許可を行います。しばらく「OK」が続きます。
echo 登録が終わるとその旨が通知されます。
echo;

pause
rem ------- google ---------------

call google/firewall_googlecloud__out.bat

call google/firewall_googledomain_out.bat


rem ------- google end -----------

echo 全てのIPアドレスを登録しました。
pause
