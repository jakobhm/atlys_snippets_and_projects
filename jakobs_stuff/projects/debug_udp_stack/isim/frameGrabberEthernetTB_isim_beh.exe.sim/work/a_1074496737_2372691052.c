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
static const char *ng0 = "C:/Users/Jakob Wittmann/Documents/GitHub/atlys_snippets_and_projects/jakobs_stuff/snippets/frameGrabberEthernet/frameGrabberEthernetTB.vhd";
extern char *WORK_P_1391133289;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );


static void work_a_1074496737_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3992U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(123, ng0);
    t2 = (t0 + 4624);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(124, ng0);
    t2 = (t0 + 2888U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3800);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(125, ng0);
    t2 = (t0 + 4624);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(126, ng0);
    t2 = (t0 + 2888U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 3800);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1074496737_2372691052_p_1(char *t0)
{
    char t13[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;
    int t9;
    int t10;
    int t11;
    int t12;
    char *t14;
    int t15;
    int t16;
    int t17;
    int t18;
    char *t19;
    int t20;
    int t21;
    int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    unsigned int t26;
    unsigned char t27;
    char *t28;
    int t29;
    int t30;
    int t31;
    int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    int t42;
    int t43;
    int t44;
    int t45;
    char *t46;
    int t47;
    int t48;
    int t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;
    int t53;
    int t54;
    int t55;
    int t56;
    char *t57;
    int t58;
    int t59;
    int t60;
    unsigned int t61;
    unsigned int t62;

LAB0:    t1 = (t0 + 4240U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(134, ng0);
    t2 = (t0 + 4688);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(135, ng0);
    t7 = (100 * 1000LL);
    t2 = (t0 + 4048);
    xsi_process_wait(t2, t7);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(136, ng0);
    t2 = (t0 + 4688);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(137, ng0);
    t2 = (t0 + 4752);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(139, ng0);
    t2 = (t0 + 2768U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 * 10);
    t2 = (t0 + 4048);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(145, ng0);
    t2 = ((WORK_P_1391133289) + 1288U);
    t3 = *((char **)t2);
    t9 = *((int *)t3);
    t10 = (t9 - 1);
    t2 = (t0 + 9548);
    *((int *)t2) = 0;
    t4 = (t0 + 9552);
    *((int *)t4) = t10;
    t11 = 0;
    t12 = t10;

LAB12:    if (t11 <= t12)
        goto LAB13;

LAB15:    xsi_set_current_line(149, ng0);
    t2 = (t0 + 4880);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(150, ng0);
    t2 = ((WORK_P_1391133289) + 1168U);
    t3 = *((char **)t2);
    t9 = *((int *)t3);
    t10 = (t9 - 1);
    t2 = (t0 + 9556);
    *((int *)t2) = 0;
    t4 = (t0 + 9560);
    *((int *)t4) = t10;
    t11 = 0;
    t12 = t10;

LAB19:    if (t11 <= t12)
        goto LAB20;

LAB22:    xsi_set_current_line(154, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t3 = t2;
    memset(t3, (unsigned char)2, 8U);
    t4 = (t0 + 4944);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t14 = (t6 + 56U);
    t19 = *((char **)t14);
    memcpy(t19, t2, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(155, ng0);
    t2 = (t0 + 4880);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(157, ng0);
    t2 = (t0 + 2888U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 * 4);
    t2 = (t0 + 4048);
    xsi_process_wait(t2, t8);

LAB30:    *((char **)t1) = &&LAB31;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB13:    xsi_set_current_line(146, ng0);
    t5 = (t0 + 9548);
    t6 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t13, *((int *)t5), 8);
    t14 = (t0 + 9548);
    t15 = *((int *)t14);
    t16 = (t15 + 1);
    t17 = (t16 * 8);
    t18 = (t17 - 1);
    t19 = (t0 + 9548);
    t20 = *((int *)t19);
    t21 = (t20 * 8);
    t22 = (t21 - t18);
    t23 = (t22 * -1);
    t23 = (t23 + 1);
    t24 = (1U * t23);
    t25 = (t13 + 12U);
    t26 = *((unsigned int *)t25);
    t26 = (t26 * 1U);
    t27 = (t24 != t26);
    if (t27 == 1)
        goto LAB16;

LAB17:    t28 = (t0 + 9548);
    t29 = *((int *)t28);
    t30 = (t29 + 1);
    t31 = (t30 * 8);
    t32 = (t31 - 1);
    t33 = (31 - t32);
    t34 = (1U * t33);
    t35 = (0U + t34);
    t36 = (t0 + 4816);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = (t0 + 9548);
    t42 = *((int *)t41);
    t43 = (t42 + 1);
    t44 = (t43 * 8);
    t45 = (t44 - 1);
    t46 = (t0 + 9548);
    t47 = *((int *)t46);
    t48 = (t47 * 8);
    t49 = (t48 - t45);
    t50 = (t49 * -1);
    t50 = (t50 + 1);
    t51 = (1U * t50);
    memcpy(t40, t6, t51);
    t52 = (t0 + 9548);
    t53 = *((int *)t52);
    t54 = (t53 + 1);
    t55 = (t54 * 8);
    t56 = (t55 - 1);
    t57 = (t0 + 9548);
    t58 = *((int *)t57);
    t59 = (t58 * 8);
    t60 = (t59 - t56);
    t61 = (t60 * -1);
    t61 = (t61 + 1);
    t62 = (1U * t61);
    xsi_driver_first_trans_delta(t36, t35, t62, 0LL);

LAB14:    t2 = (t0 + 9548);
    t11 = *((int *)t2);
    t3 = (t0 + 9552);
    t12 = *((int *)t3);
    if (t11 == t12)
        goto LAB15;

LAB18:    t9 = (t11 + 1);
    t11 = t9;
    t4 = (t0 + 9548);
    *((int *)t4) = t11;
    goto LAB12;

LAB16:    xsi_size_not_matching(t24, t26, 0);
    goto LAB17;

LAB20:    xsi_set_current_line(151, ng0);
    t5 = (t0 + 9556);
    t6 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t13, *((int *)t5), 8);
    t14 = (t0 + 4944);
    t19 = (t14 + 56U);
    t25 = *((char **)t19);
    t28 = (t25 + 56U);
    t36 = *((char **)t28);
    memcpy(t36, t6, 8U);
    xsi_driver_first_trans_fast(t14);
    xsi_set_current_line(152, ng0);
    t2 = (t0 + 2888U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t2 = (t0 + 4048);
    xsi_process_wait(t2, t7);

LAB25:    *((char **)t1) = &&LAB26;
    goto LAB1;

LAB21:    t2 = (t0 + 9556);
    t11 = *((int *)t2);
    t3 = (t0 + 9560);
    t12 = *((int *)t3);
    if (t11 == t12)
        goto LAB22;

LAB27:    t9 = (t11 + 1);
    t11 = t9;
    t4 = (t0 + 9556);
    *((int *)t4) = t11;
    goto LAB19;

LAB23:    goto LAB21;

LAB24:    goto LAB23;

LAB26:    goto LAB24;

LAB28:    xsi_set_current_line(158, ng0);
    t2 = (t0 + 5008);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(159, ng0);
    t2 = (t0 + 2888U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t2 = (t0 + 4048);
    xsi_process_wait(t2, t7);

LAB34:    *((char **)t1) = &&LAB35;
    goto LAB1;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB32:    xsi_set_current_line(160, ng0);
    t2 = (t0 + 5008);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(161, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t3 = t2;
    memset(t3, (unsigned char)2, 32U);
    t4 = (t0 + 4816);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t14 = (t6 + 56U);
    t19 = *((char **)t14);
    memcpy(t19, t2, 32U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(163, ng0);
    t2 = (t0 + 2888U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 * 10);
    t2 = (t0 + 4048);
    xsi_process_wait(t2, t8);

LAB38:    *((char **)t1) = &&LAB39;
    goto LAB1;

LAB33:    goto LAB32;

LAB35:    goto LAB33;

LAB36:    xsi_set_current_line(165, ng0);

LAB42:    *((char **)t1) = &&LAB43;
    goto LAB1;

LAB37:    goto LAB36;

LAB39:    goto LAB37;

LAB40:    goto LAB2;

LAB41:    goto LAB40;

LAB43:    goto LAB41;

}


extern void work_a_1074496737_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1074496737_2372691052_p_0,(void *)work_a_1074496737_2372691052_p_1};
	xsi_register_didat("work_a_1074496737_2372691052", "isim/frameGrabberEthernetTB_isim_beh.exe.sim/work/a_1074496737_2372691052.didat");
	xsi_register_executes(pe);
}
