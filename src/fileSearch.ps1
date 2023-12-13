#------------------------------------------------------------------------------------------------#
# Title:          Filename Search                                                                #
# Description:    Search filenames in directories, including hidden files. Output to CSV file    #
# Author:         How To Work From Home                                                          #
#------------------------------------------------------------------------------------------------#

Clear-Host

$folderPath = "C:\Users\John\*"
$fileName = '*hidden*'
$resultPath = "C:\Users\John\Powershell\src\output"
$result = (Get-Date -Format dddd-MMM-dd-yyyy--hh.mm.ss.tt) + ".csv"

get-childitem -Force $folderPath -Filter $fileName -Recurse | where {!$_.PSIsContainer} | 
select-object FullName, LastWriteTime, Length | Sort-Object FullName | 
export-csv -notypeinformation -path $resultPath\$result | % {$_.Replace('"','')}
Invoke-Item $resultPath\$result