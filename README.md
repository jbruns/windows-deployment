# WDS/MDT Deployment Scripts
I deploy Windows 10 over my network at home, using Windows Deployment Services and Microsoft Deployment Toolkit.

The scripts in this repository are used within my task sequence. They take care of a few small portions of the deployment:

-Install-WindowsFeatures.ps1: installs some optional components, including Hyper-V if the target machine is not a VM. 
-RemoveApps.ps1: removes a selection of applications that I prefer not to have installed on my machines. The array of application names at the beginning of the script can be adjusted to suit your preferences.
-WorkstationFirewallConfig.ps1: opens up some firewall rulegroups in the Domain context. Once again the array at the beginning of the script can be adjusted to your scenario.
-Install-ChocolateyPro.ps1: Installs chocolatey, puts my license file in the right place, and then installs the chocolatey.extension library. If you are not using Chocolatey Pro, this isn't explicitly necessary - Install-ChocolateyPackage.ps1 should install "plain ol'" chocolatey the first time it is run.
-Install-ChocolateyPackage.ps1: installs one or more chocolatey packages, based on your MDT configuration. I'm using the script in a slightly different way; specifying a list of separate application entries in CustomSettings.ini, most of which are just singular Chocolatey packages. For example, one of my "applications" installs like this:

```powershell.exe -NoProfile -ExecutionPolicy unrestricted "%ScriptRoot%\Install-ChocolateyPackage.ps1" -verbose -Packages "firefox"```

In my task sequence, I can then prompt the user (well, me, mostly) to select from a list of packages to install. If you wanted to always install a predetermined list of packages instead, adjust your CustomSettings.ini as instructed in the .ps1 file.

