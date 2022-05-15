Get-ChildItem *.webp | Rename-Item -NewName { $_.Name.Replace('.webp','.png') }
