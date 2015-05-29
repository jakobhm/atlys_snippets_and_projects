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
static const char *ng0 = "C:/Users/Jakob Wittmann/Documents/GitHub/atlys_snippets_and_projects/jakobs_stuff/projects/debug_udp_stack/arduino_tx.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_1782494273_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned char t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;

LAB0:    t1 = (t0 + 3152U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng0);

LAB6:    t2 = (t0 + 3720);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    t5 = (t0 + 3720);
    *((int *)t5) = 0;
    xsi_set_current_line(52, ng0);
    t2 = (t0 + 3816);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(53, ng0);
    t2 = (t0 + 3880);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(54, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t8 = (t4 == (unsigned char)3);
    if (t8 != 0)
        goto LAB8;

LAB10:
LAB9:    goto LAB2;

LAB5:    t3 = (t0 + 1312U);
    t4 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t3, 0U, 0U);
    if (t4 == 1)
        goto LAB4;
    else
        goto LAB6;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 3816);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(56, ng0);
    t2 = (t0 + 3880);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)0;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t8 = (t4 == (unsigned char)0);
    if (t8 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t10 = (7 - 7);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t2 = (t3 + t12);
    t5 = (t0 + 3944);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t9 = (t7 + 56U);
    t13 = *((char **)t9);
    memcpy(t13, t2, 4U);
    xsi_driver_first_trans_fast_port(t5);

LAB12:    goto LAB9;

LAB11:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t10 = (7 - 3);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t2 = (t5 + t12);
    t6 = (t0 + 3944);
    t7 = (t6 + 56U);
    t9 = *((char **)t7);
    t13 = (t9 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t2, 4U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 3880);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)1;
    xsi_driver_first_trans_fast(t2);
    goto LAB12;

}

static void work_a_1782494273_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(66, ng0);

LAB3:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4008);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 3736);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1782494273_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1782494273_3212880686_p_0,(void *)work_a_1782494273_3212880686_p_1};
	xsi_register_didat("work_a_1782494273_3212880686", "isim/atlysWrapperDebugUDPStackTB_isim_beh.exe.sim/work/a_1782494273_3212880686.didat");
	xsi_register_executes(pe);
}
