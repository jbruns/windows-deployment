Function Install-Chocolatey {
    $LicenseFile = $TSEnv:DEPLOYROOT + "\Applications\Chocolatey\chocolatey.license.xml"
	Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    New-Item -Path "C:\ProgramData\chocolatey\license" -ItemType Directory
    Copy-Item $LicenseFile "C:\ProgramData\chocolatey\license\chocolatey.license.xml"
    choco install -y chocolatey.extension
}
Install-Chocolatey