# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Disable Hyper-V
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All


choco install /y virtualbox

$vb_version = (&"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" --version)
$vb_small_version = $vb_version.Split("r")[0]
$url = "https://download.virtualbox.org/virtualbox/${vb_small_version}/Oracle_VM_VirtualBox_Extension_Pack-${vb_small_version}.vbox-extpack"
wget $url -OutFile "Oracle_VM_VirtualBox_Extension_Pack-${vb_small_version}.vbox-extpack"
&"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" extpack install --replace "Oracle_VM_VirtualBox_Extension_Pack-${vb_small_version}.vbox-extpack"

choco install /y vagrant
