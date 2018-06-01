param([String]$full_name_input,[String] $uuid)

$original_path="D:\src\firm\firm_long.main_project\firm.main_project\"
$old_full_name="firm.main_project.project_name.Application"
$full_name="$full_name_input.Application"

$old_full_adapter_name=$old_full_name.replace(".Application","")
$old_short_adapter_name=$old_full_adapter_name.replace("firm.","" ).replace("main_project.","")
$old_short_name=$old_short_adapter_name.replace("Adapter","")

$full_adapter_name=$full_name.replace(".Application","")
$short_adapter_name=$full_adapter_name.replace("firm.","" ).replace("main_project.","")
$short_name=$short_adapter_name.replace("Adapter","")

Write-Output $old_full_name
Write-Output $old_short_name
Write-Output $old_full_adapter_name
Write-Output $old_short_adapter_name


Write-Output "Full name: $full_name"
Write-Output $short_name
Write-Output $full_adapter_name
Write-Output $short_adapter_name

$old_guid = "841B4347-8AC5-4255-AAC3-DC30BF2327B2"

# $uuid = [GUID]::NewGuid().GUID
Write-Output $uuid

Copy-Item $old_full_name $full_name -Recurse
cd $full_name

#print working directory
Write-Output "working directory:"(Get-Item -Path ".\" -Verbose).FullName

(Get-Content Properties\AssemblyInfo.cs) | ForEach-Object { $_ -replace "$old_short_name", "$short_name" } | Set-Content Properties\AssemblyInfo.cs
(Get-Content Properties\AssemblyInfo.cs) | ForEach-Object { $_ -replace "$old_guid", "$uuid" } | Set-Content Properties\AssemblyInfo.cs # guid


(Get-Content Program.cs) | ForEach-Object { $_ -replace "$old_short_name", "$short_name" } | Set-Content Program.cs


Move-Item $old_full_name'.csproj' $full_name'.csproj'
(Get-Content $full_name'.csproj') | ForEach-Object { $_ -replace "$old_guid", "$uuid" } | Set-Content $full_name'.csproj'
(Get-Content $full_name'.csproj') | ForEach-Object { $_ -replace "$old_short_name", "$short_name" } | Set-Content $full_name'.csproj'

$old_adapter_guid="4d6947f1-f6bb-45a4-af58-a3f0c42ca3e8"
$input_path="$original_path$full_adapter_name\Properties\AssemblyInfo.cs"
$regex="[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}"
$adapter_guid=select-string -Path $input_path -Pattern $regex -AllMatches | % { $_.Matches } | % { $_.Value } 
Write-Output $adapter_guid

(Get-Content $full_name'.csproj') | ForEach-Object { $_ -replace "$old_adapter_guid", "$adapter_guid" } | Set-Content $full_name'.csproj' # adapter guid

Move-Item $old_short_name'WindowsService.cs' $short_name'WindowsService.cs'
(Get-Content $short_name'WindowsService.cs') | ForEach-Object { $_ -replace "$old_short_name", "$short_name" } | Set-Content $short_name'WindowsService.cs'

cd ..