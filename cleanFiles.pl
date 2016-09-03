#! perl -w
foreach $cfgLine (<>){
    chomp($cfgLine);
    ($cfgLine)=split("#",$cfgLine);
    next unless($cfgLine);
    my($filePattern,$expireDate,$cleanDir);
    ($filePattern,$expireDate,$cleanDir)=split(/\s+/,$cfgLine);
   #print "$filePattern,$expireDate,$cleanDir\n";
    unless(-e $cleanDir and -d $cleanDir){
	print "create $cleanDir failed ,errMsg=$!\n" unless(system "mkdir -p $cleanDir");
    }
    &cleanFiles($filePattern,$expireDate,$cleanDir);
}	

sub cleanFiles{
	my($filePattern,$expireDate,$cleanDir)=@_;
	my(@files,$file);
	@files=glob("$filePattern");
#	@files=`ls $filePattern 2>/dev/null`;
	chomp(@files);
	for $file (@files){
		#print "mv $file $cleanDir\n" if -A $file>$expireDate;
		system "mv $file $cleanDir" if -A $file>$expireDate;
		
	}
}
