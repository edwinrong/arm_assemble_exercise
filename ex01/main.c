/************************************************
*
*File Name: 	main.c
*Description:
*Author:
*Date:
**************************************************/

void Main(void)
{
	int i;
	*((volatile unsigned long *)0x3ff5000) = 0x00000000f;
	while (1) {
		*((volatile unsigned long*)0x3ff5008) = 0x00000001;
		for (i=0; i<0x7ffff; i++) 
			*((volatile unsigned long *)0x3ff5008) = 0x00000002;
		for (i=0; i<0x7ffff; i++)	
			;
	}	

}