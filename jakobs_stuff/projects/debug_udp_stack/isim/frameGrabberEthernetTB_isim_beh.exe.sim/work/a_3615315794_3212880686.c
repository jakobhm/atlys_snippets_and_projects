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
static const char *ng0 = "C:/Users/Jakob Wittmann/Documents/GitHub/atlys_snippets_and_projects/jakobs_stuff/projects/debug_udp_stack/frameGrabberEthernet.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

char *ieee_p_1242562249_sub_1547198987_1035706684(char *, char *, char *, char *, char *, char *);
int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );
char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_1919437128_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_3615315794_3212880686_p_0(char *t0)
{
    char t43[16];
    char t44[16];
    char t45[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned char t9;
    unsigned int t10;
    char *t11;
    unsigned char t12;
    int t13;
    int t14;
    int t15;
    int t16;
    int t17;
    int t18;
    int t19;
    int t20;
    int t21;
    unsigned int t22;
    int t23;
    int t24;
    int t25;
    int t26;
    int t27;
    int t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    int t33;
    int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    static char *nl0[] = {&&LAB5, &&LAB6, &&LAB7, &&LAB8, &&LAB9, &&LAB10, &&LAB11, &&LAB12};

LAB0:    xsi_set_current_line(149, ng0);
    t1 = (t0 + 36718);
    t3 = (t0 + 9208);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 32U);
    xsi_driver_first_trans_delta(t3, 0U, 32U, 0LL);
    xsi_set_current_line(150, ng0);
    t1 = (t0 + 36750);
    t3 = (t0 + 9208);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 16U);
    xsi_driver_first_trans_delta(t3, 32U, 16U, 0LL);
    xsi_set_current_line(151, ng0);
    t1 = (t0 + 36766);
    t3 = (t0 + 9208);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 16U);
    xsi_driver_first_trans_delta(t3, 48U, 16U, 0LL);
    xsi_set_current_line(152, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t2 = t1;
    memset(t2, (unsigned char)2, 16U);
    t3 = (t0 + 9208);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 16U);
    xsi_driver_first_trans_delta(t3, 64U, 16U, 0LL);
    xsi_set_current_line(153, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t2 = t1;
    memset(t2, (unsigned char)2, 16U);
    t3 = (t0 + 9208);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 16U);
    xsi_driver_first_trans_delta(t3, 80U, 16U, 0LL);
    xsi_set_current_line(154, ng0);
    t1 = (t0 + 9208);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 96U, 1, 0LL);
    xsi_set_current_line(155, ng0);
    t1 = (t0 + 9208);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 97U, 1, 0LL);
    xsi_set_current_line(156, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t2 = t1;
    memset(t2, (unsigned char)2, 8U);
    t3 = (t0 + 9208);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 8U);
    xsi_driver_first_trans_delta(t3, 98U, 8U, 0LL);
    xsi_set_current_line(157, ng0);
    t1 = (t0 + 9272);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(159, ng0);
    t1 = (t0 + 9336);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(160, ng0);
    t1 = (t0 + 9400);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(161, ng0);
    t1 = xsi_get_transient_memory(14U);
    memset(t1, 0, 14U);
    t2 = t1;
    memset(t2, (unsigned char)2, 14U);
    t3 = (t0 + 9464);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 14U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(163, ng0);
    t1 = (t0 + 9528);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(164, ng0);
    t1 = (t0 + 9592);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(165, ng0);
    t1 = xsi_get_transient_memory(14U);
    memset(t1, 0, 14U);
    t2 = t1;
    memset(t2, (unsigned char)2, 14U);
    t3 = (t0 + 9656);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 14U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(166, ng0);
    t1 = xsi_get_transient_memory(8U);
    memset(t1, 0, 8U);
    t2 = t1;
    memset(t2, (unsigned char)2, 8U);
    t3 = (t0 + 9720);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 8U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(167, ng0);
    t1 = (t0 + 9784);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(169, ng0);
    t1 = (t0 + 9848);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(170, ng0);
    t1 = xsi_get_transient_memory(14U);
    memset(t1, 0, 14U);
    t2 = t1;
    memset(t2, (unsigned char)2, 14U);
    t3 = (t0 + 9912);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 14U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(171, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    t8 = (8U * 1U);
    t3 = t2;
    memset(t3, (unsigned char)2, t8);
    t9 = (t8 != 0);
    if (t9 == 1)
        goto LAB2;

LAB3:    t4 = (t0 + 9976);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    memcpy(t11, t1, 32U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(172, ng0);
    t1 = (t0 + 10040);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(174, ng0);
    t1 = (t0 + 10104);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(175, ng0);
    t1 = (t0 + 4872U);
    t2 = *((char **)t1);
    t9 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t9);
    goto **((char **)t1);

LAB2:    t10 = (32U / t8);
    xsi_mem_set_data(t2, t2, t8, t10);
    goto LAB3;

LAB4:    t1 = (t0 + 9064);
    *((int *)t1) = 1;

LAB1:    return;
LAB5:    xsi_set_current_line(177, ng0);
    t3 = (t0 + 9400);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(178, ng0);
    t1 = xsi_get_transient_memory(14U);
    memset(t1, 0, 14U);
    t2 = t1;
    memset(t2, (unsigned char)2, 14U);
    t3 = (t0 + 9464);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 14U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(179, ng0);
    t1 = (t0 + 10040);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(180, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    t8 = (8U * 1U);
    t3 = t2;
    memset(t3, (unsigned char)2, t8);
    t9 = (t8 != 0);
    if (t9 == 1)
        goto LAB14;

LAB15:    t4 = (t0 + 9976);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    memcpy(t11, t1, 32U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(181, ng0);
    t1 = (t0 + 9528);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(182, ng0);
    t1 = xsi_get_transient_memory(14U);
    memset(t1, 0, 14U);
    t2 = t1;
    memset(t2, (unsigned char)2, 14U);
    t3 = (t0 + 6768U);
    t4 = *((char **)t3);
    t3 = (t4 + 0);
    memcpy(t3, t1, 14U);
    xsi_set_current_line(184, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t9 = *((unsigned char *)t2);
    t12 = (t9 == (unsigned char)2);
    if (t12 != 0)
        goto LAB16;

LAB18:    xsi_set_current_line(187, ng0);
    t1 = (t0 + 10104);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);

LAB17:    goto LAB4;

LAB6:    xsi_set_current_line(190, ng0);
    t1 = (t0 + 9592);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(191, ng0);
    t1 = (t0 + 5032U);
    t2 = *((char **)t1);
    t1 = (t0 + 9656);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 14U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(192, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 9720);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(193, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t9 = *((unsigned char *)t2);
    t12 = (t9 == (unsigned char)3);
    if (t12 != 0)
        goto LAB19;

LAB21:    xsi_set_current_line(199, ng0);
    t1 = (t0 + 10104);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);

LAB20:    goto LAB4;

LAB7:    xsi_set_current_line(202, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t9 = *((unsigned char *)t2);
    t12 = (t9 == (unsigned char)3);
    if (t12 != 0)
        goto LAB22;

LAB24:    xsi_set_current_line(211, ng0);
    t13 = (4 - 1);
    t1 = (t0 + 36782);
    *((int *)t1) = 0;
    t2 = (t0 + 36786);
    *((int *)t2) = t13;
    t14 = 0;
    t15 = t13;

LAB25:    if (t14 <= t15)
        goto LAB26;

LAB28:    xsi_set_current_line(214, ng0);
    t1 = (t0 + 10040);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(215, ng0);
    t1 = (t0 + 5032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6768U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    memcpy(t1, t2, 14U);
    xsi_set_current_line(217, ng0);
    t1 = (t0 + 10104);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);

LAB23:    goto LAB4;

LAB8:    xsi_set_current_line(220, ng0);
    t1 = (t0 + 5032U);
    t2 = *((char **)t1);
    t1 = (t0 + 19984U);
    t3 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t44, t2, t1, 1);
    t4 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t45, 4, 16);
    t5 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t43, t3, t44, t4, t45);
    t6 = (t0 + 9208);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    t32 = (t11 + 56U);
    t38 = *((char **)t32);
    memcpy(t38, t5, 16U);
    xsi_driver_first_trans_delta(t6, 64U, 16U, 0LL);
    xsi_set_current_line(222, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t13 = (0 - 0);
    t8 = (t13 * 1);
    t10 = (8U * t8);
    t22 = (0 + t10);
    t1 = (t2 + t22);
    t3 = (t0 + 9208);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 8U);
    xsi_driver_first_trans_delta(t3, 98U, 8U, 0LL);
    xsi_set_current_line(224, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t9 = *((unsigned char *)t2);
    t12 = (t9 == (unsigned char)3);
    if (t12 != 0)
        goto LAB32;

LAB34:    xsi_set_current_line(234, ng0);
    t1 = (t0 + 9272);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(235, ng0);
    t1 = (t0 + 9400);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(236, ng0);
    t1 = xsi_get_transient_memory(14U);
    memset(t1, 0, 14U);
    t2 = t1;
    memset(t2, (unsigned char)2, 14U);
    t3 = (t0 + 9464);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 14U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(238, ng0);
    t1 = (t0 + 10104);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);

LAB33:    goto LAB4;

LAB9:    xsi_set_current_line(242, ng0);
    t1 = (t0 + 5032U);
    t2 = *((char **)t1);
    t1 = (t0 + 19984U);
    t3 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t44, t2, t1, 1);
    t4 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t45, 4, 16);
    t5 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t43, t3, t44, t4, t45);
    t6 = (t0 + 9208);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    t32 = (t11 + 56U);
    t38 = *((char **)t32);
    memcpy(t38, t5, 16U);
    xsi_driver_first_trans_delta(t6, 64U, 16U, 0LL);
    xsi_set_current_line(243, ng0);
    t1 = (t0 + 9208);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 96U, 1, 0LL);
    xsi_set_current_line(244, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 5032U);
    t3 = *((char **)t1);
    t1 = (t0 + 19984U);
    t13 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t3, t1);
    t14 = (t13 - 0);
    t8 = (t14 * 1);
    xsi_vhdl_check_range_of_index(0, 3, 1, t13);
    t10 = (8U * t8);
    t22 = (0 + t10);
    t4 = (t2 + t22);
    t5 = (t0 + 9208);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t11 = (t7 + 56U);
    t32 = *((char **)t11);
    memcpy(t32, t4, 8U);
    xsi_driver_first_trans_delta(t5, 98U, 8U, 0LL);
    xsi_set_current_line(246, ng0);
    t1 = (t0 + 9336);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(248, ng0);
    t1 = (t0 + 5032U);
    t2 = *((char **)t1);
    t13 = (4 - 2);
    t1 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t43, t13, 14);
    t3 = (t43 + 12U);
    t8 = *((unsigned int *)t3);
    t8 = (t8 * 1U);
    t9 = 1;
    if (14U == t8)
        goto LAB41;

LAB42:    t9 = 0;

LAB43:    if (t9 != 0)
        goto LAB38;

LAB40:    xsi_set_current_line(251, ng0);
    t1 = (t0 + 10104);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);

LAB39:    goto LAB4;

LAB10:    xsi_set_current_line(255, ng0);
    t1 = (t0 + 5032U);
    t2 = *((char **)t1);
    t1 = (t0 + 19984U);
    t3 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t44, t2, t1, 1);
    t4 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t45, 4, 16);
    t5 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t43, t3, t44, t4, t45);
    t6 = (t0 + 9208);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    t32 = (t11 + 56U);
    t38 = *((char **)t32);
    memcpy(t38, t5, 16U);
    xsi_driver_first_trans_delta(t6, 64U, 16U, 0LL);
    xsi_set_current_line(256, ng0);
    t1 = (t0 + 9208);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 96U, 1, 0LL);
    xsi_set_current_line(257, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t13 = (4 - 1);
    t14 = (t13 - 0);
    t8 = (t14 * 1);
    t10 = (8U * t8);
    t22 = (0 + t10);
    t1 = (t2 + t22);
    t3 = (t0 + 9208);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 8U);
    xsi_driver_first_trans_delta(t3, 98U, 8U, 0LL);
    xsi_set_current_line(258, ng0);
    t1 = (t0 + 9400);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(259, ng0);
    t1 = xsi_get_transient_memory(14U);
    memset(t1, 0, 14U);
    t2 = t1;
    memset(t2, (unsigned char)2, 14U);
    t3 = (t0 + 9464);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t1, 14U);
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(260, ng0);
    t1 = (t0 + 10104);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)6;
    xsi_driver_first_trans_fast(t1);
    goto LAB4;

LAB11:    xsi_set_current_line(263, ng0);
    t1 = (t0 + 5032U);
    t2 = *((char **)t1);
    t1 = (t0 + 19984U);
    t3 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t44, t2, t1, 1);
    t4 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t45, 4, 16);
    t5 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t43, t3, t44, t4, t45);
    t6 = (t0 + 9208);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    t32 = (t11 + 56U);
    t38 = *((char **)t32);
    memcpy(t38, t5, 16U);
    xsi_driver_first_trans_delta(t6, 64U, 16U, 0LL);
    xsi_set_current_line(264, ng0);
    t1 = (t0 + 9208);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 96U, 1, 0LL);
    xsi_set_current_line(265, ng0);
    t1 = (t0 + 3592U);
    t2 = *((char **)t1);
    t1 = (t0 + 5032U);
    t3 = *((char **)t1);
    t1 = (t0 + 19984U);
    t13 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t3, t1);
    t14 = (t13 - 0);
    t8 = (t14 * 1);
    xsi_vhdl_check_range_of_index(0, 2047, 1, t13);
    t10 = (8U * t8);
    t22 = (0 + t10);
    t4 = (t2 + t22);
    t5 = (t0 + 9208);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t11 = (t7 + 56U);
    t32 = *((char **)t11);
    memcpy(t32, t4, 8U);
    xsi_driver_first_trans_delta(t5, 98U, 8U, 0LL);
    xsi_set_current_line(267, ng0);
    t1 = (t0 + 9336);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(269, ng0);
    t1 = (t0 + 5032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6768U);
    t3 = *((char **)t1);
    t1 = (t0 + 20016U);
    t4 = ieee_p_1242562249_sub_1919437128_1035706684(IEEE_P_1242562249, t43, t3, t1, 2);
    t5 = (t43 + 12U);
    t8 = *((unsigned int *)t5);
    t10 = (1U * t8);
    t9 = 1;
    if (14U == t10)
        goto LAB50;

LAB51:    t9 = 0;

LAB52:    if (t9 != 0)
        goto LAB47;

LAB49:    xsi_set_current_line(272, ng0);
    t1 = (t0 + 10104);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)6;
    xsi_driver_first_trans_fast(t1);

LAB48:    goto LAB4;

LAB12:    xsi_set_current_line(276, ng0);
    t1 = (t0 + 5032U);
    t2 = *((char **)t1);
    t1 = (t0 + 19984U);
    t3 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t44, t2, t1, 1);
    t4 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t45, 4, 16);
    t5 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t43, t3, t44, t4, t45);
    t6 = (t0 + 9208);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    t32 = (t11 + 56U);
    t38 = *((char **)t32);
    memcpy(t38, t5, 16U);
    xsi_driver_first_trans_delta(t6, 64U, 16U, 0LL);
    xsi_set_current_line(277, ng0);
    t1 = (t0 + 9208);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 96U, 1, 0LL);
    xsi_set_current_line(278, ng0);
    t1 = (t0 + 3592U);
    t2 = *((char **)t1);
    t1 = (t0 + 6768U);
    t3 = *((char **)t1);
    t1 = (t0 + 20016U);
    t4 = ieee_p_1242562249_sub_1919437128_1035706684(IEEE_P_1242562249, t43, t3, t1, 1);
    t13 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t4, t43);
    t14 = (t13 - 0);
    t8 = (t14 * 1);
    xsi_vhdl_check_range_of_index(0, 2047, 1, t13);
    t10 = (8U * t8);
    t22 = (0 + t10);
    t5 = (t2 + t22);
    t6 = (t0 + 9208);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    t32 = (t11 + 56U);
    t38 = *((char **)t32);
    memcpy(t38, t5, 8U);
    xsi_driver_first_trans_delta(t6, 98U, 8U, 0LL);
    xsi_set_current_line(279, ng0);
    t1 = (t0 + 9208);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 97U, 1, 0LL);
    xsi_set_current_line(281, ng0);
    t1 = (t0 + 10104);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB4;

LAB13:    xsi_set_current_line(283, ng0);
    t1 = (t0 + 10104);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB4;

LAB14:    t10 = (32U / t8);
    xsi_mem_set_data(t2, t2, t8, t10);
    goto LAB15;

LAB16:    xsi_set_current_line(185, ng0);
    t1 = (t0 + 10104);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)1;
    xsi_driver_first_trans_fast(t1);
    goto LAB17;

LAB19:    xsi_set_current_line(194, ng0);
    t1 = (t0 + 9784);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(195, ng0);
    t1 = (t0 + 9336);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(197, ng0);
    t1 = (t0 + 10104);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB20;

LAB22:    xsi_set_current_line(203, ng0);
    t1 = (t0 + 9784);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(204, ng0);
    t1 = (t0 + 9592);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(205, ng0);
    t1 = (t0 + 5032U);
    t2 = *((char **)t1);
    t1 = (t0 + 9656);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 14U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(206, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 9720);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(207, ng0);
    t1 = (t0 + 9336);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(209, ng0);
    t1 = (t0 + 10104);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB23;

LAB26:    xsi_set_current_line(212, ng0);
    t3 = (t0 + 1512U);
    t4 = *((char **)t3);
    t3 = (t0 + 36782);
    t16 = *((int *)t3);
    t17 = (t16 + 1);
    t18 = (t17 * 8);
    t19 = (t18 - 1);
    t8 = (31 - t19);
    t5 = (t0 + 36782);
    t20 = *((int *)t5);
    t21 = (t20 * 8);
    xsi_vhdl_check_range_of_slice(31, 0, -1, t19, t21, -1);
    t10 = (t8 * 1U);
    t22 = (0 + t10);
    t6 = (t4 + t22);
    t7 = (t0 + 36782);
    t23 = *((int *)t7);
    t24 = (t23 + 1);
    t25 = (t24 * 8);
    t26 = (t25 - 1);
    t11 = (t0 + 36782);
    t27 = *((int *)t11);
    t28 = (t27 * 8);
    t29 = (t28 - t26);
    t30 = (t29 * -1);
    t30 = (t30 + 1);
    t31 = (1U * t30);
    t9 = (8U != t31);
    if (t9 == 1)
        goto LAB29;

LAB30:    t32 = (t0 + 36782);
    t33 = *((int *)t32);
    t34 = (t33 - 0);
    t35 = (t34 * 1);
    t36 = (8U * t35);
    t37 = (0U + t36);
    t38 = (t0 + 9976);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    t41 = (t40 + 56U);
    t42 = *((char **)t41);
    memcpy(t42, t6, 8U);
    xsi_driver_first_trans_delta(t38, t37, 8U, 0LL);

LAB27:    t1 = (t0 + 36782);
    t14 = *((int *)t1);
    t2 = (t0 + 36786);
    t15 = *((int *)t2);
    if (t14 == t15)
        goto LAB28;

LAB31:    t13 = (t14 + 1);
    t14 = t13;
    t3 = (t0 + 36782);
    *((int *)t3) = t14;
    goto LAB25;

LAB29:    xsi_size_not_matching(8U, t31, 0);
    goto LAB30;

LAB32:    xsi_set_current_line(225, ng0);
    t1 = (t0 + 9336);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(226, ng0);
    t1 = (t0 + 9208);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 96U, 1, 0LL);
    xsi_set_current_line(228, ng0);
    t9 = ((unsigned char)0 == (unsigned char)1);
    if (t9 != 0)
        goto LAB35;

LAB37:    xsi_set_current_line(231, ng0);
    t1 = (t0 + 10104);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)6;
    xsi_driver_first_trans_fast(t1);

LAB36:    goto LAB33;

LAB35:    xsi_set_current_line(229, ng0);
    t1 = (t0 + 10104);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t5 = *((char **)t4);
    *((unsigned char *)t5) = (unsigned char)4;
    xsi_driver_first_trans_fast(t1);
    goto LAB36;

LAB38:    xsi_set_current_line(249, ng0);
    t6 = (t0 + 10104);
    t7 = (t6 + 56U);
    t11 = *((char **)t7);
    t32 = (t11 + 56U);
    t38 = *((char **)t32);
    *((unsigned char *)t38) = (unsigned char)5;
    xsi_driver_first_trans_fast(t6);
    goto LAB39;

LAB41:    t10 = 0;

LAB44:    if (t10 < 14U)
        goto LAB45;
    else
        goto LAB43;

LAB45:    t4 = (t2 + t10);
    t5 = (t1 + t10);
    if (*((unsigned char *)t4) != *((unsigned char *)t5))
        goto LAB42;

LAB46:    t10 = (t10 + 1);
    goto LAB44;

LAB47:    xsi_set_current_line(270, ng0);
    t11 = (t0 + 10104);
    t32 = (t11 + 56U);
    t38 = *((char **)t32);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    *((unsigned char *)t40) = (unsigned char)7;
    xsi_driver_first_trans_fast(t11);
    goto LAB48;

LAB50:    t22 = 0;

LAB53:    if (t22 < 14U)
        goto LAB54;
    else
        goto LAB52;

LAB54:    t6 = (t2 + t22);
    t7 = (t4 + t22);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB51;

LAB55:    t22 = (t22 + 1);
    goto LAB53;

}

static void work_a_3615315794_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(300, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1312U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 9080);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(301, ng0);
    t1 = (t0 + 10168);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(303, ng0);
    t2 = (t0 + 1192U);
    t5 = *((char **)t2);
    t4 = *((unsigned char *)t5);
    t9 = (t4 == (unsigned char)3);
    if (t9 != 0)
        goto LAB7;

LAB9:
LAB8:    goto LAB3;

LAB7:    xsi_set_current_line(304, ng0);
    t2 = (t0 + 4712U);
    t6 = *((char **)t2);
    t10 = *((unsigned char *)t6);
    t2 = (t0 + 10168);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t10;
    xsi_driver_first_trans_fast(t2);
    goto LAB8;

}

static void work_a_3615315794_3212880686_p_2(char *t0)
{
    char t11[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(322, ng0);
    t1 = (t0 + 5192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1312U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 9096);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(323, ng0);
    t1 = (t0 + 5512U);
    t5 = *((char **)t1);
    t1 = (t0 + 10232);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 14U);
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(325, ng0);
    t2 = (t0 + 5352U);
    t5 = *((char **)t2);
    t4 = *((unsigned char *)t5);
    t10 = (t4 == (unsigned char)3);
    if (t10 != 0)
        goto LAB7;

LAB9:
LAB8:    goto LAB3;

LAB7:    xsi_set_current_line(326, ng0);
    t2 = (t0 + 5032U);
    t6 = *((char **)t2);
    t2 = (t0 + 19984U);
    t7 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t11, t6, t2, 1);
    t8 = (t0 + 10232);
    t9 = (t8 + 56U);
    t12 = *((char **)t9);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t7, 14U);
    xsi_driver_first_trans_fast(t8);
    goto LAB8;

}

static void work_a_3615315794_3212880686_p_3(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    int t12;
    int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;

LAB0:    xsi_set_current_line(345, ng0);
    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 9112);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(346, ng0);
    t3 = (t0 + 3912U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(347, ng0);
    t3 = (t0 + 4072U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)3);
    if (t9 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(350, ng0);
    t1 = (t0 + 3592U);
    t3 = *((char **)t1);
    t1 = (t0 + 3752U);
    t4 = *((char **)t1);
    t1 = (t0 + 19952U);
    t12 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t4, t1);
    t13 = (t12 - 0);
    t14 = (t13 * 1);
    xsi_vhdl_check_range_of_index(0, 2047, 1, t12);
    t15 = (8U * t14);
    t16 = (0 + t15);
    t7 = (t3 + t16);
    t10 = (t0 + 10360);
    t11 = (t10 + 56U);
    t17 = *((char **)t11);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t7, 8U);
    xsi_driver_first_trans_fast(t10);

LAB9:    goto LAB6;

LAB8:    xsi_set_current_line(348, ng0);
    t3 = (t0 + 4392U);
    t10 = *((char **)t3);
    t3 = (t0 + 3752U);
    t11 = *((char **)t3);
    t3 = (t0 + 19952U);
    t12 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t11, t3);
    t13 = (t12 - 0);
    t14 = (t13 * 1);
    t15 = (8U * t14);
    t16 = (0U + t15);
    t17 = (t0 + 10296);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t10, 8U);
    xsi_driver_first_trans_delta(t17, t16, 8U, 0LL);
    goto LAB9;

}

static void work_a_3615315794_3212880686_p_4(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;
    int t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    xsi_set_current_line(370, ng0);
    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1312U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 9128);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(371, ng0);
    t1 = (t0 + 2952U);
    t5 = *((char **)t1);
    t1 = (t0 + 10424);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 32U);
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(373, ng0);
    t2 = (t0 + 3272U);
    t5 = *((char **)t2);
    t4 = *((unsigned char *)t5);
    t10 = (t4 == (unsigned char)3);
    if (t10 != 0)
        goto LAB7;

LAB9:
LAB8:    goto LAB3;

LAB7:    xsi_set_current_line(374, ng0);
    t2 = (t0 + 2632U);
    t6 = *((char **)t2);
    t2 = (t0 + 2792U);
    t7 = *((char **)t2);
    t2 = (t0 + 19888U);
    t11 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t7, t2);
    t12 = (t11 - 0);
    t13 = (t12 * 1);
    xsi_vhdl_check_range_of_index(0, 3, 1, t11);
    t14 = (8U * t13);
    t15 = (0 + t14);
    t8 = (t6 + t15);
    t9 = (t0 + 10488);
    t16 = (t9 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t8, 8U);
    xsi_driver_first_trans_fast(t9);
    goto LAB8;

}


extern void work_a_3615315794_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3615315794_3212880686_p_0,(void *)work_a_3615315794_3212880686_p_1,(void *)work_a_3615315794_3212880686_p_2,(void *)work_a_3615315794_3212880686_p_3,(void *)work_a_3615315794_3212880686_p_4};
	xsi_register_didat("work_a_3615315794_3212880686", "isim/frameGrabberEthernetTB_isim_beh.exe.sim/work/a_3615315794_3212880686.didat");
	xsi_register_executes(pe);
}
