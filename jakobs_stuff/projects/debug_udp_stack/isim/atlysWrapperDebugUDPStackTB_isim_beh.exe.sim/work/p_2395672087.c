/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
extern char *STD_STANDARD;



int work_p_2395672087_sub_4222739064_746946755(char *t1, int t2, int t3)
{
    char t5[16];
    int t0;
    char *t6;
    char *t7;
    int t8;
    int t9;

LAB0:    t6 = (t5 + 4U);
    *((int *)t6) = t2;
    t7 = (t5 + 8U);
    *((int *)t7) = t3;
    t8 = (t2 / 1000);
    t9 = (t8 * t3);
    t0 = t9;

LAB1:    return t0;
LAB2:;
}

int work_p_2395672087_sub_2559273391_746946755(char *t1, int t2)
{
    char t3[128];
    char t4[8];
    char t8[8];
    int t0;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    int t14;
    int t15;
    unsigned char t16;
    char *t17;
    int t18;
    int t19;
    char *t20;

LAB0:    t5 = (t3 + 4U);
    t6 = ((STD_STANDARD) + 384);
    t7 = (t5 + 88U);
    *((char **)t7) = t6;
    t9 = (t5 + 56U);
    *((char **)t9) = t8;
    *((int *)t8) = 0;
    t10 = (t5 + 80U);
    *((unsigned int *)t10) = 4U;
    t11 = (t4 + 4U);
    *((int *)t11) = t2;

LAB2:    t12 = (t5 + 56U);
    t13 = *((char **)t12);
    t14 = *((int *)t13);
    t15 = xsi_vhdl_pow(2, t14);
    t16 = (t15 <= t2);
    if (t16 != 0)
        goto LAB3;

LAB5:    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t14 = *((int *)t7);
    t0 = t14;

LAB1:    return t0;
LAB3:    t12 = (t5 + 56U);
    t17 = *((char **)t12);
    t18 = *((int *)t17);
    t19 = (t18 + 1);
    t12 = (t5 + 56U);
    t20 = *((char **)t12);
    t12 = (t20 + 0);
    *((int *)t12) = t19;
    goto LAB2;

LAB4:;
LAB6:;
}


extern void work_p_2395672087_init()
{
	static char *se[] = {(void *)work_p_2395672087_sub_4222739064_746946755,(void *)work_p_2395672087_sub_2559273391_746946755};
	xsi_register_didat("work_p_2395672087", "isim/atlysWrapperDebugUDPStackTB_isim_beh.exe.sim/work/p_2395672087.didat");
	xsi_register_subprogram_executes(se);
}
