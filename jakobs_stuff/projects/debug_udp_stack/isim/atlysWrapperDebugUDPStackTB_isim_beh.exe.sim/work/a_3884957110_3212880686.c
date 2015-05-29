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
static const char *ng0 = "C:/Users/Jakob Wittmann/Documents/GitHub/atlys_snippets_and_projects/our_stuff/snippets/btnDebounce/btn_debounce.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_3620187407_sub_436279890_3965413181(char *, char *, char *, char *, int );


static void work_a_3884957110_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned char t7;
    char *t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 8416);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(57, ng0);
    t3 = (t0 + 1832U);
    t4 = *((char **)t3);
    t3 = (t0 + 15512U);
    t5 = (t0 + 3888U);
    t6 = *((char **)t5);
    t5 = (t0 + 15496U);
    t7 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t4, t3, t6, t5);
    if (t7 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(58, ng0);
    t8 = (t0 + 2792U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t11 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t10);
    t8 = (t0 + 8704);
    t12 = (t8 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = t11;
    xsi_driver_first_trans_fast(t8);
    goto LAB6;

}

static void work_a_3884957110_3212880686_p_1(char *t0)
{
    char t27[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 8432);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(66, ng0);
    t3 = (t0 + 2792U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t8 = (0 - 4);
    t9 = (t8 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t3 = (t7 + t11);
    t12 = *((unsigned char *)t3);
    t13 = (t12 == (unsigned char)3);
    t14 = (t6 ^ t13);
    if (t14 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(73, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t3 = t1;
    memset(t3, (unsigned char)2, 16U);
    t4 = (t0 + 8768);
    t7 = (t4 + 56U);
    t15 = *((char **)t7);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t1, 16U);
    xsi_driver_first_trans_fast(t4);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(67, ng0);
    t15 = (t0 + 1832U);
    t16 = *((char **)t15);
    t15 = (t0 + 15512U);
    t17 = (t0 + 3888U);
    t18 = *((char **)t17);
    t17 = (t0 + 15496U);
    t19 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t16, t15, t18, t17);
    if (t19 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(70, ng0);
    t1 = (t0 + 1832U);
    t3 = *((char **)t1);
    t1 = (t0 + 15512U);
    t4 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t27, t3, t1, 1);
    t7 = (t27 + 12U);
    t9 = *((unsigned int *)t7);
    t10 = (1U * t9);
    t2 = (16U != t10);
    if (t2 == 1)
        goto LAB11;

LAB12:    t15 = (t0 + 8768);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t20 = *((char **)t18);
    memcpy(t20, t4, 16U);
    xsi_driver_first_trans_fast(t15);

LAB9:    goto LAB6;

LAB8:    xsi_set_current_line(68, ng0);
    t20 = xsi_get_transient_memory(16U);
    memset(t20, 0, 16U);
    t21 = t20;
    memset(t21, (unsigned char)2, 16U);
    t22 = (t0 + 8768);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t20, 16U);
    xsi_driver_first_trans_fast(t22);
    goto LAB9;

LAB11:    xsi_size_not_matching(16U, t10, 0);
    goto LAB12;

}

static void work_a_3884957110_3212880686_p_2(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned char t7;
    char *t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(80, ng0);
    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 8448);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(81, ng0);
    t3 = (t0 + 1992U);
    t4 = *((char **)t3);
    t3 = (t0 + 15528U);
    t5 = (t0 + 3888U);
    t6 = *((char **)t5);
    t5 = (t0 + 15496U);
    t7 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t4, t3, t6, t5);
    if (t7 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(82, ng0);
    t8 = (t0 + 2952U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t11 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t10);
    t8 = (t0 + 8832);
    t12 = (t8 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = t11;
    xsi_driver_first_trans_fast(t8);
    goto LAB6;

}

static void work_a_3884957110_3212880686_p_3(char *t0)
{
    char t27[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 8464);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(90, ng0);
    t3 = (t0 + 2952U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t8 = (1 - 4);
    t9 = (t8 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t3 = (t7 + t11);
    t12 = *((unsigned char *)t3);
    t13 = (t12 == (unsigned char)3);
    t14 = (t6 ^ t13);
    if (t14 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(97, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t3 = t1;
    memset(t3, (unsigned char)2, 16U);
    t4 = (t0 + 8896);
    t7 = (t4 + 56U);
    t15 = *((char **)t7);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t1, 16U);
    xsi_driver_first_trans_fast(t4);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(91, ng0);
    t15 = (t0 + 1992U);
    t16 = *((char **)t15);
    t15 = (t0 + 15528U);
    t17 = (t0 + 3888U);
    t18 = *((char **)t17);
    t17 = (t0 + 15496U);
    t19 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t16, t15, t18, t17);
    if (t19 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(94, ng0);
    t1 = (t0 + 1992U);
    t3 = *((char **)t1);
    t1 = (t0 + 15528U);
    t4 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t27, t3, t1, 1);
    t7 = (t27 + 12U);
    t9 = *((unsigned int *)t7);
    t10 = (1U * t9);
    t2 = (16U != t10);
    if (t2 == 1)
        goto LAB11;

LAB12:    t15 = (t0 + 8896);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t20 = *((char **)t18);
    memcpy(t20, t4, 16U);
    xsi_driver_first_trans_fast(t15);

LAB9:    goto LAB6;

LAB8:    xsi_set_current_line(92, ng0);
    t20 = xsi_get_transient_memory(16U);
    memset(t20, 0, 16U);
    t21 = t20;
    memset(t21, (unsigned char)2, 16U);
    t22 = (t0 + 8896);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t20, 16U);
    xsi_driver_first_trans_fast(t22);
    goto LAB9;

LAB11:    xsi_size_not_matching(16U, t10, 0);
    goto LAB12;

}

static void work_a_3884957110_3212880686_p_4(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned char t7;
    char *t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(104, ng0);
    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 8480);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(105, ng0);
    t3 = (t0 + 2152U);
    t4 = *((char **)t3);
    t3 = (t0 + 15544U);
    t5 = (t0 + 3888U);
    t6 = *((char **)t5);
    t5 = (t0 + 15496U);
    t7 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t4, t3, t6, t5);
    if (t7 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(106, ng0);
    t8 = (t0 + 3112U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t11 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t10);
    t8 = (t0 + 8960);
    t12 = (t8 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = t11;
    xsi_driver_first_trans_fast(t8);
    goto LAB6;

}

static void work_a_3884957110_3212880686_p_5(char *t0)
{
    char t27[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(113, ng0);
    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 8496);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(114, ng0);
    t3 = (t0 + 3112U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t8 = (2 - 4);
    t9 = (t8 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t3 = (t7 + t11);
    t12 = *((unsigned char *)t3);
    t13 = (t12 == (unsigned char)3);
    t14 = (t6 ^ t13);
    if (t14 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(121, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t3 = t1;
    memset(t3, (unsigned char)2, 16U);
    t4 = (t0 + 9024);
    t7 = (t4 + 56U);
    t15 = *((char **)t7);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t1, 16U);
    xsi_driver_first_trans_fast(t4);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(115, ng0);
    t15 = (t0 + 2152U);
    t16 = *((char **)t15);
    t15 = (t0 + 15544U);
    t17 = (t0 + 3888U);
    t18 = *((char **)t17);
    t17 = (t0 + 15496U);
    t19 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t16, t15, t18, t17);
    if (t19 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(118, ng0);
    t1 = (t0 + 2152U);
    t3 = *((char **)t1);
    t1 = (t0 + 15544U);
    t4 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t27, t3, t1, 1);
    t7 = (t27 + 12U);
    t9 = *((unsigned int *)t7);
    t10 = (1U * t9);
    t2 = (16U != t10);
    if (t2 == 1)
        goto LAB11;

LAB12:    t15 = (t0 + 9024);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t20 = *((char **)t18);
    memcpy(t20, t4, 16U);
    xsi_driver_first_trans_fast(t15);

LAB9:    goto LAB6;

LAB8:    xsi_set_current_line(116, ng0);
    t20 = xsi_get_transient_memory(16U);
    memset(t20, 0, 16U);
    t21 = t20;
    memset(t21, (unsigned char)2, 16U);
    t22 = (t0 + 9024);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t20, 16U);
    xsi_driver_first_trans_fast(t22);
    goto LAB9;

LAB11:    xsi_size_not_matching(16U, t10, 0);
    goto LAB12;

}

static void work_a_3884957110_3212880686_p_6(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned char t7;
    char *t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(128, ng0);
    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 8512);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(129, ng0);
    t3 = (t0 + 2312U);
    t4 = *((char **)t3);
    t3 = (t0 + 15560U);
    t5 = (t0 + 3888U);
    t6 = *((char **)t5);
    t5 = (t0 + 15496U);
    t7 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t4, t3, t6, t5);
    if (t7 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(130, ng0);
    t8 = (t0 + 3272U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t11 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t10);
    t8 = (t0 + 9088);
    t12 = (t8 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = t11;
    xsi_driver_first_trans_fast(t8);
    goto LAB6;

}

static void work_a_3884957110_3212880686_p_7(char *t0)
{
    char t27[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(137, ng0);
    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 8528);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(138, ng0);
    t3 = (t0 + 3272U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t8 = (3 - 4);
    t9 = (t8 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t3 = (t7 + t11);
    t12 = *((unsigned char *)t3);
    t13 = (t12 == (unsigned char)3);
    t14 = (t6 ^ t13);
    if (t14 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(145, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t3 = t1;
    memset(t3, (unsigned char)2, 16U);
    t4 = (t0 + 9152);
    t7 = (t4 + 56U);
    t15 = *((char **)t7);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t1, 16U);
    xsi_driver_first_trans_fast(t4);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(139, ng0);
    t15 = (t0 + 2312U);
    t16 = *((char **)t15);
    t15 = (t0 + 15560U);
    t17 = (t0 + 3888U);
    t18 = *((char **)t17);
    t17 = (t0 + 15496U);
    t19 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t16, t15, t18, t17);
    if (t19 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(142, ng0);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t1 = (t0 + 15560U);
    t4 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t27, t3, t1, 1);
    t7 = (t27 + 12U);
    t9 = *((unsigned int *)t7);
    t10 = (1U * t9);
    t2 = (16U != t10);
    if (t2 == 1)
        goto LAB11;

LAB12:    t15 = (t0 + 9152);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t20 = *((char **)t18);
    memcpy(t20, t4, 16U);
    xsi_driver_first_trans_fast(t15);

LAB9:    goto LAB6;

LAB8:    xsi_set_current_line(140, ng0);
    t20 = xsi_get_transient_memory(16U);
    memset(t20, 0, 16U);
    t21 = t20;
    memset(t21, (unsigned char)2, 16U);
    t22 = (t0 + 9152);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t20, 16U);
    xsi_driver_first_trans_fast(t22);
    goto LAB9;

LAB11:    xsi_size_not_matching(16U, t10, 0);
    goto LAB12;

}

static void work_a_3884957110_3212880686_p_8(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned char t7;
    char *t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(152, ng0);
    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 8544);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(153, ng0);
    t3 = (t0 + 2472U);
    t4 = *((char **)t3);
    t3 = (t0 + 15576U);
    t5 = (t0 + 3888U);
    t6 = *((char **)t5);
    t5 = (t0 + 15496U);
    t7 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t4, t3, t6, t5);
    if (t7 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(154, ng0);
    t8 = (t0 + 3432U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t11 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t10);
    t8 = (t0 + 9216);
    t12 = (t8 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = t11;
    xsi_driver_first_trans_fast(t8);
    goto LAB6;

}

static void work_a_3884957110_3212880686_p_9(char *t0)
{
    char t27[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(161, ng0);
    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 8560);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(162, ng0);
    t3 = (t0 + 3432U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t8 = (4 - 4);
    t9 = (t8 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t3 = (t7 + t11);
    t12 = *((unsigned char *)t3);
    t13 = (t12 == (unsigned char)3);
    t14 = (t6 ^ t13);
    if (t14 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(169, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t3 = t1;
    memset(t3, (unsigned char)2, 16U);
    t4 = (t0 + 9280);
    t7 = (t4 + 56U);
    t15 = *((char **)t7);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t1, 16U);
    xsi_driver_first_trans_fast(t4);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(163, ng0);
    t15 = (t0 + 2472U);
    t16 = *((char **)t15);
    t15 = (t0 + 15576U);
    t17 = (t0 + 3888U);
    t18 = *((char **)t17);
    t17 = (t0 + 15496U);
    t19 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t16, t15, t18, t17);
    if (t19 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(166, ng0);
    t1 = (t0 + 2472U);
    t3 = *((char **)t1);
    t1 = (t0 + 15576U);
    t4 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t27, t3, t1, 1);
    t7 = (t27 + 12U);
    t9 = *((unsigned int *)t7);
    t10 = (1U * t9);
    t2 = (16U != t10);
    if (t2 == 1)
        goto LAB11;

LAB12:    t15 = (t0 + 9280);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t20 = *((char **)t18);
    memcpy(t20, t4, 16U);
    xsi_driver_first_trans_fast(t15);

LAB9:    goto LAB6;

LAB8:    xsi_set_current_line(164, ng0);
    t20 = xsi_get_transient_memory(16U);
    memset(t20, 0, 16U);
    t21 = t20;
    memset(t21, (unsigned char)2, 16U);
    t22 = (t0 + 9280);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t20, 16U);
    xsi_driver_first_trans_fast(t22);
    goto LAB9;

LAB11:    xsi_size_not_matching(16U, t10, 0);
    goto LAB12;

}

static void work_a_3884957110_3212880686_p_10(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned char t7;
    char *t8;
    char *t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(176, ng0);
    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 8576);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(177, ng0);
    t3 = (t0 + 2632U);
    t4 = *((char **)t3);
    t3 = (t0 + 15592U);
    t5 = (t0 + 3888U);
    t6 = *((char **)t5);
    t5 = (t0 + 15496U);
    t7 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t4, t3, t6, t5);
    if (t7 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(178, ng0);
    t8 = (t0 + 3592U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t11 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t10);
    t8 = (t0 + 9344);
    t12 = (t8 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = t11;
    xsi_driver_first_trans_fast(t8);
    goto LAB6;

}

static void work_a_3884957110_3212880686_p_11(char *t0)
{
    char t22[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    unsigned int t23;
    unsigned int t24;

LAB0:    xsi_set_current_line(185, ng0);
    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 8592);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(186, ng0);
    t3 = (t0 + 3592U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    t3 = (t0 + 1192U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)3);
    t10 = (t6 ^ t9);
    if (t10 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(193, ng0);
    t1 = xsi_get_transient_memory(16U);
    memset(t1, 0, 16U);
    t3 = t1;
    memset(t3, (unsigned char)2, 16U);
    t4 = (t0 + 9408);
    t7 = (t4 + 56U);
    t11 = *((char **)t7);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t1, 16U);
    xsi_driver_first_trans_fast(t4);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(187, ng0);
    t3 = (t0 + 2632U);
    t11 = *((char **)t3);
    t3 = (t0 + 15592U);
    t12 = (t0 + 3888U);
    t13 = *((char **)t12);
    t12 = (t0 + 15496U);
    t14 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t11, t3, t13, t12);
    if (t14 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(190, ng0);
    t1 = (t0 + 2632U);
    t3 = *((char **)t1);
    t1 = (t0 + 15592U);
    t4 = ieee_p_3620187407_sub_436279890_3965413181(IEEE_P_3620187407, t22, t3, t1, 1);
    t7 = (t22 + 12U);
    t23 = *((unsigned int *)t7);
    t24 = (1U * t23);
    t2 = (16U != t24);
    if (t2 == 1)
        goto LAB11;

LAB12:    t11 = (t0 + 9408);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t15 = (t13 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t4, 16U);
    xsi_driver_first_trans_fast(t11);

LAB9:    goto LAB6;

LAB8:    xsi_set_current_line(188, ng0);
    t15 = xsi_get_transient_memory(16U);
    memset(t15, 0, 16U);
    t16 = t15;
    memset(t16, (unsigned char)2, 16U);
    t17 = (t0 + 9408);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t15, 16U);
    xsi_driver_first_trans_fast(t17);
    goto LAB9;

LAB11:    xsi_size_not_matching(16U, t24, 0);
    goto LAB12;

}

static void work_a_3884957110_3212880686_p_12(char *t0)
{
    char t6[16];
    char t11[16];
    char t16[16];
    char t21[16];
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;
    char *t12;
    char *t13;
    char *t14;
    unsigned char t15;
    char *t17;
    char *t18;
    char *t19;
    unsigned char t20;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned char t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;

LAB0:    xsi_set_current_line(198, ng0);

LAB3:    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 3272U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t7 = ((IEEE_P_2592010699) + 4024);
    t1 = xsi_base_array_concat(t1, t6, t7, (char)99, t3, (char)99, t5, (char)101);
    t8 = (t0 + 3112U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t12 = ((IEEE_P_2592010699) + 4024);
    t8 = xsi_base_array_concat(t8, t11, t12, (char)97, t1, t6, (char)99, t10, (char)101);
    t13 = (t0 + 2952U);
    t14 = *((char **)t13);
    t15 = *((unsigned char *)t14);
    t17 = ((IEEE_P_2592010699) + 4024);
    t13 = xsi_base_array_concat(t13, t16, t17, (char)97, t8, t11, (char)99, t15, (char)101);
    t18 = (t0 + 2792U);
    t19 = *((char **)t18);
    t20 = *((unsigned char *)t19);
    t22 = ((IEEE_P_2592010699) + 4024);
    t18 = xsi_base_array_concat(t18, t21, t22, (char)97, t13, t16, (char)99, t20, (char)101);
    t23 = (1U + 1U);
    t24 = (t23 + 1U);
    t25 = (t24 + 1U);
    t26 = (t25 + 1U);
    t27 = (5U != t26);
    if (t27 == 1)
        goto LAB5;

LAB6:    t28 = (t0 + 9472);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    memcpy(t32, t18, 5U);
    xsi_driver_first_trans_fast_port(t28);

LAB2:    t33 = (t0 + 8608);
    *((int *)t33) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(5U, t26, 0);
    goto LAB6;

}

static void work_a_3884957110_3212880686_p_13(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(199, ng0);

LAB3:    t1 = (t0 + 3592U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 9536);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 8624);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3884957110_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3884957110_3212880686_p_0,(void *)work_a_3884957110_3212880686_p_1,(void *)work_a_3884957110_3212880686_p_2,(void *)work_a_3884957110_3212880686_p_3,(void *)work_a_3884957110_3212880686_p_4,(void *)work_a_3884957110_3212880686_p_5,(void *)work_a_3884957110_3212880686_p_6,(void *)work_a_3884957110_3212880686_p_7,(void *)work_a_3884957110_3212880686_p_8,(void *)work_a_3884957110_3212880686_p_9,(void *)work_a_3884957110_3212880686_p_10,(void *)work_a_3884957110_3212880686_p_11,(void *)work_a_3884957110_3212880686_p_12,(void *)work_a_3884957110_3212880686_p_13};
	xsi_register_didat("work_a_3884957110_3212880686", "isim/atlysWrapperDebugUDPStackTB_isim_beh.exe.sim/work/a_3884957110_3212880686.didat");
	xsi_register_executes(pe);
}
