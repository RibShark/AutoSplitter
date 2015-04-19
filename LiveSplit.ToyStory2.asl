state("Project64")
{
	int level1LoadScreen : "Project64.exe", 0x107AD8, 0x3480;
	byte fBoss1Health : "Project64.exe", 0x107AD8, 0x2120;
	byte fBoss2Health : "Project64.exe", 0x107AD8, 0x2124;
	byte fBoss3Health : "Project64.exe", 0x107AD8, 0x2128;
	short buzzXPos : "Project64.exe", 0x107AD8, 0xbb078;
	byte16 tokenCount : "Project64.exe", 0x107AD8, 0x1e2dd0;
	byte what : this is a test;
}
 
start
{
	return (old.buzzXPos == 31815 && current.buzzXPos != old.buzzXPos);
}
 
split
{
	if(current.fBoss1Health==9 && current.fBoss2Health==9 && current.fBoss3Health==9)
		return true;
	return !(Enumerable.SequenceEqual(old.tokenCount, current.tokenCount));
}
 
reset
{
	return current.level1LoadScreen==0;
}
