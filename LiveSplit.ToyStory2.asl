state("Project64")
{
	int level1LoadScreen : "Project64.exe", 0x107AD8, 0x3480;
	byte fBoss1Health : "Project64.exe", 0x107AD8, 0x2120;
	byte fBoss2Health : "Project64.exe", 0x107AD8, 0x2124;
	byte fBoss3Health : "Project64.exe", 0x107AD8, 0x2128;
	short buzzXPos : "Project64.exe", 0x107AD8, 0xbb078;
	byte16 tokenCount : "Project64.exe", 0x107AD8, 0x1e2dd0;
}

state("toy2")
{
	int level1LoadScreen : "toy2.exe", 0x0; //value that will never be 0, so reset doesn't work on PC
	byte fBoss1Health : "toy2.exe", 0x130028;
	byte fBoss2Health : "toy2.exe", 0x13002C;
	byte fBoss3Health : "toy2.exe", 0x130030;
	short buzzXPos : "toy2.exe", 0x12F308;
	byte16 tokenCount : "toy2.exe", 0x12F0D8;
}
 
start
{
	//31815 is the starting position in level 1. This will make it so that once buzz moves at the start of level 1, timer starts
	return (old.buzzXPos == 31815 && current.buzzXPos != old.buzzXPos);
}
 
split
{
	if(current.fBoss1Health==9 && current.fBoss2Health==9 && current.fBoss3Health<=9) //if final boss is defeated
		return true;
	return !(Enumerable.SequenceEqual(old.tokenCount, current.tokenCount));
}
 
reset
{
	return current.level1LoadScreen==0; //only works for N64
}
