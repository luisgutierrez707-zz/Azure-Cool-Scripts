#Use case: In some occasions, you want to modify the File storage properties. You can do this on an individual bases but running this on a directory would take forever.
#The script below will go through each file, modify the data then store them
# Below we only touch cache control, but all var's are accessible using the properties.(filedname)


#Get Connection information

$StorageName="lugutteststorage" #Replace with your storage account information
$StorageKey="xx" #Replace with your storage account Key
$StorageCtx = New-AzureStorageContext -StorageAccountName $StorageName -StorageAccountKey $StorageKey #creates a new context

$files = Get-AzureStoragefile -ShareName $ContainerName -Context $StorageCtx #Gets a list of Files, stores them in an Array


#Array below gets each file, 
#Set's the cache control and Content type
#Then saves them
foreach ($file in $files) 
{
$file.Properties.CacheControl = "no-cache, no-store, must-revalidate"
$file.Properties.ContentType = "something/PDF"
$file.SetProperties()
}
